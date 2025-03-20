"""CaTSper/ Cambridge Terahertz Spectrum Analyser
The dotTHz project, 2023 Terahertz Applications Group
Department of Chemical Engineering and Biotechnology
University of Cambridge, UK (Prof Axel Zeitler's group)

<<Version information>>
CaTSper_Python Version 0.3

<<Liscence>>
CaTSper source code is relesed und an MIT open source license.

<<Contact>>
https://github.com/CamTHz  - online repository
https://thz.ceb.cam.ac.uk  - research group website
Lead developer: Jasper Ward-Berry, jnw35@cam.ac.uk
"""

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
        self.setWindowIcon(QIcon(str(root.joinpath('CaTSPer_resources', 'icon_48.png'))))
        self.svg_CaTSper.load(str(root.joinpath('CaTSPer_resources', 'CaTSper_logo.svg')))
        self.files = []

        # Set up models.
        self.td_model = THzDataModel()
        self.fd_model = THzDataModel()
        self.fft_settings = SettingsModel(("Transfer_Function",
                                           "Minimum_Frequency",
                                           "Maximum_Frequency",
                                           "Upsampling",
                                           "Peak_SNR",
                                           "Extrapolation_Range",
                                           "Half-Width",
                                           "Window_Function"))

        self.ds_settings = SettingsModel(("Sample",
                                          "Reference",
                                          "Baseline"))

        self.md_settings = SettingsModel(("Sample_Thickness",
                                          "Reference_Thickness",
                                          "Thickness_Unit",
                                          "Thickness_Difference"))

        self.td_plot_settings = SettingsModel(("Property",
                                               "Sample",
                                               "Reference",
                                               "Baseline",
                                               "Log",
                                               "Imaginary",
                                               "X_Label",
                                               "Y_Label",
                                               "Colour_Map",
                                               "Legend"))

        self.fd_plot_settings = SettingsModel(("Property",
                                               "Sample",
                                               "Reference",
                                               "Baseline",
                                               "Log",
                                               "Imaginary",
                                               "X_Label",
                                               "Y_Label",
                                               "Colour_Map",
                                               "Legend"))
        pyqtgraph.setConfigOptions(antialias=True)
        self.settings_file = root.joinpath("config_default.json")
        self.applySettings()

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

    def loadSettings(self):
        self.settings_file = QFileDialog.getOpenFileName(self,
                                                         'Open file',
                                                         str(Path(__file__).parent),
                                                         'json Files (*.json)')[0]

    def applySettings(self):
        with open(self.settings_file) as f:
            settings = json.load(f)
            self.fft_settings.loadSettings(settings["FFT_Settings"])
            self.md_settings.loadSettings(settings["Metadata_Settings"])
            self.ds_settings.loadSettings(settings["Dataset_Settings"])
            self.td_plot_settings.loadSettings({"Property": "waveforms",
                                                "Sample": True,
                                                "Reference": True,
                                                "Baseline": False,
                                                "Log": False,
                                                "Imaginary": False,
                                                "Transform": False,
                                                "X_Label": "Time (ps)",
                                                "Y_Label": "Electric Field Amplitude (a.u.)",
                                                "Colour_Map": 0,
                                                "Legend": False})
            self.fd_plot_settings.loadSettings({"Property": "waveforms",
                                                "Sample": True,
                                                "Reference": True,
                                                "Baseline": True,
                                                "Log": True,
                                                "Imaginary": False,
                                                "Transform": True,
                                                "X_Label": "Power (a.u)",
                                                "Y_Label": "Frequency (THz)",
                                                "Colour_Map": 0,
                                                "Legend": False})

    # Clear loaded files and their data
    def clearMemory(self):
        """Clear loaded files and their data, and reset settings."""
        self.files = []
        self.label_filenames.setText('')
        self.td_model.clear()
        self.fd_model.clear
        self.tab_td.listWidget_selection.clear()
        self.tab_fd.listWidget_selection.clear()

    def transform(self):
        measurements = self.tab_td.listWidget_selection.getSelectedMeasurements()

        for measurement in measurements:
            waveforms = measurement.getWaveforms(self.ds_settings.getSetting("Sample"),
                                                 self.ds_settings.getSetting("Reference"),
                                                 self.ds_settings.getSetting("Baseline"))

            st_index = self.md_settings.getSetting("Sample_Thickness")
            if st_index:
                sample_thickness = getattr(measurement, "md" + str(st_index))
            else:
                sample_thickness = 0
            rt_index = self.md_settings.getSetting("Reference_Thickness")
            if rt_index:
                reference_thickness = getattr(measurement, "md" + str(rt_index))
            else:
                reference_thickness = 0.

            sample = waveforms["sample"]
            reference = waveforms["reference"]

            if "baseline" not in waveforms:
                baseline = None
                sample, reference = common_window([sample, reference],
                                                  self.fft_settings.getSetting("Half-Width"),
                                                  self.fft_settings.getSetting("Window_Function"))
            else:
                baseline = waveforms["baseline"]
                sample, reference, baseline = common_window([sample, reference, baseline],
                                                            self.fft_settings.getSetting("Half-Width"),
                                                            self.fft_settings.getSetting("Window_Function"))

            match self.fft_settings.getSetting("Transfer_Function"):
                case "uniform_slab":
                    optical_constants = uniform_slab(sample_thickness,
                                                     sample, reference,
                                                     self.md_settings.getSetting("Thickness_Unit"),
                                                     1,
                                                     self.fft_settings.getSetting("Minimum_Frequency"),
                                                     self.fft_settings.getSetting("Maximum_Frequency"),
                                                     self.fft_settings.getSetting("Upsampling"),
                                                     self.fft_settings.getSetting("Peak_SNR"),
                                                     self.fft_settings.getSetting("Extrapolation_Range"),
                                                     True)

                case "binary_mixture":
                    optical_constants = binary_mixture(sample_thickness,
                                                       reference_thickness,
                                                       sample,
                                                       reference,
                                                       baseline,
                                                       self.md_settings.getSetting("Thickness_Unit"),
                                                       1,
                                                       1.54,
                                                       0,
                                                       self.fft_settings.getSetting("Minimum_Frequency"),
                                                       self.fft_settings.getSetting("Maximum_Frequency"),
                                                       self.fft_settings.getSetting("Upsampling"),
                                                       self.fft_settings.getSetting("Peak_SNR"),
                                                       self.fft_settings.getSetting("Extrapolation_Range"),
                                                       "maxwell-garnett",
                                                       True)

            optical_constants["waveforms"] = {"sample": sample,
                                              "reference": reference}
            if baseline is not None:
                optical_constants["waveforms"]["baseline"] = baseline

            transformed_measurement = copy.deepcopy(measurement)
            setattr(transformed_measurement, "optical_constants", optical_constants)
            self.fd_model.addData(transformed_measurement)

def main():
    """Execute application."""
    app = QApplication(sys.argv)
    app.setStyle("WindowsVista")
    ex = MainWindow()
    ex.show()
    sys.exit(app.exec())


if __name__ == '__main__':
    main()
