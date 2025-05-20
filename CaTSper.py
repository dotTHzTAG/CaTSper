import os
import sys
import copy
from pathlib import Path
import pyqtgraph
from thzpy.timedomain import common_window
from thzpy.transferfunctions import (uniform_slab,
                                     binary_mixture)
from PyQt6 import uic
from PyQt6.QtCore import QEvent, Qt
from PyQt6.QtGui import QIcon
from PyQt6.QtWidgets import (QMainWindow,
                             QApplication,
                             QFileDialog,
                             QWidget)
from CaTSperClasses import (THzDataModel,
                            ExceptionHook)
from CaTSper_timedomain import TimeDomainTab
from CaTSper_frequencydomain import FrequencyDomainTab
from warnings import warn

if getattr(sys, 'frozen', False):
    os.chdir(sys._MEIPASS)


class MainWindow(QMainWindow):
    """CaTSper main window."""

    def __init__(self, *args, **kwargs):
        """Initialises the main window.

        Initialises the main window, tabs, and data models, and Sets function
        bindings for persistant ui elements.
        """

        # Initialise and load UI.
        super().__init__(*args, **kwargs)
        root = Path(__file__).parent
        uic.loadUi(root.joinpath('CaTSper.ui'), self)
        pyqtgraph.setConfigOptions(antialias=True)
        self.files = []
        self.setWindowIcon(QIcon(str(root.joinpath('CaTSper_resources',
                                                   'dotTHz_logo.ico'))))

        # Set up models.
        self.td_model = THzDataModel()
        self.fd_model = THzDataModel()

        # Set up tabs.
        self.tab_td = TimeDomainTab(self)
        self.tabWidget.addTab(self.tab_td, "Time Domain (TD)")
        self.tab_fd = FrequencyDomainTab(self)
        self.tabWidget.addTab(self.tab_fd, "Frequency Domain (FD)")
        self.syncTheme()

        # Bindings for buttons.
        self.pushButton_import.clicked.connect(self.importFiles)
        self.pushButton_deploy.clicked.connect(self.deployFiles)
        self.pushButton_clear.clicked.connect(self.clearMemory)
        self.tab_td.pushButton_transform.clicked.connect(self.transform)

        # Initialise pop-up exception handler.
        self.ehook = ExceptionHook()

    def changeEvent(self, a0):
        """Intercept palette change events."""

        if a0.type() == QEvent.Type.PaletteChange:
            self.syncTheme()
        return super().changeEvent(a0)

    def syncTheme(self):
        """Apply dark/light theme changes to elements
        that don't handle them automatically."""

        root = Path(__file__).parent
        style_hints = QApplication.styleHints()
        colour_scheme = style_hints.colorScheme()

        # Refresh styling by repolishing all widgets.
        for child in self.findChildren(QWidget):
            child.style().unpolish(child)
            child.style().polish(child)

        # Set plot backgrounds seperately becuase they don't use QSS.
        self.tab_td.plot_1.setBackground(self.palette().base().color())
        self.tab_td.plot_2.setBackground(self.palette().base().color())
        self.tab_fd.plot_1.setBackground(self.palette().base().color())
        self.tab_fd.plot_2.setBackground(self.palette().base().color())

        if colour_scheme == Qt.ColorScheme.Light:
            self.svg_CaTSper.load(str(root.joinpath('CaTSper_resources',
                                                    'dotTHz_logo_light.svg')))
        elif colour_scheme == Qt.ColorScheme.Dark:
            self.svg_CaTSper.load(str(root.joinpath('CaTSper_resources',
                                                    'dotTHz_logo_dark.svg')))
        else:
            warn("Unknown system theme.")

    def importFiles(self):
        """Get the paths of files to load from a file dialog."""
        path = Path.home()
        self.files = QFileDialog.getOpenFileNames(self,
                                                  'Open file',
                                                  str(path),
                                                  'Terahertz Files (*.thz)')[0]
        names = [name.split('/')[-1] for name in self.files]
        self.label_filenames.setText(', '.join(names))

    def deployFiles(self):
        """Load selected files."""

        if self.files != []:
            # Load measurements from files to model.
            for file in self.files:
                self.td_model.loadMeasurements(file)

            # Apply inferred dataset and metadata indices to settings.
            ds = self.td_model.measurement(self.td_model.createIndex(0, 0))
            self.tab_td.ds_settings.setSetting("Sample",
                                               ds.sample_index)
            self.tab_td.ds_settings.setSetting("Reference",
                                               ds.reference_index)
            self.tab_td.ds_settings.setSetting("Baseline",
                                               ds.baseline_index)
            self.tab_td.md_settings.setSetting("Sample_Thickness",
                                               ds.sample_thickness)
            self.tab_td.md_settings.setSetting("Reference_Thickness",
                                               ds.reference_thickness)
            self.td_model.layoutChanged.emit()

    def clearMemory(self):
        """Clear loaded files and their data, and reset settings."""

        # Clear files selection
        self.files = []
        self.label_filenames.setText('')

        # Reset model data
        self.td_model.clear()
        self.fd_model.clear()

        # Re-initialise tabs
        self.tab_td = TimeDomainTab(self)
        self.tab_fd = FrequencyDomainTab(self)
        self.tabWidget.removeTab(1)
        self.tabWidget.removeTab(0)
        self.tabWidget.addTab(self.tab_td, "Time Domain (TD)")
        self.tabWidget.addTab(self.tab_fd, "Frequency Domain (FD)")
        self.tab_td.pushButton_transform.clicked.connect(self.transform)

        self.syncTheme()

    def transform(self):
        """Transform measurements into the frequency domain.

        Pulls the selected datasets from the time-domain model and the relevant
        transform settings. Applies the transform to each measurement and adds
        the output to the frequency-domain model.
        """

        # Load measurements and settings.
        measurements = self.tab_td.listWidget_select.getSelectedMeasurements()
        sample_index = self.tab_td.ds_settings.setting("Sample")
        ref_index = self.tab_td.ds_settings.setting("Reference")
        baseline_index = self.tab_td.ds_settings.setting("Baseline")
        st_index = self.tab_td.md_settings.setting("Sample_Thickness")
        rt_index = self.tab_td.md_settings.setting("Reference_Thickness")
        half_width = self.tab_td.fft_settings.setting("Half-Width")
        win_func = self.tab_td.fft_settings.setting("Window_Function")
        t_unit = self.tab_td.md_settings.setting("Thickness_Unit")
        f_min = self.tab_td.fft_settings.setting("Minimum_Frequency")
        f_max = self.tab_td.fft_settings.setting("Maximum_Frequency")
        upsampling = self.tab_td.fft_settings.setting("Upsampling")
        centre = self.tab_td.fft_settings.setting("Peak_SNR")
        e_range = self.tab_td.fft_settings.setting("Extrapolation_Range")
        tran_func = self.tab_td.fft_settings.setting("Transfer_Function")
        full_name = self.tab_td.fft_settings.setting("Full_Naming")

        # Iterate over all measurements.
        for measurement in measurements:

            # Acquire the relevent waveforms as specified by the user.
            waveforms = measurement.getWaveforms(sample_index,
                                                 ref_index,
                                                 baseline_index)

            # Acquire sample and reference thickness if they exist, else set 0.
            if st_index:
                sample_thickness = getattr(measurement, "md" + str(st_index))
            else:
                sample_thickness = 0

            if rt_index:
                ref_thickness = getattr(measurement, "md" + str(rt_index))
            else:
                ref_thickness = 0.

            # Apply window function to samples.
            # If no baseline is selected by user set it to None and ignore it.
            if "baseline" not in waveforms.keys():
                sample = waveforms["sample"]
                reference = waveforms["reference"]
                baseline = None
                sample, reference = common_window([sample,
                                                   reference],
                                                  half_width,
                                                  win_func)
            else:
                sample = waveforms["sample"]
                reference = waveforms["reference"]
                baseline = waveforms["baseline"]
                sample, reference, baseline = common_window([sample,
                                                             reference,
                                                             baseline],
                                                            half_width,
                                                            win_func)

            # Apply transfer function.
            match tran_func:
                case "uniform_slab":
                    optical_constants = uniform_slab(sample_thickness,
                                                     sample, reference,
                                                     t_unit,
                                                     1.,
                                                     f_min,
                                                     f_max,
                                                     upsampling,
                                                     centre,
                                                     e_range,
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
                                                       e_range,
                                                       "maxwell-garnett",
                                                       True)

            # Add waveforms to optical constants.
            optical_constants["waveforms"] = {"sample": sample,
                                              "reference": reference}
            if baseline is not None:
                optical_constants["waveforms"]["baseline"] = baseline

            # Copy measurement and add optical constants to it.
            transformed_measurement = copy.deepcopy(measurement)
            setattr(transformed_measurement,
                    "optical_constants",
                    optical_constants)

            # If requested rename copied measurement.
            if full_name:
                name = (getattr(transformed_measurement, "name")
                        + " (" + win_func + " " + str(half_width) + "ps, "
                        + str(f_min) + "-" + str(f_max) + "THz, "
                        + "2^" + str(upsampling) + " upsampling, "
                        + tran_func + ")")
                setattr(transformed_measurement, "name", name)

            # Add to frequency domain model.
            self.fd_model.addMeasurement(transformed_measurement)


def main():
    """Execute application."""

    app = QApplication(sys.argv)
    app.setStyle("Fusion")
    ex = MainWindow()
    ex.show()
    sys.exit(app.exec())


if __name__ == '__main__':
    main()
