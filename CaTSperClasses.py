"""Module providing custom classes for CaTSper."""
from PyQt6.QtWidgets import (QListWidget,
                             QMessageBox)
from PyQt6.QtCore import (QAbstractListModel,
                          QAbstractTableModel,
                          Qt,
                          QModelIndex)
from PyQt6.QtGui import QIcon
from PyQt6 import QtCore
from pyqtgraph import PlotWidget, mkPen
from thzpy.dotthz import DotthzFile, DotthzMeasurement
from thzpy.timedomain import primary_peak, n_effective
import numpy as np
import colorcet
import sys
import traceback
from pathlib import Path
from copy import copy


class SelectionListWidget(QListWidget):
    """A QListWidget subclass for handling data selection.

    A QListWidget subclass containing special methods for transferring items
    from a model and associated QListView into a itself representing a
    selection of the model items.

    Attributes
    ----------
    model : THZDataModel
        The source model holding the measurements to be selected from.
    view : QListView
        A list view presenting the model.

    Methods
    -------
    copyListModel
        Copy all items from the source model to the selection.
    addSelected
        Add selected items from the source model to the selection while
        avoiding duplicates.
    deleteSelected
        Delete selected items from the selection.
    removeSelected
        Remove items selected in the view from both the selection and the
        source model.
    getSelectedMeasurements
        Get the selected measurements from the source model.
    getSelectedDatasets(sample_index, reference_index, baseline_index)
        Get the specified datasets from the selected measurements.
    """

    def __init__(self, *args, **kwargs):
        """Initialises the widget."""

        super().__init__(*args, **kwargs)

    def model(self):
        return self._model

    def view(self):
        return self._view

    def setModel(self, value):
        self._model = value

    def setView(self, value):
        self._view = value

    def _getItems(self):
        """Return the text of all items belonging to the list."""

        items = []
        for i in range(self.count()):
            item = self.item(i)
            items.append(item)
        return items

    def _deleteMatching(self, name):
        """Delete items from the list that match a given name.

        Parameters
        ----------
        name : str
            The name if the item to delete.
        """

        items = self._getItems()
        for item in items:
            index = self.row(item)
            if item.text() == name:
                self.takeItem(index)

    def copyListModel(self):
        """Copy all items from the source model to the selection."""

        self.clear()
        model = self.model()
        for i in range(model.rowCount(0)):
            index = model.index(i, 0)
            item = model.data(index, Qt.ItemDataRole.DisplayRole)
            self.addItem(item)

    def addSelected(self):
        """Add selected items from the source model to the selection while
        avoiding duplicates."""

        # Get items currently on the list.
        names = [item.text() for item in self._getItems()]

        # If item isn't already in the list add it.
        model = self.model()
        view = self.view()
        for index in view.selectedIndexes():
            item = model.data(index, Qt.ItemDataRole.DisplayRole)
            if item not in names:
                self.addItem(item)
                names.append(item)

    def deleteSelected(self):
        """Delete selected items from the selection."""

        items = self.selectedItems()
        for item in items:
            index = self.row(item)
            self.takeItem(index)

    def removeSelected(self):
        """Remove items selected in the view from both the selection and the
        source model."""

        indices = self.view().selectedIndexes()
        indices.sort(reverse=True)
        model = self.model()
        for index in indices:
            item = model.data(index, Qt.ItemDataRole.DisplayRole)
            self._deleteMatching(item)
            model.removeMeasurement(index)

    def getSelectedMeasurements(self):
        """Get the selected measurements from the source model."""

        # Get selection names and source model measurements.
        names = [item.text() for item in self._getItems()]
        all_measurements = self.model().measurements()

        # Identify selected measurements to return.
        measurements = []
        for measurement in all_measurements:
            if getattr(measurement, "name") in names:
                measurements.append(measurement)

        return measurements

    def getSelectedDatasets(self, sample_index,
                            reference_index, baseline_index):
        """Get the specified datasets from the selected measurements.

        Parameters
        ----------
        sample_index : int
            The index of the sample measurement.
        reference_index : int
            The index of the reference measurement.
        baseline_index : int
            The index of the baseline measurement.
        """

        # Iterate over selected measurements.
        measurements = self.getSelectedMeasurements()
        datasets = []
        for measurement in measurements:

            # If measurement already has an optical_constant dictionary
            # just return it.
            if hasattr(measurement, "optical_constants"):
                datasets.append(getattr(measurement, "optical_constants"))

            # Otherwise get the get just the waveforms at each index and
            # build into a dictionary.
            else:
                waveforms = measurement.getWaveforms(sample_index,
                                                     reference_index,
                                                     baseline_index)
                datasets.append({"waveforms": waveforms})

        return datasets


class THzMeasurement():
    """Data class for holding thz measurements.

    A data class holding a single THz-TDS measurement. Converts the hdf5 style
    data from a DotthzMeasurment object into a flat structure that is easier to
    interface with QT.

    Parameters
    ----------
    name : str
        The name of the measurement.
    measurement : DotthzMeasurement
        The measurment to be loaded.

    Attributes
    ----------
    attr_map : tuple
        A tuple of attributes names allowing attributes to be accessed
        using an integer index.

    Methods
    -------
    getWaveforms(sample_index, reference_index, baseline_index)
        Get the waveforms from the datasets at the given indices.
    """

    def __init__(self, name: str, measurement: DotthzMeasurement):
        super().__init__()
        self.name = name
        self._loadDotTHz(measurement)

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

    def _formatDS(self, waveform):
        """Convert waveforms into a standard format of (2,n) with time as the
        second row."""

        # Make shape (2,n)
        shape = np.shape(waveform)
        if shape[1] == 2:
            waveform = np.swapaxes(waveform, 0, 1)

        # Identify time axis as the continuosly increasing dataset.
        if min(np.diff(waveform[0])) > 0:
            waveform = waveform[::-1]

        return waveform

    def _loadDotTHz(self, measurement):
        """Load the data and metadata from a DotthzMeasurement Object."""

        # Create metadata attributes.
        metadata = getattr(measurement, "meta_data")
        self.md_dict = getattr(metadata, "md")
        self.ds_dict = getattr(measurement, "datasets")
        self.user = getattr(metadata, "user")
        self.description = getattr(metadata, "description")
        self.instrument = getattr(metadata, "instrument")
        self.time = getattr(metadata, "time")
        self.date = getattr(metadata, "date")

        # Create individual attributes for the first 4 custom metadata entries.
        thicknesses = []
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

        # If there are less than 4 metadata entries top up with empty ones.
        while i < 5:
            setattr(self, "md" + str(i) + "_description", None)
            setattr(self, "md" + str(i) + "_unit", None)
            setattr(self, "md" + str(i), None)
            i += 1

        # Create individual attributes for the first 4 datasets.
        peak_times = []
        self.ds0 = [None, None]
        i = 1
        for k, v in self.ds_dict.items():
            setattr(self, "ds" + str(i) + "_description", k)
            setattr(self, "ds" + str(i), self._formatDS(v))

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
        self.etalon = 0
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

        # If there are sample and reference datasets and a sample thickness
        # attempt to calculated the effective refractive index.
        if (self.sample_thickness != 0 and
                self.sample_index != 0 and
                self.reference_index != 0):

            sample = getattr(self, "ds"+str(self.sample_index))
            ref = getattr(self, "ds" + str(self.reference_index))
            t_sample = getattr(self, "md" + str(self.sample_thickness))
            t_ref = getattr(self, "md" + str(self.reference_thickness))
            t_unit = getattr(self, "md" + str(self.sample_thickness) + "_unit")

            self.n = float(n_effective(sample,
                                       ref,
                                       t_sample,
                                       t_ref,
                                       thickness_unit=t_unit))
        else:
            self.n = 0.

        self.etalon = round(self.etalon, 2)
        self.n = round(self.n, 2)

    def getWaveforms(self, sample_index, reference_index, baseline_index):
        """Get the waveforms from the datasets at the given indices.

        Parameters
        ----------
        sample_index : int
            The index of the sample measurement.
        reference_index : int
            The index of the reference measurement.
        baseline_index : int
            The index of the baseline measurement.
        """

        waveforms = {}

        # If the index is valid get the dataset.
        if sample_index != 0:
            waveforms["sample"] = getattr(self, "ds" + str(sample_index))
        if reference_index != 0:
            waveforms["reference"] = getattr(self, "ds" + str(reference_index))
        if baseline_index != 0:
            waveforms["baseline"] = getattr(self, "ds" + str(baseline_index))

        # Delete None datasets.
        for k, v in waveforms.items():
            if v is None:
                del waveforms[k]

        return waveforms


class THzDataModel(QAbstractTableModel):
    """A QAbstractTableModel subclass for holding THzMeasurement objects.

    Holds a list of THzMeasurement objects. The list serves as the rows in the
    table model while each THzMeasurment provides the columns through its
    attribute map. To enable this the data and setData methods simply act as
    passthroughs to the equivalent methods in the THzMeasurement object. This
    enables measurements to be connected to the UI via QDataWidgetMapper.
    """

    def __init__(self):
        super().__init__()
        self._measurements = []
        self._column_count = len(THzMeasurement("temp",
                                                DotthzMeasurement()).attr_map)

    def rowCount(self, column):
        return len(self.measurements())

    def columnCount(self, row):
        return self._column_count

    def data(self, index, role):
        row = index.row()
        column = index.column()
        value = self._measurements[row]
        if (role == Qt.ItemDataRole.DisplayRole or
                role == Qt.ItemDataRole.EditRole):
            return value.data(column)

    def setData(self, index, data, role=QtCore.Qt.ItemDataRole.EditRole):
        row = index.row()
        column = index.column()
        value = self._measurements[row]
        if role == Qt.ItemDataRole.EditRole:
            value.setData(column, data)
            self.dataChanged.emit(index, index, [Qt.ItemDataRole.EditRole])
            return True
        return False

    def measurement(self, index):
        row = index.row()
        return self._measurements[row]

    def measurements(self):
        return self._measurements

    def setMeasurement(self, index, value):
        row = index.row()
        self._measurements[row] = value

    def insertMeasurement(self, index, value):
        row = index.row()
        self._measurements.insert(row, value)

    def addMeasurement(self, measurement):
        self._measurements.append(measurement)
        self.layoutChanged.emit()

    def removeMeasurement(self, index):
        row = index.row()
        self._measurements.pop(row)
        self.layoutChanged.emit()

    def loadMeasurements(self, path):
        with DotthzFile(path, 'r') as file:
            for k, v in file.get_measurements().items():
                self.addMeasurement(THzMeasurement(k, v))

    def clear(self):
        self._measurements = []
        self.layoutChanged.emit()


class SettingsModel(QAbstractListModel):
    """A Model for holding settings as attributes.

    A list type model for holding settings and allowing them to be
    dynamically mapped to GUI elements via QDataWidgetMapper. During
    instatiation a dictionary of settings is to create a attribute for
    each setting and generate a tuple of attribute names, connecting
    each name to an integer index.

    Settings can be accessed by name using the setting(name) method,
    or by an index using the data(index, role) method.

    Parameters
    ----------
    settings : Dict[str, any]
        A dictionary of settings for the model to hold.

    Attributes
    ----------
    attr_map : tuple
        A tuple of setting names allowing settings to be accessed
        using an integer index.
    """

    def __init__(self, settings):
        super().__init__()
        for k, v in settings.items():
            setattr(self, k, v)

        self.attr_map = tuple(settings.keys())

    def rowCount(self, parent=QModelIndex()):
        return len(self.attr_map)

    def data(self, index, role):
        # Use map to get setting name from index to return.
        attr_name = self.attr_map[index.row()]
        value = getattr(self, attr_name)
        if (role == Qt.ItemDataRole.DisplayRole or
                role == Qt.ItemDataRole.EditRole):
            return value

    def setData(self, index, data, role=Qt.ItemDataRole.EditRole):
        # Use map to get setting name from index.
        attr_name = self.attr_map[index.row()]

        # If possible convert value to int or float.
        if type(data) is str:
            try:
                if "." not in data:
                    data = int(data)
                else:
                    data = float(data)
            except ValueError or TypeError:
                data = data

        # Update setting and notify of model change.
        setattr(self, attr_name, data)
        self.dataChanged.emit(index, index, [Qt.ItemDataRole.EditRole])
        return True

    def setting(self, setting):
        return getattr(self, setting)

    def setSetting(self, name, value):
        setattr(self, name, value)
        index = self.createIndex(self.attr_map.index(name), 0)
        self.dataChanged.emit(index, index, [Qt.ItemDataRole.EditRole])

    def settings(self):
        # Construct a dictionary of the settings.
        settings = {}
        for setting in self.attr_map:
            settings[setting] = getattr(self, setting)
        return settings

    def setSettings(self, settings):
        # Load settings from a dictionary.
        for k, v in settings.items():
            setattr(self, k, v)
            # Notify of model change.
            self.dataChanged.emit(self.createIndex(0, 0),
                                  self.createIndex(self.rowCount(), 0))


class CaTSperPlotWidget(PlotWidget):
    """A widget for plotting datasets in CaTSper

    This model expands the functionality of PlotWidget, making it data-aware
    by connecting it to settings and selection models that are themselves made
    data-aware through QDataWidgetMapper.
    """
    def __init__(self,
                 parent=None,
                 background='default',
                 plotItem=None,
                 **kwargs):
        super().__init__(parent, background, plotItem, **kwargs)

        # Hide unwanted menu items.
        self.getPlotItem().setContextMenuActionVisible("Transforms", False)
        self.getPlotItem().setContextMenuActionVisible("Downsample", False)
        self.getPlotItem().setContextMenuActionVisible("Points", False)

        # Set up empty placeholder legend.
        self.getPlotItem().addLegend(verSpacing=-0.1,
                                     frame=True,
                                     labelTextSize='6pt')
        self.getPlotItem().addLegend().anchor(itemPos=(1, 0), parentPos=(1, 0))

    def plotSettings(self):
        return self._plot_settings

    def setPlotSettings(self, value):
        self._plot_settings = value

    def dsSettings(self):
        return self._ds_settings

    def setDSSettings(self, value):
        self._ds_settings = value

    def selection(self):
        return self._selection

    def setSelection(self, value):
        self._selection = value

    def plotSelection(self):
        """Plot all items in the current selection."""

        # Get settings for plotting.
        sam_index = self.dsSettings().setting("Sample")
        ref_index = self.dsSettings().setting("Reference")
        base_index = self.dsSettings().setting("Baseline")
        colormap = self.plotSettings().setting("Colour_Map")
        plot_property = self.plotSettings().setting("Property")
        plot_sam = self.plotSettings().setting("Sample")
        plot_ref = self.plotSettings().setting("Reference")
        plot_base = self.plotSettings().setting("Baseline")
        transform = self.plotSettings().setting("Transform")
        log = self.plotSettings().setting("Log")
        imag = self.plotSettings().setting("Imaginary")
        x_label = self.plotSettings().setting("X_Label")
        y_label = self.plotSettings().setting("Y_Label")

        # Set up plot.
        palette = copy(colorcet.palette_n[colormap])
        self.clear()
        self.getPlotItem().addLegend().clear()
        self.getPlotItem().enableAutoRange()
        self.setLabel('left', y_label)
        self.setLabel('bottom', x_label)
        if log:
            self.getPlotItem().setLogMode(False, True)
        else:
            self.getPlotItem().setLogMode(False, False)

        # Get datasets and names to plot.
        names = [m.name for m in self.selection().getSelectedMeasurements()]
        datasets = self.selection().getSelectedDatasets(sam_index*plot_sam,
                                                        ref_index*plot_ref,
                                                        base_index*plot_base)

        # Work out how many traces will be plotted.
        trace_count = len(names)
        if plot_property == "waveforms":
            trace_count *= (plot_sam + plot_ref + plot_base)

        # Fit colormap palette to plot count.
        if "glasbey" in colormap:
            # For categorical colormaps just repeat the palette.
            while trace_count > len(palette):
                palette = np.repeat(palette, 1)
        else:
            # For continuous colormaps sub/supersample the palette.
            indices = np.linspace(0, 255,
                                  trace_count).astype(int)
            palette = [palette[index] for index in indices]

        # Plot datasets.
        for dataset in datasets:
            name = names.pop(0)

            # Special case for plotting multiple waveforms per dataset.
            if plot_property == "waveforms":
                property = dataset["waveforms"]
                for k, v in property.items():
                    y, x = v
                    self.plot(x, y,
                              pen=mkPen(palette.pop(0), width=2),
                              name=name + "_" + k)

                # For plotting FFT amplitude use the built in transform.
                if transform:
                    fmin = np.min(datasets[0]["frequency"])
                    fmax = np.max(datasets[0]["frequency"])
                    traces = self.getPlotItem().listDataItems()
                    for trace in traces:
                        trace.setFftMode(True)
                    self.setXRange(fmin, fmax)
                    self.enableAutoRange(axis='y')
                    self.setAutoVisible(y=True)

            # For all other plot types with one plot per measurement.
            else:
                x = dataset["frequency"]
                y = dataset[plot_property]

                # Plot either imaginary or real.
                if any(np.iscomplex(y)):
                    if imag:
                        y = np.imag(y)
                    else:
                        y = np.real(y)

                self.plot(x, y,
                          pen=mkPen(palette.pop(0), width=2),
                          name=name)

    def plotLegend(self):
        """Generate a legend for the current plot."""

        traces = self.getPlotItem().listDataItems()
        legend = self.getPlotItem().addLegend()
        legend.clear()
        for trace in traces:
            legend.addItem(trace, trace.name())


class ExceptionHook(object):
    """A custom exception hook to display exceptions in a QT popup."""

    def __init__(self):
        super().__init__()

        # Copy default exception hook to run alongside the custom one.
        self.default_except = sys.excepthook
        sys.excepthook = self._except

    def _except(self, type, value, trace):
        """Create popup upon exception raise."""

        # Run the default exception handler.
        self.default_except(type, value, trace)

        # Generate a popup message to notify the user of an exception.
        self.dlg = QMessageBox()
        self.dlg.setWindowTitle("Warning")
        self.dlg.setText("A bug has occured.\n"
                         "If the bug persists please report it to the "
                         "developers with a description of what you were doing"
                         " when the bug occured and a copy of the error trace."
                         )

        # Set the icons for the popup to display.
        root = Path(__file__).parent
        self.dlg.setWindowIcon(QIcon(str(root.joinpath('CaTSper_resources',
                                                       'CaTSper_logo.ico'))))
        self.dlg.setIcon(QMessageBox.Icon.Warning)

        # Add a close button to the popup.
        close = self.dlg.addButton(QMessageBox.StandardButton.Close)
        self.dlg.setEscapeButton(close)

        # Display the exception trace as the detailed text of the popup.
        exception = traceback.TracebackException(type,
                                                 value,
                                                 trace,
                                                 capture_locals=True)
        self.dlg.setDetailedText('\n'.join(exception.format()))
        self.dlg.exec()
