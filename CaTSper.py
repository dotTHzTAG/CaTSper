import os
import sys
import copy
import json
from pathlib import Path
import pyqtgraph
from thzpy.timedomain import common_window
from thzpy.transferfunctions import uniform_slab, binary_mixture
from PyQt6 import uic
from PyQt6.QtCore import Qt
from PyQt6.QtGui import QIcon
from PyQt6.QtWidgets import (QMainWindow,
                             QApplication,
                             QFileDialog)
from CaTSperClasses import THzDataModel, SettingsModel
from CaTSper_timedomain import TimeDomainTab
from CaTSper_frequencydomain import FrequencyDomainTab


if getattr(sys, 'frozen', False):
    os.chdir(sys._MEIPASS)


class MainWindow(QMainWindow):
    """CaTSper main window class.
    Contains methods handling primary data operations and transfer.

    Attributes:
        files (list of str): A list of paths to .thz files
    """

    def __init__(self, *args, **kwargs):
        """Initialises the main window.
        Sets bindings for persistant ui elements."""
        # Initialise and load UI
        super().__init__(*args, **kwargs)
        root = Path(__file__).parent
        uic.loadUi(root.joinpath('CaTSper_python.ui'), self)
        self.setWindowIcon(QIcon(str(root.joinpath('CaTSper_resources',
                                                   'CaTSper_logo.ico'))))
        self.svg_CaTSper.load(str(root.joinpath('CaTSper_resources',
                                                'CaTSper_logo.svg')))
        self.files = []

        # Set up models.
        self.td_model = THzDataModel()
        self.fd_model = THzDataModel()

        # Apply default settings
        pyqtgraph.setConfigOptions(antialias=True)
        self.settings_file = root.joinpath("config_default.json")
        with open(self.settings_file) as f:
            settings = json.load(f)
            self.fft_settings = SettingsModel(settings["FFT_Settings"])
            self.md_settings = SettingsModel(settings["Metadata_Settings"])
            self.ds_settings = SettingsModel(settings["Dataset_Settings"])
            self.td_plot_settings = SettingsModel({"Property": "waveforms",
                                                   "Sample": True,
                                                   "Reference": True,
                                                   "Baseline": False,
                                                   "Log": False,
                                                   "Imaginary": False,
                                                   "Transform": False,
                                                   "X_Label": "Time (ps)",
                                                   "Y_Label": "E_Field (a.u.)",
                                                   "Colour_Map": "glasbey"})
            self.fd_plot_settings = SettingsModel({"Property": "waveforms",
                                                   "Sample": True,
                                                   "Reference": True,
                                                   "Baseline": True,
                                                   "Log": True,
                                                   "Imaginary": False,
                                                   "Transform": True,
                                                   "X_Label": "Frequency (THz)",
                                                   "Y_Label": "Frequency (THz)",
                                                   "Colour_Map": "glasbey"})

        # Set up tabs
        self.tab_td = TimeDomainTab(self)
        self.tabWidget.addTab(self.tab_td, "Time Domain (TD)")
        self.tab_fd = FrequencyDomainTab(self)
        self.tabWidget.addTab(self.tab_fd, "Frequency Domain (FD)")

        # Binding for buttons
        self.pushButton_import.clicked.connect(self.importFiles)
        self.pushButton_deploy.clicked.connect(self.deployFiles)
        self.pushButton_clear.clicked.connect(self.clearMemory)
        self.tab_td.pushButton_transform.clicked.connect(self.transform)

    def importFiles(self):
        """Get the paths of files to load from a file dialog."""

        self.files = QFileDialog.getOpenFileNames(self,
                                                  'Open file',
                                                  str(Path(__file__).parent),
                                                  'Terahertz Files (*.thz)')[0]
        names = [name.split('/')[-1] for name in self.files]
        self.label_filenames.setText(', '.join(names))

    def deployFiles(self):
        """Load selected files."""
        for file in self.files:
            self.td_model.loadData(file)
        ds = self.td_model._data[0]
        self.ds_settings.setData(self.ds_settings.index(0, 0),
                                 ds.sample_index,
                                 Qt.ItemDataRole.EditRole)
        self.ds_settings.setData(self.ds_settings.index(1, 0),
                                 ds.reference_index,
                                 Qt.ItemDataRole.EditRole)
        self.ds_settings.setData(self.ds_settings.index(2, 0),
                                 ds.baseline_index,
                                 Qt.ItemDataRole.EditRole)
        self.td_model.layoutChanged.emit()

    def clearMemory(self):
        """Clear loaded files and their data, and reset settings."""

        # Clear files selection
        self.files = []
        self.label_filenames.setText('')

        # Reset model data
        self.td_model.clear()
        self.fd_model.clear()

        # Reset settings to default
        root = Path(__file__).parent
        self.settings_file = root.joinpath("config_default.json")
        self.applySettings()

        # Re-initialise tabs
        self.tab_td = TimeDomainTab(self)
        self.tab_fd = FrequencyDomainTab(self)
        self.tabWidget.removeTab(1)
        self.tabWidget.removeTab(0)
        self.tabWidget.addTab(self.tab_td, "Time Domain (TD)")
        self.tabWidget.addTab(self.tab_fd, "Frequency Domain (FD)")
        self.tab_td.pushButton_transform.clicked.connect(self.transform)

    def transform(self):
        measurements = self.tab_td.listWidget_selection.getSelectedMeasurements()

        sample_index = self.ds_settings.getSetting("Sample")
        ref_index = self.ds_settings.getSetting("Reference")
        baseline_index = self.ds_settings.getSetting("Baseline")
        st_index = self.md_settings.getSetting("Sample_Thickness")
        rt_index = self.md_settings.getSetting("Reference_Thickness")
        half_width = self.fft_settings.getSetting("Half-Width")
        win_func = self.fft_settings.getSetting("Window_Function")
        t_unit = self.md_settings.getSetting("Thickness_Unit")
        f_min = self.fft_settings.getSetting("Minimum_Frequency")
        f_max = self.fft_settings.getSetting("Maximum_Frequency")
        upsampling = self.fft_settings.getSetting("Upsampling")
        centre = self.fft_settings.getSetting("Peak_SNR")
        range = self.fft_settings.getSetting("Extrapolation_Range")
        transfer_func = self.fft_settings.getSetting("Transfer_Function")

        for measurement in measurements:
            waveforms = measurement.getWaveforms(sample_index,
                                                 ref_index,
                                                 baseline_index)

            if st_index:
                sample_thickness = getattr(measurement, "md" + str(st_index))
            else:
                sample_thickness = 0

            if rt_index:
                ref_thickness = getattr(measurement, "md" + str(rt_index))
            else:
                ref_thickness = 0.

            sample = waveforms["sample"]
            reference = waveforms["reference"]

            if "baseline" not in waveforms:
                baseline = None
                sample, reference = common_window([sample,
                                                   reference],
                                                  half_width,
                                                  win_func)
            else:
                baseline = waveforms["baseline"]
                sample, reference, baseline = common_window([sample,
                                                             reference,
                                                             baseline],
                                                            half_width,
                                                            win_func)

            match transfer_func:
                case "uniform_slab":
                    optical_constants = uniform_slab(sample_thickness,
                                                     sample, reference,
                                                     t_unit,
                                                     1.,
                                                     f_min,
                                                     f_max,
                                                     upsampling,
                                                     centre,
                                                     range,
                                                     True)

                case "binary_mixture":
                    optical_constants = binary_mixture(sample_thickness,
                                                       ref_thickness,
                                                       sample,
                                                       reference,
                                                       baseline,
                                                       t_unit,
                                                       1.,
                                                       1.54,
                                                       0.,
                                                       f_min,
                                                       f_max,
                                                       upsampling,
                                                       centre,
                                                       range,
                                                       "maxwell-garnett",
                                                       True)

            optical_constants["waveforms"] = {"sample": sample,
                                              "reference": reference}
            if baseline is not None:
                optical_constants["waveforms"]["baseline"] = baseline

            transformed_measurement = copy.deepcopy(measurement)
            setattr(transformed_measurement,
                    "optical_constants",
                    optical_constants)
            if self.fft_settings.getSetting("Full_Naming"):
                name = (getattr(transformed_measurement, "name")
                        + " (" + win_func + " " + str(half_width) + "ps, "
                        + str(f_min) + "-" + str(f_max) + "THz, "
                        + "2^" + str(upsampling) + " upsampling, "
                        + transfer_func + ")")
                setattr(transformed_measurement, "name", name)
            self.fd_model.addData(transformed_measurement)


def main():
    """Execute application."""
    app = QApplication(sys.argv)
    ex = MainWindow()
    ex.show()
    sys.exit(app.exec())


if __name__ == '__main__':
    main()
