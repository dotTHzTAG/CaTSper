"""Module providing custom classes for CaTSper."""
from PyQt6.QtWidgets import QListWidget
from PyQt6.QtCore import QAbstractListModel, QAbstractTableModel
from PyQt6.QtCore import Qt, QModelIndex
from PyQt6 import QtCore
from PyQt6.QtGui import QPen, QColor
from pyqtgraph import PlotWidget, mkPen
from thzpy.dotthz import DotthzFile, DotthzMeasurement
from thzpy.timedomain import primary_peak, n_effective
import numpy as np
import colorcet


class SelectionListWidget(QListWidget):
    """A QListWidget subclass for handling data selection.
    Contains special methods for transferring items from a listview.
    """

    def __init__(self, *args, **kwargs):
        """Initialises the widget."""

        super().__init__(*args, **kwargs)

    def getItemTexts(self):
        """Return the text of all items belonging to the list."""

        item_texts = []
        for i in range(self.count()):
            item = self.item(i)
            item_texts.append(item.text())
        return item_texts

    def getItems(self):
        """Return the text of all items belonging to the list."""

        items = []
        for i in range(self.count()):
            item = self.item(i)
            items.append(item)
        return items

    def setSourceModel(self, model):
        self._model = model

    def setSourceView(self, view):
        self._view = view

    def copyListModel(self):
        self.clear()
        for i in range(self._model.rowCount(0)):
            index = self._model.index(i, 0)
            item = self._model.data(index, Qt.ItemDataRole.DisplayRole)
            self.addItem(item)

    def addSelectedExclusive(self):
        oldItemNames = [item.data(0) for item in self.getItems()]
        for index in self._view.selectedIndexes():
            item = self._model.data(index, Qt.ItemDataRole.DisplayRole)
            if item not in oldItemNames:
                self.addItem(item)
                oldItemNames.append(item)

    def deleteSelected(self):
        items = self.selectedItems()
        for item in items:
            index = self.row(item)
            self.takeItem(index)

    def getSelectedMeasurements(self):
        selection = self.getItemTexts()
        all_datasets = self._model.getDatasets()
        datasets = []
        for dataset in all_datasets:
            if dataset.data(0) in selection:
                datasets.append(dataset)
        return datasets

    def getSelectedDatasets(self, sample_index,
                            reference_index, baseline_index):
        measurements = self.getSelectedMeasurements()
        datasets = []
        for measurement in measurements:
            if hasattr(measurement, "optical_constants"):
                datasets.append(getattr(measurement, "optical_constants"))
            else:
                waveforms = measurement.getWaveforms(sample_index,
                                                     reference_index,
                                                     baseline_index)
                datasets.append({"waveforms": waveforms})
        return datasets


class THzMeasurement():

    def __init__(self, name: str, measurement: DotthzMeasurement):
        super().__init__()

        self.name = name
        self.loadDotThz(measurement)

        self.attr_map = ("name",
                         "user",
                         "description",
                         "instrument",
                         "time",
                         "md1",
                         "md2",
                         "md3",
                         "md4",
                         "md1_description",
                         "md2_description",
                         "md3_description",
                         "md4_description",
                         "md1_unit",
                         "md2_unit",
                         "md3_unit",
                         "md4_unit",
                         "ds1_description",
                         "ds2_description",
                         "ds3_description",
                         "sample_index",
                         "reference_index",
                         "baseline_index",
                         "sample_thickness",
                         "reference_thickness",
                         "etalon",
                         "n")

    def data(self, index):
        attr_name = self.attr_map[index]
        return getattr(self, attr_name)

    def setData(self, index, data):
        attr_name = self.attr_map[index]
        setattr(self, attr_name, data)

    def formatDS(self, waveform):
        shape = np.shape(waveform)
        if shape[1] == 2:
            waveform = np.swapaxes(waveform, 0, 1)

        if min(np.diff(waveform[0])) > 0:
            waveform = waveform[::-1]

        return waveform

    def loadDotThz(self, measurement):
        # Create metadata attributes.
        metadata = measurement.meta_data
        self.user = metadata.user
        self.description = metadata.description
        self.instrument = metadata.instrument
        self.time = metadata.time
        self.date = metadata.date

        # Create individual attributes for the first 4 custom metadata entries.
        thicknesses = []
        self.md_dict = metadata.md
        self.md0 = 0.
        i = 1
        for k, v in self.md_dict.items():

            # Attempt to separate units from names.
            split = k.split("(")
            if len(split) > 1:
                k = split[0].strip()
                u = split[1][:-1]
                setattr(self, "md" + str(i) + "_unit", u)

                # Store thicknesses with index.
                if u[-1] == "m":
                    thicknesses.append((i, v))

            else:
                setattr(self, "md" + str(i) + "_unit", "")

            setattr(self, "md" + str(i) + "_description", k)
            setattr(self, "md" + str(i), v)
            i += 1
            if i > 5:
                break
        while i < 5:
            setattr(self, "md" + str(i) + "_description", None)
            setattr(self, "md" + str(i) + "_unit", None)
            setattr(self, "md" + str(i), None)
            i += 1

        # Create individual attributes for the first 4 datasets.
        peak_times = []
        self.ds_dict = measurement.datasets
        self.ds0 = [None, None]
        i = 1
        for k, v in self.ds_dict.items():
            setattr(self, "ds" + str(i) + "_description", k)
            setattr(self, "ds" + str(i), self.formatDS(v))

            # Store peak times and index for each dataset.
            time, _, _ = primary_peak(v)
            peak_times.append((i, time))

            i += 1
            if i > 5:
                break
        while i < 5:
            setattr(self, "ds" + str(i) + "_description", None)
            setattr(self, "ds" + str(i), None)
            i += 1

        # Attempt to order datasets using peak time
        peak_times.sort(key=lambda pair: pair[1], reverse=True)
        self.sample_index = 0
        self.reference_index = 0
        self.baseline_index = 0
        if len(peak_times) != 0:
            self.sample_index = peak_times[0][0]
            self.etalon = float(peak_times[0][1])
            if len(peak_times) > 1:
                self.reference_index = peak_times[1][0]
                peak_delay = peak_times[0][1] - peak_times[1][1]
                self.etalon += float(2*peak_delay)
                if len(peak_times) > 2:
                    self.baseline_index = peak_times[2][0]

        # Sort to identify sample and ref thicknesses. Assumes common unit.
        self.sample_thickness = 0
        self.reference_thickness = 0
        thicknesses.sort(key=lambda pair: pair[1], reverse=True)
        if len(thicknesses) != 0:
            self.sample_thickness = thicknesses[0][0]
            if len(thicknesses) > 1:
                self.reference_thickness = thicknesses[1][0]

        if (self.sample_thickness != 0 and
                self.sample_index != 0 and
                self.reference_index != 0):

            self.n = float(n_effective(getattr(self, "ds"+str(self.sample_index)),
                                       getattr(self, "ds" + str(self.reference_index)),
                                       getattr(self, "md" + str(self.sample_thickness)),
                                       getattr(self, "md" + str(self.reference_thickness)),
                                       thickness_unit=getattr(self, "md" + str(self.sample_thickness) + "_unit")))
        else:
            self.n = 0.

        self.etalon = round(self.etalon, 2)
        self.n = round(self.n, 2)

    def getWaveforms(self, sample_index, reference_index, baseline_index):
        waveforms = {}

        if sample_index != 0:
            waveforms["sample"] = getattr(self, "ds" + str(sample_index))
        if reference_index != 0:
            waveforms["reference"] = getattr(self, "ds" + str(reference_index))
        if baseline_index != 0:
            waveforms["baseline"] = getattr(self, "ds" + str(baseline_index))

        return waveforms


class THzDataModel(QAbstractTableModel):

    def __init__(self):
        super().__init__()

        self._data = []
        self._view = None

    def rowCount(self, column):
        return len(self._data)

    def columnCount(self, row):
        return 27

    def data(self, index, role):
        row = index.row()
        column = index.column()
        value = self._data[row]
        if (role == Qt.ItemDataRole.DisplayRole or
                role == Qt.ItemDataRole.EditRole):
            return value.data(column)

    def getDatasets(self):
        return self._data

    def setData(self, index, data, role=QtCore.Qt.ItemDataRole.EditRole):
        row = index.row()
        column = index.column()
        value = self._data[row]
        if role == Qt.ItemDataRole.EditRole:
            value.setData(column, data)
            self.dataChanged.emit(index, index, [Qt.ItemDataRole.EditRole])
            return True
        return False

    def addData(self, measurement):
        self._data.append(measurement)
        self.layoutChanged.emit()

    def removeData(self, index):
        row = index.row()
        self._data.pop(row)
        self.layoutChanged.emit()

    def loadData(self, path):
        with DotthzFile(path, 'r') as file:
            for k, v in file.get_measurements().items():
                self._data.append(THzMeasurement(k, v))

    def setView(self, view):
        self._view = view

    def deleteSelected(self):
        indices = self._view.selectedIndexes()
        indices.sort(reverse=True)
        for index in indices:
            self.removeData(index)

    def clear(self):
        self._data = []
        self.layoutChanged.emit()


class SettingsModel(QAbstractListModel):

    def __init__(self, map):
        super().__init__()
        self.attr_map = map

    def rowCount(self, parent=QModelIndex()):
        return len(self.attr_map)

    def data(self, index, role):
        attr_name = self.attr_map[index.row()]
        value = getattr(self, attr_name)
        if (role == Qt.ItemDataRole.DisplayRole or
                role == Qt.ItemDataRole.EditRole):
            return value

    def setData(self, index, data, role):
        attr_name = self.attr_map[index.row()]
        if type(data) is str:
            try:
                if "." not in data:
                    data = int(data)
                else:
                    data = float(data)
            except ValueError or TypeError:
                data = data
        setattr(self, attr_name, data)
        self.dataChanged.emit(index, index, [Qt.ItemDataRole.EditRole])
        return True

    def loadSettings(self, settings):
        for k, v in settings.items():
            setattr(self, k, v)
            self.dataChanged.emit(self.createIndex(0, 0),
                                  self.createIndex(self.rowCount(), 0))

    def getSetting(self, setting):
        return getattr(self, setting)

    def getSettings(self):
        settings = {}
        for setting in self.attr_map:
            settings[setting] = getattr(self, setting)
        return settings


class CaTSperPlotWidget(PlotWidget):
    def __init__(self, parent=None, background='default', plotItem=None, **kwargs):
        super().__init__(parent, background, plotItem, **kwargs)
        self.getPlotItem().setContextMenuActionVisible("Transforms", False)
        self.getPlotItem().setContextMenuActionVisible("Downsample", False)
        self.getPlotItem().setContextMenuActionVisible("Points", False)

    def setPlotSettings(self, plot_settings):
        self.plot_settings = plot_settings

    def setDSSettings(self, ds_settings):
        self.ds_settings = ds_settings

    def setSelection(self, selection):
        self.selection = selection

    def plotSelection(self):
        palette = colorcet.palette_n[self.plot_settings.Colour_Map]
        plot_count = 0
        self.clear()
        self.getPlotItem().enableAutoRange()
        self.setLabel('left', self.plot_settings.Y_Label)
        self.setLabel('bottom', self.plot_settings.X_Label)
        datasets = self.selection.getSelectedDatasets(self.ds_settings.Sample,
                                                      self.ds_settings.Reference,
                                                      self.ds_settings.Baseline)

        if self.plot_settings.Log:
            self.getPlotItem().setLogMode(False, True)
        else:
            self.getPlotItem().setLogMode(False, False)

        for dataset in datasets:
            if self.plot_settings.Property == "waveforms":
                property = dataset["waveforms"]
                if self.plot_settings.Sample:
                    if "sample" in property:
                        y, x = property["sample"]
                        self.plot(x, y, pen=mkPen(palette[plot_count],
                                                  width=2))
                        plot_count += 1
                if self.plot_settings.Reference:
                    if "reference" in property:
                        y, x = property["reference"]
                        self.plot(x, y, pen=mkPen(palette[plot_count],
                                                  width=2))
                        plot_count += 1
                if self.plot_settings.Baseline:
                    if "baseline" in property:
                        y, x = property["baseline"]
                        self.plot(x, y, pen=mkPen(palette[plot_count],
                                                  width=2))
                        plot_count += 1

                if self.plot_settings.Transform:
                    fmin = np.min(datasets[0]["frequency"])
                    fmax = np.max(datasets[0]["frequency"])
                    traces = self.getPlotItem().listDataItems()
                    for trace in traces:
                        trace.setFftMode(True)
                    self.setXRange(fmin, fmax)
                    self.enableAutoRange(axis='y')
                    self.setAutoVisible(y=True)

            else:
                x = dataset["frequency"]
                y = dataset[self.plot_settings.Property]
                if any(np.iscomplex(y)):
                    if self.plot_settings.Imaginary:
                        y = np.imag(y)
                    else:
                        y = np.real(y)

                self.plot(x, y, pen=mkPen(palette[plot_count],
                                          width=2))
                plot_count += 1
