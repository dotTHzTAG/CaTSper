from pathlib import Path
from PyQt6 import uic
from PyQt6.QtCore import Qt
from PyQt6.QtWidgets import QWidget, QDataWidgetMapper


class FrequencyDomainTab(QWidget):
    def __init__(self, parent):
        super().__init__()
        root = Path(__file__).parent
        uic.loadUi(root.joinpath('CaTSper_frequencydomain.ui'), self)

        self.setParent(parent)

        # Bindings for buttons
        self.pushButton_add.clicked.connect(self.listWidget_selection.addSelectedExclusive)
        self.pushButton_addall.clicked.connect(self.listWidget_selection.copyListModel)
        self.pushButton_del.clicked.connect(self.listWidget_selection.deleteSelected)
        self.pushButton_delall.clicked.connect(self.listWidget_selection.clear)
        self.pushButton_remove.clicked.connect(self.parent().fd_model.deleteSelected)
        self.pushButton_removeall.clicked.connect(self.parent().fd_model.clear)
        self.pushButton_removeall.clicked.connect(self.listWidget_selection.clear)
        self.pushButton_plot1.clicked.connect(self.plot_1.plotSelection)
        self.pushButton_plot2.clicked.connect(self.plot_2.plotSelection)
        self.buttonGroup_properties.buttonClicked.connect(self.setPlotProperty)

        # Bindings for lists
        self.parent().fd_model.setView(self.listView_measurements)
        self.parent().fd_model.setSelection(self.listWidget_selection)
        self.listView_measurements.setModel(self.parent().fd_model)
        self.listWidget_selection.setSourceModel(self.parent().fd_model)
        self.listWidget_selection.setSourceView(self.listView_measurements)

        # Set up mapping of plot settings
        self.plot_mapper = QDataWidgetMapper()
        self.plot_mapper.setModel(self.parent().fd_plot_settings)
        self.plot_mapper.setOrientation(Qt.Orientation.Vertical)
        self.plot_mapper.addMapping(self.checkBox_plotsample, 1)
        self.plot_mapper.addMapping(self.checkBox_plotreference, 2)
        self.plot_mapper.addMapping(self.checkBox_plotbaseline, 3)
        self.plot_mapper.addMapping(self.checkBox_plotlog, 4)
        self.plot_mapper.addMapping(self.checkBox_plotimaginary, 5)
        self.plot_mapper.addMapping(self.comboBox_colourmap, 8)
        self.plot_mapper.addMapping(self.pushButton_legend, 9)
        self.plot_mapper.toFirst()

        # Set Graph properties
        self.frame_plot1.setStyleSheet("background-color: palette(base);")
        self.plot_1.setBackground(self.palette().base().color())
        self.plot_1.setTitle("Plot 1", size="12pt")
        self.plot_1.setPlotSettings(self.parent().fd_plot_settings)
        self.plot_1.setDSSettings(self.parent().ds_settings)
        self.plot_1.setSelection(self.listWidget_selection)

        self.frame_plot2.setStyleSheet("background-color: palette(base);")
        self.plot_2.setBackground(self.palette().base().color())
        self.plot_2.setTitle("Plot 2", size="12pt")
        self.plot_2.setPlotSettings(self.parent().fd_plot_settings)
        self.plot_2.setDSSettings(self.parent().ds_settings)
        self.plot_2.setSelection(self.listWidget_selection)

    def setPlotProperty(self):
        button = self.buttonGroup_properties.checkedButton()
        settings = self.parent().parent().parent().parent().fd_plot_settings
        settings.setData(settings.index(0), button.property("plotProperty"))
        settings.setData(settings.index(4), button.property("plotLog"))
        settings.setData(settings.index(5), button.property("plotImaginary"))
        settings.setData(settings.index(6), button.property("plotTransform"))
        settings.setData(settings.index(7), button.property("xLabel"))
        settings.setData(settings.index(8), button.property("yLabel"))
