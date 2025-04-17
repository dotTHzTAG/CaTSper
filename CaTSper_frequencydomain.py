from pathlib import Path
from PyQt6 import uic
from PyQt6.QtCore import Qt
from PyQt6.QtWidgets import QWidget, QDataWidgetMapper
from CaTSperClasses import SettingsModel


class FrequencyDomainTab(QWidget):
    """CaTSper frequency-domain tab."""

    def __init__(self, parent):
        """Initialises the tab.

        Initialises the tab, sets default settings, and sets function bindings
        for persistant ui elements.

        Parameters
        ----------
        parent : obj
            The parent of the tab. Should be set as the main window.
        """

        super().__init__()
        root = Path(__file__).parent
        uic.loadUi(root.joinpath('CaTSper_frequencydomain.ui'), self)
        self.setParent(parent)
        self.defaultSettings()

        # Set Graph properties
        self.plot_1.setTitle("Plot 1", size="12pt")
        self.plot_1.setPlotSettings(self.plot_settings)
        self.plot_1.setDSSettings(self.ds_settings)
        self.plot_1.setSelection(self.listWidget_select)

        self.plot_2.setTitle("Plot 2", size="12pt")
        self.plot_2.setPlotSettings(self.plot_settings)
        self.plot_2.setDSSettings(self.ds_settings)
        self.plot_2.setSelection(self.listWidget_select)

        # Set up mapping of plot settings
        self.plot_mapper = QDataWidgetMapper()
        self.plot_mapper.setModel(self.plot_settings)
        self.plot_mapper.setOrientation(Qt.Orientation.Vertical)
        self.plot_mapper.addMapping(self.checkBox_plotsample, 1)
        self.plot_mapper.addMapping(self.checkBox_plotreference, 2)
        self.plot_mapper.addMapping(self.checkBox_plotbaseline, 3)
        self.plot_mapper.addMapping(self.checkBox_plotlog, 4)
        self.plot_mapper.addMapping(self.checkBox_plotimaginary, 5)
        self.plot_mapper.addMapping(self.comboBox_colourmap, 9)
        self.plot_mapper.toFirst()

        # Bindings for buttons
        self.pushButton_add.clicked.connect(
            self.listWidget_select.addSelected)
        self.pushButton_addall.clicked.connect(
            self.listWidget_select.copyListModel)
        self.pushButton_del.clicked.connect(
            self.listWidget_select.deleteSelected)
        self.pushButton_remove.clicked.connect(
            self.listWidget_select.deleteSelected)
        self.pushButton_removeall.clicked.connect(self.parent().fd_model.clear)
        self.pushButton_removeall.clicked.connect(self.listWidget_select.clear)
        self.pushButton_delall.clicked.connect(self.listWidget_select.clear)
        self.pushButton_plot1.clicked.connect(self.plot_1.plotSelection)
        self.pushButton_plot2.clicked.connect(self.plot_2.plotSelection)
        self.buttonGroup_properties.buttonClicked.connect(self.setPlotProperty)
        self.pushButton_legend.clicked.connect(self.plot_1.plotLegend)
        self.pushButton_legend.clicked.connect(self.plot_2.plotLegend)

        # Bindings for lists
        self.listView_measurements.setModel(self.parent().fd_model)
        self.listWidget_select.setModel(self.parent().fd_model)
        self.listWidget_select.setView(self.listView_measurements)

    def setPlotProperty(self):
        """Read settings from button and apply to model."""

        button = self.buttonGroup_properties.checkedButton()
        self.plot_settings.setSetting("Property",
                                      button.property("plotProperty"))
        self.plot_settings.setSetting("Log",
                                      button.property("plotLog"))
        self.plot_settings.setSetting("Imaginary",
                                      button.property("plotImaginary"))
        self.plot_settings.setSetting("Transform",
                                      button.property("plotTransform"))
        self.plot_settings.setSetting("X_Label",
                                      button.property("xLabel"))
        self.plot_settings.setSetting("Y_Label",
                                      button.property("yLabel"))

    def defaultSettings(self):
        """Initialise settings model with default values"""

        self.plot_settings = SettingsModel({"Property": "waveforms",
                                            "Sample": True,
                                            "Reference": True,
                                            "Baseline": True,
                                            "Log": True,
                                            "Imaginary": False,
                                            "Transform": True,
                                            "X_Label": "Frequency (THz)",
                                            "Y_Label": "Frequency (THz)",
                                            "Colour_Map": "glasbey"})

        # Dummy settings to make plot handling work.
        self.ds_settings = SettingsModel({"Sample": 0,
                                          "Reference": 0,
                                          "Baseline": 0})
