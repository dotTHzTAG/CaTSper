from pathlib import Path
import numpy as np
from PyQt6 import uic
from PyQt6.QtCore import Qt
from PyQt6.QtWidgets import QDataWidgetMapper, QWidget
from PyQt6.QtGui import QDoubleValidator
from functools import partial
from CaTSperClasses import CaTSperPlotWidget


class TimeDomainTab(QWidget):
    def __init__(self, parent):
        super().__init__()
        root = Path(__file__).parent
        uic.loadUi(root.joinpath('CaTSper_timedomain.ui'), self)

        self.setParent(parent)

        # Bindings for buttons
        self.pushButton_add.clicked.connect(self.listWidget_selection.addSelectedExclusive)
        self.pushButton_addall.clicked.connect(self.listWidget_selection.copyListModel)
        self.pushButton_del.clicked.connect(self.listWidget_selection.deleteSelected)
        self.pushButton_delall.clicked.connect(self.listWidget_selection.clear)
        self.pushButton_plot1.clicked.connect(self.plot_1.plotSelection)
        self.pushButton_plot2.clicked.connect(self.plot_2.plotSelection)

        # Bindings for lists
        self.listView_measurements.setModel(self.parent().td_model)
        self.listView_measurements.selectionModel().currentChanged.connect(self.setDataSelection)
        self.listWidget_selection.setSourceModel(self.parent().td_model)
        self.listWidget_selection.setSourceView(self.listView_measurements)

        # Set Graph properties
        self.frame_plot1.setStyleSheet("background-color: palette(base);")
        self.plot_1.setBackground(self.palette().base().color())
        self.plot_1.setTitle("Plot 1", size="12pt")
        self.plot_1.setLabel('left', "Electric Field Amplitude (a.u.)")
        self.plot_1.setLabel('bottom', "Time (ps)")
        self.plot_1.setPlotSettings(self.parent().td_plot_settings)
        self.plot_1.setDSSettings(self.parent().ds_settings)
        self.plot_1.setSelection(self.listWidget_selection)

        self.frame_plot2.setStyleSheet("background-color: palette(base);")
        self.plot_2.setBackground(self.palette().base().color())
        self.plot_2.setTitle("Plot 2", size="12pt")
        self.plot_2.setLabel('left', "Electric Field Amplitude (a.u.)")
        self.plot_2.setLabel('bottom', "Time (ps)")
        self.plot_2.setPlotSettings(self.parent().td_plot_settings)
        self.plot_2.setDSSettings(self.parent().ds_settings)
        self.plot_2.setSelection(self.listWidget_selection)

        # Assign input validators
        notation = QDoubleValidator.Notation.StandardNotation
        numericalValidator = QDoubleValidator(float('-inf'), float('inf'), 12,
                                              notation=notation)
        positiveValidator = QDoubleValidator(0., float('inf'), 12,
                                             notation=notation)
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

        # Setup of mapping for measurement selection
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

        # Set up mapping of FFT settings
        self.fft_mapper = QDataWidgetMapper()
        self.fft_mapper.setModel(self.parent().fft_settings)
        self.fft_mapper.setOrientation(Qt.Orientation.Vertical)
        self.fft_mapper.addMapping(self.comboBox_transferfunction, 0)
        self.fft_mapper.addMapping(self.lineEdit_fmin, 1)
        self.fft_mapper.addMapping(self.lineEdit_fmax, 2)
        self.fft_mapper.addMapping(self.spinBox_upsampling, 3)
        self.fft_mapper.addMapping(self.lineEdit_centre, 4)
        self.fft_mapper.addMapping(self.lineEdit_range, 5)
        self.fft_mapper.addMapping(self.lineEdit_halfwidth, 6)
        self.fft_mapper.addMapping(self.comboBox_winfunc, 7)
        self.fft_mapper.toFirst()

        # Set up mapping of metadata settings
        self.md_mapper = QDataWidgetMapper()
        self.md_mapper.setModel(self.parent().md_settings)
        self.md_mapper.setOrientation(Qt.Orientation.Vertical)
        self.md_mapper.addMapping(self.comboBox_samplethickness, 0,
                                  "currentIndex".encode())
        self.md_mapper.addMapping(self.comboBox_referencethickness, 1,
                                  "currentIndex".encode())
        self.md_mapper.addMapping(self.comboBox_thicknessunit, 2)
        self.md_mapper.addMapping(self.checkBox_offset, 3)
        self.md_mapper.toFirst()

        # Set up mapping of dataset settings
        self.ds_mapper = QDataWidgetMapper()
        self.ds_mapper.setModel(self.parent().ds_settings)
        self.ds_mapper.setOrientation(Qt.Orientation.Vertical)
        self.ds_mapper.addMapping(self.comboBox_sample, 0,
                                  "currentIndex".encode())
        self.ds_mapper.addMapping(self.comboBox_reference, 1,
                                  "currentIndex".encode())
        self.ds_mapper.addMapping(self.comboBox_baseline, 2,
                                  "currentIndex".encode())
        self.ds_mapper.toFirst()

        # Set up mapping of plot settings
        self.plot_mapper = QDataWidgetMapper()
        self.plot_mapper.setModel(self.parent().td_plot_settings)
        self.plot_mapper.setOrientation(Qt.Orientation.Vertical)
        self.plot_mapper.addMapping(self.checkBox_plotsample, 1)
        self.plot_mapper.addMapping(self.checkBox_plotreference, 2)
        self.plot_mapper.addMapping(self.checkBox_plotbaseline, 3)
        self.plot_mapper.addMapping(self.comboBox_colourmap, 10)
        self.plot_mapper.addMapping(self.pushButton_legend, 11)
        self.plot_mapper.toFirst()

        # Set up plot handling
        self.plot_1.selection = self.listWidget_selection
        self.plot_1.settings = self.parent().td_plot_settings
        self.plot_2.selection = self.listWidget_selection
        self.plot_2.settings = self.parent().td_plot_settings


    def setDataSelection(self, current):
        row = current.row()
        self.selection_mapper.setCurrentIndex(row)
