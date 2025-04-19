import json
from pathlib import Path
from PyQt6 import uic
from PyQt6.QtCore import Qt
from PyQt6.QtWidgets import (QDataWidgetMapper,
                             QWidget,
                             QFileDialog,
                             QLineEdit)
from PyQt6.QtGui import QDoubleValidator
from CaTSperClasses import SettingsModel


class TimeDomainTab(QWidget):
    """Catsper time-domain tab."""

    def __init__(self, parent):
        """Initialises the tab.

        Initialises the tab, sets default settings, creates mappings between
        ui elements, creates and assigns validators for user input, and sets
        function bindings for persistant ui elements.

        Parameters
        ----------
        parent : obj
            The parent of the tab. Should be set as the main window.
        """

        super().__init__()
        root = Path(__file__).parent
        uic.loadUi(root.joinpath('CaTSper_timedomain.ui'), self)
        self.setParent(parent)
        self.defaultSettings()

        # Set Graph properties
        self.plot_1.setTitle("Plot 1", size="12pt")
        self.plot_1.setLabel('left', "Electric Field Amplitude (a.u.)")
        self.plot_1.setLabel('bottom', "Time (ps)")
        self.plot_1.setPlotSettings(self.plot_settings)
        self.plot_1.setDSSettings(self.ds_settings)
        self.plot_1.setSelection(self.listWidget_select)

        self.plot_2.setTitle("Plot 2", size="12pt")
        self.plot_2.setLabel('left', "Electric Field Amplitude (a.u.)")
        self.plot_2.setLabel('bottom', "Time (ps)")
        self.plot_2.setPlotSettings(self.plot_settings)
        self.plot_2.setDSSettings(self.ds_settings)
        self.plot_2.setSelection(self.listWidget_select)

        # Setup mapping for measurement selection.
        self.selection_mapper = QDataWidgetMapper()
        self.selection_mapper.setModel(self.parent().td_model)
        self.selection_mapper.setOrientation(Qt.Orientation.Horizontal)
        self.selection_mapper.addMapping(self.lineEdit_user, 1)
        self.selection_mapper.addMapping(self.lineEdit_description, 2)
        self.selection_mapper.addMapping(self.lineEdit_instrument, 3)
        self.selection_mapper.addMapping(self.lineEdit_datetime, 4)
        self.selection_mapper.addMapping(self.lineEdit_md1, 5)
        self.selection_mapper.addMapping(self.lineEdit_md2, 6)
        self.selection_mapper.addMapping(self.lineEdit_md3, 7)
        self.selection_mapper.addMapping(self.lineEdit_md4, 8)
        self.selection_mapper.addMapping(self.lineEdit_md1desc, 9)
        self.selection_mapper.addMapping(self.lineEdit_md2desc, 10)
        self.selection_mapper.addMapping(self.lineEdit_md3desc, 11)
        self.selection_mapper.addMapping(self.lineEdit_md4desc, 12)
        self.selection_mapper.addMapping(self.lineEdit_md1unit, 13)
        self.selection_mapper.addMapping(self.lineEdit_md2unit, 14)
        self.selection_mapper.addMapping(self.lineEdit_md3unit, 15)
        self.selection_mapper.addMapping(self.lineEdit_md4unit, 16)
        self.selection_mapper.addMapping(self.lineEdit_ds1, 17)
        self.selection_mapper.addMapping(self.lineEdit_ds2, 18)
        self.selection_mapper.addMapping(self.lineEdit_ds3, 19)
        self.selection_mapper.addMapping(self.comboBox_samplethickness, 23)
        self.selection_mapper.addMapping(self.comboBox_referencethickness, 24)
        self.selection_mapper.addMapping(self.lineEdit_etalon, 25)
        self.selection_mapper.addMapping(self.lineEdit_refractiveindex, 26)

        # Set up mapping of FFT settings.
        self.fft_mapper = QDataWidgetMapper()
        self.fft_mapper.setModel(self.fft_settings)
        self.fft_mapper.setOrientation(Qt.Orientation.Vertical)
        self.fft_mapper.addMapping(self.comboBox_transferfunction, 0)
        self.fft_mapper.addMapping(self.lineEdit_fmin, 1)
        self.fft_mapper.addMapping(self.lineEdit_fmax, 2)
        self.fft_mapper.addMapping(self.spinBox_upsampling, 3)
        self.fft_mapper.addMapping(self.lineEdit_centre, 4)
        self.fft_mapper.addMapping(self.lineEdit_range, 5)
        self.fft_mapper.addMapping(self.lineEdit_halfwidth, 6)
        self.fft_mapper.addMapping(self.comboBox_winfunc, 7)
        self.fft_mapper.addMapping(self.checkBox_naming, 8)
        self.fft_mapper.toFirst()

        # Set up mapping of metadata settings
        prp = "currentIndex".encode()
        self.md_mapper = QDataWidgetMapper()
        self.md_mapper.setModel(self.md_settings)
        self.md_mapper.setOrientation(Qt.Orientation.Vertical)
        self.md_mapper.addMapping(self.comboBox_samplethickness, 0, prp)
        self.md_mapper.addMapping(self.comboBox_referencethickness, 1, prp)
        self.md_mapper.addMapping(self.comboBox_thicknessunit, 2)
        self.md_mapper.addMapping(self.checkBox_offset, 3)
        self.md_mapper.toFirst()

        # Set up mapping of dataset settings
        self.ds_mapper = QDataWidgetMapper()
        self.ds_mapper.setModel(self.ds_settings)
        self.ds_mapper.setOrientation(Qt.Orientation.Vertical)
        self.ds_mapper.addMapping(self.comboBox_sample, 0, prp)
        self.ds_mapper.addMapping(self.comboBox_reference, 1, prp)
        self.ds_mapper.addMapping(self.comboBox_baseline, 2, prp)
        self.ds_mapper.toFirst()

        # Set up mapping of plot settings
        self.plot_mapper = QDataWidgetMapper()
        self.plot_mapper.setModel(self.plot_settings)
        self.plot_mapper.setOrientation(Qt.Orientation.Vertical)
        self.plot_mapper.addMapping(self.checkBox_plotsample, 1)
        self.plot_mapper.addMapping(self.checkBox_plotreference, 2)
        self.plot_mapper.addMapping(self.checkBox_plotbaseline, 3)
        self.plot_mapper.addMapping(self.comboBox_colourmap, 9)
        self.plot_mapper.toFirst()

        # Create input validators for number and positive number.
        notation = QDoubleValidator.Notation.StandardNotation
        numericalValidator = QDoubleValidator(float('-inf'),
                                              float('inf'),
                                              12,
                                              notation=notation)
        positiveValidator = QDoubleValidator(0.,
                                             float('inf'),
                                             12,
                                             notation=notation)

        # Assign input validators.
        self.lineEdit_refractiveindex.setValidator(positiveValidator)
        self.lineEdit_etalon.setValidator(positiveValidator)
        self.lineEdit_refractiveindex.setValidator(positiveValidator)
        self.lineEdit_md1.setValidator(numericalValidator)
        self.lineEdit_md2.setValidator(numericalValidator)
        self.lineEdit_md3.setValidator(numericalValidator)
        self.lineEdit_md4.setValidator(numericalValidator)
        self.lineEdit_etalon.setValidator(numericalValidator)
        self.lineEdit_halfwidth.setValidator(numericalValidator)
        self.lineEdit_fmin.setValidator(numericalValidator)
        self.lineEdit_fmax.setValidator(numericalValidator)
        self.lineEdit_centre.setValidator(numericalValidator)
        self.lineEdit_range.setValidator(numericalValidator)

        # Bindings for buttons
        self.pushButton_add.clicked.connect(
            self.listWidget_select.addSelected)
        self.pushButton_addall.clicked.connect(
            self.listWidget_select.copyListModel)
        self.pushButton_del.clicked.connect(
            self.listWidget_select.deleteSelected)
        self.pushButton_delall.clicked.connect(self.listWidget_select.clear)
        self.pushButton_plot1.clicked.connect(self.plot_1.plotSelection)
        self.pushButton_plot2.clicked.connect(self.plot_2.plotSelection)
        self.pushButton_legend.clicked.connect(self.plot_1.plotLegend)
        self.pushButton_legend.clicked.connect(self.plot_2.plotLegend)
        self.pushButton_save.clicked.connect(self.saveSettings)
        self.pushButton_load.clicked.connect(self.loadSettings)

        # Bindings for lists
        self.listWidget_select.setModel(self.parent().td_model)
        self.listWidget_select.setView(self.listView_measurements)
        self.listView_measurements.setModel(self.parent().td_model)
        self.listView_measurements.selectionModel().currentChanged.connect(
            self.setDataSelection)

        # Set up left alignment for QLineEdit overflows.
        for obj in self.findChildren(QLineEdit):
            obj.editingFinished.connect(self.homeText)

    def homeText(self):
        """Home the text of a QLineEdit"""

        obj = self.sender()
        obj.home(True)

    def setDataSelection(self, current):
        """Set mapper index to show the metadata of the select measurement."""

        row = current.row()
        self.selection_mapper.setCurrentIndex(row)

        # Set overflowing QLineEdits to align left.
        for obj in self.findChildren(QLineEdit):
            obj.home(False)

    def loadSettings(self):
        """Load settings from a .json file."""

        # Get path to load from file dialog.
        root = Path(__file__).parent
        file_path = QFileDialog.getOpenFileName(self,
                                                'Open file',
                                                str(root),
                                                'json Files (*.json)')[0]

        # Load settings to dict from .json and apply to model.
        if file_path != "":
            with open(file_path) as f:
                settings = json.load(f)
                self.fft_settings.setSettings(settings["FFT_Settings"])
                self.md_settings.setSettings(settings["Metadata_Settings"])
                self.ds_settings.setSettings(settings["Dataset_Settings"])

    def saveSettings(self):
        """Save current settings to a .json file"""

        # Get path to save to from file dialog.
        root = Path(__file__).parent
        file_path = QFileDialog.getSaveFileName(self,
                                                'Save file',
                                                str(root),
                                                'json Files (*.json)')[0]

        if file_path != "":
            # Get current settings.
            fft = self.fft_settings.settings()
            md = self.md_settings.settings()
            ds = self.ds_settings.settings()

            # Construct settins dictionary.
            settings = {"FFT_Settings": fft,
                        "Metadata_Settings": md,
                        "Dataset_Settings": ds}

            # Dump dictionary to json and save.
            json_str = json.dumps(settings, indent='\t')
            with open(file_path, 'w') as f:
                f.write(json_str)

    def defaultSettings(self):
        """Initialise settings models with default values."""

        # Load settings from json.
        root = Path(__file__).parent
        self.settings_file = root.joinpath("config_default.json")
        with open(self.settings_file) as f:
            settings = json.load(f)
            self.fft_settings = SettingsModel(settings["FFT_Settings"])
            self.md_settings = SettingsModel(settings["Metadata_Settings"])
            self.ds_settings = SettingsModel(settings["Dataset_Settings"])
            self.plot_settings = SettingsModel({"Property": "waveforms",
                                                "Sample": True,
                                                "Reference": True,
                                                "Baseline": False,
                                                "Log": False,
                                                "Imaginary": False,
                                                "Transform": False,
                                                "X_Label": "Time (ps)",
                                                "Y_Label": "E_Field (a.u.)",
                                                "Colour_Map": "glasbey"})
