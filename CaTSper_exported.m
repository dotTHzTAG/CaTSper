classdef CaTSper_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        CaTSperUIFigure                 matlab.ui.Figure
        DeployButton                    matlab.ui.control.Button
        Image                           matlab.ui.control.Image
        ProjectsEditField               matlab.ui.control.EditField
        ImportTHzFilesButton            matlab.ui.control.Button
        CaTSperLabel                    matlab.ui.control.Label
        SaveTDFDDMButton                matlab.ui.control.Button
        ClearMemoryButton               matlab.ui.control.Button
        DEBUGMsgLabel                   matlab.ui.control.Label
        SystemStatusLabel               matlab.ui.control.Label
        TabGroup                        matlab.ui.container.TabGroup
        TimeDomainTDTab                 matlab.ui.container.Tab
        DatasetInformationPanel         matlab.ui.container.Panel
        dsPumpedDropDown                matlab.ui.control.DropDown
        PumpedLabel                     matlab.ui.control.Label
        ds4DesEditField                 matlab.ui.control.EditField
        ds4EditFieldLabel               matlab.ui.control.Label
        ds3DesEditField                 matlab.ui.control.EditField
        ds3EditFieldLabel               matlab.ui.control.Label
        ds2DesEditField                 matlab.ui.control.EditField
        ds2EditFieldLabel               matlab.ui.control.Label
        ds1DesEditField                 matlab.ui.control.EditField
        ds1EditFieldLabel               matlab.ui.control.Label
        dsReferenceDropDown             matlab.ui.control.DropDown
        ReferenceDropDownLabel          matlab.ui.control.Label
        dsSampleDropDown                matlab.ui.control.DropDown
        SampleDropDownLabel             matlab.ui.control.Label
        ResetConfigurationsButton       matlab.ui.control.Button
        MetadataInformationPanel        matlab.ui.container.Panel
        ThicknessSwitch_TD              matlab.ui.control.Switch
        md4DesEditField                 matlab.ui.control.EditField
        md3DesEditField                 matlab.ui.control.EditField
        md2DesEditField                 matlab.ui.control.EditField
        md1DesEditField                 matlab.ui.control.EditField
        ThicknessmmLabel                matlab.ui.control.Label
        md4EditField                    matlab.ui.control.NumericEditField
        md4EditFieldLabel               matlab.ui.control.Label
        md3EditField                    matlab.ui.control.NumericEditField
        md3EditFieldLabel               matlab.ui.control.Label
        md2EditField                    matlab.ui.control.NumericEditField
        md2EditFieldLabel               matlab.ui.control.Label
        md1EditField                    matlab.ui.control.NumericEditField
        md1EditFieldLabel               matlab.ui.control.Label
        mdReferenceThicknessDropDown    matlab.ui.control.DropDown
        ReferenceLabel                  matlab.ui.control.Label
        mdSampleThicknessDropDown       matlab.ui.control.DropDown
        SampleLabel                     matlab.ui.control.Label
        GeneralInformationPanel         matlab.ui.container.Panel
        GeneralEtalonEditField          matlab.ui.control.NumericEditField
        stEtalonpsLabel                 matlab.ui.control.Label
        GeneralRefractiveIndexEditField  matlab.ui.control.NumericEditField
        RefractiveIndexEditFieldLabel   matlab.ui.control.Label
        GeneralUserEditField            matlab.ui.control.EditField
        UserEditFieldLabel              matlab.ui.control.Label
        GeneralInstrumentEditField      matlab.ui.control.EditField
        InstrumentEditFieldLabel        matlab.ui.control.Label
        GeneralDateandTimeEditField     matlab.ui.control.EditField
        DateandTimeEditFieldLabel       matlab.ui.control.Label
        GeneralDescriptionEditField     matlab.ui.control.EditField
        DescriptionEditField_2Label_2   matlab.ui.control.Label
        PlotForCustomisationButton_TD   matlab.ui.control.Button
        CheckDynamicRangeButton         matlab.ui.control.Button
        AssignTD_DataButton             matlab.ui.control.Button
        SaveData_TD                     matlab.ui.control.Button
        LoadData_TD                     matlab.ui.control.Button
        GridOffButton_3                 matlab.ui.control.StateButton
        JetColormapButton_2             matlab.ui.control.StateButton
        LegendButton_2                  matlab.ui.control.StateButton
        ButtonGroupTD                   matlab.ui.container.ButtonGroup
        BothButtonTD                    matlab.ui.control.RadioButton
        SampleButtonTD                  matlab.ui.control.RadioButton
        ReferenceButtonTD               matlab.ui.control.RadioButton
        ALLButton                       matlab.ui.control.Button
        Plot2TDButton                   matlab.ui.control.Button
        FFTSettingsPanel                matlab.ui.container.Panel
        ToEpolFreqEditField             matlab.ui.control.NumericEditField
        toLabel_2                       matlab.ui.control.Label
        FromEpolFreqEditField           matlab.ui.control.NumericEditField
        fromLabel_2                     matlab.ui.control.Label
        ExtrapolationRangeTHzLabel      matlab.ui.control.Label
        FulllistnamingCheckBox          matlab.ui.control.CheckBox
        UnwrappingLabel                 matlab.ui.control.Label
        StartFrequencyTHzEditField      matlab.ui.control.NumericEditField
        StartFrequencyTHzEditFieldLabel  matlab.ui.control.Label
        FromTimeEditField               matlab.ui.control.NumericEditField
        fromLabel_3                     matlab.ui.control.Label
        WindowFunctionLabel             matlab.ui.control.Label
        UpsamplingLabel                 matlab.ui.control.Label
        FrequencyRangeTHzLabel          matlab.ui.control.Label
        AutoWindowButton                matlab.ui.control.StateButton
        ManualWindowpsLabel             matlab.ui.control.Label
        ZeroFillingpowerofSpinner       matlab.ui.control.Spinner
        ZeroFillingpowerofSpinnerLabel  matlab.ui.control.Label
        ApodisationFunctionDropDown     matlab.ui.control.DropDown
        ApodisationFunctionDropDownLabel  matlab.ui.control.Label
        TransformButton                 matlab.ui.control.Button
        truncatebasedon1stetalonLabel   matlab.ui.control.Label
        ToTimeEditField                 matlab.ui.control.NumericEditField
        MaxTimeLabel                    matlab.ui.control.Label
        ToFreqEditField                 matlab.ui.control.NumericEditField
        toLabel                         matlab.ui.control.Label
        FromFreqEditField               matlab.ui.control.NumericEditField
        fromLabel                       matlab.ui.control.Label
        Plot1TDButton                   matlab.ui.control.Button
        SelectionListBox                matlab.ui.control.ListBox
        SelectionListBoxLabel           matlab.ui.control.Label
        DELButton                       matlab.ui.control.Button
        ADDButton                       matlab.ui.control.Button
        MeasurementListBox              matlab.ui.control.ListBox
        MeasurementListBoxLabel         matlab.ui.control.Label
        UIAxes1                         matlab.ui.control.UIAxes
        UIAxes2                         matlab.ui.control.UIAxes
        FrequencyDomainFDTab            matlab.ui.container.Tab
        PlotForCustomisationButton_FD1  matlab.ui.control.Button
        GridOffButton                   matlab.ui.control.StateButton
        DataManipulationButton          matlab.ui.control.Button
        FDDatatoLabel                   matlab.ui.control.Label
        JetColormapButton               matlab.ui.control.StateButton
        LegendButton                    matlab.ui.control.StateButton
        LoadData_FD                     matlab.ui.control.Button
        SaveData_FD                     matlab.ui.control.Button
        MagPhaseButtonGroup             matlab.ui.container.ButtonGroup
        PhaseButton                     matlab.ui.control.RadioButton
        AmplitudeButton                 matlab.ui.control.RadioButton
        YscaleButtonGroup               matlab.ui.container.ButtonGroup
        linearButton                    matlab.ui.control.RadioButton
        logButton                       matlab.ui.control.RadioButton
        FDDataAnalysisPanel             matlab.ui.container.Panel
        GridOffButton_2                 matlab.ui.control.StateButton
        RealImagButtonGroup             matlab.ui.container.ButtonGroup
        ImaginaryButton                 matlab.ui.control.RadioButton
        RealButton                      matlab.ui.control.RadioButton
        PlotForCustomisationButton_FD2  matlab.ui.control.Button
        YscaleButtonGroup_2             matlab.ui.container.ButtonGroup
        linearButton_2                  matlab.ui.control.RadioButton
        logButton_2                     matlab.ui.control.RadioButton
        PlotDataButtonGroup             matlab.ui.container.ButtonGroup
        DielectricConstantButton        matlab.ui.control.ToggleButton
        RefractiveIndexButton           matlab.ui.control.ToggleButton
        AbsorptionButton                matlab.ui.control.ToggleButton
        TransmittanceButton             matlab.ui.control.ToggleButton
        FDSelectionListBox_2            matlab.ui.control.ListBox
        FDSelectionListBox_2Label       matlab.ui.control.Label
        CalculateOpticalParametersButton  matlab.ui.control.Button
        MultipleReflectionCountPanel    matlab.ui.container.Panel
        SampleNMREditField              matlab.ui.control.NumericEditField
        SampleEditField_2Label          matlab.ui.control.Label
        ThicknessmmPanel                matlab.ui.container.Panel
        ThicknessSwitch_FD              matlab.ui.control.Switch
        SampleEditField                 matlab.ui.control.NumericEditField
        SampleEditFieldLabel            matlab.ui.control.Label
        ReferenceEditField              matlab.ui.control.NumericEditField
        ReferenceEditFieldLabel         matlab.ui.control.Label
        DescriptionEditField_FD         matlab.ui.control.EditField
        DescriptionEditField_2Label     matlab.ui.control.Label
        DELFDButton_2                   matlab.ui.control.Button
        ADDFDButton_2                   matlab.ui.control.Button
        ALLFDButton_2                   matlab.ui.control.Button
        MagPhaseButtonGroup_2           matlab.ui.container.ButtonGroup
        PhaseButton_2                   matlab.ui.control.RadioButton
        AmplitudeButton_2               matlab.ui.control.RadioButton
        Plot2FDButton_2                 matlab.ui.control.Button
        Plot1FDButton_2                 matlab.ui.control.Button
        AssignFD_DataButton             matlab.ui.control.Button
        RemoveAllButton                 matlab.ui.control.Button
        RemoveButton                    matlab.ui.control.Button
        ButtonGroupFD                   matlab.ui.container.ButtonGroup
        BothButtonFD                    matlab.ui.control.RadioButton
        SampleButtonFD                  matlab.ui.control.RadioButton
        ReferenceButtonFD               matlab.ui.control.RadioButton
        FDSelectionListBox              matlab.ui.control.ListBox
        FDSelectionListBoxLabel         matlab.ui.control.Label
        DELFDButton                     matlab.ui.control.Button
        ADDFDButton                     matlab.ui.control.Button
        ALLFDButton                     matlab.ui.control.Button
        FDListListBox                   matlab.ui.control.ListBox
        FDListListBoxLabel              matlab.ui.control.Label
        Plot2FDButton                   matlab.ui.control.Button
        Plot1FDButton                   matlab.ui.control.Button
        UIAxes4                         matlab.ui.control.UIAxes
        UIAxes3                         matlab.ui.control.UIAxes
        DataManipulationDMTab           matlab.ui.container.Tab
        JetColormapButton_DM            matlab.ui.control.StateButton
        DMTabGroup                      matlab.ui.container.TabGroup
        FrequencyBaseTab                matlab.ui.container.Tab
        MeasurementEditField            matlab.ui.control.EditField
        MeasurementEditFieldLabel       matlab.ui.control.Label
        YLabelEditField                 matlab.ui.control.EditField
        YLabelEditFieldLabel            matlab.ui.control.Label
        XLabelEditField                 matlab.ui.control.EditField
        XLabelEditFieldLabel            matlab.ui.control.Label
        YaxisDataEditField_2            matlab.ui.control.EditField
        YaxisDataEditField_2Label       matlab.ui.control.Label
        GetDatafromFrequencyTHzEditField  matlab.ui.control.EditField
        GetDatafromFrequencyTHzEditFieldLabel  matlab.ui.control.Label
        XaxisDataEditField              matlab.ui.control.EditField
        XaxisDataEditFieldLabel         matlab.ui.control.Label
        PlotButton                      matlab.ui.control.Button
        RearrangeDataButton             matlab.ui.control.Button
        DisplayXLinesButton             matlab.ui.control.Button
        PeakBaseTab                     matlab.ui.container.Tab
        MinPeakProminenceEditField      matlab.ui.control.NumericEditField
        MinPeakProminenceEditFieldLabel  matlab.ui.control.Label
        MeasurementEditField_2          matlab.ui.control.EditField
        MeasurementEditField_2Label     matlab.ui.control.Label
        YLabelEditField_2               matlab.ui.control.EditField
        YLabelEditField_2Label          matlab.ui.control.Label
        XLabelEditField_2               matlab.ui.control.EditField
        XLabelEditField_2Label          matlab.ui.control.Label
        YaxisDataEditField_3            matlab.ui.control.EditField
        YaxisDataEditField_3Label       matlab.ui.control.Label
        XaxisDataEditField_2            matlab.ui.control.EditField
        XaxisDataEditField_2Label       matlab.ui.control.Label
        LowerLimitTHzEditField          matlab.ui.control.NumericEditField
        LowerLimitTHzEditFieldLabel     matlab.ui.control.Label
        PeakNumSpinner                  matlab.ui.control.Spinner
        PeakNumSpinnerLabel             matlab.ui.control.Label
        PlotButton_2                    matlab.ui.control.Button
        RearrangeDataButton_2           matlab.ui.control.Button
        SaveData_DM                     matlab.ui.control.Button
        AssignDM_DataButton             matlab.ui.control.Button
        STEP1Panel                      matlab.ui.container.Panel
        ImportAllDataInverseSequenceButton  matlab.ui.control.Button
        PlotmeanandrangeButton          matlab.ui.control.Button
        DPlotFrequencyxaxisPanel        matlab.ui.container.Panel
        DplotdoesnotsupportthebelowextractingfunctionLabel  matlab.ui.control.Label
        data3DDropDown                  matlab.ui.control.DropDown
        dataDropDownLabel               matlab.ui.control.Label
        Plot1_3DButton                  matlab.ui.control.Button
        exABABCetcLabel                 matlab.ui.control.Label
        NumberofDataEditField           matlab.ui.control.NumericEditField
        NumberofDataEditFieldLabel      matlab.ui.control.Label
        AvailableDataSetEditField       matlab.ui.control.EditField
        AvailableDataSetEditFieldLabel  matlab.ui.control.Label
        ImportAllDataButton             matlab.ui.control.Button
        CalculateButton                 matlab.ui.control.Button
        CforDropDown                    matlab.ui.control.DropDown
        CforDropDownLabel               matlab.ui.control.Label
        BforDropDown                    matlab.ui.control.DropDown
        BforDropDownLabel               matlab.ui.control.Label
        PlotindividualdatasetsButton    matlab.ui.control.Button
        YaxisDataFormulationEditField   matlab.ui.control.EditField
        YaxisDataFormulationEditFieldLabel  matlab.ui.control.Label
        XaxisDataDropDown               matlab.ui.control.DropDown
        XaxisDataDropDownLabel          matlab.ui.control.Label
        DefinevariablesLabel            matlab.ui.control.Label
        AforDropDown                    matlab.ui.control.DropDown
        AforDropDownLabel               matlab.ui.control.Label
        SourceDataSetEditField          matlab.ui.control.EditField
        SourceDataSetEditFieldLabel     matlab.ui.control.Label
        UIAxes9                         matlab.ui.control.UIAxes
        UIAxes10                        matlab.ui.control.UIAxes
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CaTSper/ Cambridge Terahertz Spectrum Analyser
% The dotTHz project, 2023 Terahertz Applications Group                 
% Department of Chemical Engineering and Biotechnology
% University of Cambridge, UK (Prof Axel Zeitler's group)
%
% <<Version information>>
% 
% <<Acknowledgement>>
% CaTSper source code is under MIT license
% <<Contact>>
% https://github.com/CamTHz  - online repository
% https://thz.ceb.cam.ac.uk  - research group website
% Lead developer: Jongmin Lee, jl2112@cam.ac.uk
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This in-line code annotation of CaTSper v2.0 aims to provide a detailed explanation of the
% script, function and processes of the CaTSper app
% Definitions of parameters are not annotated for conciseness.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    properties (Access = public)
        fullpathname % Terapulse project file name and folder information
        filename % Terapulse project file name
        TD_data %time domain data extracted from HDF5 project file
        TD_select %time domain measurment selection
        TD_config % TD to FD transformation configuration
        FD_data %frequency data transfered through DFT
        FD_select  %frequency data selection
        FD_select_2  %frequency data selection in FD data analysis section
        FD_config
        DM_count % the number of data manipulation data
        DM_data % data manipluation data
        DM_peaks % data MAnipulation peaks 
        DR_boundary % dynamic range checker freqeuncy boundary
        PRJ_count % the number of project files imported
    end
    
    properties (Access = private)
        DialogApp % Dialog box appProperty15 % Description
    end
    
    methods (Access = private)
        % TDanalysisUpdate calculates and stores the effective refractive index and
        % the time delay for one internal reflection to occur for one
        % sample measurement    
        function TDanalysisUpdate(app,TDindex)
            % extracting the thickness value from the imported time
            % domain data for one measurement
            thickness = app.TD_data.metadata{TDindex}.thickness;
            % extracting the time delay value from the imported time
            % domain data for one measurement
            delta_t = app.TD_data.metadata{TDindex}.timeDelay;
            
            % recalculate
            % the following is performed provided the thickness value does not equal to 0
            if ~isequal(thickness,0)
                % calculate time domain effective refractive index, and
                % round the value to 4 s.f. (3 d.p. equivalent)
                % time delay value is in units of pico seconds
                % thickness value is in units of milimetre
                n_eff = round((delta_t*10^-12*3e8/(thickness*10^-3) + 1)*1000)/1000;
                % calculate the time delay for pulse to reach detector,
                % when one internal reflection occurs
                % time delay with one internation reflection = time delay
                % for pulse travelling straight through sample + time delay
                % for pulse to travel a distance equals to two times the
                % sample thickness
                % the second term is calculated from thickness information and the n_eff value
                % determined from above
                etl_t = delta_t + 2*thickness*10^-3*n_eff/3e8*10^12;
            else
                % if thickness value is zero, set values to zero automatically
                n_eff = 0;
                mtpRelection = 0;
            end

            
            % update information
            app.TD_data.metadata{TDindex}.refractiveIndex = n_eff;
            app.TD_data.metadata{TDindex}.internalReflection = etl_t;
            
            % display update
            app.GeneralRefractiveIndexEditField.Value = n_eff;
            app.stinternalreflectionpsEditField.Value = etl_t;
        end
        
        % FDdataDel empties values in row number 'FDindex' for
        % different parameters associated with the frequency domain (FD) tab
        % when certain conditions are met
        function FDdataDel(app,FDindex)
            app.FD_data.measList(FDindex) = [];
            app.FD_data.metadata(FDindex) = [];
            app.FD_data.frequency(FDindex) = [];
            app.FD_data.ffd_references(FDindex) = [];
            app.FD_data.ffd_samples(FDindex) = [];
            app.FD_data.ref_amplitude(FDindex) = [];
            app.FD_data.ref_phase(FDindex) = [];
            app.FD_data.sam_amplitude(FDindex) = [];
            app.FD_data.sam_phase(FDindex) = [];
            app.FD_data.transmit_amplitude(FDindex) = [];
            app.FD_data.transmit_phase(FDindex) = [];
            
            if isfield(app.FD_data,'absorptions')
               app.FD_data.absorption(FDindex) = [];
                app.FD_data.refractiveIndex(FDindex) = [];
                app.FD_data.eReal(FDindex) = [];
                app.FD_data.eImag(FDindex) = [];
            end
             
            % provided the array 'app.FD_data.metadata' is not empty,
            % empty following data fields
            if ~isempty(app.FD_data.metadata)
                app.FD_data.metadata(FDindex) = [];
            end
            
        end
        
        % TDdataDel empties arrays associated with the time domain (TD) tab
        function TDdataDel(app)
            app.TD_data = [];
            app.MeasurementListBox.Items(:) = [];
            app.SelectionListBox.Items(:) = [];

            app.md1DesEditField.Value = '';
            app.md2DesEditField.Value = '';
            app.md3DesEditField.Value = '';
            app.md4DesEditField.Value = '';
            app.md1EditField.AllowEmpty = "on";
            app.md2EditField.AllowEmpty = "on";
            app.md3EditField.AllowEmpty = "on";
            app.md4EditField.AllowEmpty = "on";
            app.md1EditField.Value = [];
            app.md2EditField.Value = [];
            app.md3EditField.Value = [];
            app.md4EditField.Value = [];
            app.ds1DesEditField.Value = '';
            app.ds2DesEditField.Value = '';
            app.ds3DesEditField.Value = '';
            app.ds3DesEditField.Value = '';
            app.GeneralDateandTimeEditField.Value = '';
            app.GeneralDescriptionEditField.Value = '';
            app.GeneralInstrumentEditField.Value = '';
            app.GeneralUserEditField.Value = '';
            app.GeneralRefractiveIndexEditField.Value = 0;
            app.GeneralEtalonEditField.Value = 0;
        end
        
        % plotTD_data plots the time domain data, choices can be made on plotting reference measurements only,
        % sample measurements only or both reference and sample measurements;
        % customisation on graph appearance (e.g. gridlines) can be made
        function plotTD_data(app,axesNum)
            
            plotList = app.TD_select;
            plotType = app.ButtonGroupTD.SelectedObject.Text;
            cnt = 1;
            lgd = {};
            
            if isequal(axesNum,"NEW")
                % Create UIFigure and hide until all components are created
                fig = figure('Visible', 'on');
                fig.Position = [100 100 850 500];
                fig.Name = "CaTSPer Time-domain Data";
                % Create UIAxes
                ax = uiaxes(fig);
                xlabel(ax,"Time (ps)");
                ylabel(ax,"E_{field intensity} (a.u.)");
                ax.BoxStyle = "full";
                ax.Position = [10 10 800 450];
            else
                ax = axesNum;
                % deleting graphics objects, that are specified by 'ax', from
                % the axes
                cla(ax)
            end
            
            % reset 'NO LEGEND', 'JET COLORMAP'
            app.LegendButton_2.Value = 0;
            app.JetColormapButton_2.Value = 0;
            

            % deleting the legend
            legend(ax,'off');
            hold(ax,"on")
            axis(ax,"tight");
            % specifying number of different colours required for plotting
            % as the number of items to be plotted
            colorNum = length(plotList);
            
            % if 'app.GridOffButton_3.Value' = 1 (i.e. the button on the app
            % is pressed), gridlines on the graph is turned off; otherwise,
            % gridlines are displayed on the graphs
            if app.GridOffButton_3.Value
                grid(ax,"off")
            else
                grid(ax,"on")
            end
            
            % if 'Both' is selected for the plot type, double the number of
            % colours required for graph plotting, since for each sample, both the
            % reference and the sample measurement will be plotted
            if isequal(plotType,'Both')
                colorNum = colorNum * 2;
            end
            
            % plotting all selected measurements (sample only,
            % reference only or both sample and reference, depends on what one
            % selects) in time domain
            for idx = plotList

                dsNum_Sample = app.TD_data.dsNum_Sample{idx};
                dsNum_Reference = app.TD_data.dsNum_Reference{idx};
                
                td_time = app.TD_data.ds{idx,dsNum_Reference}(1,:);
                % extracting corresponding electric field intensity values
                % for reference measurement
                td_reference = app.TD_data.ds{idx,dsNum_Reference}(2,:);
                % extracting corresponding electric field intensity values
                % for sample measurement
                td_sample = app.TD_data.ds{idx,dsNum_Sample}(2,:);
                % extracting sample name
                sampleID = strjoin(app.TD_data.measList{idx});
%                 assignin('base',"td_Base",td_base);
%                 assignin('base',"td_sample",td_sample);
                
                % plotting graphs according one's selection
                switch plotType
                    % plotting sample measurements only
                    case 'Sample'
                      plot(ax,td_time,td_sample,'linewidth',1);
                      lgd{cnt} = sampleID;
                      cnt = cnt + 1;
                    % plotting reference measurments only
                    case 'Reference'
                      plot(ax,td_time,td_reference,'linewidth',1);
                    % plotting both sample and reference measurements
                    otherwise
                      plot(ax,td_time,td_reference,td_time,td_sample,...
                          'linewidth',1);
                end
            end
            
            % if only sample measurements are plotted, automatically display legend
            % values as the measurement names
            if isequal(plotType,'Sample')
                legend(ax,(lgd),'Interpreter','none');
            end
            % the colour of each line is set by the color map
            % auto-generated by the 'lines' function, which is a function of
            % the required number of colours
            ax.ColorOrder = lines(colorNum);
            hold(ax,"off")  
            
            
        end
        
        % plotFD_data plots the frequency domain values, choices can be made on plotting reference 
        % measurements only, sample measurements only or both reference and sample measurements,
        % customisation on graph appearance (e.g. gridlines) can be made
        function plotFD_data(app,axesNum)
            % extract datasets that are to be plotted
            plotList = app.FD_select;
            % extracting choice of plotting reference measurement only,
            % sample measurement only or both reference and sample
            % measurements
            plotType = app.ButtonGroupFD.SelectedObject.Text;
            % extracting choice of plotting amplitude or phase values
            plotInfo = app.MagPhaseButtonGroup.SelectedObject.Text;
            % extracting choice of plotting in log or linear scale
            Yscale = app.YscaleButtonGroup.SelectedObject.Text;
            cnt = 1;
            lgd = {};
            
            if isequal(axesNum,"NEW")
                % Create UIFigure and hide until all components are created
                fig = figure('Visible', 'on');
                fig.Position = [100 100 850 500];
                fig.Name = "CaTSPer Frequency-domain Data";
                % Create UIAxes
                ax = uiaxes(fig);
                xlabel(ax,"Frequency (THz)");
                ax.BoxStyle = "full";
                ax.Position = [10 10 800 450];
            else
                ax = axesNum;
            end
            
            % deleting graphics objects, that are specified by 'ax', from
            % the axes
            cla(ax)
            % deleting the legend
            legend(ax,'off');
            hold(ax,"on")
            % setting y-axis scale based on the selected choice of log or
            % linear
            ax.YScale = (Yscale);
            % the colour of each line is set by the color map
            % auto-generated by the 'lines' function, and the function is based
            % on the number of items to be plotted
            ax.ColorOrder = lines(length(plotList));
            
            % reset 'NO LEGEND', 'JET COLORMAP'
            app.LegendButton.Value = 0;
            app.JetColormapButton.Value = 0;
            
            % if the 'grid off' button is selected, remove gridlines from
            % the plot, otherwise gridlines will be displayed on the plot
            if app.GridOffButton.Value
                grid(ax,"off")
            else
                grid(ax,"on")
            end
            
            % plotting all selected measurements in frequency domain
            for idx = plotList
                fd_base = app.FD_data.frequency{idx} * 10^-12;
                sampleID = app.FD_data.measList{idx};
                
                % if amplitude is selected for plotting, extract the
                % amplitude values for reference and sample measurements,
                % and set the y-axis label and plot title to 'Amplitude'
                if isequal(plotInfo,'Amplitude')
                    fd_reference = app.FD_data.ref_amplitude{idx};
                    fd_sample = app.FD_data.sam_amplitude{idx};
                    ylabel(ax,'E_{field intensity} (a.u.)');
                    title(ax,'Amplitude')
                % if phase is selected for plotting instead, extract the
                % phase values for reference and sample measurements,
                % and set the y-axis label and plot title to 'Phase'
                else
                    fd_reference = app.FD_data.ref_phase{idx};
                    fd_sample = app.FD_data.sam_phase{idx};
                    ylabel(ax,'Phase');
                    title(ax,'Phase')
                end
                
                % plotting graphs based on one's choices
                switch plotType
                    % plotting sample measurements only
                    case 'Sample'
                      plot(ax,fd_base,fd_sample,'linewidth',1);
                      lgd{cnt} = sampleID;
                      cnt = cnt + 1;
                    % plotting reference measurements only
                    case 'Reference'
                      plot(ax,fd_base,fd_reference,'linewidth',1);
                    % plotting both sample and refeence measurements
                    otherwise
                      plot(ax,fd_base,fd_reference...
                          ,fd_base,fd_sample,'linewidth',1);
                end
                
            end
            
            % if only sample measurements are plotted, automatically display legend
            % values as the measurement names
            if isequal(plotType,'Sample')
                legend(ax,(lgd),'Location',"best",'Interpreter','none');
                legend(ax,"hide");
            end
            
            hold(ax,"off")
            
        end
        
        % plotFD_data2 plots information (four possible options) extracted from terahertz data in
        % frequency domain, and offers functionalities on customising graph appearance
        function plotFD_data2(app,axesNum)
            plotList = app.FD_select_2;
            ax = axesNum;
            
            % if no measurements are selected, no functions are executed
            if isempty(plotList)
                return;
            end
            
            % extracting the plot type selected (transmittance, absorption, refractive index or dielectric constant)
            plotType = app.PlotDataButtonGroup.SelectedObject.Text;
            % extracting the corresponding information to be plotted, this is
            % different for different chosen plot types
            plotInfo = app.MagPhaseButtonGroup_2.SelectedObject.Text;
            % extracting the choice of plotting a linear or log graph
            Yscale = app.YscaleButtonGroup_2.SelectedObject.Text;
            % extracting the choice of plotting real or imaginary values
            realImag = app.RealImagButtonGroup.SelectedObject.Text;
            cnt = 1;
            lgd = {};
            
            % deleting graphics objects, that are specified by 'ax', from
            % the axes
            cla(ax)
            % deleting the legend
            legend(ax,'off');
            hold(ax,"on")
            % setting y-axis scale based on the selected parameter to be
            % plotted
            ax.YScale = (Yscale);
            % the colour of each line is set by the color map
            % auto-generated by the 'lines' function, and the function is based
            % on the number of items to be plotted
            ax.ColorOrder = lines(length(plotList));
            
            % reset 'NO LEGEND', 'JET COLORMAP'
            app.LegendButton.Value = 0;
            app.JetColormapButton.Value = 0;

            % if the 'grid off' button is selected, remove gridlines from
            % the plot, otherwise gridlines will be displayed on the plot
            if app.GridOffButton_2.Value
                grid(ax,"off")
            else
                grid(ax,"on")
            end
    
            % if the size of the first dimension (row) of 'plotType' is 2, join
            % all values on the first row of 'plotType' to form one single
            % string
            % if size(plotType,1) == 2;
            %     plotType = strjoin(plotType(1));
            % end
            
                       
            for idx = plotList
                % converting frequency values to THz
                fd_base = app.FD_data.frequency{idx} * 10^-12;
                % extracting sample name for legend
                sampleID = app.FD_data.measList{idx};
                lgd{cnt} = sampleID;
                cnt = cnt + 1;

                % if 'amplitude' option is chosen, plot amplitude values as
                % y-values; and similarly for 'phase' option                
                if isequal(plotInfo,'Amplitude')
                    fd_transmit = app.FD_data.transmit_amplitude{idx};
                    ylabel(ax,'Amplitude');
                else
                    fd_transmit = app.FD_data.transmit_phase{idx};
                    ylabel(ax,'Phase');
                end
                
                % plotting corresponding graphs based on selected option
                switch plotType
                    % plotting amplitude/phase (depending on choice)
                    % against frequency
                    case "Transmittance"
                      plot(ax,fd_base,fd_transmit,'linewidth',1);
                      title(ax,'Transmittance');
                    % plotting absorption coefficient against frequency
                    case "Absorption"
                      fd_absorption = app.FD_data.absorption{idx};
                      plot(ax,fd_base,fd_absorption,'linewidth',1);
                      ylabel(ax,'Absorption coefficient (cm^{-1})');
                      title(ax,'Absorption');
                    case "Refractive Index"
                      % plotting real part of refractive index against frequency
                      if isequal(realImag,'Real')
                          fd_refIdx = app.FD_data.refractiveIndex{idx};
                          ylabel(ax,'n',"FontSize",13);
                      else
                      % plotting imaginary part of refractive index against frequency
                          fd_refIdx = app.FD_data.extinction{idx};
                          ylabel(ax,'\kappa',"FontSize",13);
                      end
                      plot(ax,fd_base,fd_refIdx,'linewidth',1);
                      title(ax,'Refractive Index')
                    otherwise
                      % plotting real part of dielectric constant against frequency
                      if isequal(realImag,'Real')
                          fd_dielectric = app.FD_data.eReal{idx};
                          ylabel(ax,'\epsilon\prime',"FontSize",13);
                      % plotting imaginary part of dielectric constant against frequency
                      else
                          fd_dielectric = app.FD_data.eImag{idx};
                          ylabel(ax,'\epsilon\prime\prime',"FontSize",13);
                      end
                      plot(ax,fd_base,fd_dielectric,'Linewidth',1);
                      title(ax,'Dielectric Constant');                       
                end
                
            end
            
            % place legend in the most optimal location and display legend
            % values as the measurement names
            legend(ax,(lgd),'Location',"best",'Interpreter','none');
            legend(ax,"hide");
            hold(ax,"off")
            
            
        end
        
        % FD_PlotData_reset resets the buttons in FD data analysis tab to
        % default, where the absorption, refractive index and dielectric
        % constant functions are inactivated before measurements are added
        function FD_PlotData_reset(app)
%           app.TransmittanceButton.Enable = true;
            app.AbsorptionButton.Enable = false;
            app.RefractiveIndexButton.Enable = false;
            app.DielectricConstantButton.Enable = false;
        end
        
        % plotFD_dataNew plots information (four possible options) extracted from terahertz data in
        % frequency domain, and offers functionalities on customising graph appearance
        function plotFD_dataNew(app)
            % Create UIFigure and hide until all components are created
            fig = figure('Visible', 'on');
            fig.Position = [100 100 1200 800];
            fig.Name = app.ProjectsEditField.Value;

            % Create UIAxes
            ax = uiaxes(fig);
            xlabel(ax, 'Frequency (THz)')
            ax.Position = [20 10 1140 780];
%             ax.YLim = [0 100];

            % if nothing is to be plotted, no functions will be executed    
             plotList = app.FD_select_2;
            
            % if nothing is to be plotted, no functions will be executed
            if isempty(plotList)
                return;
            end
            
            % extracting the plot type selected (transmittance, absorption, refractive index or dielectric constant)
            plotType = app.PlotDataButtonGroup.SelectedObject.Text;
            % extracting the corresponding information to be plotted, this is
            % different for different chosen plot types
            plotInfo = app.MagPhaseButtonGroup_2.SelectedObject.Text;
            % extracting the choice of plotting a linear or log graph
            Yscale = app.YscaleButtonGroup_2.SelectedObject.Text;
            % extracting the choice of plotting real or imaginary values
            realImag = app.RealImagButtonGroup.SelectedObject.Text;
            cnt = 1;
            lgd = {};        
            
            % deleting graphics objects, that are specified by 'ax', from
            % the axes
            cla(ax)
            % deleting the legend
            legend(ax,'off');
            hold(ax,"on")
            % setting y-axis scale based on the selected parameter to be
            % plotted
            ax.YScale = (Yscale);
            % the colour of each line is set by the color map
            % auto-generated by the 'lines' function, and the function is based
            % on the number of items to be plotted
            ax.ColorOrder = flipud(jet(length(plotList)));
            
            % reset 'NO LEGEND', 'JET COLORMAP'
            app.LegendButton.Value = 0;
            app.JetColormapButton.Value = 0;
    
            % if the size of the first dimension (row) of 'plotType' is 2, join
            % all values on the first row of 'plotType' to form one single
            % string
            if size(plotType,1) == 2;
                plotType = strjoin(plotType(1));
            end
            
            % converting frequency values to THz
            for idx = plotList
                fd_base = app.FD_data.frequency{idx} * 10^-12;
                % extracting sample name for legend
                sampleID = app.FD_data.measList{idx};
                lgd{cnt} = sampleID;
                cnt = cnt + 1;
%                 pause(1);
                
                % if 'amplitude' option is chosen, plot amplitude values as
                % y-values; and similarly for 'phase' option
                if isequal(plotInfo,'Amplitude')
                    fd_transmit = app.FD_data.transmit_amplitude{idx};
                    ylabel(ax,'Amplitude');
                else
                    fd_transmit = app.FD_data.transmit_phase{idx};
                    ylabel(ax,'Phase');
                end

                % plotting corresponding graphs based on selected option
                switch plotType
                    % plotting amplitude/phase (depending on choice)
                    % against frequency
                    case 'TRANSMITTANCE'
                      plot(ax,fd_base,fd_transmit,'linewidth',1);
                      title(ax,'Transmittance');
                    % plotting absorption coefficient against frequency
                    case 'ABSORPTION'
                      fd_absorption = app.FD_data.absorption{idx};
                      plot(ax,fd_base,fd_absorption,'linewidth',1);
                      ylabel(ax,'Absorption coefficient (cm^{-1})');
                      title(ax,'Absorption');
                    % plotting refractive index against frequency
                    case 'REFRACTIVE'
                      fd_refIdx = app.FD_data.refractiveIndex{idx};
                      plot(ax,fd_base,fd_refIdx,'linewidth',1);
                      title(ax,'Refractive Index')
                    otherwise
                      % plotting real part of dielectric constant against frequency
                      if isequal(realImag,'Real')
                          fd_dielectric = app.FD_data.eReal{idx};
                      else
                      % plotting imaginary part of dielectric constant against frequency
                          fd_dielectric = app.FD_data.eImag{idx};
                      end
                      plot(ax,fd_base,fd_dielectric,'Linewidth',1);
                      title(ax,'Dielectric Constant');                       
                end
                legend(ax,sampleID,'Interpreter','none');
            end
            
            % place legend in the most optimal location and display legend
            % values as the measurement names
            legend(ax,(lgd),'Location',"best",'Interpreter','none');
            hold(ax,"off")            
        end
        
        
        % TDSunwrap unwraps the phase values from 0.8 THz (due to high SNR) to both directions,
        % and then corrects the phase values in low THz (<0.1 THz) via
        % linear extrapolation
        function output = TDSunwrap(app,pData,freq)
            % unwrapping functon
            %freq = app.FD_data.frequency{idx};
            strFreq = app.StartFrequencyTHzEditField.Value;
            
            %unwrapping starting frequency: 0.8THz due to its high SNR
            strFreq = strFreq * 1e12;
            % find the index of the first element in 'freq' that has a value
            % greater than 'srtFreq'
            srtLoc = find(freq > strFreq,1);
            % using srtLoc as a starting point, and in the order of increasing indices, unwrap phase values to the
            % end of the data
            pData1 = unwrap(pData(srtLoc:end));
            % using srtLoc as a starting point, and in the order of decreasing indices, unwrap phase values to the
            % start of the data
            % this action reorders the data from back to front in pData2
            pData2 = unwrap(pData(srtLoc:-1:1));
            % reordering phase values, to from front to back, excluding the
            % phase value at index strLoc, since its phase is already
            % included in pData1
            pData3 = pData2(end:-1:2);
            % grouping all phase values into one single vector
            pData = [pData3 pData1];
            
            % default: extrapolate phase data from 0.2 to 0.4 THz to estimate the
            % shift in phase and correct for it
            % more noise seems to be resulted if the lower limit of the specified region 
            % takes a value less than 0.2 THz
            epol_srtFreq = app.FromEpolFreqEditField.Value * 1e12;
            epol_endFreq = app.ToEpolFreqEditField.Value * 1e12;
            % find the index of the first element in 'freq' that has a value
            % greater than 'epol_srtFreq'
            epol_srtLoc = find(freq > epol_srtFreq,1);
            % find the index of the first element in 'freq' that has a value
            % greater than 'epol_endFreq'
            epol_endLoc = find(freq > epol_endFreq,1);
            % extracting frequency values from 'epol_srtFreq' to 'epol_endFreq'
            epol_freq = freq(epol_srtLoc:epol_endLoc);
            % extracting phase data that lies in frequency values from 'epol_srtFreq' to 'epol_endFreq'
            epol_data = pData(epol_srtLoc:epol_endLoc);
            
            % fitting a straight line of extracted phase against extracted
            % frequency
            p = polyfit(epol_freq,epol_data,1);
            % find the intercept of the fitted line
            shift = p(2); % y-axis intersection point value
            % shift all phase data down by the intercept value
            output = pData - shift;
            
        end
        
        % findDMPeaks finds peaks (the peak value and location) of the
        % selected data sets based on specified parameters (e.g. minimum prominence value of peak)
        function findDMPeaks(app)
            % convert input values (specifying data sets) in text field from strings to numbers
            dataList = str2num(app.SourceDataSetEditField.Value);
            % extract the input minimum peak prominence value
            pksProm = app.MinPeakProminenceEditField.Value;
            % this parameter is not utilised in this version
            lowLimit = app.LowerLimitTHzEditField.Value *10^12;
            % extract peak number
            pkNum = app.PeakNumSpinner.Value;
            fig = app.CaTSperUIFigure;
            ax = app.UIAxes9;
            hold(ax,"on")
            heightMat  = [];
            freqMat = [];
            
            % if the 'DM_peaks' object is not empty, delete the object
            if ~isempty(app.DM_peaks)
                delete(app.DM_peaks);
            end
            
            % arrange y-axis data
            for idx = dataList
                % extracting frequency values in the data set
                freq = app.FD_data.frequency{idx};
                dmData = app.DM_data.base{idx};
                % extracting calculated data manipulation values (detailed
                % later in another function) in the dataset
                lb = sum(freq<=lowLimit); % lower boundary

                if lb==0||lb==length(freq)
                    msg = strcat("Invalide lower limit");
                    app.LowerLimitTHzEditField.Value = 1;
                    uialert(fig,msg,'Warning');
                    return;
                end

                % finding peaks from dmData with freq as the x-vector, only
                % peaks that has a prominence greater than 'pksProm' will be
                % logged
                [pks, locs] = findpeaks(dmData(lb:end),freq(lb:end),'MinPeakProminence',pksProm);
                
                % if the specified number of peaks to be found is greater
                % than the number of actual peaks found, display a warning
                % message and reset the peak number to 1
                if pkNum > length(pks)
                    msg = strcat('Cannot find Peak-',num2str(pkNum),' from Dataset-',num2str(idx));
                    uialert(fig,msg,'Warning');
                    app.PeakNumSpinner.Value = 1;
                    return;
                end
                
                % if peaks are found, collate peak maxima found from
                % different data sets to one matrix, and similarly with the
                % peak location, then plot the peaks and label them
                if ~isempty(pks)
                    heightMat = [heightMat pks(pkNum)];
                    freqMat = [freqMat locs(pkNum)];
                    plot(ax,locs,pks,'o');
                    text(ax,locs+.1,pks,num2str((1:numel(pks))'));
                end
            end
            hold(ax,"off")
                
            % reversing the order of peak values and storing the values
            app.DM_data.heightMat = flip(heightMat);
            app.DM_data.freqMat = flip(freqMat);
        end
                
        % AdvFDbuttonsEnable enables/disables a set of buttons in the
        % frequency domain tab
        function AdvFDbuttonsEnable(app,tf)
            app.AbsorptionButton.Enable = tf;
            app.RefractiveIndexButton.Enable = tf;
            app.DielectricConstantButton.Enable = tf;
            app.DataManipulationButton.Enable = tf;            
        end
             
        
        function timeDelay = getTimeDelay(app,ds1,ds2)
            
            samTime = ds1(1,:);
            samSig = ds1(2,:);
            refTime = ds2(1,:);
            refSig = ds2(2,:);

            [Ref_max Ref_idx] = max(refSig);
            maxPerLocs = find(refSig >(Ref_max*0.8));
            maxLoc = maxPerLocs(round(length(maxPerLocs)/2));                        
            time_shift = refTime(maxLoc);
            
            refTime = refTime - time_shift;
            samTime = samTime - time_shift;
            
            Sam_max = max(samSig);
            maxPerLocs = find(samSig >(Sam_max*0.8));
            maxLoc = maxPerLocs(round(length(maxPerLocs)/2));
            timeDelay = (round(samTime(maxLoc)*10^3))/10^3;            
        end
        
        function loadDefaultSettings(app)
            %Read the configuration file
            mPath = fileparts(which(mfilename));
            addpath(genpath(mPath));    
            try
                configFile = 'config_default.json';
           catch ME
                fig = app.CaTSperUIFigure;
                uialert(fig,'config_default.json file is missing.','warning');
                return;
            end

            % Apply default configuration settings
            configData = jsondecode(fileread(configFile));
            app.DR_boundary = configData.FFT_Settings.DR_boundary; % dynamic range frequency boundary

            % Default FFT_Settings
            app.FromFreqEditField.Value = configData.FFT_Settings.Frequency_Range(1);
            app.ToFreqEditField.Value = configData.FFT_Settings.Frequency_Range(2);
            app.ZeroFillingpowerofSpinner.Value = configData.FFT_Settings.FFT_Upsampling;
            app.StartFrequencyTHzEditField.Value = configData.FFT_Settings.Unwrapping_Start_Frequency;
            app.FromEpolFreqEditField.Value = configData.FFT_Settings.Extrapolation_Frequency_Range(1);
            app.ToEpolFreqEditField.Value = configData.FFT_Settings.Extrapolation_Frequency_Range(2);
            app.FromTimeEditField.Value = configData.FFT_Settings.Window_Function_Range(1);
            app.ToTimeEditField.Value = configData.FFT_Settings.Window_Function_Range(2);

            % Default thickness metadata
            app.mdSampleThicknessDropDown.Value = configData.Metadata_Settings.Sample_Thickness;
            app.mdReferenceThicknessDropDown.Value = configData.Metadata_Settings.Reference_Thickness;

            % Default sample and referenece dataset
            app.dsSampleDropDown.Value = configData.Dataset_Settings.Sample;
            app.dsReferenceDropDown.Value = configData.Dataset_Settings.Reference;
            app.dsPumpedDropDown.Value = configData.Dataset_Settings.Pump;

        end
        
        function mdThicknessSync(app,measIdx)
            mdNum_SamThickness = app.TD_data.metadata{measIdx}.mdNum_SamThickness;
            mdNum_RefThickness = app.TD_data.metadata{measIdx}.mdNum_RefThickness;

            if isequal(mdNum_SamThickness,0)
                sam_thickness = 0;
            else
                sam_thickness = app.TD_data.metadata{measIdx}.md{mdNum_SamThickness};
            end

            if isequal(mdNum_RefThickness,0)
                ref_thickness = 0;
            else
                ref_thickness = app.TD_data.metadata{measIdx}.md{mdNum_RefThickness};
            end

            if isempty(ref_thickness)||isempty(sam_thickness)
                    warning('Invalid Metadata')
                    return;
            end

            effThickness = app.TD_data.metadata{measIdx}.effThickness;
            
            if isequal(effThickness,"Offset")
                eff_thickness = abs(sam_thickness - ref_thickness);
            else
                eff_thickness = sam_thickness;
            end

            app.TD_data.metadata{measIdx}.sam_thickness = sam_thickness;
            app.TD_data.metadata{measIdx}.ref_thickness = ref_thickness;
            app.TD_data.metadata{measIdx}.eff_thickness = eff_thickness;
        end
    end
    
    methods (Access = public)
        
        % updateThickness calculates the tablet thickness in time domain
        % using a new method
        function updateThickness(app,sam_thickness,pksProm,loc,All,refMdm,maxPer)

            % extracting the measurements selected
            TDselected = app.MeasurementListBox.Value;
            % updating thickness value based on input
            app.ThicknessmmEditField.Value = sam_thickness;
            app.TD_data.metadata{TDselected}.thickness = sam_thickness;
            
            % execute the following if function input 'All' does not equal
            % to zero
            if ~isequal(All,0)
                for TDindex = 1:app.TD_data.totalMeasNum
                    % execute the following if function input 'All' equals
                    % to 1
                    if isequal(All,1)
                        % extracting time values in reference measurement
                        refT = app.TD_data.references{TDindex,1};
                        % extracting electric field values in reference
                        % measurement
                        refE = app.TD_data.references{TDindex,2};
                        % extracting time values in sample
                        % measurement
                        samT = app.TD_data.samples{TDindex,1};
                        % extracting electric field values in reference
                        % measurement
                        samE = app.TD_data.samples{TDindex,2};
                        % extracting time delay value
                        del_t = app.TD_data.metadata{TDindex}.timeDelay;
                      
                        % substracting the first index of the reference
                        % time that is greater than the time delay by the
                        % first index of the reference time that is greater
                        % than zero
                        % note this returns the difference in indices
                        tShift = find(refT > del_t,1) - find(refT > 0,1);
                        % creating a new vector for electric field values
                        % in reference measurement, such that the THz peak
                        % in reference measurement aligns that with sample
                        % measurement
                        refE = [zeros(1,tShift) refE(1:end-tShift)];
                        % manipulate electric field values in reference
                        % measurement such that the maximum amplitude
                        % value equals to that of sample measurement
                        refE = refE * (max(samE)/max(refE));

                        % defining a time range that is four times the time
                        % delay
                        pksLLimit = 4*del_t;
                        % finding the difference between the electric field
                        % values in sample measurement and in adjusted
                        % reference measurement
                        diff = samE - refE;
                        % finding peaks (peak value and index) from the difference values with
                        % time as the x-vector, only peaks that have a prominence
                        % above pksProm will be logged
                        [pks, locs] = findpeaks(diff,refT,'MinPeakProminence',pksProm);
                        % extracting peaks that are located at a time
                        % point that is greater than four times the time
                        % delay (from zero point)
                        pks = pks(locs>pksLLimit);
                        % extracting indices of peaks that are located at a time
                        % point that is greater than four times the time
                        % delay (from zero point)
                        locs = locs(locs>pksLLimit);
                     
                        % extracting the peak location value that has the
                        % index of 'loc' (function input) in the 'locs'
                        % vector
                        mrt = locs(loc);
                        % find and log the index at which the time value
                        % equals 'mrt'
                        pkloc = find(refT == mrt,1);
                        
                        % peak time correction function
                        % extract the adjusted peak value at location
                        % 'pkloc'
                        mrtAmp = diff(pkloc);
                        % for each value in the 'diff' vector, if the value is greater than mrtAmp*maxPer,
                        % value of 1 will be returned, otherwise value of 0 is returned
                        mrtRange = diff > mrtAmp*maxPer; % 0 and 1 vector
                        % setting values, which are outside of a range around 'pkloc', to
                        % zero
                        maxPerRange = 25;
                        mrtRange(1:pkloc-maxPerRange) = 0;
                        mrtRange(pkloc+maxPerRange:end) = 0;
                        % calculating the mean reference time
                        mrt = sum(refT.*mrtRange)/sum(mrtRange);
                        % converting values from pico seconds to seconds
                        mrt = mrt *10^-12;
                        
                        del_t = del_t*10^-12;
                        % calculate the resulting thickness to 4 s.f.
                        sam_thickness = floor((mrt - 3*del_t)*3e8/2*10^3*1000)/1000;
                    end
                    
                    % updating thickness
                    app.TD_data.metadata{TDindex}.sam_thickness = sam_thickness;
                    TDanalysisUpdate(app,TDindex);
                end
            end
            TDanalysisUpdate(app,TDselected);
            
        end
        
        % updateFreqRange updates the list of data sets selected for the
        % FD Data Analysis section in the frequency domain tab and empties
        % certain data from matrices       
        
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.PRJ_count = 0;
            app.filename = [];
            loadDefaultSettings(app);

        end

        % Value changed function: MeasurementListBox
        function MeasurementListBoxValueChanged(app, event)
            % MeasurementListBoxValueChanged extracts and displays relevant values 
            MeasNum = app.MeasurementListBox.Value;
            timeDelay = app.TD_data.metadata{MeasNum}.timeDelay;
            n_eff = app.TD_data.metadata{MeasNum}.refractiveIndex;
            etl_t = app.TD_data.metadata{MeasNum}.internalReflection;

            % display sample, reference, and pump datasets on the GUI
            % dropdown handler
            dsNum_Sample = app.TD_data.dsNum_Sample{MeasNum};
            dsNum_Reference = app.TD_data.dsNum_Reference{MeasNum};
            dsNum_Pump = app.TD_data.dsNum_Pump{MeasNum};
            app.dsSampleDropDown.Value = strcat("ds",num2str(dsNum_Sample));            
            if dsNum_Reference % for non-zero dsNum_Reference
                app.dsReferenceDropDown.Value = strcat("ds",num2str(dsNum_Reference));
            else
                app.dsReferenceDropDown.Value = "no";
            end
            if dsNum_Pump % for non-zero dsNum_Pump
                app.dsPumpedDropDown.Value = strcat("ds",num2str(dsNum_Pump));
            else
                app.dsPumpedDropDown.Value = "no";
            end

            % display sample and reference thicknesses on the GUI dropdown
            % handler
            mdNum_SamThickness = app.TD_data.metadata{MeasNum}.mdNum_SamThickness;
            mdNum_RefThickness = app.TD_data.metadata{MeasNum}.mdNum_RefThickness;          

            if mdNum_SamThickness
                app.mdSampleThicknessDropDown.Value = strcat("md",num2str(mdNum_SamThickness));
            else
                app.mdSampleThicknessDropDown.Value = "no";
            end

            if mdNum_RefThickness
                app.mdReferenceThicknessDropDown.Value = strcat("md",num2str(mdNum_RefThickness));
            else
                app.mdReferenceThicknessDropDown.Value = "no";
            end

            description = app.TD_data.metadata{MeasNum}.description;
            mdDescription = app.TD_data.metadata{MeasNum}.mdDescription;
            dsDescription = app.TD_data.metadata{MeasNum}.dsDescription;

            % display metadata values
            md1 = app.TD_data.metadata{MeasNum}.md{1};
            md2 = app.TD_data.metadata{MeasNum}.md{2};
            md3 = app.TD_data.metadata{MeasNum}.md{3};
            md4 = app.TD_data.metadata{MeasNum}.md{4};

            try
                app.md1EditField.Value = md1;
            end
            try 
                app.md2EditField.Value = md2;
            end
            try
                app.md3EditField.Value = md3;
            end
            try
                app.md4EditField.Value = md4;    
            end

            % display general information
            scanTime = app.TD_data.metadata{MeasNum}.time;
            insProfile = app.TD_data.metadata{MeasNum}.instrument;
            userProfile = app.TD_data.metadata{MeasNum}.user;

            app.GeneralDescriptionEditField.Value = description;
            app.GeneralDateandTimeEditField.Value = scanTime;
            app.GeneralInstrumentEditField.Value = insProfile;
            app.GeneralUserEditField.Value = userProfile;
            app.GeneralRefractiveIndexEditField.Value = n_eff;
            app.GeneralEtalonEditField.Value = etl_t;

            % display metadata descriptions
            mdList = strsplit(mdDescription,',');
            mdSize = size(mdList,2);

            if mdSize >= 1 , app.md1DesEditField.Value = mdList{1}; , end;
            if mdSize >= 2 , app.md2DesEditField.Value = mdList{2}; , end;
            if mdSize >= 3 , app.md3DesEditField.Value = mdList{3}; , end;
            if mdSize >= 4 , app.md4DesEditField.Value = mdList{4}; , end;

            % display dataset descriptions
            dsList = strsplit(dsDescription,',');
            dsSize = size(dsList,2);

            if dsSize >= 1 , app.ds1DesEditField.Value = dsList{1}; , end;
            if dsSize >= 2 , app.ds2DesEditField.Value = dsList{2}; , end;
            if dsSize >= 3 , app.ds3DesEditField.Value = dsList{3}; , end;
            if dsSize >= 4 , app.ds4DesEditField.Value = dsList{4}; , end;
                      
        end

        % Button pushed function: ADDButton
        function ADDButtonPushed(app, event)
            % ADDButtonPushed adds the measurements in the measurement box to the selection box 
            addItem = app.MeasurementListBox.Value;
            ListBoxItem = {};
            ListBoxItemValue = [];
            
            % if the measurement list box is empty, do not continue to
            % execute this function
            if isempty(addItem)
                return;
            end
            
            % if the measurements already added do not include the item to
            % be added, perform the following actions
            if ~sum(app.TD_select == addItem)
                % adding the new item to the existing list
                app.TD_select = [app.TD_select addItem];
                % sort the list
                app.TD_select = sort(app.TD_select);
                % data should involve numerical values
                ListBoxItemValue = app.TD_select;
                
                % creating a name for each measurement based on the sample
                % list
                for ListNo = 1:length(app.TD_select)
                   ItemNo = app.TD_select(ListNo);
                   AddItem = strjoin(app.TD_data.measList{ItemNo});
                   ListBoxItem{ListNo} = AddItem;
                end
                   
             % numerical value    
             app.SelectionListBox.ItemsData = ListBoxItemValue;
             % text
             app.SelectionListBox.Items = ListBoxItem;
            
            end
             
            % if the added item is not on the first of the measurement
            % list, default select the item above the added item
            if ~isequal(addItem,1)
                List = app.MeasurementListBox.ItemsData;
                curLoc = sum(List < addItem);
                if ~isequal(curLoc,0)
                    cursor = List(curLoc);
                    app.MeasurementListBox.Value = cursor;                  
                end

            end
            
        end

        % Button pushed function: TransformButton
        function TransformButtonPushed(app, event)
        % TRANSFORMButtonPushed performs fast Fourier transform on the
        % reference and sample measurement, extracts amplitude and phase
        % data in the frequency domain and trims data accordingly. Options
        % such as choosing window functions are possible.    
        
            % checking the current FD list number
            % extracting the column size of 'app.FD_data.measList'
            FDindexNum = size(app.FD_data.measList,2);
            FDindex = 0;
            
            % extracting the values that were specified by the user
            ListBoxItem = app.FDListListBox.Items;
            addFDList = app.TD_select;
            isAutowindow = app.AutoWindowButton.Value;
            min_freq = app.FromFreqEditField.Value;
            max_freq = app.ToFreqEditField.Value;
            upscale = app.ZeroFillingpowerofSpinner.Value; 
            funcName = app.ApodisationFunctionDropDown.Value; %window function
            
            % this applies to all measurements selected for time domain
            % processing
            for cnt = 1:length(addFDList)
                % reference waveform
                % extract the time spacing between logged values
                TDindex = addFDList(cnt);

                dsNum_Sample = app.TD_data.dsNum_Sample{TDindex};
                dsNum_Reference = app.TD_data.dsNum_Reference{TDindex};
                
                % reference waveform 
                xSpacing = app.TD_data.metadata{TDindex}.xSpacing;
                % convert the time spacing into frequency spacing
                fs = 1/(xSpacing*10^-12); % obtain sampling frequency based on xSpacing value
                t_reference = app.TD_data.ds{TDindex,dsNum_Reference}(1,:);
                E_reference = app.TD_data.ds{TDindex,dsNum_Reference}(2,:);
                
                % sample waveform
                t_sample = app.TD_data.ds{TDindex,dsNum_Sample}(1,:);
                E_sample = app.TD_data.ds{TDindex,dsNum_Sample}(2,:);
                
                % time delay between reference and sample measurement
                delta_t = app.TD_data.metadata{TDindex}.timeDelay;
                
                % windowing
                % obtaining the time delay for one internal reflection to
                % occur
                % this is calulcated in the TDanalysisUpdate function
                etl_t = app.TD_data.metadata{TDindex}.internalReflection;
                
                if isAutowindow
                    % if the auto window function is selected, the upper
                    % limit in the range is defined as the time delay with one
                    % internal reflection, and the lower limit in the range is
                    % defined as the negative of the time
                    % delay with one internal reflection plus the time
                    % delay without internal reflection
                    % this time range is defined such that both the
                    % reference and sample peaks are of a time which is
                    % equivalent to the internal reflection away from the
                    % lower and upper limit respectively
                    td_max = etl_t;
                    td_min = - etl_t + delta_t;
                else
                    % maximum and minimum time delay values are defined
                    % by the user
                    td_max = app.ToTimeEditField.Value;
                    td_min = app.FromTimeEditField.Value;
                end
                
                % finding the first index that has a time equal or greater than the
                % minimum time delay
                cutoff_low = sum(t_sample < td_min) + 1;
                % finding the greatest value index that has a time less than the
                % maximum time delay
                cutoff_high = sum(t_sample < td_max);
                
                % trim the reference electric field vector using the
                % selected indices
                E_reference = E_reference(cutoff_low:cutoff_high);
                % trim the sample electric field vector using the
                % selected indices
                E_sample = E_sample(cutoff_low:cutoff_high);

                % centre reference and sample peak to midpoint of apodisation
                % function respectively, by adding minimum number of zeros
                % to one end of the waveform
                % this is not upsampling of data; upsampling will be done by
                % MATLAB's built-in FFT function

                % find the location of the reference and sample peak
                % respectively
                % use max() instead of findpeaks() as the sample and
                % reference peak must always have the greatest amplitude
                % amongst all points in the waveform by definition
                [~,reference_pk_loc] = max(E_sample);
                [~,sample_pk_loc] = max(E_sample);

                % find the minimum number of zeros that needs to be added
                % before or after the waveform in order to centre the
                % reference or sample peak
                % if the value is positive, it means that the
                % zeros should be added before the waveform; if the value
                % is negative, zeros should be added after the waveform
                % note this is the result of (length(E_reference)-reference_pk_loc)-(reference_pk_loc-1)
                ref_add_zero_no = length(E_reference)-2*reference_pk_loc+1;
                sam_add_zero_no = length(E_sample)-2*sample_pk_loc+1;

                % adding zeros based on the results above to locate
                % reference and sam peaks at the midpoint of the
                % apodisation function
                % no zeros are added if the peak is already at midpoint
                E_reference = [zeros(1, max(0, ref_add_zero_no)), E_reference, zeros(1, max(0, -ref_add_zero_no))];
                E_sample = [zeros(1, max(0, sam_add_zero_no)), E_sample, zeros(1, max(0, -sam_add_zero_no))];
                
                % window function
                % if any apodization function is chosen (apart from
                % boxcar), apply the apodization function over the trimmed
                % reference and sample electric field measurements
                % respectively
                if ~isequal(funcName,'Boxcar')
                    wf = str2func(funcName);
                    E_reference = E_reference.*...
                        window(wf,length(E_reference))';
                    E_sample = E_sample.*window(wf,length(E_sample))';
                end
                
                % fast Fourier tranform
                samNum = length(E_sample);
                % calculating the length of the sample electric field with
                % an upscale added
                % this is calculated using a power of two, which the exponent is a sum of
                % the nearest integer (greater than or equal to) exponent that
                % returns the original length of the sample electric
                % field, and the exponent specified by the user on
                % upscaling
                N = 2^(nextpow2(length(E_sample))+upscale);
                
                % perform N-point discrete Fourier transform (multiplying N-by-N square matrix with the vector, of length N, to be Fourier transformed)
                % perform this on both reference and sample electric field
                % measurement
                % the Fourier transform transforms the time domain data
                % into frequency domain
                FD_reference = fft(E_reference,N);
                FD_sample = fft(E_sample,N);

                % correcting for phase introduced due to fast Fourier
                % transform and zero padding due to centering time-domain waveform
                % correction for zero padding due to centering time-domain waveform is
                % only needed when the zeros are added before the
                % time-domain waveform
                k = [0:1:N-1];
                FD_reference = FD_reference.*exp(i.*2.*pi.*k.*max(1,ref_add_zero_no)./N);
                FD_sample = FD_sample.*exp(i.*2.*pi.*k.*max(1,sam_add_zero_no)./N);
                                
                % Calculate the double and single-sided spectra
                % create a frequency vector from 0 to half the frequency
                % spacing (calculated earlier in this function), in
                % increments equivalent to the value obtained by dividing the frequency
                % spacing with the upscaled data length
                freqs = 0:fs/N:fs/2;
                % trim the frequency domain data, for both reference and sample, to the same length as
                % 'freq', and adjust the values in the vector by dividing
                % with the original length of sample values
                FD_reference = FD_reference(1:N/2 + 1)/samNum;
                FD_sample = FD_sample(1:N/2 + 1)/samNum;
                % calculate the spectral resolution
                % in units of THz
                freqRes = fs/(N*10^12);
                % converting the spectral resolution to a string with 3
                % significant figures displayed
                app.DEBUGMsgLabel.Text = strcat("Spectral resolution (THz): ", num2str(freqRes,'%.3f'));
                
                % find the first index that has a frequency equal to or
                % greater than the minimum frequency specified by the user
                cutoff_low = sum(freqs < min_freq*10^12) + 1;
                % find the greatest index that has a frequency
                % less than the maximum frequency specified by the user
                cutoff_high = sum(freqs < max_freq*10^12); 
                
                % trim the frequency, reference and sample data values
                % using the upper limit
                FD_frequency = freqs(1:cutoff_high);                
                FD_reference = FD_reference(1:cutoff_high);
                FD_sample = FD_sample(1:cutoff_high);
                
                % extracting order numbers, descriptions, Fourier transform
                % parameter summary for display in the 'FD list' in the
                % frequency domain tab
                FDindex = cnt + FDindexNum;
                
                % FTsetting description - more detailed or simpler
                if app.FulllistnamingCheckBox.Value
                    FTsetting = strcat(' (',num2str(td_min,3),'-',num2str(td_max,3),'ps,'...
                        ,num2str(min_freq,3),'-',num2str(max_freq,3),'THz,'...
                        ,(funcName),',',num2str(upscale),'upscale,',')');
                else
                    FTsetting = strcat(' (',num2str(td_min,3),'-',num2str(td_max,3),' ps,'...
                        ,(funcName),')');
                end
                
                sampleID = strjoin(app.TD_data.measList{TDindex});
                FDsampleName = strcat(num2str(FDindex),':',sampleID);
                AddItem = strcat(FDsampleName,FTsetting);
                app.FD_data.measList{FDindex} = FDsampleName;
                app.FD_data.metadata{FDindex} = FTsetting;
                ListBoxItem{FDindex} = AddItem;
                
                % calculate the number of etalon oscillations in the data
                % number of etalon oscillations is default to be one if
                % auto window is selected
                %etlNum_sam = floor((td_max - delta_t)/(etl_t-delta_t));
                
                % input FD_data structure
                sampleID = matlab.lang.makeValidName(sampleID);
                app.FD_data.metadata{FDindex} = ...
                    app.TD_data.metadata{TDindex};
                app.FD_data.metadata{FDindex}.sam_thickness = ...
                    app.TD_data.metadata{TDindex}.sam_thickness;
                app.FD_data.metadata{FDindex}.ref_thickness = ...
                    app.TD_data.metadata{TDindex}.ref_thickness;
                app.FD_data.metadata{FDindex}.timeWindow = [td_min td_max];
                app.FD_data.metadata{FDindex}.windowFunction = funcName;
                %app.FD_data.metadata{FDindex}.etlNum_sam = etlNum_sam;
                
                % unwrap phase data (calling TDSunwrap function)
                % unwrapping phase values for reference and sample
                % measurements in frequency domain
                app.FD_data.frequency{FDindex} = FD_frequency;
                % the negative sign is added to compensate for the negative sign introduced during the fast Fourier transform process
                uw_refPhase = TDSunwrap(app,-angle(FD_reference),FD_frequency);
                uw_samPhase = TDSunwrap(app,-angle(FD_sample),FD_frequency);
                
                % cut off lower frequency part
                % trim lower end values using the lower cutoff value
                % lower end values can only be trimmed now since trimming
                % them earlier would affect the phase values obtained
                % from unwrapping
                FD_frequency = FD_frequency(cutoff_low:end);
                FD_reference = FD_reference(cutoff_low:end);
                FD_sample = FD_sample(cutoff_low:end);
                uw_refPhase = uw_refPhase(cutoff_low:end);
                uw_samPhase = uw_samPhase(cutoff_low:end);
                
                % allocating FD_data
                app.FD_data.frequency{FDindex} = FD_frequency;
                app.FD_data.ffd_references{FDindex} = FD_reference;
                app.FD_data.ffd_samples{FDindex} = FD_sample;
                app.FD_data.ref_amplitude{FDindex} = abs(FD_reference);
                app.FD_data.ref_phase{FDindex} = uw_refPhase;
                app.FD_data.sam_amplitude{FDindex} = abs(FD_sample);
                app.FD_data.sam_phase{FDindex} = uw_samPhase;
                
                % calculate Transmittance
                % calculate the transmission amplitude by dividing the
                % absolute value of the sample electric field in frequency
                % domain by that of the equivalent reference value
                app.FD_data.transmit_amplitude{FDindex} =...
                    abs(FD_sample)./abs(FD_reference);
                % ensure transmitted phase is positive and hence ensure
                % refractive index spectra is correctly calculated
                app.FD_data.transmit_phase{FDindex} = ...
                    abs(uw_samPhase - uw_refPhase);
                
            end
            
            app.FDListListBox.Items = ListBoxItem;
            app.FDListListBox.ItemsData = (1:FDindex);
        end

        % Button pushed function: Plot1TDButton
        function Plot1TDButtonPushed(app, event)
            plotTD_data(app,app.UIAxes1);
        end

        % Button pushed function: Plot1FDButton
        function Plot1FDButtonPushed(app, event)
            plotFD_data(app,app.UIAxes3);     
        end

        % Button pushed function: Plot2FDButton
        function Plot2FDButtonPushed(app, event)
            plotFD_data(app,app.UIAxes4);
        end

        % Value changed function: AutoWindowButton
        function AutoWindowButtonValueChanged(app, event)
            % AUTOWINDOWButtonValueChanged enables/disables the editing of
            % certain fields based on the deselection/selection of the auto
            % window button
            value = app.AutoWindowButton.Value;
            if value
                app.ToTimeEditField.Enable = "off";
                app.FromTimeEditField.Enable = "off";
            else
                app.ToTimeEditField.Enable = "on";
                app.FromTimeEditField.Enable = "on";
            end
        end

        % Button pushed function: DELButton
        function DELButtonPushed(app, event)
            % DELButtonPushed deletes the selected data set from the selection
            % list, updates the selection list and updates the default data set selected in the selection
            % list
            delItem = app.SelectionListBox.Value;
            ListBoxItem = {};
            ListBoxItemValue = [];
            
            % double check only one item is selected for deletion
            if size(delItem,1)
                if  sum(app.TD_select == delItem)
                    % removing the item to be deleted from the selection
                    % list
                    app.TD_select = app.TD_select(app.TD_select~=delItem);
                    % update the selection list displayed
                    ListBoxItemValue = app.TD_select;
                
                    % updating the numbers displayed on the selection list
                    for ListNo = 1:length(app.TD_select)
                        ItemNo = app.TD_select(ListNo);
                        AddItem = strjoin(app.TD_data.measList{ItemNo});
                        ListBoxItem{ListNo} = AddItem;
                    end
         
                    app.SelectionListBox.ItemsData = ListBoxItemValue;
                    app.SelectionListBox.Items = ListBoxItem;
                    
                    % if the selection list is not empty, default item to
                    % be selected in the selection list as the item above,
                    % if this is not possible, select the first item on the
                    % selection list
                    if ~isempty(ListBoxItemValue)
                        curLoc = sum(ListBoxItemValue<delItem);
                        if isequal(curLoc,0)
                           curLoc = 1; 
                        end
                        cursor = ListBoxItemValue(curLoc);
                        app.SelectionListBox.Value = cursor;                           
                    end
                    
                end         
            end
        end

        % Button pushed function: ALLButton
        function ALLButtonPushed(app, event)
            % ALLButtonPushed transfers all items in the measurement list box
            % to the selection list box

            % extracts all values in the measurement list box
            ListBoxItemValue = app.MeasurementListBox.ItemsData;
            ListBoxItems = app.MeasurementListBox.Items;
            
            % inputs all the extracted values into the selection list box
            app.TD_select = ListBoxItemValue;            
            app.SelectionListBox.ItemsData = ListBoxItemValue;
            app.SelectionListBox.Items = ListBoxItems;
        end

        % Button pushed function: Plot2TDButton
        function Plot2TDButtonPushed(app, event)
            plotTD_data(app,app.UIAxes2);
        end

        % Button pushed function: RemoveButton
        function RemoveButtonPushed(app, event)
            % REMOVEButtonPushed removes the selected item from the list box,
            % updates the index for the remaining data in the list box, and
            % clears all strings/data stored in the two selection boxes in the
            % frequency domain tab

            delItem = app.FDListListBox.Value;
            ListBoxItems = app.FDListListBox.Items;
            
            % if no item is selected for deletion, do not continue to run
            % the code
            if isempty(delItem)
                return;
            end
            
            % run the FDdataDel function to delete the item from the list
            % box
            FDdataDel(app,delItem);
            % remove the entry of the item deleted
            ListBoxItems(delItem) = [];

            % at this point, all strings in the list box beyond 'delItem'
            % will shift up by one index in the array, but the number
            % inside the string has not been updated yet
            % this loop updates the number inside the string such that it
            % matches the index number in the array
            for idx = delItem:length(app.FD_data.measList)
                % extracting the strings
                ListBoxID = ListBoxItems{idx};
                sampleID = app.FD_data.measList{idx};
                % extracting the old number, which is one greater than the
                % index number in the structure, and converting it with the ':' sign into a string                
                repOld = strcat(num2str(idx+1),':');
                % extracting the new number, which equals the
                % index number in the structure, and converting it with the ':' sign into a string
                repNew = strcat(num2str(idx),':');
                
                % replace the number in the string with the updated number
                sampleID = replace(sampleID,repOld,repNew);
                ListBoxID = replace(ListBoxID,repOld, repNew);
                
                % update the information stored in the array
                app.FD_data.measList{idx} = sampleID;
                ListBoxItems{idx} = ListBoxID;
            end
            
            % update the information stored in the array
            app.FDListListBox.Items = ListBoxItems;
            app.FDListListBox.ItemsData = (1:length(ListBoxItems));
            
            % clear all strings/names stored in the selection boxes in the frequency domain tab
            app.FD_select = {};
            app.FD_select_2 = {};
            app.FDSelectionListBox.Items = {};
            app.FDSelectionListBox_2.Items = {};
        end

        % Button pushed function: ALLFDButton
        function ALLFDButtonPushed(app, event)
            % ALLFDButtonPushed extracts all strings in the FD list
            % box and place them into the FD selection box

            % extracting values
            ListBoxItemValue = app.FDListListBox.ItemsData;
            % select all values in the list box
            app.FD_select = ListBoxItemValue;
            % if there are no items in the list box, do not continue to run
            % this function            
            if isempty(ListBoxItemValue)
                return;
            end
                
            % for all values selected in the list box
            for ListNo = 1:length(app.FD_select)
                % extracting the value
                ItemNo = app.FD_select(ListNo);
                % extracting the string located at the corresponding index
                AddItem = app.FD_data.measList{ItemNo};
                % storing the string into an array
                ListBoxItem{ListNo} = AddItem;
            end
                  
            % places all the values and strings into the FD selection box     
            app.FDSelectionListBox.ItemsData = ListBoxItemValue;
            app.FDSelectionListBox.Items = ListBoxItem;
        end

        % Button pushed function: ADDFDButton
        function ADDFDButtonPushed(app, event)
            % ADDFDButtonPushed adds the selected item from the FD list box to
            % the FD selection box
            
            % extracting the selected value in the FD list box    
            addItem = app.FDListListBox.Value;
            % empty arrays/vectors
            ListBoxItem = {};
            ListBoxItemValue = [];
            
            % if there are no items selected in the FD list box, do not continue
            % to execute this function
            if isempty(addItem)
                return;
            end
            
            % if the selected item is not already in the FD select list,
            % execute the following
            if ~sum(app.FD_select == addItem)
                % add the selected item into the FD select list
                app.FD_select = [app.FD_select addItem];
                % sort the list
                app.FD_select = sort(app.FD_select);
                % store the list under another variable
                ListBoxItemValue = app.FD_select;
                
                for ListNo = 1:length(app.FD_select)
                   % extracting the value
                   ItemNo = app.FD_select(ListNo);
                   % extracting the string stored with an index of the same value
                   AddItem = app.FD_data.measList{ItemNo};
                   % storing the string into an array
                   ListBoxItem{ListNo} = AddItem;
                end
                       
             % places all the values and strings into the FD selection box
             app.FDSelectionListBox.ItemsData = ListBoxItemValue;
             app.FDSelectionListBox.Items = ListBoxItem;
            
            end
            
            % if the added item is not on the first of the FD
            % list, default select the item above the added item in the
            % list box
            if ~isequal(addItem,1)
                List = app.FDListListBox.ItemsData;
                curLoc = sum(List < addItem);
                if ~isequal(curLoc,0)
                    cursor = List(curLoc);
                    app.FDListListBox.Value = cursor;                  
                end
            end  
        end

        % Button pushed function: DELFDButton
        function DELFDButtonPushed(app, event)
            % DELFDButton deletes an item from the FD selection box and updates
            % the FD selection box
            
            % extract selected value
            delItem = app.FDSelectionListBox.Value;
            % empty arrays/vectors
            ListBoxItem = {};
            ListBoxItemValue = [];
            
            % if one item is selected for deletion, perform the following
            if size(delItem,1)
                % double check the item to be deleted is in the selection
                % list/box, and if yes, perform the following
                if  sum(app.FD_select == delItem)
                    % remove the deleted item from the selection list
                    app.FD_select = app.FD_select(app.FD_select~=delItem);
                    ListBoxItemValue = app.FD_select;
                
                for ListNo = 1:length(app.FD_select)
                   % extracting the value
                   ItemNo = app.FD_select(ListNo);
                   % extracting the string stored with an index of the same value
                   AddItem = app.FD_data.measList{ItemNo};
                   % storing the string into an array
                   ListBoxItem{ListNo} = AddItem;
                end
                       
                % places all the strings into the FD selection box
                app.FDSelectionListBox.ItemsData = ListBoxItemValue;
                app.FDSelectionListBox.Items = ListBoxItem;
                
                % if there are still items in the FD selection box, default
                % select the item that comes before the deleted item; if
                % there is no item before the deleted item, default select
                % the first item on the FD selection box
                if ~isempty(ListBoxItemValue)
                    curLoc = sum(ListBoxItemValue<delItem);
                        if isequal(curLoc,0)
                           curLoc = 1; 
                        end
                    cursor = ListBoxItemValue(curLoc);
                    app.FDSelectionListBox.Value = cursor;
                end
            
            end         
            end
        end

        % Button pushed function: AssignTD_DataButton
        function AssignTD_DataButtonPushed(app, event)
            % ASSIGNButtonTDPushed assigns the values in 'app.TD_data' to the
            % variable 'TD_data' in the 'base' workspace
            assignin('base',"TD_data",app.TD_data);
        end

        % Button pushed function: AssignFD_DataButton
        function AssignFD_DataButtonPushed(app, event)
            % ASSIGNButtonFDPushed assigns the values in 'app.FD_data' to the
            % variable 'FD_data' in the 'base' workspace
            assignin('base',"FD_data",app.FD_data);
        end

        % Button pushed function: RemoveAllButton
        function RemoveAllButtonPushed(app, event)
            % REMOVEALLButtonPushed removes all stored frequency domain data,
            % empties data in the frequency domain list/selection boxes and
            % reset the buttons in the FD data analysis section to default

            % run FDdataDel to remove all stored frequency domain data
            FDdataDel(app,':');      
            % empty all arrays/vectors relating FD list and selection boxes      
            app.FDListListBox.Items = {};
            app.FDSelectionListBox.Items = {};
            app.FDSelectionListBox_2.Items = {};
            app.FD_select = [];
            app.FD_select_2 = [];
            % run FD_PlotData_reset to reset the buttons in FD data analysis tab to
            % default
            FD_PlotData_reset(app);
        end

        % Button pushed function: SaveData_TD
        function SaveData_TDPushed(app, event)
            % SaveData_TDPushed executes a series of dialouge boxes and saves
            % the selected or all data in the time domain tab
            % pop up box to double check intention of saving all data
            question = "Do you want to save all data?";
            % the dialouge box is titled 'Data Range'
            % available options in responding to question are 'Yes' or 'No, only selected data'
            % if the return key is pressed, the dialouge box will remain
            % open
            answer = questdlg(question,'Data Range','Yes','No, only selected data','cancel');
            
            % in the 'select file to write' dialouge box, allow files to be
            % saved a '*.mat' file or all types
            filter = {'*.mat';'*.*'};
            [filename, filepath] = uiputfile(filter);
            % when the cancel button is selected, the filename and filepath
            % values are registered as zero. do not continue to perform
            % this function.            
            if isequal(filename,0)||isequal(filepath,0)
                return;          
            end
                       
            % create a string with the file path together with the file
            % name
            fullfile = strcat(filepath,filename);
            
            % if 'yes' is selected for saving all data, all data is saved
            if isequal(answer,'Yes')
                ListItems = app.MeasurementListBox.Items;
                TD_data = app.TD_data;
            % if only selected data are to be saved
            else
                % if no items are in the TD selection box, display error
                % message and do not continue to perform the function
                if isempty(app.TD_select)
                    warning('There are no selected data.')
                    return;
                end
                
                % extracting the selected item names and the data (this extends to the for loop below)
                ListItems = app.SelectionListBox.Items;
                ListIdx = app.TD_select;
                cnt = 1
                
                for Idx = ListIdx
                   TD_data.samples{cnt,1} = app.TD_data.samples{Idx,1};
                   TD_data.samples{cnt,2} = app.TD_data.samples{Idx,2};
                   TD_data.references{cnt,1} = app.TD_data.references{Idx,1};
                   TD_data.references{cnt,2} = app.TD_data.references{Idx,2};
                   TD_data.measList{cnt} = app.TD_data.measList{Idx};
                   TD_data.metadata{cnt} = app.TD_data.metadata{Idx};
                   %TD_data.analysis{cnt} = app.TD_data.analysis{Idx}; %[Re_max, delta_t, n_eff, elt_t]
                 
                   cnt = cnt + 1;
                end
                TD_data.totalMeasNum = length(ListIdx);

            end

            save(fullfile,'TD_data','ListItems');
        end

        % Button pushed function: LoadData_TD
        function LoadData_TDButtonPushed(app, event)
            % LoadData_TDButtonPushed loads data from a *.mat file to the time domain tab
            % open a dialouge box for user to select a *.mat file from a folder
            [filename, filepath] = uigetfile('*.mat');
            
            % if either the file name or file path has a value of 0, do not
            % continue to execute the function
            if isequal(filename,0)||isequal(filepath,0)
                return;
            end
            
            % catenate the file path and file name to a single string
            fullfile = strcat(filepath,filename);
            
            % empty arrays associated with the time domain (TD) tab via the
            % TDdataDel function
            TDdataDel(app);
            % load the file
            load(fullfile);
            % extract data from the file to corresponding sections in the app
            app.TD_data = TD_data;
            app.MeasurementListBox.Items = ListItems;
            app.MeasurementListBox.ItemsData = (1:length(ListItems));
            % enable the Fourier transform function
            app.TransformButton.Enable = true;
            
            % empties the sample list and settings in the frequency domain tab
            app.FD_data.measList = {};
            app.FD_data.metadata = {};
        end

        % Button pushed function: SaveData_FD
        function SaveData_FDButtonPushed(app, event)
            % SaveData_FDButtonPushed saves data from the frequency domain tab

            % in the 'select file to write' dialouge box, allow files to be
            % saved a '*.mat' file or all types
            filter = {'*.mat';'*.*'};
            % extracts the selected/specified file path
            [filename, filepath] = uiputfile(filter);
            
            % if either the file name or file path has a value of 0, do not
            % continue to execute the function
            if isequal(filename,0)||isequal(filepath,0)
                return;          
            end
            
            % catenate the file path and file name to a single string
            fullfile = strcat(filepath,filename);
            % saving the data
            ListItems = app.FDListListBox.Items;
            ListItems2 = app.FDSelectionListBox_2.Items;
            FD_data = app.FD_data;
            save(fullfile,'FD_data','ListItems','ListItems2');
        end

        % Button pushed function: ALLFDButton_2
        function ALLFDButton_2Pushed(app, event)
           % ALLFDButton_2Pushed adds all items from the FD list to the FD
           % selection box
            
            % extracting the number of items in the FD List
            ListBoxItemValue = app.FDListListBox.ItemsData;
            app.FD_select_2 = ListBoxItemValue;
            
            % if the ListBoxItemValue is empty, do not continue to execute
            % this function
            if isempty(ListBoxItemValue)
                return;
            end
                
            % extract all items from the FD List
            for ListNo = 1:length(app.FD_select_2)
                ItemNo = app.FD_select_2(ListNo);
                AddItem = app.FD_data.measList{ItemNo};
                ListBoxItem{ListNo} = AddItem;
            end
                       
            % place all the extracted items into the FD selection box
            app.FDSelectionListBox_2.ItemsData = ListBoxItemValue;
            app.FDSelectionListBox_2.Items = ListBoxItem;
            
            % disable buttons in the FD data analysis tab via the
            % AdvFDbuttonsEnable function
            AdvFDbuttonsEnable(app,0);
        end

        % Button pushed function: ADDFDButton_2
        function ADDFDButton_2Pushed(app, event)
            % ADDFDButton_2Pushed adds the selected item from the FD list to
            % the FD selection box
            
            % extract item to be added from the FD List
            addItem = app.FDListListBox.Value;
            % empty arrays
            ListBoxItem = {};
            ListBoxItemValue = [];
            
            % if there are no items in the FD list, do not continue to
            % execute the function
            if isempty(addItem)
                return;
            end
            
            % if the FD selection list do not contain the item to be added
            if ~sum(app.FD_select_2 == addItem)
                % add the item to the FD selection list
                app.FD_select_2 = [app.FD_select_2 addItem];
                % sort the selection list
                app.FD_select_2 = sort(app.FD_select_2);
                ListBoxItemValue = app.FD_select_2;
                
                % extract all items from the selection list
                for ListNo = 1:length(app.FD_select_2)
                   ItemNo = app.FD_select_2(ListNo);
                   AddItem = app.FD_data.measList{ItemNo};
                   ListBoxItem{ListNo} = AddItem;
                end
                       
             % update the FD selection box with the selection list
             app.FDSelectionListBox_2.ItemsData = ListBoxItemValue;
             app.FDSelectionListBox_2.Items = ListBoxItem;          
            end 
            
            % if the added item is not on the first of the FD
            % list, default select the item above the added item in the
            % list box
            if ~isequal(addItem,1)
                List = app.FDListListBox.ItemsData;
                curLoc = sum(List < addItem);
                if ~isequal(curLoc,0)
                    cursor = List(curLoc);
                    app.FDListListBox.Value = cursor;                  
                end
            end 
            
            % disable buttons in the FD data analysis tab via the
            % AdvFDbuttonsEnable function
            AdvFDbuttonsEnable(app,0);
        end

        % Button pushed function: DELFDButton_2
        function DELFDButton_2Pushed(app, event)
            % DELFDButton_2Pushed deletes the selected item from the FD
            % seelction box
            
            % extract the item selected
            delItem = app.FDSelectionListBox_2.Value;
            % empty arrays
            ListBoxItem = {};
            ListBoxItemValue = [];
            
            % if only one item is selected for deletion
            if size(delItem,1)
                % if the selection list contains the item to be deleted
                if  sum(app.FD_select_2 == delItem)
                    % delete item from the selection list
                    app.FD_select_2 = app.FD_select_2(app.FD_select_2~=delItem);
                    ListBoxItemValue = app.FD_select_2;
                
                % extract all items from the selection list
                for ListNo = 1:length(app.FD_select_2)
                   ItemNo = app.FD_select_2(ListNo);
                   AddItem = app.FD_data.measList{ItemNo};
                   ListBoxItem{ListNo} = AddItem;
                end
                       
                % update the FD selection box with the selection list
                app.FDSelectionListBox_2.ItemsData = ListBoxItemValue;
                app.FDSelectionListBox_2.Items = ListBoxItem;
                
                % if the added item is not on the first of the FD
                % list, default select the item above the added item in the
                % list box
                if ~isempty(ListBoxItemValue)
                    curLoc = sum(ListBoxItemValue<delItem);
                        if isequal(curLoc,0)
                           curLoc = 1; 
                        end
                    cursor = ListBoxItemValue(curLoc);
                    app.FDSelectionListBox_2.Value = cursor;
                end
            
            end         
            end
        end

        % Value changed function: FDSelectionListBox_2
        function FDSelectionListBox_2ValueChanged(app, event)
            % FDSelectionListBox_2ValueChanged updates fields with the new
            % input values
            
            % extract the index of the selected item
            idx = app.FDSelectionListBox_2.Value;
            
            % extract the input description
            description = app.FD_data.metadata{idx}.description;
            
            % extract the input values
            sam_thickness = app.FD_data.metadata{idx}.sam_thickness;
            ref_thickness = app.FD_data.metadata{idx}.ref_thickness;
            %etlNum_sam= app.FD_data.metadata{idx}.etlNum_sam;
                       
            % display in EditTextFields
            app.DescriptionEditField_FD.Value = description;
            app.ReferenceEditField.Value = ref_thickness;
            app.SampleEditField.Value = sam_thickness;                  
        end

        % Button pushed function: CalculateOpticalParametersButton
        function CalculateOpticalParametersButtonPushed(app, event)
            % CALCULATEButtonPushed calculates the refractive index, the
            % absorption coefficient, extinction coefficient and the dielectric
            % constants of the sample
            
            % if no items are in the FD selection box (under FD data
            % analysis), display warning message
            fig = app.CaTSperUIFigure;

            if isempty(app.FD_select_2)
                uialert(fig,'No items','Warning');
                return;
            end
            
            % perform the following for each item
            for FDindex = app.FD_select_2
                % thickness information can be either the sample thickness
                % or the offset between the reference and sample thickness,
                % which can be determined by ThicknessSwitch on the GUI.

                sam_thickness = app.FD_data.metadata{FDindex}.sam_thickness;
                ref_thickness = app.FD_data.metadata{FDindex}.ref_thickness;

                if isequal(app.ThicknessSwitch_FD.Value,"Offset")
                    eff_thickness = sam_thickness - ref_thickness;
                else
                    eff_thickness = sam_thickness;
                end
                
                % if there is no data on the measured thickness, display
                % error message and do not continue to perform the function
                if isempty(app.FD_data.metadata{FDindex}.eff_thickness)
                    ID = app.FD_data.measList{FDindex};
                    msg = strcat((ID)," doesn't have thickness information.");
                    uialert(fig,(msg),'Abort Calculation');
                    return;
                end
                
                c = 299792458; % the speed of light
                n_medium = 1; % refractive index of medium
                n_reference = 1; % refractive indx of the reference

                % if ~isequal(app.mdReferenceThicknessDropDown.Value,"air")
                %     uialert(fig,'n_reference is set to 1. Please confirm this','Warning');
                % end

                % calculate the refractive index of the sample using values
                % extracted from frequency domain calculations
                n_sample = c.*app.FD_data.transmit_phase{FDindex}./...
                    (2*pi*app.FD_data.frequency{FDindex}.*eff_thickness*10^-3) + 1;
                
                % calculate the absorption coefficient, the logartihm base is e.
                % the following procedures references equation two in the work by Jepsen
                % and Fischer, 2005 (doi.org/10.1364/OL.30.000029) and breaks down equation two into steps
                
                ref_factor = 4.*n_medium.*n_reference./...
                    ((n_medium + n_reference).^2);
                sam_factor = 4.*n_medium.*n_sample./...
                    ((n_medium + n_sample).^2);
                scaleFactor = ref_factor./sam_factor;
                
                scaledTransmitMag = ...
                    app.FD_data.transmit_amplitude{FDindex}.*scaleFactor;
                
                absorption = -2./(eff_thickness*0.1).*log(scaledTransmitMag); % unit: cm^-1
                % calcuate extinction coefficients
                % 100 is for compensating cm to m in absorption calculation
                % absorption = 4pi*f*k/c -> k = c*absorption/4pi*f
                extinction = c*100*absorption./(4*pi*app.FD_data.frequency{FDindex});

                % storing calculated values
                app.FD_data.refractiveIndex{FDindex} = n_sample;
                app.FD_data.absorption{FDindex} = absorption; 
                app.FD_data.extinction{FDindex} = extinction;
                
                % calculate real and imaginary parts of the dielectric constancts
                eReal = n_sample.^2 - extinction.^2;
                eImag = 2 * n_sample.*extinction;
                
                app.FD_data.eReal{FDindex} = eReal;
                app.FD_data.eImag{FDindex} = eImag;
                
            end
            
            % enable absorption, refractive index, dielectric constant btn
            AdvFDbuttonsEnable(app,1);
        end

        % Button pushed function: Plot1FDButton_2
        function Plot1FDButton_2Pushed(app, event)
            plotFD_data2(app,app.UIAxes3);
        end

        % Button pushed function: Plot2FDButton_2
        function Plot2FDButton_2Pushed(app, event)
            plotFD_data2(app,app.UIAxes4);
        end

        % Selection changed function: PlotDataButtonGroup
        function PlotDataButtonGroupSelectionChanged(app, event)
            % PlotDataButtonGroupSelectionChanged enables different corresponding 
            % graph plotting options, based on the plot type of transmittance, 
            % absorption coefficient, refractive index and dielectric constant   
            
            % extract the value of the selected button
            selectedButton = app.PlotDataButtonGroup.SelectedObject.Text;
            
            % % catenate strings into one
            % if size(selectedButton,1) == 2;
            %     selectedButton = strjoin(selectedButton(1));
            % end
            
            % based on the selected options, enable/disable the options of
            % linear/log y-scale, plotting magnitude/phase, real/imaginary
            % values
            switch selectedButton
                % for transmittance, options include plotting linear/log y-scale and magnitude/phase
                case "Transmittance"
                    app.YscaleButtonGroup_2.Visible = true;
                    app.MagPhaseButtonGroup_2.Visible = true;
                    app.RealImagButtonGroup.Visible = false;

                    % for dielectric constant, options include plotting
                    % real/imaginary values                
                case "Dielectric Constant"
                    app.linearButton_2.Value = true;
                    app.YscaleButtonGroup_2.Visible = false;
                    app.MagPhaseButtonGroup_2.Visible = false;
                    app.RealImagButtonGroup.Visible = true;

                    % for refractive index, options include plotting
                    % real/imaginary values                        
                case "Refractive Index"
                    app.linearButton_2.Value = true;
                    app.YscaleButtonGroup_2.Visible = false;
                    app.MagPhaseButtonGroup_2.Visible = false;
                    app.RealImagButtonGroup.Visible = true;

                    % for absorption coefficient, no options are available                    
                otherwise
                    app.linearButton_2.Value = true;
                    app.YscaleButtonGroup_2.Visible = false;
                    app.MagPhaseButtonGroup_2.Visible = false; 
                    app.RealImagButtonGroup.Visible = false;
            end
            
        end

        % Value changed function: LegendButton_2
        function LegendButton_2ValueChanged(app, event)
            % LEGENDButton_2ValueChanged displays or hides legend based on
            % user's specified preference
            value = app.LegendButton_2.Value;
            if isequal(value,0)
                legend(app.UIAxes1,"hide");
                legend(app.UIAxes2,"hide");
            else
                legend(app.UIAxes1,"show");
                legend(app.UIAxes2,"show");
            end
        end

        % Value changed function: JetColormapButton_2
        function JetColormapButton_2ValueChanged(app, event)
            % JETCOLORMAPButtonValueChanged applies the jet colormap to the lines in the plot if user
            % selects the jet colormap option, otherwise the lines colormap is applied
            value = app.JetColormapButton_2.Value;
            idxNum = length(app.TD_select);
            if isequal(value,1)
                app.UIAxes1.ColorOrder = jet(idxNum);
                app.UIAxes2.ColorOrder = jet(idxNum);
            else
                app.UIAxes1.ColorOrder = lines(idxNum);
                app.UIAxes2.ColorOrder = lines(idxNum);
            end
        end

        % Value changed function: LegendButton
        function LegendButtonValueChanged(app, event)
            % LEGENDButtonValueChanged displays or hides legend based on
            % user's specified preference

            value = app.LegendButton.Value;
             if isequal(value,0)
                legend(app.UIAxes3,"hide");
                legend(app.UIAxes4,"hide");
            else
                legend(app.UIAxes3,"show");
                legend(app.UIAxes4,"show");
            end
            
        end

        % Value changed function: JetColormapButton
        function JetColormapButtonValueChanged(app, event)
            % JETCOLORMAPButton_2ValueChanged applies the jet colormap to the lines in the plot if user
            % selects the jet colormap option, otherwise the lines colormap is applied

            value = app.JetColormapButton.Value;
            idxNum = length(app.FD_select_2);
            if isequal(value,1)
                app.UIAxes3.ColorOrder = jet(idxNum);
                app.UIAxes4.ColorOrder = jet(idxNum);
            else
                app.UIAxes3.ColorOrder = lines(idxNum);
                app.UIAxes4.ColorOrder = lines(idxNum);
            end
        end

        % Button pushed function: CheckDynamicRangeButton
        function CheckDynamicRangeButtonPushed(app, event)
            % CHECKDYNAMICRANGEButtonPushed performs fast fourier transform on the sample measurements,
            % calculates the transmittance and absorption coefficient, and then
            % open the DR checker app together with these values 

            % display warning message if no items are selected
            TDindex = app.SelectionListBox.Value;
            if isempty(TDindex)
                fig = app.CaTSperUIFigure;
                uialert(fig,'Select item in the the list','Warning');
                return;
            end


            % extract input value
            question = "Select The Waveform Period to be processed";
            truncationOption = questdlg('Select Truncation Period','Truncation','Full Waveform','FFT-Setting Values','Cancel');

            upscale = app.ZeroFillingpowerofSpinner.Value; 
            dsNum_Sample = app.TD_data.dsNum_Sample{TDindex};
            dsNum_Reference = app.TD_data.dsNum_Reference{TDindex};

            % reference waveform
            % extract the time spacing between logged values
            xSpacing = app.TD_data.metadata{TDindex}.xSpacing;
            % convert the time spacing into frequency spacing
            fs = 1/(xSpacing*10^-12); % obtain sampling frequency based on xSpacing value
            t_reference = app.TD_data.ds{TDindex,dsNum_Reference}(1,:);
            E_reference = app.TD_data.ds{TDindex,dsNum_Reference}(2,:);
                
            % sample waveform
            t_sample = app.TD_data.ds{TDindex,dsNum_Sample}(1,:);
            E_sample = app.TD_data.ds{TDindex,dsNum_Sample}(2,:);


            if isequal(truncationOption,'Full Waveform')
                td_max = max(t_reference);
                td_min = min(t_reference);
            else
                td_max = app.ToTimeEditField.Value;
                td_min = app.FromTimeEditField.Value;
            end
                          
            % finding the first index that has a time equal or greater than the
            % minimum time delay    
            cutoff_low = sum(t_sample < td_min) + 1;
            % finding the greatest value index that has a time less than the
            % maximum time delay
            cutoff_high = sum(t_sample < td_max);
                
            % trim the reference electric field vector using the
            % selected indices
            E_reference = E_reference(cutoff_low:cutoff_high);
            % trim the sample electric field vector using the
            % selected indices
            E_sample = E_sample(cutoff_low:cutoff_high);
                
            % fast Fourier tranform
            samNum = length(E_sample);
            % calculating the length of the sample electric field with
            % an upscale added
            % this is calculated using a power of two, which the exponent is a sum of
            % the nearest integer (greater than or equal to) exponent that
            % returns the original length of the sample electric
            % field, and the exponent specified by the user on
            % upscaling
            N = 2^(nextpow2(length(E_sample))+upscale);
                
            % perform N-point discrete Fourier transform (multiplying N-by-N square matrix with the vector, of length N, to be Fourier transformed)
            % perform this on both reference and sample electric field
            % measurement
            % the Fourier transform transforms the time domain data
            % into frequency domain
            FD_reference = fft(E_reference,N);
            FD_sample = fft(E_sample,N);

            % correcting for phase introduced due to fast Fourier
            % transform
            % correction for zero padding is not necessary here
            % since no padding is placed to centre waveform with respect to apodisation function
            k = [0:1:N-1];
            FD_reference = FD_reference.*exp(i.*2.*pi.*k./N);
            FD_sample = FD_sample.*exp(i.*2.*pi.*k./N);
                
            % Calculate the double and single-sided spectra
            % create a frequency vector from 0 to half the frequency
            % spacing (calculated earlier in this function), in
            % increments equivalent to the value obtained by dividing the frequency
            % spacing with the upscaled data length
            freqs = 0:fs/N:fs/2;
            % trim the frequency domain data, for both reference and sample, to the same length as
            % 'freq', and adjust the values in the vector by dividing
            % with the original length of sample values
            FD_reference = FD_reference(1:N/2 + 1)/samNum;
            FD_sample = FD_sample(1:N/2 + 1)/samNum;
            
            % find the first index that has a frequency
            % less than 0.2 THz
            DR_boundary = app.DR_boundary;
            cutoff_low = sum(freqs < DR_boundary(1)*10^12) + 1;
            % find the first index that has a frequency
            % less than 5 THz
            cutoff_high = sum(freqs < DR_boundary(2)*10^12); 
                
            % trim the frequency, reference and sample data values
            % using the upper cutoff limit
            FD_frequency = freqs(1:cutoff_high);                
            FD_reference = FD_reference(1:cutoff_high);
            FD_sample = FD_sample(1:cutoff_high);

            % unwrap phase data (calling TDSunwrap function)
            % unwrapping phase values for reference and sample
            % measurements in frequency domain
            % the negative sign is added to compensate for the negative sign introduced during the fast Fourier transform process
            uw_refPhase = TDSunwrap(app,-angle(FD_reference),FD_frequency);
            uw_samPhase = TDSunwrap(app,-angle(FD_sample),FD_frequency);

            % cut off lower frequency part
            FD_frequency = FD_frequency(cutoff_low:end);
            FD_reference = FD_reference(cutoff_low:end);
            FD_sample = FD_sample(cutoff_low:end);
            uw_refPhase = uw_refPhase(cutoff_low:end);
            uw_samPhase = uw_samPhase(cutoff_low:end);
              
            % calculate Transmittance
            transmAmp = abs(FD_sample)./abs(FD_reference);
            % ensure transmitted phase is positive and hence ensure
            % refractive index spectra is correctly calculated
            transmPha = abs(uw_refPhase - uw_samPhase);
         
            % calculate the absorption coefficient, the logartihm base is e.
            % this is calculated by referencing equation 2 from Jepsen and Fischer (DOI: 10.1364/ol.30.000029)
            % the calculation is broken down into steps
            
            c = 299792458; % the speed of light
            n_medium = 1; % refractive index of medium
            n_reference = 1; % refractive indx of the reference
            eff_thickness = app.TD_data.metadata{TDindex}.eff_thickness;
            n_sample = c.*transmPha./(2*pi*FD_frequency.*eff_thickness*10^-3) + 1;
            ref_factor = 4*n_medium*n_reference/((n_medium + n_reference).^2);
            sam_factor = 4*n_medium*n_sample/((n_medium + n_sample).^2);
            scaleFactor = ref_factor/sam_factor;
            scaledTransmitMag = transmAmp*scaleFactor;
                
            absorption = -2./(eff_thickness*0.1).*log(scaledTransmitMag); % unit: cm^-1
  
            % Find the selected item in the list box
            refF = abs(FD_frequency);
            refE = abs(FD_reference);
            samA = absorption;
            sampleID = strjoin(app.TD_data.measList{TDindex});
            n_eff = app.TD_data.metadata{TDindex}.refractiveIndex;
            
            % open the DR checker app with the calculated values
            app.DialogApp = DR_Checker(app,refF,refE,samA,n_eff,eff_thickness,sampleID);
        end

        % Button pushed function: PlotForCustomisationButton_FD2
        function PlotForCustomisationButton_FD2Pushed(app, event)
            plotFD_dataNew(app);
        end

        % Button pushed function: DataManipulationButton
        function DataManipulationButtonPushed(app, event)
            % dataManipulationButtonPushed extracts values and arrays in the
            % frequency domain tab to the data manipulation tab, and sets up th
            % drop down menu
            
            % extracting arrays and values
            dataList = app.FD_select_2;
            dataList2 = app.FDSelectionListBox_2.Items;
            dataList2v = app.FDSelectionListBox_2.ItemsData;
            app.AvailableDataSetEditField.Value = num2str(dataList);
            app.data3DDropDown.Items = dataList2;
            app.data3DDropDown.ItemsData = dataList2v;
            app.DM_data.set = 'FD_data';
            itemList = {'frequency', 'ref_amplitude', 'ref_phase', 'sam_amplitude', 'sam_phase', 'transmit_amplitude', 'transmit_phase', 'refractiveIndex', 'absorption', 'extinction', 'eReal', 'eImag'};
            app.AforDropDown.Items = itemList;
            app.BforDropDown.Items = itemList;
            app.CforDropDown.Items = itemList;
            app.TabGroup.SelectedTab = app.TabGroup.Children(3);
        end

        % Button pushed function: ImportAllDataButton
        function ImportAllDataButtonPushed(app, event)
            % IMPORTALLDATAButtonPushed imports all datasets to the source data
            % set list in the DM tab and makes them available for data manipulation
        
            dataList = app.FD_select_2;
            app.SourceDataSetEditField.Value = num2str(dataList);
        end

        % Button pushed function: CalculateButton
        function CalculateButtonPushed(app, event)
            % CALCULATEButton_2Pushed extracts the relevant data that is
            % specified as A, B and C in DM tab and calculates the specified
            % Y-axis data formulation
            
            % convert the strings in the source data set to numerical values
            dataList = str2num(app.SourceDataSetEditField.Value);
            % extract the number of values
            app.NumberofDataEditField.Value = length(dataList);
            % enable the plotting functions
            app.PlotindividualdatasetsButton.Enable = "on";
            app.PlotmeanandrangeButton.Enable = "on";
            
            % extract the parameter that is set to be the y-axis
            Func = app.YaxisDataFormulationEditField.Value;
            
            % do not continue to execute the function if 'Func' is empty
            if isempty(Func)
                return;
            end
            
            dataSrc = app.DM_data.set;
            
            % performing the following for each data set
            for idx = dataList
                % extract parameters that A, B and C corresponds to
                A = app.AforDropDown.Value;
                B = app.BforDropDown.Value;
                C = app.CforDropDown.Value;
                
                % extract the relevant data
                A = app.(dataSrc).(A){idx};
                B = app.(dataSrc).(B){idx};
                C = app.(dataSrc).(C){idx};
                
                % based on the extracted data, calculate the parameter as
                % defined by 'Func'
                output = eval([(Func)]);
                app.DM_data.base{idx} = output;
            end
        end

        % Button pushed function: PlotindividualdatasetsButton
        function PlotindividualdatasetsButtonPushed(app, event)
            % PLOTindividualdatasetsButtonPushed plots the specified data sets
            % individually based on the specified values as x and y data

%             if ~exist('app.FD_data.DM1')
%                 display("no data to plot")
%                 return;
%             end
            
            ax = app.UIAxes9;
            
            % deleting graphics objects, that are specified by 'ax', from the axes
            cla(ax);
            % convert the strings in the source data set to numerical values
            dataList = str2num(app.SourceDataSetEditField.Value);
            % extract input value from Y axis data formulation
            ax.YLabel.String = app.YaxisDataFormulationEditField.Value;
            hold(ax,"on");
            
            % extract chosen X axis data value
            xData = app.XaxisDataDropDown.Value;
            % extract the strings of the available data set
            dataSrc = app.DM_data.set;
            
            % plot the selected data sets specified in 'source data sets'
            for idx = dataList
                plot(ax,app.(dataSrc).(xData){idx},app.DM_data.base{idx},"LineWidth",1);
            end
            
            % extract parameters that A, B and C corresponds to
            A = app.AforDropDown.Value;
            B = app.BforDropDown.Value;
            C = app.CforDropDown.Value;
            % creating y-label
            ylabel = strrep(app.YaxisDataFormulationEditField.Value,'A',A);
            ylabel = strrep(ylabel,'B',B);
            ylabel = strrep(ylabel,'C',C);
            
            % put axis labels on plot
            ax.reset;
            ax.YLabel.String = ylabel;
            ax.YLabel.Interpreter = "none";
            ax.XLabel.String = app.XaxisDataDropDown.Value;
            hold(ax,"off");
            
        end

        % Button pushed function: DisplayXLinesButton
        function DisplayXLinesButtonPushed(app, event)
            % DISPLAYXLINESButtonPushed plots red dashed lines at specified
            % frequencies on the plot

            ax = app.UIAxes9;
            % convert the input frequencies from strings to numerical values
            selectedFreq = str2num(app.GetDatafromFrequencyTHzEditField.Value);
            
            % plotting red x lines (straight lines) on the plot at the
            % specified frequencies
            for idx = selectedFreq
                idxLoc = idx*10^12;
                xlineName = strcat(num2str(idx)," THz");
                xline(ax,idxLoc,'--r',xlineName);
            end
        end

        % Button pushed function: RearrangeDataButton
        function RearrangeDataButtonPushed(app, event)
            % REARRANGEDATAButtonPushed rearranges the y-axis data formulation
            % value first according to the specified frequncies and then
            % according to data sets
            
            % convert the strings in the source data set to numerical values
            dataList = str2num(app.SourceDataSetEditField.Value);
            % convert the input frequencies from strings to numerical value
            freqList = str2num(app.GetDatafromFrequencyTHzEditField.Value);
            cnt1 = 0;
            
            % for each specified frequency
            for freqIdx = freqList
                % empty array
                dmData = [];
                xtempList = [];
                % setting counts
                cnt1 = cnt1 +1;
                cnt2 = length(dataList);
                
                % for each specified data sets
                for idx = dataList
                    % extract frequency values for the data set
                    freq = app.FD_data.frequency{idx};
                    % convert the specified frequency into units of THz
                    freqTHz = freqIdx * 10^12;
                    % find the index for the first frequency that has a
                    % value greater than the specified frequency
                    freqLoc = find(freq > freqTHz,1);
                    % extract the corresponding value as calculated from y
                    % axis data formulation and adds it to the first position of the array
                    % designated to the specified data set
                    dmData = [app.DM_data.base{idx}(freqLoc) dmData];
                    
                    % extract the common name for the set of data and the
                    % individual measurement identifiers
                    xList = app.FD_data.measList{idx};
                    comLoc = strfind(xList,':');
                    % common name for the set of data
                    barLoc = strfind(xList,'_');
                    preName = xList(comLoc+1:barLoc-1);
                    % individual measurement identifier
                    xTemp = xList(barLoc + 1:end);
                    xtempList{cnt2} = xTemp;
                    cnt2 = cnt2 - 1;
                end
                
                % display the name of the data set 
                app.MeasurementEditField.Value = preName;
                % store the frequency value as a string together with the
                % unit 'THz'
                dataFreq = strcat(num2str(freqIdx)," THz");
                app.DM_data.freq{cnt1} = dataFreq;
                % store the specific data value
                app.DM_data.values{cnt1} = dmData;
            end
            
            % stores the total number of specified frequency
            app.DM_count = cnt1;
            % stores the list of names of the specified data sets
            app.DM_data.tempList = xtempList;
            % stores the list of names of the specified data sets as a matrix
            app.XaxisDataEditField.Value = cell2mat(xtempList);
            % enable graph plotting
            app.PlotButton.Enable = "on";
        end

        % Button pushed function: PlotButton
        function PlotButtonPushed(app, event)
            % PLOTButton_2Pushed plots the y-axis data formulation value
            % against data sets for different specified frequencies

            ax = app.UIAxes10;
            % empty legend
            lgd = {};
            % extracting strings for labels in plot
            labels = app.DM_data.tempList;
            % find the number of labels
            numLabels = length(labels);
            
            % deleting graphics objects, that are specified by 'ax', from
            % the axes
            cla(ax)
            hold(ax,"on")
            
            % for each specified frequency
            for idx = 1:app.DM_count
                % setting legends as the specified frequencies
                lgd{idx} = app.DM_data.freq{idx};
                % extracting the data values to be plotted as y-value
                yData = app.DM_data.values{idx};
                % plotting the values
                plot(ax,yData,'--o','LineWidth',1);
            end
            
            % formatting plot title, x-ticks and x-labels
            ax.reset;
            ax.XTick = (1:numLabels);
            ax.XLabel.String = app.XLabelEditField.Value;
            ax.Title.String = app.MeasurementEditField.Value;
            ax.XTickLabel = labels;
            ax.XTickLabelRotation= 45;
            ax.TickLabelInterpreter = 'none';
            legend(ax,lgd,'Interpreter','none');
            hold(ax,"off")
        end

        % Button pushed function: AssignDM_DataButton
        function AssignDM_DataButtonPushed(app, event)
            % ASSIGNButtonDMPushed assigns the values in app.DM_data to the
            % variable 'DM_data' to the base workspace

            assignin('base',"DM_data",app.DM_data);
        end

        % Button pushed function: RearrangeDataButton_2
        function RearrangeDataButton_2Pushed(app, event)
            % REARRANGEDATAButton_2Pushed calls the findDMPeaks function,
            % extracts and stores both the common name for the set of data and
            % the individual measurement identifiers
            
            % convert the strings in the source data set to numerical values
            dataList = str2num(app.SourceDataSetEditField.Value);
            % find the number of data sets specified 
            cnt = length(dataList);
            
            % call findDMPeaks function
            app.findDMPeaks;
         
            % extract the common name for the set of data and the
            % individual measurement identifiers
            for idx = dataList
                xList = app.FD_data.measList{idx};
                comLoc = strfind(xList,':');
                barLoc = strfind(xList,'_');
                % common name for the set of data
                preName = xList(comLoc+1:barLoc-1);
                % individual measurement identifier
                xTemp = xList(barLoc + 1:end);
                xtempList{cnt} = xTemp;
                cnt = cnt - 1;
            end
           
            % store the common name for the set of data
            app.MeasurementEditField_2.Value = preName;
            % store the individual measurement identifiers
            app.DM_data.tempList = xtempList;
            % convert the individual measurement identifiers to matrix
            app.XaxisDataEditField_2.Value = cell2mat(xtempList);
        end

        % Value changed function: LowerLimitTHzEditField
        function LowerLimitTHzEditFieldValueChanged(app, event)
            % LowerLimitTHzEditFieldValueChanged extracts the updated value in
            % the lower limit (THz) field and then calls the findDMPeaks function

            findDMPeaks(app);
        end

        % Button pushed function: PlotButton_2
        function PlotButton_2Pushed(app, event)
            % PLOTButton_3Pushed plots specified frequency values 
            % against individual data sets

            ax = app.UIAxes10;
            % extracting strings for labels in plot
            labels = app.DM_data.tempList;
            % find the number of labels
            numLabels = length(labels);
            
            % deleting graphics objects, that are specified by 'ax', from the axes
            cla(ax)
            
            % extract the specified frequency values
            yData = app.DM_data.freqMat;
            % plot specified frequency values against individual data sets
            plot(ax,(1:numLabels),yData,'--o','LineWidth',1);
                  
            % formatting plot title, x-ticks and x-labels      
            ax.reset;
            ax.XTick = (1:numLabels);
            ax.XLabel.String = app.XLabelEditField_2.Value;
            ax.Title.String = app.MeasurementEditField_2.Value;
            ax.XTickLabel = labels;
            ax.XTickLabelRotation= 45;
        end

        % Button pushed function: ClearMemoryButton
        function ClearMemoryButtonPushed(app, event)
            % CLEARMEMORYButtonPushed creates a dialouge box to ask if the user
            % would like to clear memory and if the answer is yes, arrays and
            % parameters are emptied

                question = "Do you want to clear memory?";
                answer = questdlg(question,'Warning');
                
            % if 'yes' is selected, empty the following arrays and parameters
            if answer == "Yes"
                TDdataDel(app)

                app.TD_data = [];
                app.FD_data = [];
                app.DM_data = [];
                app.TD_select = [];
                app.FD_select = [];
                app.FD_select_2 = [];
                app.MeasurementListBox.Items = {};
                app.SelectionListBox.Items = {};
                app.FDListListBox.Items = {};
                app.FDSelectionListBox.Items = {};
                app.FDSelectionListBox_2.Items = {};
                app.filename = [];
                app.fullpathname = [];
                app.PRJ_count = 0;
                app.DEBUGMsgLabel.Text = '';
                app.ProjectsEditField.Value = '';
            end
        end

        % Value changed function: MinPeakProminenceEditField
        function MinPeakProminenceEditFieldValueChanged(app, event)
            findDMPeaks(app);
        end

        % Value changed function: PeakNumSpinner
        function PeakNumSpinnerValueChanged(app, event)
            findDMPeaks(app);
        end

        % Button pushed function: LoadData_FD
        function LoadData_FDButtonPushed(app, event)
            % LoadData_FDButtonPushed loads a *.mat file, extracts its
            % frequency domain data and display the data on the graphical user
            % interface of the app
            
            % open a dialouge box for user to select a *.mat file from a folder
            [filename, filepath] = uigetfile('*.mat');
            
            % if either the file name or file path has a value of 0, do not
            % continue to execute the function
            if isequal(filename,0)||isequal(filepath,0)
                return;
            end
            
            % catenate the file path and file name to a single string
            fullfile = strcat(filepath,filename);
            
            % load the file
            load(fullfile);
            % run FDdataDel to remove all stored frequency domain data on
            % the app
            FDdataDel(app,:);
            % loads frequency domain data from the file to the app and the
            % graphical user interface
            app.FD_data = FD_data;
            app.FDListListBox.Items = ListItems;
            app.FDListListBox.ItemsData = (1:length(ListItems));
            app.FDSelectionListBox_2.Items = ListItems;
            app.FDSelectionListBox_2.ItemsData = (1:length(ListItems));
        end

        % Value changed function: JetColormapButton_DM
        function JetColormapButton_DMValueChanged(app, event)
            % JETCOLORMAPButton_DMValueChanged plots data sets using the jet
            % colormap or the lines colormap based on the selection by user
            
            % extracts the selection by user, if the jet colormap button is
            % clicked, the value is one, otherwise the value is zero
            
            value = app.JetColormapButton_DM.Value;
            % converts the value from a string to number
            dataList = str2num(app.SourceDataSetEditField.Value);
            % extract the number of data sets
            idxNum = length(dataList);
            % if jet colormap is selected, plot data sets using the jet
            % colormap
            if isequal(value,1)
                app.UIAxes9.ColorOrder = flipud(jet(idxNum));
            % if jet colormap is not selected, plot data sets using the lines
            % colormap
            else
                app.UIAxes9.ColorOrder = lines(idxNum);
            end
        end

        % Button pushed function: Plot1_3DButton
        function Plot1_3DButtonPushed(app, event)
            % PLOT1_3DButtonPushed plots a 3D plot for the specified data set
        
            ax = app.UIAxes9;
            % extract the chosen data set
            idx = app.data3DDropDown.Value;
            
            % if there is no available data for running the function,
            % display warning message
            if isequal(idx,'noavailabledata')
                fig = app.CaTSperUIFigure;
                uialert(fig,'Import data set before using this function.','Warning');
                return;
            end
            
            % deleting graphics objects, that are specified by 'ax', from
            % the axes
            cla(ax);
            % convert the input values in the source data set edit field
            % from strings to numbers
            dataList = str2num(app.SourceDataSetEditField.Value);
            hold(ax,"on");
            
            % extract the data specified as the x-data
            xData = app.XaxisDataDropDown.Value;
            dataSrc = app.DM_data.set;

            % plot the data in a 3D plot using the values specified as A, B and C 
            plot3(ax,app.(dataSrc).frequency{idx},app.(dataSrc).(xData){idx},app.DM_data.base{idx},"LineWidth",1);
            
            % extracts the specified values for A, B, C
            A = app.AforDropDown.Value;
            B = app.BforDropDown.Value;
            C = app.CforDropDown.Value;
            
            % set up the z-label
            zlabel = strrep(app.YaxisDataFormulationEditField.Value,'A',A);
            zlabel = strrep(zlabel,'B',B);
            zlabel = strrep(zlabel,'C',C);
            
            % put the labels onto the plot
            ax.reset;
            ax.XLabel.String = "Frequency";
            ax.ZLabel.String = zlabel;
            ax.YLabel.String = app.XaxisDataDropDown.Value;
            hold(ax,"off");
        end

        % Button pushed function: SaveTDFDDMButton
        function SaveTDFDDMButtonPushed(app, event)
            % SAVETDFDDMButtonPushed saves selected or all time domain data,
            % all frequency domain and data manipulation data

            % preparing to save TD_data
            % creates a dialouge box asking if user would like to save all
            % data (time domain, frequency domain and data manipulation),
            % and provides three options for response
            question = 'Do you want to save all data?';
            answer = questdlg(question,'Data Range','Yes','No, only selected data','Cancel','Yes');
            
            % open a dialouge box for saving file as *.mat format or for
            % any file format
            filter = {'*.mat';'*.*'};
            [filename, filepath] = uiputfile(filter);
            
            % if either the file name or file path has a value of 0, do not
            % continue to execute the function
            if isequal(filename,0)||isequal(filepath,0)
                return;          
            end
                        
            % catenate the file path and file name to a single string
            fullfile = strcat(filepath,filename);
            
            % if all data are to be saved, assign the time domain data to parameters
            if isequal(answer,"Yes")
                TD_ListItems = app.MeasurementListBox.Items;
                TD_data = app.TD_data;
            else
                % if no time domain data are selected, display warning message and do
                % not continue to execute the function
                if isempty(app.TD_select)
                    warning('There are no selected data.')
                    return;
                end
                
                % if only selected data are to be saved, assign the
                % selected time domain data to parameters
                TD_ListItems = app.SelectionListBox.Items;
                ListIdx = app.TD_select;
                cnt = 1
                
                for Idx = ListIdx
                   TD_data.samples{cnt,1} = app.TD_data.samples{Idx,1};
                   TD_data.samples{cnt,2} = app.TD_data.samples{Idx,2};
                   TD_data.references{cnt,1} = app.TD_data.references{Idx,1};
                   TD_data.references{cnt,2} = app.TD_data.references{Idx,2};
                   TD_data.measList{cnt} = app.TD_data.measList{Idx};
                   TD_data.metadata{cnt} = app.TD_data.metadata{Idx};
                 
                   cnt = cnt + 1;
                end
                % extract the number of selected time domain data for saving
                TD_data.totalMeasNum = length(ListIdx);

            end
                    
            % preparing to save FD_data
            % extract the frequency domain data and assign them to
            % parameters
            FD_ListItems = app.FDListListBox.Items;
            FD_ListItems2 = app.FDSelectionListBox_2.Items;
            % save the frequency domain data
            FD_data = app.FD_data;
                        
            % preparing to save DM_data
            % extract the data manipulation data and assign them to parameters
            DM_ListItems = app.SourceDataSetEditField.Value;
            DM_data = app.DM_data;

            % save all TD, FD and DM data
            save(fullfile,'TD_data','TD_ListItems','FD_data','FD_ListItems','FD_ListItems2','DM_data','DM_ListItems');
                  
        end

        % Button pushed function: SaveData_DM
        function SaveData_DMButtonPushed(app, event)
            % SaveData_DMButtonPushed saves data generated from the data
            % manipulation tab as a *.mat file
            
            % open a dialouge box for saving file as *.mat format or for any file format
            filter = {'*.mat';'*.*'};
            [filename, filepath] = uiputfile(filter);
            
            % if either the file name or file path has a value of 0, do not
            % continue to execute the function
            if isequal(filename,0)||isequal(filepath,0)
                return;          
            end
            
            % catenate the file path and file name to a single string
            fullfile = strcat(filepath,filename);
            % assign arrays and values to parameters
            ListItems = app.FDListListBox.Items;
            ListItems2 = app.FDSelectionListBox_2.Items;
            DM_data = app.DM_data;
            % save data manipulation data
            save(fullfile,'DM_data');
        end

        % Button pushed function: PlotmeanandrangeButton
        function PlotmeanandrangeButtonPushed(app, event)
            % PLOTmeanandrangeButtonPushed caclulates the mean and range for the y axis data formulation values among
            % the data sets at all x-values and then present them on a plot
            
            ax = app.UIAxes9;
            
            % deleting graphics objects, that are specified by 'ax', from the axes
            cla(ax);
            % convert the input values in the source data set edit field from strings to numbers
            dataList = str2num(app.SourceDataSetEditField.Value);
            % extract the value from the y-axis data formulation edit field
            % for generating y-axis label
            ax.YLabel.String = app.YaxisDataFormulationEditField.Value;
            hold(ax,"on");
            
            % extract the data specified as the x-data
            xData = app.XaxisDataDropDown.Value;
            dataSrc = app.DM_data.set;
            % extract the calculated value (specified by Y axis data formulation) for the first data set listed in the source data
            % set edit field
            % note that the minimum and maximum values yet to be determined
            % at this stage
            baseMin = app.DM_data.base{dataList(1)};
            baseMax = app.DM_data.base{dataList(1)};
            % creating a zero column vector which the number of rows is
            % equivalent to the number of data sets
            baseMean = zeros(size(dataList,2),1);
            
            % for each dataset
            for idx = dataList
                % extract the calculated values (specified by Y axis data formulation,
                % each data set has one corresponding calculated value)
                baseCrt = app.DM_data.base{idx};
                % calculate the mean among all values in all data sets
                % baseMean only yields the actual mean value for each
                % column in the Y axis data formulation after this for loop
                % is completed
                baseMean = baseMean + baseCrt./size(dataList,2);
                % extract the minimum value among baseMin and baseCrt
                % the global minimum value is obtained after this for loop
                % is completed
                baseMin = min(baseMin,baseCrt);
                % the global maximum value is obtained after this for loop
                % is completed
                % extract the maximum value among baseMin and baseCrt
                baseMax = max(baseMax,baseCrt);
            end
             
            patch(ax,[app.(dataSrc).(xData){dataList(1)} app.(dataSrc).(xData){dataList(1)}(end:-1:1)],[baseMin baseMax(end:-1:1)],'r','FaceAlpha',0.1,'EdgeColor','none');
            % plot the mean values
            plot(ax,app.(dataSrc).(xData){dataList(1)},baseMean,"LineWidth",1);
            
            % extract parameters that A, B and C corresponds to
            A = app.AforDropDown.Value;
            B = app.BforDropDown.Value;
            C = app.CforDropDown.Value;
            % creating y-label
            ylabel = strrep(app.YaxisDataFormulationEditField.Value,'A',A);
            ylabel = strrep(ylabel,'B',B);
            ylabel = strrep(ylabel,'C',C);
            
            ax.reset;
%             ax.ColorOrder = flipud(jet(length(dataList)));
            % put axis labels on plot
            ax.YLabel.String = ylabel;
            ax.XLabel.String = app.XaxisDataDropDown.Value;
            hold(ax,"off");
        end

        % Button pushed function: ImportTHzFilesButton
        function ImportTHzFilesButtonPushed(app, event)
            % ImportthzFileButtonPushed imports a *.thz file, reads its data
            % and assigns the data to corresponding fields in the app

            % open a dialouge box for user to select a *.thz file from a folder
            [filename, filepath] = uigetfile('*.thz');figure(app.CaTSperUIFigure);
            
            % if either the file name or file path has a value of 0, do not
            % continue to execute the function
            PRJ_count = app.PRJ_count; % PRJ_count: number of project files imported

            if isequal(filename,0)||isequal(filepath,0)
                return;
            end

            % if the imported file is already exist in the list,
            % just return
            for cnt = 1:PRJ_count
                if isequal(app.filename{cnt},filename)
                    filename
                    return;
                end
            end

            PRJ_count = PRJ_count + 1;

            fileinfo = strcat(filepath,filename);
            app.filename{PRJ_count} = filename;
            app.fullpathname{PRJ_count} = fileinfo;
   
            allFileList = strjoin(app.filename,',');
            allFileList = strrep(allFileList,'.thz','');          
            app.ProjectsEditField.Value = allFileList;
            
            % initialization
            app.TD_select = [];
            app.FD_select = [];
            app.FD_select_2 = [];
            app.MeasurementListBox.Items = {};
            app.SelectionListBox.Items = {};
            app.FDListListBox.Items = {};
            app.FDSelectionListBox.Items = {};
            cla(app.UIAxes1)
            cla(app.UIAxes2)
            cla(app.UIAxes3)
            cla(app.UIAxes4)

            app.PRJ_count = PRJ_count;
          
        end

        % Button pushed function: DeployButton
        function DeployButtonPushed(app, event)
            
            if ~app.PRJ_count
                fig = app.CaTSperUIFigure;
                uialert(fig,'No THz Files','Warning');
                return;
            end

            question = "Select effective thickness";
            thicknessOption = questdlg('Select Effective Thickness','Thickness Information','Sample','Sample-Reference Offset','Cancel');

            if isequal(thicknessOption,'Sample-Reference Offset')
                question = "Select metadata";
                referenceThicknessMn = questdlg('Select Reference Thickness Metadata','Thickness Information','md2','md3','md4','Cancel');
                app.mdReferenceThicknessDropDown.Value = referenceThicknessMn;
            else
                app.mdReferenceThicknessDropDown.Value = "no";
                referenceThicknessMn = "no";
            end
            sampleThicknessMn = app.mdSampleThicknessDropDown.Value;
            
            idxCap = 1;
            % run the TDdataDel function
            TDdataDel(app);
            allListItems = {};
            newDataset = 1;



            for PRJcnt = 1:app.PRJ_count
                % import .thz file to the workspace
                fullpath = app.fullpathname{PRJcnt};

                if isempty(fullpath)
                     return;
                end

                % initialization
                % empty arrays and values
                thzInfo = h5info(fullpath);
                % extract the number of datasets/measurements in the file
                measNum = size(thzInfo.Groups,1);
                % create a column vector
                ListItems = cell(measNum,1);
                % copy the names of the datasets into the column vector 'ListItems'
                [ListItems{:}] = deal(thzInfo.Groups.Name);
                %assignin("base","thzInfo",thzInfo);
                %allListItems = [allListItems;ListItems];
    
                TD_data.totalMeasNum = measNum;
    
                % for each dataset/measurement
                for idx = 1:measNum
                    
                    % dataset extraction
                    dn = ListItems{idx};
                    dsList = ["ds1","ds2","ds3","ds4"];

                    for dsNum = 1:4
                        dnTemp = strcat(dn,'/',dsList(dsNum));                        

                        try
                           dsTemp = h5read(fullpath,dnTemp);
                           TD_data.ds{idxCap+idx-1,dsNum} = dsTemp;
                        catch
                        end

                    end

                    sampleDn = app.dsSampleDropDown.Value; % sample dataset name
                    referenceDn = app.dsReferenceDropDown.Value; % reference dataset name
                    pumpDn = app.dsPumpedDropDown.Value; % pump dataset name


                    sampleDsNum = str2num(sampleDn(3));
                    try
                        referenceDsNum = str2num(referenceDn(3));
                    catch
                        referenceDsNum = 0;
                    end

                    try
                        pumpDsNum = str2num(pumpDn(3));
                    catch
                        pumpDsNum = 0;
                    end

                    TD_data.dsNum_Sample{idxCap+idx-1} = sampleDsNum;
                    TD_data.dsNum_Reference{idxCap+idx-1} = referenceDsNum;
                    TD_data.dsNum_Pump{idxCap+idx-1} = pumpDsNum;

                    % metadata extraction
                    mdList = ["md1","md2","md3","md4","md5","md5","md6","md7"];

                    for mdNum = 1:7
                        mdTemp = h5readatt(fullpath,dn,mdList(mdNum));
                        try
                            TD_data.metadata{idxCap+idx-1}.md{mdNum} = mdTemp;
                        catch
                        end
                    end

                    try
                        mdNum_SamThickness = str2num(sampleThicknessMn(3));
                    catch
                        mdNum_SamThickness = 0;
                    end

                    try
                        mdNum_ReferecenThickness = str2num(referenceThicknessMn(3));
                    catch
                        mdNum_ReferecenThickness = 0;
                    end

                    % time delay and effective refractive index calculation
                    % if the array in the dataset has the referecne 1 datasets
                     % sam_thickness = h5readatt(fullpath,dn,sampleThicknessMn);
                    sam_thickness = TD_data.metadata{idxCap+idx-1}.md{mdNum_SamThickness};
                    
                    if isequal(referenceThicknessMn,"no")
                        ref_thickness = 0;
                    else
                        ref_thickness = TD_data.metadata{idxCap+idx-1}.md{mdNum_ReferecenThickness};
                    end

                    if isequal(thicknessOption,"Sample")
                        eff_thickness = sam_thickness;
                        app.ThicknessSwitch_TD.Value = "Sample";
                        app.ThicknessSwitch_FD.Value = "Sample";
                    else
                        thicknessOption = "Offset";
                        eff_thickness = abs(sam_thickness - ref_thickness);
                        app.ThicknessSwitch_TD.Value = "Offset";
                        app.ThicknessSwitch_FD.Value = "Offset";
                    end

                    if ~isequal(referenceDsNum,0)
                        timeDelay = getTimeDelay(app,TD_data.ds{idxCap+idx-1,sampleDsNum},TD_data.ds{idxCap+idx-1,referenceDsNum});
                        if ~isequal(eff_thickness,0)
                            n_eff = timeDelay*10^-12*3e8/(eff_thickness*10^-3) + 1;
                            etl_t = timeDelay + (2*eff_thickness*10^-3*n_eff/3e8)*10^12;
                        else
                            n_eff = [];
                            etl_t = [];
                        end
                        TD_data.metadata{idxCap+idx-1}.timeDelay = timeDelay;
                        TD_data.metadata{idxCap+idx-1}.refractiveIndex = n_eff;
                        TD_data.metadata{idxCap+idx-1}.internalReflection = etl_t;
                    end

                    % extract other data and information relating to the
                    % measurement from the dataset or from the attributes
                    allListItems{idxCap+idx-1} = dn(2:end);
                    TD_data.measList{idxCap+idx-1}={dn(2:end)};
                    TD_data.metadata{idxCap+idx-1}.sampleName = dn(2:end);
                    TD_data.metadata{idxCap+idx-1}.scanLength = size(TD_data.ds{idxCap+idx-1,sampleDsNum},2);
                    TD_data.metadata{idxCap+idx-1}.xSpacing = mean(diff(TD_data.ds{idxCap+idx-1,sampleDsNum}(1,:)));
                    TD_data.metadata{idxCap+idx-1}.description = h5readatt(fullpath,dn,"description");
                    TD_data.metadata{idxCap+idx-1}.mdDescription = h5readatt(fullpath,dn,"mdDescription");
                    TD_data.metadata{idxCap+idx-1}.dsDescription = h5readatt(fullpath,dn,"dsDescription");
                    TD_data.metadata{idxCap+idx-1}.time = h5readatt(fullpath,dn,"time");
                    
                    TD_data.metadata{idxCap+idx-1}.sam_thickness = sam_thickness; 
                    TD_data.metadata{idxCap+idx-1}.ref_thickness = ref_thickness;
                    TD_data.metadata{idxCap+idx-1}.eff_thickness = eff_thickness;
                    TD_data.metadata{idxCap+idx-1}.effThickness = thicknessOption;
                    TD_data.metadata{idxCap+idx-1}.mdNum_SamThickness = mdNum_SamThickness;
                    TD_data.metadata{idxCap+idx-1}.mdNum_RefThickness = mdNum_ReferecenThickness;
    
                    % extract the name of the instrument model
                    % insProfile = extractBefore(h5readatt(fullpath,dn,"instrument"),'/');
                    % userProfile = extractBefore(h5readatt(fullpath,dn,"user"),'/');
                    insProfile = h5readatt(fullpath,dn,"instrument");
                    userProfile = h5readatt(fullpath,dn,"user");
    
                    % if the instrument model is not specified, leave the
                    % corresponding field empty
                    if isequal(insProfile,"<missing>")
                        TD_data.metadata{idxCap+idx-1}.instrument = '';
                    % if the instrument model is specified, assign the value to
                    % the corresponding field
                    else
                        TD_data.metadata{idxCap+idx-1}.instrument = insProfile;
                    end

                    if isequal(userProfile,"<missing>")
                        TD_data.metadata{idxCap+idx-1}.user = '';
                    % if the instrument model is specified, assign the value to
                    % the corresponding field
                    else
                        TD_data.metadata{idxCap+idx-1}.user = userProfile;
                    end
    
                end
                idxCap = idxCap + measNum;
            end

            % assigning values and arrays to corresponding fields
            app.TD_data = TD_data;            
            app.MeasurementListBox.Items = allListItems;
            app.MeasurementListBox.ItemsData = (1:length(allListItems));

            % enable the Fourier transform button
            app.TransformButton.Enable = true;
            
            % empty arrays associated with frequency domain
            app.FD_data.measList = {};
            app.FD_data.metadata = {};
        end

        % Button pushed function: PlotForCustomisationButton_TD
        function PlotForCustomisationButton_TDPushed(app, event)
            plotTD_data(app,"NEW");
        end

        % Button pushed function: PlotForCustomisationButton_FD1
        function PlotForCustomisationButton_FD1Pushed(app, event)
            plotFD_data(app,"NEW");
        end

        % Button pushed function: ImportAllDataInverseSequenceButton
        function ImportAllDataInverseSequenceButtonPushed(app, event)
            % IMPORTALLDATA (Inverse Sequence) ButtonPushed imports all
            % datasets to the source data in inverse order
            % set list in the DM tab and makes them available for data manipulation
        
            dataList = app.FD_select_2;
            dataList = fliplr(dataList);
            dataList = num2str(dataList);
            app.SourceDataSetEditField.Value = dataList;
        end

        % Value changed function: ToEpolFreqEditField
        function ToEpolFreqEditFieldValueChanged(app, event)
            value = app.ToEpolFreqEditField.Value;
            epolStartFreq = app.FromEpolFreqEditField.Value;
            fig = app.CaTSperUIFigure;

            if le(value,epolStartFreq)
                msg = strcat("Invalid value, input value should be larger than the start frequency.");
                uialert(fig,msg,'Warning');
                app.ToEpolFreqEditField.Value = 0.5;
                return;
            end
            
        end

        % Value changed function: FromEpolFreqEditField
        function FromEpolFreqEditFieldValueChanged(app, event)
            value = app.FromEpolFreqEditField.Value;
            epolEndFreq = app.ToEpolFreqEditField.Value;
            fig = app.CaTSperUIFigure;            

            if ge(value,epolEndFreq)
                msg = strcat("Invalid value, input value should be smaller than the end frequency.");
                uialert(fig,msg,'Warning');
                app.FromEpolFreqEditField.Value = 0.04;
                return;
            end
            
        end

        % Button pushed function: ResetConfigurationsButton
        function ResetConfigurationsButtonPushed(app, event)
            loadDefaultSettings(app);
        end

        % Value changed function: md1EditField
        function md1EditFieldValueChanged(app, event)
            value = app.md1EditField.Value;

            if value <= 0
                fig = app.CaTSperUIFigure;
                uialert(fig,'Invalid Input','Warning');
                return;
            end
            
            TDIdx = app.MeasurementListBox.Value;
            
            if isempty(TDIdx)
                return;
            end

            % update
            app.TD_data.metadata{TDIdx}.md{1} = value;
            mdThicknessSync(app,TDIdx);
        end

        % Value changed function: md2EditField
        function md2EditFieldValueChanged(app, event)
            value = app.md2EditField.Value;

            if value < 0
                fig = app.CaTSperUIFigure;
                uialert(fig,'Invalid Input','Warning');
                return;
            end
            
            TDIdx = app.MeasurementListBox.Value;
            
            if isempty(TDIdx)
                return;
            end

            % update
            app.TD_data.metadata{TDIdx}.md{2} = value;
            mdThicknessSync(app,TDIdx);
        end

        % Value changed function: md3EditField
        function md3EditFieldValueChanged(app, event)
            value = app.md3EditField.Value;
            
            if value < 0
                fig = app.CaTSperUIFigure;
                uialert(fig,'Invalid Input','Warning');
                return;
            end
            
            TDIdx = app.MeasurementListBox.Value;
            
            if isempty(TDIdx)
                return;
            end

            % update
            app.TD_data.metadata{TDIdx}.md{3} = value;
            mdThicknessSync(app,TDIdx);
        end

        % Value changed function: ThicknessSwitch_TD
        function ThicknessSwitch_TDValueChanged(app, event)
            value = app.ThicknessSwitch_TD.Value;
            TDIdx = app.MeasurementListBox.Value;
            app.TD_data.metadata{TDIdx}.effThickness = value;   
            mdThicknessSync(app,TDIdx);
        end

        % Value changed function: mdSampleThicknessDropDown
        function mdSampleThicknessDropDownValueChanged(app, event)
            value = app.mdSampleThicknessDropDown.Value;

            try
                TDIdx = app.MeasurementListBox.Value;
            catch
                warning('No Items Seleced');
                return;
            end

            try
                mdNum_SamThickness = str2num(value(3));
            catch
                mdNum_SamThickness = 0;
            end

            app.TD_data.metadata{TDIdx}.mdNum_SamThickness = mdNum_SamThickness;
            mdThicknessSync(app,TDIdx);
        end

        % Value changed function: mdReferenceThicknessDropDown
        function mdReferenceThicknessDropDownValueChanged(app, event)
            value = app.mdReferenceThicknessDropDown.Value;

            try
                TDIdx = app.MeasurementListBox.Value;
            catch
                warning('No Items Seleced');
                return;
            end

            try
                mdNum_RefThickness = str2num(value(3));
            catch
                mdNum_RefThickness = 0;
            end

            app.TD_data.metadata{TDIdx}.mdNum_RefThickness = mdNum_RefThickness;
            mdThicknessSync(app,TDIdx);
        end

        % Value changed function: dsReferenceDropDown
        function dsReferenceDropDownValueChanged(app, event)
            value = app.dsReferenceDropDown.Value;
            
            try
                TDIdx = app.MeasurementListBox.Value;
            catch
                warning('No Items Selected');
                return;
            end

            try
                dsNum_Reference = str2num(value(3));
            catch
                dsNum_Reference = 0;
            end

            app.TD_data.dsNum_Reference{TDIdx} = dsNum_Reference;            
        end

        % Value changed function: dsSampleDropDown
        function dsSampleDropDownValueChanged(app, event)
            value = app.dsSampleDropDown.Value;
            
            try
                TDIdx = app.MeasurementListBox.Value;
            catch
                warning('No Items Seleted');
                return;
            end

            try
                dsNum_Sample = str2num(value(3));
            catch
                dsNum_Sample = 0;
            end

            app.TD_data.dsNum_Sample{TDIdx} = dsNum_Sample;  
        end

        % Value changed function: dsPumpedDropDown
        function dsPumpedDropDownValueChanged(app, event)
            value = app.dsPumpedDropDown.Value;
            
            try
                TDIdx = app.MeasurementListBox.Value;
            catch
                warning('No Items Seleted');
                return;
            end

            try
                dsNum_Pump = str2num(value(3));
            catch
                dsNum_Pump = 0;
            end

            app.TD_data.dsNum_Pump{TDIdx} = dsNum_Pump; 
        end

        % Value changed function: md4EditField
        function md4EditFieldValueChanged(app, event)
            value = app.md4EditField.Value;
            
            if value < 0
                fig = app.CaTSperUIFigure;
                uialert(fig,'Invalid Input','Warning');
                return;
            end
            
            TDIdx = app.MeasurementListBox.Value;
            
            if isempty(TDIdx)
                return;
            end

            % update
            app.TD_data.metadata{TDIdx}.md{4} = value;
            mdThicknessSync(app,TDIdx);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create CaTSperUIFigure and hide until all components are created
            app.CaTSperUIFigure = uifigure('Visible', 'off');
            app.CaTSperUIFigure.Position = [100 100 1518 992];
            app.CaTSperUIFigure.Name = 'Catsper';
            app.CaTSperUIFigure.Icon = fullfile(pathToMLAPP, 'CaT_logo.png');

            % Create TabGroup
            app.TabGroup = uitabgroup(app.CaTSperUIFigure);
            app.TabGroup.Position = [25 20 1470 889];

            % Create TimeDomainTDTab
            app.TimeDomainTDTab = uitab(app.TabGroup);
            app.TimeDomainTDTab.Title = 'Time Domain (TD)';

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.TimeDomainTDTab);
            title(app.UIAxes2, 'PLOT 2')
            xlabel(app.UIAxes2, 'Time (ps)')
            ylabel(app.UIAxes2, 'E_{field amplitude} (a.u.)')
            app.UIAxes2.FontWeight = 'bold';
            app.UIAxes2.XLim = [-5 15];
            app.UIAxes2.XTickLabelRotation = 0;
            app.UIAxes2.YTickLabelRotation = 0;
            app.UIAxes2.ZTickLabelRotation = 0;
            app.UIAxes2.LineWidth = 1;
            app.UIAxes2.Box = 'on';
            app.UIAxes2.Position = [700 45 750 400];

            % Create UIAxes1
            app.UIAxes1 = uiaxes(app.TimeDomainTDTab);
            title(app.UIAxes1, 'PLOT 1')
            xlabel(app.UIAxes1, 'Time (ps)')
            ylabel(app.UIAxes1, 'E_{field amplitude} (a.u.)')
            app.UIAxes1.FontWeight = 'bold';
            app.UIAxes1.XLim = [-5 15];
            app.UIAxes1.XTickLabelRotation = 0;
            app.UIAxes1.YTickLabelRotation = 0;
            app.UIAxes1.ZTickLabelRotation = 0;
            app.UIAxes1.LineWidth = 1;
            app.UIAxes1.Box = 'on';
            app.UIAxes1.Position = [700 455 750 400];

            % Create MeasurementListBoxLabel
            app.MeasurementListBoxLabel = uilabel(app.TimeDomainTDTab);
            app.MeasurementListBoxLabel.HorizontalAlignment = 'right';
            app.MeasurementListBoxLabel.Position = [18 834 79 22];
            app.MeasurementListBoxLabel.Text = 'Measurement';

            % Create MeasurementListBox
            app.MeasurementListBox = uilistbox(app.TimeDomainTDTab);
            app.MeasurementListBox.Items = {};
            app.MeasurementListBox.ValueChangedFcn = createCallbackFcn(app, @MeasurementListBoxValueChanged, true);
            app.MeasurementListBox.Position = [18 500 278 333];
            app.MeasurementListBox.Value = {};

            % Create ADDButton
            app.ADDButton = uibutton(app.TimeDomainTDTab, 'push');
            app.ADDButton.ButtonPushedFcn = createCallbackFcn(app, @ADDButtonPushed, true);
            app.ADDButton.Position = [310 704 45 45];
            app.ADDButton.Text = 'ADD';

            % Create DELButton
            app.DELButton = uibutton(app.TimeDomainTDTab, 'push');
            app.DELButton.ButtonPushedFcn = createCallbackFcn(app, @DELButtonPushed, true);
            app.DELButton.Position = [310 640 45 45];
            app.DELButton.Text = 'DEL';

            % Create SelectionListBoxLabel
            app.SelectionListBoxLabel = uilabel(app.TimeDomainTDTab);
            app.SelectionListBoxLabel.Position = [371 834 55 22];
            app.SelectionListBoxLabel.Text = 'Selection';

            % Create SelectionListBox
            app.SelectionListBox = uilistbox(app.TimeDomainTDTab);
            app.SelectionListBox.Items = {};
            app.SelectionListBox.Position = [367 500 193 333];
            app.SelectionListBox.Value = {};

            % Create Plot1TDButton
            app.Plot1TDButton = uibutton(app.TimeDomainTDTab, 'push');
            app.Plot1TDButton.ButtonPushedFcn = createCallbackFcn(app, @Plot1TDButtonPushed, true);
            app.Plot1TDButton.Position = [574 664 105 45];
            app.Plot1TDButton.Text = 'Plot 1';

            % Create FFTSettingsPanel
            app.FFTSettingsPanel = uipanel(app.TimeDomainTDTab);
            app.FFTSettingsPanel.Title = 'FFT Settings';
            app.FFTSettingsPanel.FontWeight = 'bold';
            app.FFTSettingsPanel.Position = [353 57 328 305];

            % Create fromLabel
            app.fromLabel = uilabel(app.FFTSettingsPanel);
            app.fromLabel.HorizontalAlignment = 'right';
            app.fromLabel.Position = [143 254 59 23];
            app.fromLabel.Text = ' from ';

            % Create FromFreqEditField
            app.FromFreqEditField = uieditfield(app.FFTSettingsPanel, 'numeric');
            app.FromFreqEditField.Limits = [0 5];
            app.FromFreqEditField.ValueDisplayFormat = '%.1f';
            app.FromFreqEditField.Position = [206 255 40 22];
            app.FromFreqEditField.Value = 0.2;

            % Create toLabel
            app.toLabel = uilabel(app.FFTSettingsPanel);
            app.toLabel.HorizontalAlignment = 'right';
            app.toLabel.Position = [242 254 25 23];
            app.toLabel.Text = 'to';

            % Create ToFreqEditField
            app.ToFreqEditField = uieditfield(app.FFTSettingsPanel, 'numeric');
            app.ToFreqEditField.Limits = [1 10];
            app.ToFreqEditField.ValueDisplayFormat = '%.1f';
            app.ToFreqEditField.Position = [272 255 40 22];
            app.ToFreqEditField.Value = 2.8;

            % Create MaxTimeLabel
            app.MaxTimeLabel = uilabel(app.FFTSettingsPanel);
            app.MaxTimeLabel.HorizontalAlignment = 'right';
            app.MaxTimeLabel.Position = [219 84 25 23];
            app.MaxTimeLabel.Text = 'to';

            % Create ToTimeEditField
            app.ToTimeEditField = uieditfield(app.FFTSettingsPanel, 'numeric');
            app.ToTimeEditField.Limits = [0 100];
            app.ToTimeEditField.ValueDisplayFormat = '%5.2f';
            app.ToTimeEditField.Tooltip = {'set the maximum value of the sample waveform(s)'};
            app.ToTimeEditField.Position = [248 85 45 22];
            app.ToTimeEditField.Value = 20;

            % Create truncatebasedon1stetalonLabel
            app.truncatebasedon1stetalonLabel = uilabel(app.FFTSettingsPanel);
            app.truncatebasedon1stetalonLabel.Position = [121 108 164 22];
            app.truncatebasedon1stetalonLabel.Text = '(truncate based on 1st etalon)';

            % Create TransformButton
            app.TransformButton = uibutton(app.FFTSettingsPanel, 'push');
            app.TransformButton.ButtonPushedFcn = createCallbackFcn(app, @TransformButtonPushed, true);
            app.TransformButton.FontWeight = 'bold';
            app.TransformButton.Enable = 'off';
            app.TransformButton.Position = [118 11 192 34];
            app.TransformButton.Text = 'Transform';

            % Create ApodisationFunctionDropDownLabel
            app.ApodisationFunctionDropDownLabel = uilabel(app.FFTSettingsPanel);
            app.ApodisationFunctionDropDownLabel.FontWeight = 'bold';
            app.ApodisationFunctionDropDownLabel.Position = [18 56 128 23];
            app.ApodisationFunctionDropDownLabel.Text = 'Apodisation Function';

            % Create ApodisationFunctionDropDown
            app.ApodisationFunctionDropDown = uidropdown(app.FFTSettingsPanel);
            app.ApodisationFunctionDropDown.Items = {'Boxcar', 'Hamming', 'Bartlett', 'Blackman', 'Rectangular window', 'Hann', 'Taylor', 'Triang'};
            app.ApodisationFunctionDropDown.ItemsData = {'Boxcar', 'hamming', 'bartlett', 'blackman', 'rectwin', 'hann', 'taylorwin', 'triang'};
            app.ApodisationFunctionDropDown.Position = [151 57 149 22];
            app.ApodisationFunctionDropDown.Value = 'Boxcar';

            % Create ZeroFillingpowerofSpinnerLabel
            app.ZeroFillingpowerofSpinnerLabel = uilabel(app.FFTSettingsPanel);
            app.ZeroFillingpowerofSpinnerLabel.Position = [124 222 129 23];
            app.ZeroFillingpowerofSpinnerLabel.Text = 'Zero Filling, + power of';

            % Create ZeroFillingpowerofSpinner
            app.ZeroFillingpowerofSpinner = uispinner(app.FFTSettingsPanel);
            app.ZeroFillingpowerofSpinner.Limits = [1 4];
            app.ZeroFillingpowerofSpinner.Position = [252 223 65 22];
            app.ZeroFillingpowerofSpinner.Value = 2;

            % Create ManualWindowpsLabel
            app.ManualWindowpsLabel = uilabel(app.FFTSettingsPanel);
            app.ManualWindowpsLabel.FontWeight = 'bold';
            app.ManualWindowpsLabel.Position = [18 85 128 22];
            app.ManualWindowpsLabel.Text = 'Manual Window (ps): ';

            % Create AutoWindowButton
            app.AutoWindowButton = uibutton(app.FFTSettingsPanel, 'state');
            app.AutoWindowButton.ValueChangedFcn = createCallbackFcn(app, @AutoWindowButtonValueChanged, true);
            app.AutoWindowButton.Tooltip = {'set the time_max 1st multiple reflection time'};
            app.AutoWindowButton.Text = 'Auto Window';
            app.AutoWindowButton.BackgroundColor = [1 1 1];
            app.AutoWindowButton.Position = [11 108 105 23];

            % Create FrequencyRangeTHzLabel
            app.FrequencyRangeTHzLabel = uilabel(app.FFTSettingsPanel);
            app.FrequencyRangeTHzLabel.FontWeight = 'bold';
            app.FrequencyRangeTHzLabel.Position = [11 255 139 22];
            app.FrequencyRangeTHzLabel.Text = 'Frequency Range (THz)';

            % Create UpsamplingLabel
            app.UpsamplingLabel = uilabel(app.FFTSettingsPanel);
            app.UpsamplingLabel.FontWeight = 'bold';
            app.UpsamplingLabel.Position = [11 224 74 22];
            app.UpsamplingLabel.Text = 'Upsampling';

            % Create WindowFunctionLabel
            app.WindowFunctionLabel = uilabel(app.FFTSettingsPanel);
            app.WindowFunctionLabel.FontWeight = 'bold';
            app.WindowFunctionLabel.Position = [11 135 105 22];
            app.WindowFunctionLabel.Text = 'Window Function';

            % Create fromLabel_3
            app.fromLabel_3 = uilabel(app.FFTSettingsPanel);
            app.fromLabel_3.HorizontalAlignment = 'right';
            app.fromLabel_3.Position = [150 85 29 22];
            app.fromLabel_3.Text = 'from';

            % Create FromTimeEditField
            app.FromTimeEditField = uieditfield(app.FFTSettingsPanel, 'numeric');
            app.FromTimeEditField.Limits = [-30 50];
            app.FromTimeEditField.ValueDisplayFormat = '%5.2f';
            app.FromTimeEditField.Tooltip = {'Set the minimum value of the sample waveform(s)'};
            app.FromTimeEditField.Position = [183 85 45 22];
            app.FromTimeEditField.Value = -10;

            % Create StartFrequencyTHzEditFieldLabel
            app.StartFrequencyTHzEditFieldLabel = uilabel(app.FFTSettingsPanel);
            app.StartFrequencyTHzEditFieldLabel.HorizontalAlignment = 'right';
            app.StartFrequencyTHzEditFieldLabel.Position = [143 193 124 22];
            app.StartFrequencyTHzEditFieldLabel.Text = 'Start Frequency (THz)';

            % Create StartFrequencyTHzEditField
            app.StartFrequencyTHzEditField = uieditfield(app.FFTSettingsPanel, 'numeric');
            app.StartFrequencyTHzEditField.Limits = [0.2 1.5];
            app.StartFrequencyTHzEditField.ValueDisplayFormat = '%5.1f';
            app.StartFrequencyTHzEditField.Position = [272 193 41 22];
            app.StartFrequencyTHzEditField.Value = 0.8;

            % Create UnwrappingLabel
            app.UnwrappingLabel = uilabel(app.FFTSettingsPanel);
            app.UnwrappingLabel.FontWeight = 'bold';
            app.UnwrappingLabel.Position = [11 193 75 22];
            app.UnwrappingLabel.Text = 'Unwrapping';

            % Create FulllistnamingCheckBox
            app.FulllistnamingCheckBox = uicheckbox(app.FFTSettingsPanel);
            app.FulllistnamingCheckBox.Text = 'Full list naming';
            app.FulllistnamingCheckBox.Position = [15 14 102 22];

            % Create ExtrapolationRangeTHzLabel
            app.ExtrapolationRangeTHzLabel = uilabel(app.FFTSettingsPanel);
            app.ExtrapolationRangeTHzLabel.FontWeight = 'bold';
            app.ExtrapolationRangeTHzLabel.Position = [11 162 155 22];
            app.ExtrapolationRangeTHzLabel.Text = 'Extrapolation Range (THz)';

            % Create fromLabel_2
            app.fromLabel_2 = uilabel(app.FFTSettingsPanel);
            app.fromLabel_2.HorizontalAlignment = 'right';
            app.fromLabel_2.Position = [173 162 29 22];
            app.fromLabel_2.Text = 'from';

            % Create FromEpolFreqEditField
            app.FromEpolFreqEditField = uieditfield(app.FFTSettingsPanel, 'numeric');
            app.FromEpolFreqEditField.Limits = [0 5];
            app.FromEpolFreqEditField.ValueDisplayFormat = '%5.2f';
            app.FromEpolFreqEditField.ValueChangedFcn = createCallbackFcn(app, @FromEpolFreqEditFieldValueChanged, true);
            app.FromEpolFreqEditField.Position = [207 162 40 22];
            app.FromEpolFreqEditField.Value = 0.2;

            % Create toLabel_2
            app.toLabel_2 = uilabel(app.FFTSettingsPanel);
            app.toLabel_2.HorizontalAlignment = 'right';
            app.toLabel_2.Position = [243 162 25 22];
            app.toLabel_2.Text = 'to';

            % Create ToEpolFreqEditField
            app.ToEpolFreqEditField = uieditfield(app.FFTSettingsPanel, 'numeric');
            app.ToEpolFreqEditField.Limits = [0 5];
            app.ToEpolFreqEditField.ValueDisplayFormat = '%5.2f';
            app.ToEpolFreqEditField.ValueChangedFcn = createCallbackFcn(app, @ToEpolFreqEditFieldValueChanged, true);
            app.ToEpolFreqEditField.Position = [273 162 40 22];
            app.ToEpolFreqEditField.Value = 0.4;

            % Create Plot2TDButton
            app.Plot2TDButton = uibutton(app.TimeDomainTDTab, 'push');
            app.Plot2TDButton.ButtonPushedFcn = createCallbackFcn(app, @Plot2TDButtonPushed, true);
            app.Plot2TDButton.Position = [574 613 105 45];
            app.Plot2TDButton.Text = 'Plot 2';

            % Create ALLButton
            app.ALLButton = uibutton(app.TimeDomainTDTab, 'push');
            app.ALLButton.ButtonPushedFcn = createCallbackFcn(app, @ALLButtonPushed, true);
            app.ALLButton.Position = [310 768 45 45];
            app.ALLButton.Text = 'ALL';

            % Create ButtonGroupTD
            app.ButtonGroupTD = uibuttongroup(app.TimeDomainTDTab);
            app.ButtonGroupTD.Position = [573 754 100 78];

            % Create ReferenceButtonTD
            app.ReferenceButtonTD = uiradiobutton(app.ButtonGroupTD);
            app.ReferenceButtonTD.Text = 'Reference';
            app.ReferenceButtonTD.Position = [11 51 77 22];

            % Create SampleButtonTD
            app.SampleButtonTD = uiradiobutton(app.ButtonGroupTD);
            app.SampleButtonTD.Text = 'Sample';
            app.SampleButtonTD.Position = [11 29 63 22];

            % Create BothButtonTD
            app.BothButtonTD = uiradiobutton(app.ButtonGroupTD);
            app.BothButtonTD.Text = 'Both';
            app.BothButtonTD.Position = [11 7 65 22];
            app.BothButtonTD.Value = true;

            % Create LegendButton_2
            app.LegendButton_2 = uibutton(app.TimeDomainTDTab, 'state');
            app.LegendButton_2.ValueChangedFcn = createCallbackFcn(app, @LegendButton_2ValueChanged, true);
            app.LegendButton_2.Text = 'Legend';
            app.LegendButton_2.Position = [1204 13 99 23];

            % Create JetColormapButton_2
            app.JetColormapButton_2 = uibutton(app.TimeDomainTDTab, 'state');
            app.JetColormapButton_2.ValueChangedFcn = createCallbackFcn(app, @JetColormapButton_2ValueChanged, true);
            app.JetColormapButton_2.Text = 'Jet Colormap';
            app.JetColormapButton_2.Position = [1320 13 107 23];

            % Create GridOffButton_3
            app.GridOffButton_3 = uibutton(app.TimeDomainTDTab, 'state');
            app.GridOffButton_3.Text = 'Grid Off';
            app.GridOffButton_3.Position = [574 716 105 30];

            % Create LoadData_TD
            app.LoadData_TD = uibutton(app.TimeDomainTDTab, 'push');
            app.LoadData_TD.ButtonPushedFcn = createCallbackFcn(app, @LoadData_TDButtonPushed, true);
            app.LoadData_TD.BackgroundColor = [0.9412 0.9412 0.9412];
            app.LoadData_TD.FontWeight = 'bold';
            app.LoadData_TD.Tooltip = {'Assign data to variable in the base workspace'};
            app.LoadData_TD.Position = [25 13 111 30];
            app.LoadData_TD.Text = 'Load TD_DATA';

            % Create SaveData_TD
            app.SaveData_TD = uibutton(app.TimeDomainTDTab, 'push');
            app.SaveData_TD.ButtonPushedFcn = createCallbackFcn(app, @SaveData_TDPushed, true);
            app.SaveData_TD.BackgroundColor = [0.9412 0.9412 0.9412];
            app.SaveData_TD.FontWeight = 'bold';
            app.SaveData_TD.Tooltip = {'Assign data to variable in the base workspace'};
            app.SaveData_TD.Position = [145 13 111 30];
            app.SaveData_TD.Text = 'Save TD_DATA';

            % Create AssignTD_DataButton
            app.AssignTD_DataButton = uibutton(app.TimeDomainTDTab, 'push');
            app.AssignTD_DataButton.ButtonPushedFcn = createCallbackFcn(app, @AssignTD_DataButtonPushed, true);
            app.AssignTD_DataButton.BackgroundColor = [0.9412 0.9412 0.9412];
            app.AssignTD_DataButton.FontWeight = 'bold';
            app.AssignTD_DataButton.Tooltip = {'Assign data to variable in the base workspace'};
            app.AssignTD_DataButton.Position = [265 13 220 30];
            app.AssignTD_DataButton.Text = 'Assign TD_DATA in Workspace';

            % Create CheckDynamicRangeButton
            app.CheckDynamicRangeButton = uibutton(app.TimeDomainTDTab, 'push');
            app.CheckDynamicRangeButton.ButtonPushedFcn = createCallbackFcn(app, @CheckDynamicRangeButtonPushed, true);
            app.CheckDynamicRangeButton.Position = [574 500 105 61];
            app.CheckDynamicRangeButton.Text = {'Check'; 'Dynamic'; 'Range'};

            % Create PlotForCustomisationButton_TD
            app.PlotForCustomisationButton_TD = uibutton(app.TimeDomainTDTab, 'push');
            app.PlotForCustomisationButton_TD.ButtonPushedFcn = createCallbackFcn(app, @PlotForCustomisationButton_TDPushed, true);
            app.PlotForCustomisationButton_TD.Position = [574 567 105 40];
            app.PlotForCustomisationButton_TD.Text = {'Plot For'; 'Customisation'};

            % Create GeneralInformationPanel
            app.GeneralInformationPanel = uipanel(app.TimeDomainTDTab);
            app.GeneralInformationPanel.Title = 'General Information';
            app.GeneralInformationPanel.FontWeight = 'bold';
            app.GeneralInformationPanel.Position = [18 323 316 163];

            % Create DescriptionEditField_2Label_2
            app.DescriptionEditField_2Label_2 = uilabel(app.GeneralInformationPanel);
            app.DescriptionEditField_2Label_2.HorizontalAlignment = 'right';
            app.DescriptionEditField_2Label_2.Position = [8 113 65 22];
            app.DescriptionEditField_2Label_2.Text = 'Description';

            % Create GeneralDescriptionEditField
            app.GeneralDescriptionEditField = uieditfield(app.GeneralInformationPanel, 'text');
            app.GeneralDescriptionEditField.Editable = 'off';
            app.GeneralDescriptionEditField.Position = [96 113 210 22];

            % Create DateandTimeEditFieldLabel
            app.DateandTimeEditFieldLabel = uilabel(app.GeneralInformationPanel);
            app.DateandTimeEditFieldLabel.HorizontalAlignment = 'right';
            app.DateandTimeEditFieldLabel.Position = [7 87 83 22];
            app.DateandTimeEditFieldLabel.Text = 'Date and Time';

            % Create GeneralDateandTimeEditField
            app.GeneralDateandTimeEditField = uieditfield(app.GeneralInformationPanel, 'text');
            app.GeneralDateandTimeEditField.Editable = 'off';
            app.GeneralDateandTimeEditField.Position = [96 87 210 22];

            % Create InstrumentEditFieldLabel
            app.InstrumentEditFieldLabel = uilabel(app.GeneralInformationPanel);
            app.InstrumentEditFieldLabel.HorizontalAlignment = 'right';
            app.InstrumentEditFieldLabel.Position = [7 61 62 22];
            app.InstrumentEditFieldLabel.Text = 'Instrument';

            % Create GeneralInstrumentEditField
            app.GeneralInstrumentEditField = uieditfield(app.GeneralInformationPanel, 'text');
            app.GeneralInstrumentEditField.Editable = 'off';
            app.GeneralInstrumentEditField.Position = [96 61 210 22];

            % Create UserEditFieldLabel
            app.UserEditFieldLabel = uilabel(app.GeneralInformationPanel);
            app.UserEditFieldLabel.HorizontalAlignment = 'right';
            app.UserEditFieldLabel.Position = [7 36 30 22];
            app.UserEditFieldLabel.Text = 'User';

            % Create GeneralUserEditField
            app.GeneralUserEditField = uieditfield(app.GeneralInformationPanel, 'text');
            app.GeneralUserEditField.Editable = 'off';
            app.GeneralUserEditField.Position = [96 36 210 22];

            % Create RefractiveIndexEditFieldLabel
            app.RefractiveIndexEditFieldLabel = uilabel(app.GeneralInformationPanel);
            app.RefractiveIndexEditFieldLabel.HorizontalAlignment = 'right';
            app.RefractiveIndexEditFieldLabel.Position = [7 9 92 22];
            app.RefractiveIndexEditFieldLabel.Text = 'Refractive Index';

            % Create GeneralRefractiveIndexEditField
            app.GeneralRefractiveIndexEditField = uieditfield(app.GeneralInformationPanel, 'numeric');
            app.GeneralRefractiveIndexEditField.ValueDisplayFormat = '%5.2f';
            app.GeneralRefractiveIndexEditField.Position = [103 9 48 22];

            % Create stEtalonpsLabel
            app.stEtalonpsLabel = uilabel(app.GeneralInformationPanel);
            app.stEtalonpsLabel.HorizontalAlignment = 'right';
            app.stEtalonpsLabel.Position = [154 9 82 22];
            app.stEtalonpsLabel.Text = '1st Etalon (ps)';

            % Create GeneralEtalonEditField
            app.GeneralEtalonEditField = uieditfield(app.GeneralInformationPanel, 'numeric');
            app.GeneralEtalonEditField.ValueDisplayFormat = '%5.2f';
            app.GeneralEtalonEditField.Position = [241 9 57 22];

            % Create MetadataInformationPanel
            app.MetadataInformationPanel = uipanel(app.TimeDomainTDTab);
            app.MetadataInformationPanel.Title = 'Metadata Information';
            app.MetadataInformationPanel.FontWeight = 'bold';
            app.MetadataInformationPanel.Position = [18 113 316 201];

            % Create SampleLabel
            app.SampleLabel = uilabel(app.MetadataInformationPanel);
            app.SampleLabel.HorizontalAlignment = 'right';
            app.SampleLabel.Position = [21 11 49 22];
            app.SampleLabel.Text = 'Sample ';

            % Create mdSampleThicknessDropDown
            app.mdSampleThicknessDropDown = uidropdown(app.MetadataInformationPanel);
            app.mdSampleThicknessDropDown.Items = {'no', 'md1', 'md2', 'md3', 'md4'};
            app.mdSampleThicknessDropDown.ValueChangedFcn = createCallbackFcn(app, @mdSampleThicknessDropDownValueChanged, true);
            app.mdSampleThicknessDropDown.Position = [79 11 60 22];
            app.mdSampleThicknessDropDown.Value = 'md1';

            % Create ReferenceLabel
            app.ReferenceLabel = uilabel(app.MetadataInformationPanel);
            app.ReferenceLabel.HorizontalAlignment = 'right';
            app.ReferenceLabel.Position = [164 11 60 22];
            app.ReferenceLabel.Text = 'Reference';

            % Create mdReferenceThicknessDropDown
            app.mdReferenceThicknessDropDown = uidropdown(app.MetadataInformationPanel);
            app.mdReferenceThicknessDropDown.Items = {'no', 'md1', 'md2', 'md3', 'md4'};
            app.mdReferenceThicknessDropDown.ValueChangedFcn = createCallbackFcn(app, @mdReferenceThicknessDropDownValueChanged, true);
            app.mdReferenceThicknessDropDown.Position = [234 11 60 22];
            app.mdReferenceThicknessDropDown.Value = 'md3';

            % Create md1EditFieldLabel
            app.md1EditFieldLabel = uilabel(app.MetadataInformationPanel);
            app.md1EditFieldLabel.HorizontalAlignment = 'right';
            app.md1EditFieldLabel.Position = [10 149 28 22];
            app.md1EditFieldLabel.Text = 'md1';

            % Create md1EditField
            app.md1EditField = uieditfield(app.MetadataInformationPanel, 'numeric');
            app.md1EditField.ValueDisplayFormat = '%5.2f';
            app.md1EditField.ValueChangedFcn = createCallbackFcn(app, @md1EditFieldValueChanged, true);
            app.md1EditField.Position = [54 149 50 22];

            % Create md2EditFieldLabel
            app.md2EditFieldLabel = uilabel(app.MetadataInformationPanel);
            app.md2EditFieldLabel.HorizontalAlignment = 'right';
            app.md2EditFieldLabel.Position = [10 123 28 22];
            app.md2EditFieldLabel.Text = 'md2';

            % Create md2EditField
            app.md2EditField = uieditfield(app.MetadataInformationPanel, 'numeric');
            app.md2EditField.ValueDisplayFormat = '%5.2f';
            app.md2EditField.ValueChangedFcn = createCallbackFcn(app, @md2EditFieldValueChanged, true);
            app.md2EditField.Position = [54 123 50 22];

            % Create md3EditFieldLabel
            app.md3EditFieldLabel = uilabel(app.MetadataInformationPanel);
            app.md3EditFieldLabel.HorizontalAlignment = 'right';
            app.md3EditFieldLabel.Position = [10 98 28 22];
            app.md3EditFieldLabel.Text = 'md3';

            % Create md3EditField
            app.md3EditField = uieditfield(app.MetadataInformationPanel, 'numeric');
            app.md3EditField.ValueDisplayFormat = '%5.2f';
            app.md3EditField.ValueChangedFcn = createCallbackFcn(app, @md3EditFieldValueChanged, true);
            app.md3EditField.Position = [54 98 50 22];

            % Create md4EditFieldLabel
            app.md4EditFieldLabel = uilabel(app.MetadataInformationPanel);
            app.md4EditFieldLabel.HorizontalAlignment = 'right';
            app.md4EditFieldLabel.Position = [10 73 28 22];
            app.md4EditFieldLabel.Text = 'md4';

            % Create md4EditField
            app.md4EditField = uieditfield(app.MetadataInformationPanel, 'numeric');
            app.md4EditField.ValueDisplayFormat = '%5.2f';
            app.md4EditField.ValueChangedFcn = createCallbackFcn(app, @md4EditFieldValueChanged, true);
            app.md4EditField.Position = [54 73 50 22];

            % Create ThicknessmmLabel
            app.ThicknessmmLabel = uilabel(app.MetadataInformationPanel);
            app.ThicknessmmLabel.FontWeight = 'bold';
            app.ThicknessmmLabel.Position = [9 46 96 22];
            app.ThicknessmmLabel.Text = 'Thickness (mm)';

            % Create md1DesEditField
            app.md1DesEditField = uieditfield(app.MetadataInformationPanel, 'text');
            app.md1DesEditField.Editable = 'off';
            app.md1DesEditField.Position = [111 149 195 22];

            % Create md2DesEditField
            app.md2DesEditField = uieditfield(app.MetadataInformationPanel, 'text');
            app.md2DesEditField.Editable = 'off';
            app.md2DesEditField.Position = [111 123 195 22];

            % Create md3DesEditField
            app.md3DesEditField = uieditfield(app.MetadataInformationPanel, 'text');
            app.md3DesEditField.Editable = 'off';
            app.md3DesEditField.Position = [111 98 195 22];

            % Create md4DesEditField
            app.md4DesEditField = uieditfield(app.MetadataInformationPanel, 'text');
            app.md4DesEditField.Editable = 'off';
            app.md4DesEditField.Position = [111 73 195 22];

            % Create ThicknessSwitch_TD
            app.ThicknessSwitch_TD = uiswitch(app.MetadataInformationPanel, 'slider');
            app.ThicknessSwitch_TD.Items = {'Sample', 'Offset'};
            app.ThicknessSwitch_TD.ValueChangedFcn = createCallbackFcn(app, @ThicknessSwitch_TDValueChanged, true);
            app.ThicknessSwitch_TD.Position = [162 45 45 20];
            app.ThicknessSwitch_TD.Value = 'Sample';

            % Create ResetConfigurationsButton
            app.ResetConfigurationsButton = uibutton(app.TimeDomainTDTab, 'push');
            app.ResetConfigurationsButton.ButtonPushedFcn = createCallbackFcn(app, @ResetConfigurationsButtonPushed, true);
            app.ResetConfigurationsButton.Position = [190 75 133 28];
            app.ResetConfigurationsButton.Text = 'Reset Configurations';

            % Create DatasetInformationPanel
            app.DatasetInformationPanel = uipanel(app.TimeDomainTDTab);
            app.DatasetInformationPanel.Title = 'Dataset Information';
            app.DatasetInformationPanel.FontWeight = 'bold';
            app.DatasetInformationPanel.Position = [354 372 327 115];

            % Create SampleDropDownLabel
            app.SampleDropDownLabel = uilabel(app.DatasetInformationPanel);
            app.SampleDropDownLabel.HorizontalAlignment = 'right';
            app.SampleDropDownLabel.Position = [5 7 46 22];
            app.SampleDropDownLabel.Text = 'Sample';

            % Create dsSampleDropDown
            app.dsSampleDropDown = uidropdown(app.DatasetInformationPanel);
            app.dsSampleDropDown.Items = {'ds1', 'ds2', 'ds3', 'ds4'};
            app.dsSampleDropDown.ValueChangedFcn = createCallbackFcn(app, @dsSampleDropDownValueChanged, true);
            app.dsSampleDropDown.Position = [54 7 52 22];
            app.dsSampleDropDown.Value = 'ds1';

            % Create ReferenceDropDownLabel
            app.ReferenceDropDownLabel = uilabel(app.DatasetInformationPanel);
            app.ReferenceDropDownLabel.HorizontalAlignment = 'right';
            app.ReferenceDropDownLabel.Position = [106 7 60 22];
            app.ReferenceDropDownLabel.Text = 'Reference';

            % Create dsReferenceDropDown
            app.dsReferenceDropDown = uidropdown(app.DatasetInformationPanel);
            app.dsReferenceDropDown.Items = {'no', 'ds1', 'ds2', 'ds3', 'ds4'};
            app.dsReferenceDropDown.ValueChangedFcn = createCallbackFcn(app, @dsReferenceDropDownValueChanged, true);
            app.dsReferenceDropDown.Position = [170 7 52 22];
            app.dsReferenceDropDown.Value = 'ds2';

            % Create ds1EditFieldLabel
            app.ds1EditFieldLabel = uilabel(app.DatasetInformationPanel);
            app.ds1EditFieldLabel.HorizontalAlignment = 'right';
            app.ds1EditFieldLabel.Position = [10 67 25 22];
            app.ds1EditFieldLabel.Text = 'ds1';

            % Create ds1DesEditField
            app.ds1DesEditField = uieditfield(app.DatasetInformationPanel, 'text');
            app.ds1DesEditField.Editable = 'off';
            app.ds1DesEditField.Position = [38 67 120 22];

            % Create ds2EditFieldLabel
            app.ds2EditFieldLabel = uilabel(app.DatasetInformationPanel);
            app.ds2EditFieldLabel.HorizontalAlignment = 'right';
            app.ds2EditFieldLabel.Position = [165 67 25 22];
            app.ds2EditFieldLabel.Text = 'ds2';

            % Create ds2DesEditField
            app.ds2DesEditField = uieditfield(app.DatasetInformationPanel, 'text');
            app.ds2DesEditField.Editable = 'off';
            app.ds2DesEditField.Position = [195 67 120 22];

            % Create ds3EditFieldLabel
            app.ds3EditFieldLabel = uilabel(app.DatasetInformationPanel);
            app.ds3EditFieldLabel.HorizontalAlignment = 'right';
            app.ds3EditFieldLabel.Position = [8 38 25 22];
            app.ds3EditFieldLabel.Text = 'ds3';

            % Create ds3DesEditField
            app.ds3DesEditField = uieditfield(app.DatasetInformationPanel, 'text');
            app.ds3DesEditField.Editable = 'off';
            app.ds3DesEditField.Position = [38 38 120 22];

            % Create ds4EditFieldLabel
            app.ds4EditFieldLabel = uilabel(app.DatasetInformationPanel);
            app.ds4EditFieldLabel.HorizontalAlignment = 'right';
            app.ds4EditFieldLabel.Position = [165 38 25 22];
            app.ds4EditFieldLabel.Text = 'ds4';

            % Create ds4DesEditField
            app.ds4DesEditField = uieditfield(app.DatasetInformationPanel, 'text');
            app.ds4DesEditField.Editable = 'off';
            app.ds4DesEditField.Position = [195 38 120 22];

            % Create PumpedLabel
            app.PumpedLabel = uilabel(app.DatasetInformationPanel);
            app.PumpedLabel.HorizontalAlignment = 'right';
            app.PumpedLabel.Position = [224 7 36 22];
            app.PumpedLabel.Text = 'Pump';

            % Create dsPumpedDropDown
            app.dsPumpedDropDown = uidropdown(app.DatasetInformationPanel);
            app.dsPumpedDropDown.Items = {'no', 'ds1', 'ds2', 'ds3', 'ds4'};
            app.dsPumpedDropDown.ValueChangedFcn = createCallbackFcn(app, @dsPumpedDropDownValueChanged, true);
            app.dsPumpedDropDown.Position = [263 7 52 22];
            app.dsPumpedDropDown.Value = 'no';

            % Create FrequencyDomainFDTab
            app.FrequencyDomainFDTab = uitab(app.TabGroup);
            app.FrequencyDomainFDTab.Title = 'Frequency Domain (FD)';

            % Create UIAxes3
            app.UIAxes3 = uiaxes(app.FrequencyDomainFDTab);
            title(app.UIAxes3, 'PLOT 1')
            xlabel(app.UIAxes3, 'Frequency (THz)')
            ylabel(app.UIAxes3, 'E_{field amplitude} (a.u.)')
            app.UIAxes3.FontWeight = 'bold';
            app.UIAxes3.XTickLabelRotation = 0;
            app.UIAxes3.YTickLabelRotation = 0;
            app.UIAxes3.YScale = 'log';
            app.UIAxes3.YMinorTick = 'on';
            app.UIAxes3.ZTickLabelRotation = 0;
            app.UIAxes3.LineWidth = 1;
            app.UIAxes3.Box = 'on';
            app.UIAxes3.Position = [715 455 750 400];

            % Create UIAxes4
            app.UIAxes4 = uiaxes(app.FrequencyDomainFDTab);
            title(app.UIAxes4, 'PLOT 2')
            xlabel(app.UIAxes4, 'Frequency (THz)')
            ylabel(app.UIAxes4, 'E_{field amplitude} (a.u.)')
            app.UIAxes4.FontWeight = 'bold';
            app.UIAxes4.XTickLabelRotation = 0;
            app.UIAxes4.YTickLabelRotation = 0;
            app.UIAxes4.YScale = 'log';
            app.UIAxes4.YMinorTick = 'on';
            app.UIAxes4.ZTickLabelRotation = 0;
            app.UIAxes4.LineWidth = 1;
            app.UIAxes4.Box = 'on';
            app.UIAxes4.Position = [715 45 750 400];

            % Create Plot1FDButton
            app.Plot1FDButton = uibutton(app.FrequencyDomainFDTab, 'push');
            app.Plot1FDButton.ButtonPushedFcn = createCallbackFcn(app, @Plot1FDButtonPushed, true);
            app.Plot1FDButton.Position = [593 556 100 45];
            app.Plot1FDButton.Text = 'Plot 1';

            % Create Plot2FDButton
            app.Plot2FDButton = uibutton(app.FrequencyDomainFDTab, 'push');
            app.Plot2FDButton.ButtonPushedFcn = createCallbackFcn(app, @Plot2FDButtonPushed, true);
            app.Plot2FDButton.Position = [593 505 100 45];
            app.Plot2FDButton.Text = 'Plot 2';

            % Create FDListListBoxLabel
            app.FDListListBoxLabel = uilabel(app.FrequencyDomainFDTab);
            app.FDListListBoxLabel.Position = [17 833 79 22];
            app.FDListListBoxLabel.Text = 'FD List';

            % Create FDListListBox
            app.FDListListBox = uilistbox(app.FrequencyDomainFDTab);
            app.FDListListBox.Items = {};
            app.FDListListBox.Position = [14 496 358 336];
            app.FDListListBox.Value = {};

            % Create ALLFDButton
            app.ALLFDButton = uibutton(app.FrequencyDomainFDTab, 'push');
            app.ALLFDButton.ButtonPushedFcn = createCallbackFcn(app, @ALLFDButtonPushed, true);
            app.ALLFDButton.Position = [384 749 45 45];
            app.ALLFDButton.Text = 'ALL';

            % Create ADDFDButton
            app.ADDFDButton = uibutton(app.FrequencyDomainFDTab, 'push');
            app.ADDFDButton.ButtonPushedFcn = createCallbackFcn(app, @ADDFDButtonPushed, true);
            app.ADDFDButton.Position = [384 689 45 45];
            app.ADDFDButton.Text = 'ADD';

            % Create DELFDButton
            app.DELFDButton = uibutton(app.FrequencyDomainFDTab, 'push');
            app.DELFDButton.ButtonPushedFcn = createCallbackFcn(app, @DELFDButtonPushed, true);
            app.DELFDButton.Position = [384 629 45 45];
            app.DELFDButton.Text = 'DEL';

            % Create FDSelectionListBoxLabel
            app.FDSelectionListBoxLabel = uilabel(app.FrequencyDomainFDTab);
            app.FDSelectionListBoxLabel.Position = [439 831 79 22];
            app.FDSelectionListBoxLabel.Text = 'FD Selection';

            % Create FDSelectionListBox
            app.FDSelectionListBox = uilistbox(app.FrequencyDomainFDTab);
            app.FDSelectionListBox.Items = {};
            app.FDSelectionListBox.Position = [439 496 142 336];
            app.FDSelectionListBox.Value = {};

            % Create ButtonGroupFD
            app.ButtonGroupFD = uibuttongroup(app.FrequencyDomainFDTab);
            app.ButtonGroupFD.Position = [593 755 100 78];

            % Create ReferenceButtonFD
            app.ReferenceButtonFD = uiradiobutton(app.ButtonGroupFD);
            app.ReferenceButtonFD.Text = 'Reference';
            app.ReferenceButtonFD.Position = [11 51 77 22];

            % Create SampleButtonFD
            app.SampleButtonFD = uiradiobutton(app.ButtonGroupFD);
            app.SampleButtonFD.Text = 'Sample';
            app.SampleButtonFD.Position = [11 29 63 22];
            app.SampleButtonFD.Value = true;

            % Create BothButtonFD
            app.BothButtonFD = uiradiobutton(app.ButtonGroupFD);
            app.BothButtonFD.Text = 'Both';
            app.BothButtonFD.Position = [11 7 65 22];

            % Create RemoveButton
            app.RemoveButton = uibutton(app.FrequencyDomainFDTab, 'push');
            app.RemoveButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveButtonPushed, true);
            app.RemoveButton.Position = [27 456 156 30];
            app.RemoveButton.Text = 'Remove';

            % Create RemoveAllButton
            app.RemoveAllButton = uibutton(app.FrequencyDomainFDTab, 'push');
            app.RemoveAllButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveAllButtonPushed, true);
            app.RemoveAllButton.Position = [205 456 156 30];
            app.RemoveAllButton.Text = 'Remove All';

            % Create AssignFD_DataButton
            app.AssignFD_DataButton = uibutton(app.FrequencyDomainFDTab, 'push');
            app.AssignFD_DataButton.ButtonPushedFcn = createCallbackFcn(app, @AssignFD_DataButtonPushed, true);
            app.AssignFD_DataButton.FontWeight = 'bold';
            app.AssignFD_DataButton.Tooltip = {'Assign data to variable in the base workspace'};
            app.AssignFD_DataButton.Position = [283 16 220 30];
            app.AssignFD_DataButton.Text = 'Assign FD_DATA in Workspace';

            % Create FDDataAnalysisPanel
            app.FDDataAnalysisPanel = uipanel(app.FrequencyDomainFDTab);
            app.FDDataAnalysisPanel.Title = 'FD Data Analysis';
            app.FDDataAnalysisPanel.FontWeight = 'bold';
            app.FDDataAnalysisPanel.Position = [12 92 675 344];

            % Create Plot1FDButton_2
            app.Plot1FDButton_2 = uibutton(app.FDDataAnalysisPanel, 'push');
            app.Plot1FDButton_2.ButtonPushedFcn = createCallbackFcn(app, @Plot1FDButton_2Pushed, true);
            app.Plot1FDButton_2.Position = [554 118 104 45];
            app.Plot1FDButton_2.Text = 'Plot 1';

            % Create Plot2FDButton_2
            app.Plot2FDButton_2 = uibutton(app.FDDataAnalysisPanel, 'push');
            app.Plot2FDButton_2.ButtonPushedFcn = createCallbackFcn(app, @Plot2FDButton_2Pushed, true);
            app.Plot2FDButton_2.Position = [554 65 104 45];
            app.Plot2FDButton_2.Text = 'Plot 2';

            % Create MagPhaseButtonGroup_2
            app.MagPhaseButtonGroup_2 = uibuttongroup(app.FDDataAnalysisPanel);
            app.MagPhaseButtonGroup_2.Position = [555 201 100 50];

            % Create AmplitudeButton_2
            app.AmplitudeButton_2 = uiradiobutton(app.MagPhaseButtonGroup_2);
            app.AmplitudeButton_2.Text = 'Amplitude';
            app.AmplitudeButton_2.Position = [11 24 75 22];
            app.AmplitudeButton_2.Value = true;

            % Create PhaseButton_2
            app.PhaseButton_2 = uiradiobutton(app.MagPhaseButtonGroup_2);
            app.PhaseButton_2.Text = 'Phase';
            app.PhaseButton_2.Position = [11 2 56 22];

            % Create ALLFDButton_2
            app.ALLFDButton_2 = uibutton(app.FDDataAnalysisPanel, 'push');
            app.ALLFDButton_2.ButtonPushedFcn = createCallbackFcn(app, @ALLFDButton_2Pushed, true);
            app.ALLFDButton_2.Position = [8 229 45 45];
            app.ALLFDButton_2.Text = 'ALL';

            % Create ADDFDButton_2
            app.ADDFDButton_2 = uibutton(app.FDDataAnalysisPanel, 'push');
            app.ADDFDButton_2.ButtonPushedFcn = createCallbackFcn(app, @ADDFDButton_2Pushed, true);
            app.ADDFDButton_2.Position = [8 171 45 45];
            app.ADDFDButton_2.Text = 'ADD';

            % Create DELFDButton_2
            app.DELFDButton_2 = uibutton(app.FDDataAnalysisPanel, 'push');
            app.DELFDButton_2.ButtonPushedFcn = createCallbackFcn(app, @DELFDButton_2Pushed, true);
            app.DELFDButton_2.Position = [8 114 45 45];
            app.DELFDButton_2.Text = 'DEL';

            % Create DescriptionEditField_2Label
            app.DescriptionEditField_2Label = uilabel(app.FDDataAnalysisPanel);
            app.DescriptionEditField_2Label.Position = [230 287 66 22];
            app.DescriptionEditField_2Label.Text = 'Description';

            % Create DescriptionEditField_FD
            app.DescriptionEditField_FD = uieditfield(app.FDDataAnalysisPanel, 'text');
            app.DescriptionEditField_FD.Editable = 'off';
            app.DescriptionEditField_FD.Position = [227 265 143 22];

            % Create ThicknessmmPanel
            app.ThicknessmmPanel = uipanel(app.FDDataAnalysisPanel);
            app.ThicknessmmPanel.Title = 'Thickness(mm)';
            app.ThicknessmmPanel.Position = [227 146 143 113];

            % Create ReferenceEditFieldLabel
            app.ReferenceEditFieldLabel = uilabel(app.ThicknessmmPanel);
            app.ReferenceEditFieldLabel.HorizontalAlignment = 'right';
            app.ReferenceEditFieldLabel.Position = [7 35 60 22];
            app.ReferenceEditFieldLabel.Text = 'Reference';

            % Create ReferenceEditField
            app.ReferenceEditField = uieditfield(app.ThicknessmmPanel, 'numeric');
            app.ReferenceEditField.Limits = [0 Inf];
            app.ReferenceEditField.ValueDisplayFormat = '%5.2g';
            app.ReferenceEditField.Editable = 'off';
            app.ReferenceEditField.Position = [92 35 42 22];

            % Create SampleEditFieldLabel
            app.SampleEditFieldLabel = uilabel(app.ThicknessmmPanel);
            app.SampleEditFieldLabel.HorizontalAlignment = 'right';
            app.SampleEditFieldLabel.Position = [7 64 46 22];
            app.SampleEditFieldLabel.Text = 'Sample';

            % Create SampleEditField
            app.SampleEditField = uieditfield(app.ThicknessmmPanel, 'numeric');
            app.SampleEditField.Limits = [0 Inf];
            app.SampleEditField.ValueDisplayFormat = '%5.2g';
            app.SampleEditField.Editable = 'off';
            app.SampleEditField.Position = [92 62 42 22];

            % Create ThicknessSwitch_FD
            app.ThicknessSwitch_FD = uiswitch(app.ThicknessmmPanel, 'slider');
            app.ThicknessSwitch_FD.Items = {'Sample', 'Offset'};
            app.ThicknessSwitch_FD.Position = [53 8 43 19];
            app.ThicknessSwitch_FD.Value = 'Sample';

            % Create MultipleReflectionCountPanel
            app.MultipleReflectionCountPanel = uipanel(app.FDDataAnalysisPanel);
            app.MultipleReflectionCountPanel.Title = 'Multiple Reflection Count';
            app.MultipleReflectionCountPanel.Position = [227 84 144 54];

            % Create SampleEditField_2Label
            app.SampleEditField_2Label = uilabel(app.MultipleReflectionCountPanel);
            app.SampleEditField_2Label.HorizontalAlignment = 'right';
            app.SampleEditField_2Label.Position = [6 6 46 22];
            app.SampleEditField_2Label.Text = 'Sample';

            % Create SampleNMREditField
            app.SampleNMREditField = uieditfield(app.MultipleReflectionCountPanel, 'numeric');
            app.SampleNMREditField.Limits = [0 Inf];
            app.SampleNMREditField.ValueDisplayFormat = '%.0f';
            app.SampleNMREditField.Editable = 'off';
            app.SampleNMREditField.Position = [92 6 42 22];

            % Create CalculateOpticalParametersButton
            app.CalculateOpticalParametersButton = uibutton(app.FDDataAnalysisPanel, 'push');
            app.CalculateOpticalParametersButton.ButtonPushedFcn = createCallbackFcn(app, @CalculateOpticalParametersButtonPushed, true);
            app.CalculateOpticalParametersButton.FontWeight = 'bold';
            app.CalculateOpticalParametersButton.Position = [229 21 140 55];
            app.CalculateOpticalParametersButton.Text = {'Calculate'; 'Optical Parameters'};

            % Create FDSelectionListBox_2Label
            app.FDSelectionListBox_2Label = uilabel(app.FDDataAnalysisPanel);
            app.FDSelectionListBox_2Label.Position = [61 290 79 22];
            app.FDSelectionListBox_2Label.Text = 'FD Selection';

            % Create FDSelectionListBox_2
            app.FDSelectionListBox_2 = uilistbox(app.FDDataAnalysisPanel);
            app.FDSelectionListBox_2.Items = {};
            app.FDSelectionListBox_2.ValueChangedFcn = createCallbackFcn(app, @FDSelectionListBox_2ValueChanged, true);
            app.FDSelectionListBox_2.Position = [61 14 155 277];
            app.FDSelectionListBox_2.Value = {};

            % Create PlotDataButtonGroup
            app.PlotDataButtonGroup = uibuttongroup(app.FDDataAnalysisPanel);
            app.PlotDataButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @PlotDataButtonGroupSelectionChanged, true);
            app.PlotDataButtonGroup.Title = 'Plot Data';
            app.PlotDataButtonGroup.Position = [383 14 159 293];

            % Create TransmittanceButton
            app.TransmittanceButton = uitogglebutton(app.PlotDataButtonGroup);
            app.TransmittanceButton.Text = 'Transmittance';
            app.TransmittanceButton.Position = [9 208 140 55];

            % Create AbsorptionButton
            app.AbsorptionButton = uitogglebutton(app.PlotDataButtonGroup);
            app.AbsorptionButton.Enable = 'off';
            app.AbsorptionButton.Text = 'Absorption';
            app.AbsorptionButton.Position = [9 142 140 55];

            % Create RefractiveIndexButton
            app.RefractiveIndexButton = uitogglebutton(app.PlotDataButtonGroup);
            app.RefractiveIndexButton.Enable = 'off';
            app.RefractiveIndexButton.Text = 'Refractive Index';
            app.RefractiveIndexButton.Position = [9 77 140 55];
            app.RefractiveIndexButton.Value = true;

            % Create DielectricConstantButton
            app.DielectricConstantButton = uitogglebutton(app.PlotDataButtonGroup);
            app.DielectricConstantButton.Enable = 'off';
            app.DielectricConstantButton.Text = 'Dielectric Constant';
            app.DielectricConstantButton.Position = [9 12 140 55];

            % Create YscaleButtonGroup_2
            app.YscaleButtonGroup_2 = uibuttongroup(app.FDDataAnalysisPanel);
            app.YscaleButtonGroup_2.Position = [555 256 100 50];

            % Create logButton_2
            app.logButton_2 = uiradiobutton(app.YscaleButtonGroup_2);
            app.logButton_2.Text = 'log';
            app.logButton_2.Position = [11 24 38 22];
            app.logButton_2.Value = true;

            % Create linearButton_2
            app.linearButton_2 = uiradiobutton(app.YscaleButtonGroup_2);
            app.linearButton_2.Text = 'linear';
            app.linearButton_2.Position = [11 2 51 22];

            % Create PlotForCustomisationButton_FD2
            app.PlotForCustomisationButton_FD2 = uibutton(app.FDDataAnalysisPanel, 'push');
            app.PlotForCustomisationButton_FD2.ButtonPushedFcn = createCallbackFcn(app, @PlotForCustomisationButton_FD2Pushed, true);
            app.PlotForCustomisationButton_FD2.Position = [554 14 103 45];
            app.PlotForCustomisationButton_FD2.Text = {'Plot For'; 'Customisation'};

            % Create RealImagButtonGroup
            app.RealImagButtonGroup = uibuttongroup(app.FDDataAnalysisPanel);
            app.RealImagButtonGroup.Visible = 'off';
            app.RealImagButtonGroup.Position = [555 200 100 50];

            % Create RealButton
            app.RealButton = uiradiobutton(app.RealImagButtonGroup);
            app.RealButton.Text = 'Real';
            app.RealButton.Position = [11 24 58 22];
            app.RealButton.Value = true;

            % Create ImaginaryButton
            app.ImaginaryButton = uiradiobutton(app.RealImagButtonGroup);
            app.ImaginaryButton.Text = 'Imaginary';
            app.ImaginaryButton.Position = [11 2 75 22];

            % Create GridOffButton_2
            app.GridOffButton_2 = uibutton(app.FDDataAnalysisPanel, 'state');
            app.GridOffButton_2.Text = 'Grid Off';
            app.GridOffButton_2.Position = [554 169 103 25];

            % Create YscaleButtonGroup
            app.YscaleButtonGroup = uibuttongroup(app.FrequencyDomainFDTab);
            app.YscaleButtonGroup.Position = [593 697 100 51];

            % Create logButton
            app.logButton = uiradiobutton(app.YscaleButtonGroup);
            app.logButton.Text = 'log';
            app.logButton.Position = [11 24 38 22];
            app.logButton.Value = true;

            % Create linearButton
            app.linearButton = uiradiobutton(app.YscaleButtonGroup);
            app.linearButton.Text = 'linear';
            app.linearButton.Position = [11 2 51 22];

            % Create MagPhaseButtonGroup
            app.MagPhaseButtonGroup = uibuttongroup(app.FrequencyDomainFDTab);
            app.MagPhaseButtonGroup.Position = [593 640 100 51];

            % Create AmplitudeButton
            app.AmplitudeButton = uiradiobutton(app.MagPhaseButtonGroup);
            app.AmplitudeButton.Text = 'Amplitude';
            app.AmplitudeButton.Position = [11 24 75 22];
            app.AmplitudeButton.Value = true;

            % Create PhaseButton
            app.PhaseButton = uiradiobutton(app.MagPhaseButtonGroup);
            app.PhaseButton.Text = 'Phase';
            app.PhaseButton.Position = [11 2 56 22];

            % Create SaveData_FD
            app.SaveData_FD = uibutton(app.FrequencyDomainFDTab, 'push');
            app.SaveData_FD.ButtonPushedFcn = createCallbackFcn(app, @SaveData_FDButtonPushed, true);
            app.SaveData_FD.FontWeight = 'bold';
            app.SaveData_FD.Tooltip = {'Assign data to variable in the base workspace'};
            app.SaveData_FD.Position = [153 16 117 30];
            app.SaveData_FD.Text = 'Save FD_DATA';

            % Create LoadData_FD
            app.LoadData_FD = uibutton(app.FrequencyDomainFDTab, 'push');
            app.LoadData_FD.ButtonPushedFcn = createCallbackFcn(app, @LoadData_FDButtonPushed, true);
            app.LoadData_FD.FontWeight = 'bold';
            app.LoadData_FD.Tooltip = {'Assign data to variable in the base workspace'};
            app.LoadData_FD.Position = [27 16 116 30];
            app.LoadData_FD.Text = 'Load FD_DATA';

            % Create LegendButton
            app.LegendButton = uibutton(app.FrequencyDomainFDTab, 'state');
            app.LegendButton.ValueChangedFcn = createCallbackFcn(app, @LegendButtonValueChanged, true);
            app.LegendButton.Text = 'Legend';
            app.LegendButton.Position = [1216 12 99 23];

            % Create JetColormapButton
            app.JetColormapButton = uibutton(app.FrequencyDomainFDTab, 'state');
            app.JetColormapButton.ValueChangedFcn = createCallbackFcn(app, @JetColormapButtonValueChanged, true);
            app.JetColormapButton.Text = 'Jet Colormap';
            app.JetColormapButton.Position = [1332 12 107 23];

            % Create FDDatatoLabel
            app.FDDatatoLabel = uilabel(app.FrequencyDomainFDTab);
            app.FDDatatoLabel.FontWeight = 'bold';
            app.FDDatatoLabel.Position = [27 59 69 22];
            app.FDDatatoLabel.Text = 'FD Data to ';

            % Create DataManipulationButton
            app.DataManipulationButton = uibutton(app.FrequencyDomainFDTab, 'push');
            app.DataManipulationButton.ButtonPushedFcn = createCallbackFcn(app, @DataManipulationButtonPushed, true);
            app.DataManipulationButton.FontWeight = 'bold';
            app.DataManipulationButton.Enable = 'off';
            app.DataManipulationButton.Tooltip = {'Assign data to variable in the base workspace'};
            app.DataManipulationButton.Position = [97 57 295 26];
            app.DataManipulationButton.Text = 'Data Manipulation';

            % Create GridOffButton
            app.GridOffButton = uibutton(app.FrequencyDomainFDTab, 'state');
            app.GridOffButton.Text = 'Grid Off';
            app.GridOffButton.Position = [593 607 100 25];

            % Create PlotForCustomisationButton_FD1
            app.PlotForCustomisationButton_FD1 = uibutton(app.FrequencyDomainFDTab, 'push');
            app.PlotForCustomisationButton_FD1.ButtonPushedFcn = createCallbackFcn(app, @PlotForCustomisationButton_FD1Pushed, true);
            app.PlotForCustomisationButton_FD1.Position = [593 458 100 41];
            app.PlotForCustomisationButton_FD1.Text = {'Plot For'; 'Customisation'};

            % Create DataManipulationDMTab
            app.DataManipulationDMTab = uitab(app.TabGroup);
            app.DataManipulationDMTab.Title = 'Data Manipulation (DM)';

            % Create UIAxes10
            app.UIAxes10 = uiaxes(app.DataManipulationDMTab);
            title(app.UIAxes10, 'PLOT 2')
            app.UIAxes10.FontWeight = 'bold';
            app.UIAxes10.XTickLabelRotation = 0;
            app.UIAxes10.YTickLabelRotation = 0;
            app.UIAxes10.ZTickLabelRotation = 0;
            app.UIAxes10.LineWidth = 1;
            app.UIAxes10.Box = 'on';
            app.UIAxes10.Position = [697 11 750 400];

            % Create STEP1Panel
            app.STEP1Panel = uipanel(app.DataManipulationDMTab);
            app.STEP1Panel.Title = 'STEP 1';
            app.STEP1Panel.Position = [13 423 1437 431];

            % Create UIAxes9
            app.UIAxes9 = uiaxes(app.STEP1Panel);
            title(app.UIAxes9, 'PLOT 1')
            xlabel(app.UIAxes9, 'Frequency (THz)')
            app.UIAxes9.FontWeight = 'bold';
            app.UIAxes9.XLim = [0 4];
            app.UIAxes9.XTickLabelRotation = 0;
            app.UIAxes9.YTickLabelRotation = 0;
            app.UIAxes9.ZTickLabelRotation = 0;
            app.UIAxes9.LineWidth = 1;
            app.UIAxes9.Box = 'on';
            app.UIAxes9.Position = [681 5 750 400];

            % Create SourceDataSetEditFieldLabel
            app.SourceDataSetEditFieldLabel = uilabel(app.STEP1Panel);
            app.SourceDataSetEditFieldLabel.HorizontalAlignment = 'right';
            app.SourceDataSetEditFieldLabel.Position = [18 310 94 22];
            app.SourceDataSetEditFieldLabel.Text = 'Source Data Set';

            % Create SourceDataSetEditField
            app.SourceDataSetEditField = uieditfield(app.STEP1Panel, 'text');
            app.SourceDataSetEditField.Position = [129 310 537 22];
            app.SourceDataSetEditField.Value = 'ex) 1 2 3 4 5';

            % Create AforDropDownLabel
            app.AforDropDownLabel = uilabel(app.STEP1Panel);
            app.AforDropDownLabel.HorizontalAlignment = 'right';
            app.AforDropDownLabel.Position = [117 272 30 22];
            app.AforDropDownLabel.Text = 'A for';

            % Create AforDropDown
            app.AforDropDown = uidropdown(app.STEP1Panel);
            app.AforDropDown.Items = {'frequency', 'ref_amplitude', 'ref_phase', 'sam_amplitude', 'sam_phase', 'transmit_amplitude', 'transmit_phase', 'refractiveIndex', 'absorption', 'extinction', 'eReal', 'eImag'};
            app.AforDropDown.Position = [151 272 113 22];
            app.AforDropDown.Value = 'frequency';

            % Create DefinevariablesLabel
            app.DefinevariablesLabel = uilabel(app.STEP1Panel);
            app.DefinevariablesLabel.Position = [24 271 95 22];
            app.DefinevariablesLabel.Text = 'Define variables ';

            % Create XaxisDataDropDownLabel
            app.XaxisDataDropDownLabel = uilabel(app.STEP1Panel);
            app.XaxisDataDropDownLabel.HorizontalAlignment = 'right';
            app.XaxisDataDropDownLabel.Position = [25 236 67 22];
            app.XaxisDataDropDownLabel.Text = 'X-axis Data';

            % Create XaxisDataDropDown
            app.XaxisDataDropDown = uidropdown(app.STEP1Panel);
            app.XaxisDataDropDown.Items = {'frequency', 'ref_amplitude', 'ref_phase', 'sam_amplitude', 'sam_phase', 'transmit_amplitude', 'transmit_phase', 'refractiveIndex', 'absorption', 'extinction', 'eReal', 'eImag'};
            app.XaxisDataDropDown.Position = [151 236 115 22];
            app.XaxisDataDropDown.Value = 'frequency';

            % Create YaxisDataFormulationEditFieldLabel
            app.YaxisDataFormulationEditFieldLabel = uilabel(app.STEP1Panel);
            app.YaxisDataFormulationEditFieldLabel.HorizontalAlignment = 'right';
            app.YaxisDataFormulationEditFieldLabel.Position = [24 201 133 22];
            app.YaxisDataFormulationEditFieldLabel.Text = 'Y-axis Data Formulation';

            % Create YaxisDataFormulationEditField
            app.YaxisDataFormulationEditField = uieditfield(app.STEP1Panel, 'text');
            app.YaxisDataFormulationEditField.Position = [181 201 382 22];
            app.YaxisDataFormulationEditField.Value = 'A';

            % Create PlotindividualdatasetsButton
            app.PlotindividualdatasetsButton = uibutton(app.STEP1Panel, 'push');
            app.PlotindividualdatasetsButton.ButtonPushedFcn = createCallbackFcn(app, @PlotindividualdatasetsButtonPushed, true);
            app.PlotindividualdatasetsButton.Enable = 'off';
            app.PlotindividualdatasetsButton.Position = [411 59 231 30];
            app.PlotindividualdatasetsButton.Text = 'Plot (individual data sets)';

            % Create BforDropDownLabel
            app.BforDropDownLabel = uilabel(app.STEP1Panel);
            app.BforDropDownLabel.HorizontalAlignment = 'right';
            app.BforDropDownLabel.Position = [268 272 31 22];
            app.BforDropDownLabel.Text = 'B for';

            % Create BforDropDown
            app.BforDropDown = uidropdown(app.STEP1Panel);
            app.BforDropDown.Items = {'frequency', 'ref_amplitude', 'ref_phase', 'sam_amplitude', 'sam_phase', 'transmit_amplitude', 'transmit_phase', 'refractiveIndex', 'absorption', 'extinction', 'eReal', 'eImag'};
            app.BforDropDown.Position = [303 272 113 22];
            app.BforDropDown.Value = 'frequency';

            % Create CforDropDownLabel
            app.CforDropDownLabel = uilabel(app.STEP1Panel);
            app.CforDropDownLabel.HorizontalAlignment = 'right';
            app.CforDropDownLabel.Position = [417 272 32 22];
            app.CforDropDownLabel.Text = 'C for';

            % Create CforDropDown
            app.CforDropDown = uidropdown(app.STEP1Panel);
            app.CforDropDown.Items = {'frequency', 'ref_amplitude', 'ref_phase', 'sam_amplitude', 'sam_phase', 'transmit_amplitude', 'transmit_phase', 'refractiveIndex', 'absorption', 'extinction', 'eReal', 'eImag'};
            app.CforDropDown.Position = [454 272 113 22];
            app.CforDropDown.Value = 'frequency';

            % Create CalculateButton
            app.CalculateButton = uibutton(app.STEP1Panel, 'push');
            app.CalculateButton.ButtonPushedFcn = createCallbackFcn(app, @CalculateButtonPushed, true);
            app.CalculateButton.BackgroundColor = [1 1 1];
            app.CalculateButton.Position = [411 98 231 30];
            app.CalculateButton.Text = 'Calculate';

            % Create ImportAllDataButton
            app.ImportAllDataButton = uibutton(app.STEP1Panel, 'push');
            app.ImportAllDataButton.ButtonPushedFcn = createCallbackFcn(app, @ImportAllDataButtonPushed, true);
            app.ImportAllDataButton.Position = [129 338 209 23];
            app.ImportAllDataButton.Text = 'Import All Data';

            % Create AvailableDataSetEditFieldLabel
            app.AvailableDataSetEditFieldLabel = uilabel(app.STEP1Panel);
            app.AvailableDataSetEditFieldLabel.HorizontalAlignment = 'right';
            app.AvailableDataSetEditFieldLabel.Position = [19 368 104 22];
            app.AvailableDataSetEditFieldLabel.Text = 'Available Data Set';

            % Create AvailableDataSetEditField
            app.AvailableDataSetEditField = uieditfield(app.STEP1Panel, 'text');
            app.AvailableDataSetEditField.Editable = 'off';
            app.AvailableDataSetEditField.Position = [129 368 537 22];

            % Create NumberofDataEditFieldLabel
            app.NumberofDataEditFieldLabel = uilabel(app.STEP1Panel);
            app.NumberofDataEditFieldLabel.HorizontalAlignment = 'right';
            app.NumberofDataEditFieldLabel.Position = [26 147 91 22];
            app.NumberofDataEditFieldLabel.Text = 'Number of Data';

            % Create NumberofDataEditField
            app.NumberofDataEditField = uieditfield(app.STEP1Panel, 'numeric');
            app.NumberofDataEditField.Editable = 'off';
            app.NumberofDataEditField.Position = [131 147 71 22];

            % Create exABABCetcLabel
            app.exABABCetcLabel = uilabel(app.STEP1Panel);
            app.exABABCetcLabel.Position = [182 178 129 22];
            app.exABABCetcLabel.Text = 'ex) A./B , (A+B).*C, etc';

            % Create DPlotFrequencyxaxisPanel
            app.DPlotFrequencyxaxisPanel = uipanel(app.STEP1Panel);
            app.DPlotFrequencyxaxisPanel.Title = '3D Plot (Frequency x-axis)';
            app.DPlotFrequencyxaxisPanel.Position = [39 21 345 71];

            % Create Plot1_3DButton
            app.Plot1_3DButton = uibutton(app.DPlotFrequencyxaxisPanel, 'push');
            app.Plot1_3DButton.ButtonPushedFcn = createCallbackFcn(app, @Plot1_3DButtonPushed, true);
            app.Plot1_3DButton.Position = [216 20 114 23];
            app.Plot1_3DButton.Text = '3D Plot 1';

            % Create dataDropDownLabel
            app.dataDropDownLabel = uilabel(app.DPlotFrequencyxaxisPanel);
            app.dataDropDownLabel.HorizontalAlignment = 'right';
            app.dataDropDownLabel.Position = [9 21 29 22];
            app.dataDropDownLabel.Text = 'data';

            % Create data3DDropDown
            app.data3DDropDown = uidropdown(app.DPlotFrequencyxaxisPanel);
            app.data3DDropDown.Items = {'no available data'};
            app.data3DDropDown.Position = [53 21 152 22];
            app.data3DDropDown.Value = 'no available data';

            % Create DplotdoesnotsupportthebelowextractingfunctionLabel
            app.DplotdoesnotsupportthebelowextractingfunctionLabel = uilabel(app.DPlotFrequencyxaxisPanel);
            app.DplotdoesnotsupportthebelowextractingfunctionLabel.FontSize = 10;
            app.DplotdoesnotsupportthebelowextractingfunctionLabel.Position = [41 0 249 22];
            app.DplotdoesnotsupportthebelowextractingfunctionLabel.Text = '*3D plot doesnot support the below extracting function.';

            % Create PlotmeanandrangeButton
            app.PlotmeanandrangeButton = uibutton(app.STEP1Panel, 'push');
            app.PlotmeanandrangeButton.ButtonPushedFcn = createCallbackFcn(app, @PlotmeanandrangeButtonPushed, true);
            app.PlotmeanandrangeButton.Enable = 'off';
            app.PlotmeanandrangeButton.Position = [411 21 231 30];
            app.PlotmeanandrangeButton.Text = 'Plot (mean and range)';

            % Create ImportAllDataInverseSequenceButton
            app.ImportAllDataInverseSequenceButton = uibutton(app.STEP1Panel, 'push');
            app.ImportAllDataInverseSequenceButton.ButtonPushedFcn = createCallbackFcn(app, @ImportAllDataInverseSequenceButtonPushed, true);
            app.ImportAllDataInverseSequenceButton.Position = [348 338 209 23];
            app.ImportAllDataInverseSequenceButton.Text = 'Import All Data (Inverse Sequence)';

            % Create AssignDM_DataButton
            app.AssignDM_DataButton = uibutton(app.DataManipulationDMTab, 'push');
            app.AssignDM_DataButton.ButtonPushedFcn = createCallbackFcn(app, @AssignDM_DataButtonPushed, true);
            app.AssignDM_DataButton.FontWeight = 'bold';
            app.AssignDM_DataButton.Tooltip = {'Assign data to variable in the base workspace'};
            app.AssignDM_DataButton.Position = [148 22 220 30];
            app.AssignDM_DataButton.Text = 'Assign DM_DATA in Workspace';

            % Create SaveData_DM
            app.SaveData_DM = uibutton(app.DataManipulationDMTab, 'push');
            app.SaveData_DM.ButtonPushedFcn = createCallbackFcn(app, @SaveData_DMButtonPushed, true);
            app.SaveData_DM.FontWeight = 'bold';
            app.SaveData_DM.Tooltip = {'Assign data to variable in the base workspace'};
            app.SaveData_DM.Position = [27 22 113 30];
            app.SaveData_DM.Text = 'Save DM_DATA';

            % Create DMTabGroup
            app.DMTabGroup = uitabgroup(app.DataManipulationDMTab);
            app.DMTabGroup.Position = [25 76 648 310];

            % Create FrequencyBaseTab
            app.FrequencyBaseTab = uitab(app.DMTabGroup);
            app.FrequencyBaseTab.Title = 'Frequency Base';

            % Create DisplayXLinesButton
            app.DisplayXLinesButton = uibutton(app.FrequencyBaseTab, 'push');
            app.DisplayXLinesButton.ButtonPushedFcn = createCallbackFcn(app, @DisplayXLinesButtonPushed, true);
            app.DisplayXLinesButton.Position = [462 233 160 23];
            app.DisplayXLinesButton.Text = 'Display X Lines';

            % Create RearrangeDataButton
            app.RearrangeDataButton = uibutton(app.FrequencyBaseTab, 'push');
            app.RearrangeDataButton.ButtonPushedFcn = createCallbackFcn(app, @RearrangeDataButtonPushed, true);
            app.RearrangeDataButton.BackgroundColor = [1 1 1];
            app.RearrangeDataButton.Position = [104 200 518 23];
            app.RearrangeDataButton.Text = 'Re-arrange Data';

            % Create PlotButton
            app.PlotButton = uibutton(app.FrequencyBaseTab, 'push');
            app.PlotButton.ButtonPushedFcn = createCallbackFcn(app, @PlotButtonPushed, true);
            app.PlotButton.Enable = 'off';
            app.PlotButton.Position = [329 12 295 30];
            app.PlotButton.Text = 'Plot';

            % Create XaxisDataEditFieldLabel
            app.XaxisDataEditFieldLabel = uilabel(app.FrequencyBaseTab);
            app.XaxisDataEditFieldLabel.HorizontalAlignment = 'right';
            app.XaxisDataEditFieldLabel.Position = [26 134 67 22];
            app.XaxisDataEditFieldLabel.Text = 'X-axis Data';

            % Create XaxisDataEditField
            app.XaxisDataEditField = uieditfield(app.FrequencyBaseTab, 'text');
            app.XaxisDataEditField.Position = [104 134 520 22];

            % Create GetDatafromFrequencyTHzEditFieldLabel
            app.GetDatafromFrequencyTHzEditFieldLabel = uilabel(app.FrequencyBaseTab);
            app.GetDatafromFrequencyTHzEditFieldLabel.HorizontalAlignment = 'right';
            app.GetDatafromFrequencyTHzEditFieldLabel.Position = [17 234 171 22];
            app.GetDatafromFrequencyTHzEditFieldLabel.Text = 'Get Data from Frequency(THz)';

            % Create GetDatafromFrequencyTHzEditField
            app.GetDatafromFrequencyTHzEditField = uieditfield(app.FrequencyBaseTab, 'text');
            app.GetDatafromFrequencyTHzEditField.Position = [202 234 252 22];
            app.GetDatafromFrequencyTHzEditField.Value = '1';

            % Create YaxisDataEditField_2Label
            app.YaxisDataEditField_2Label = uilabel(app.FrequencyBaseTab);
            app.YaxisDataEditField_2Label.HorizontalAlignment = 'right';
            app.YaxisDataEditField_2Label.Position = [28 98 67 22];
            app.YaxisDataEditField_2Label.Text = 'Y-axis Data';

            % Create YaxisDataEditField_2
            app.YaxisDataEditField_2 = uieditfield(app.FrequencyBaseTab, 'text');
            app.YaxisDataEditField_2.Position = [104 98 520 22];

            % Create XLabelEditFieldLabel
            app.XLabelEditFieldLabel = uilabel(app.FrequencyBaseTab);
            app.XLabelEditFieldLabel.HorizontalAlignment = 'right';
            app.XLabelEditFieldLabel.Position = [50 63 43 22];
            app.XLabelEditFieldLabel.Text = 'XLabel';

            % Create XLabelEditField
            app.XLabelEditField = uieditfield(app.FrequencyBaseTab, 'text');
            app.XLabelEditField.Position = [103 63 204 22];
            app.XLabelEditField.Value = 'Temperature (K)';

            % Create YLabelEditFieldLabel
            app.YLabelEditFieldLabel = uilabel(app.FrequencyBaseTab);
            app.YLabelEditFieldLabel.HorizontalAlignment = 'right';
            app.YLabelEditFieldLabel.Position = [314 63 43 22];
            app.YLabelEditFieldLabel.Text = 'YLabel';

            % Create YLabelEditField
            app.YLabelEditField = uieditfield(app.FrequencyBaseTab, 'text');
            app.YLabelEditField.Position = [365 63 259 22];

            % Create MeasurementEditFieldLabel
            app.MeasurementEditFieldLabel = uilabel(app.FrequencyBaseTab);
            app.MeasurementEditFieldLabel.HorizontalAlignment = 'right';
            app.MeasurementEditFieldLabel.Position = [19 168 79 23];
            app.MeasurementEditFieldLabel.Text = 'Measurement';

            % Create MeasurementEditField
            app.MeasurementEditField = uieditfield(app.FrequencyBaseTab, 'text');
            app.MeasurementEditField.Position = [104 168 520 22];

            % Create PeakBaseTab
            app.PeakBaseTab = uitab(app.DMTabGroup);
            app.PeakBaseTab.Title = 'Peak Base';

            % Create RearrangeDataButton_2
            app.RearrangeDataButton_2 = uibutton(app.PeakBaseTab, 'push');
            app.RearrangeDataButton_2.ButtonPushedFcn = createCallbackFcn(app, @RearrangeDataButton_2Pushed, true);
            app.RearrangeDataButton_2.BackgroundColor = [1 1 1];
            app.RearrangeDataButton_2.Position = [103 194 471 23];
            app.RearrangeDataButton_2.Text = 'Re-arrange Data';

            % Create PlotButton_2
            app.PlotButton_2 = uibutton(app.PeakBaseTab, 'push');
            app.PlotButton_2.ButtonPushedFcn = createCallbackFcn(app, @PlotButton_2Pushed, true);
            app.PlotButton_2.Position = [329 12 231 30];
            app.PlotButton_2.Text = 'Plot';

            % Create PeakNumSpinnerLabel
            app.PeakNumSpinnerLabel = uilabel(app.PeakBaseTab);
            app.PeakNumSpinnerLabel.HorizontalAlignment = 'right';
            app.PeakNumSpinnerLabel.Position = [444 229 65 22];
            app.PeakNumSpinnerLabel.Text = 'Peak Num.';

            % Create PeakNumSpinner
            app.PeakNumSpinner = uispinner(app.PeakBaseTab);
            app.PeakNumSpinner.Limits = [1 3];
            app.PeakNumSpinner.ValueChangedFcn = createCallbackFcn(app, @PeakNumSpinnerValueChanged, true);
            app.PeakNumSpinner.Position = [514 230 64 22];
            app.PeakNumSpinner.Value = 1;

            % Create LowerLimitTHzEditFieldLabel
            app.LowerLimitTHzEditFieldLabel = uilabel(app.PeakBaseTab);
            app.LowerLimitTHzEditFieldLabel.HorizontalAlignment = 'right';
            app.LowerLimitTHzEditFieldLabel.Position = [267 229 100 22];
            app.LowerLimitTHzEditFieldLabel.Text = 'Lower Limit (THz)';

            % Create LowerLimitTHzEditField
            app.LowerLimitTHzEditField = uieditfield(app.PeakBaseTab, 'numeric');
            app.LowerLimitTHzEditField.Limits = [0 4];
            app.LowerLimitTHzEditField.ValueChangedFcn = createCallbackFcn(app, @LowerLimitTHzEditFieldValueChanged, true);
            app.LowerLimitTHzEditField.Position = [373 229 54 22];
            app.LowerLimitTHzEditField.Value = 1;

            % Create XaxisDataEditField_2Label
            app.XaxisDataEditField_2Label = uilabel(app.PeakBaseTab);
            app.XaxisDataEditField_2Label.HorizontalAlignment = 'right';
            app.XaxisDataEditField_2Label.Position = [25 128 67 22];
            app.XaxisDataEditField_2Label.Text = 'X-axis Data';

            % Create XaxisDataEditField_2
            app.XaxisDataEditField_2 = uieditfield(app.PeakBaseTab, 'text');
            app.XaxisDataEditField_2.Position = [103 128 464 22];

            % Create YaxisDataEditField_3Label
            app.YaxisDataEditField_3Label = uilabel(app.PeakBaseTab);
            app.YaxisDataEditField_3Label.HorizontalAlignment = 'right';
            app.YaxisDataEditField_3Label.Position = [27 92 67 22];
            app.YaxisDataEditField_3Label.Text = 'Y-axis Data';

            % Create YaxisDataEditField_3
            app.YaxisDataEditField_3 = uieditfield(app.PeakBaseTab, 'text');
            app.YaxisDataEditField_3.Position = [103 92 466 22];

            % Create XLabelEditField_2Label
            app.XLabelEditField_2Label = uilabel(app.PeakBaseTab);
            app.XLabelEditField_2Label.HorizontalAlignment = 'right';
            app.XLabelEditField_2Label.Position = [49 57 43 22];
            app.XLabelEditField_2Label.Text = 'XLabel';

            % Create XLabelEditField_2
            app.XLabelEditField_2 = uieditfield(app.PeakBaseTab, 'text');
            app.XLabelEditField_2.Position = [102 57 204 22];
            app.XLabelEditField_2.Value = 'Temperature (K)';

            % Create YLabelEditField_2Label
            app.YLabelEditField_2Label = uilabel(app.PeakBaseTab);
            app.YLabelEditField_2Label.HorizontalAlignment = 'right';
            app.YLabelEditField_2Label.Position = [313 57 43 22];
            app.YLabelEditField_2Label.Text = 'YLabel';

            % Create YLabelEditField_2
            app.YLabelEditField_2 = uieditfield(app.PeakBaseTab, 'text');
            app.YLabelEditField_2.Position = [364 57 204 22];

            % Create MeasurementEditField_2Label
            app.MeasurementEditField_2Label = uilabel(app.PeakBaseTab);
            app.MeasurementEditField_2Label.HorizontalAlignment = 'right';
            app.MeasurementEditField_2Label.Position = [18 162 79 23];
            app.MeasurementEditField_2Label.Text = 'Measurement';

            % Create MeasurementEditField_2
            app.MeasurementEditField_2 = uieditfield(app.PeakBaseTab, 'text');
            app.MeasurementEditField_2.Position = [103 162 256 22];

            % Create MinPeakProminenceEditFieldLabel
            app.MinPeakProminenceEditFieldLabel = uilabel(app.PeakBaseTab);
            app.MinPeakProminenceEditFieldLabel.HorizontalAlignment = 'right';
            app.MinPeakProminenceEditFieldLabel.Position = [45 229 126 22];
            app.MinPeakProminenceEditFieldLabel.Text = 'Min. Peak Prominence';

            % Create MinPeakProminenceEditField
            app.MinPeakProminenceEditField = uieditfield(app.PeakBaseTab, 'numeric');
            app.MinPeakProminenceEditField.Limits = [0 Inf];
            app.MinPeakProminenceEditField.ValueChangedFcn = createCallbackFcn(app, @MinPeakProminenceEditFieldValueChanged, true);
            app.MinPeakProminenceEditField.Position = [178 229 74 22];

            % Create JetColormapButton_DM
            app.JetColormapButton_DM = uibutton(app.DataManipulationDMTab, 'state');
            app.JetColormapButton_DM.ValueChangedFcn = createCallbackFcn(app, @JetColormapButton_DMValueChanged, true);
            app.JetColormapButton_DM.Text = 'Jet Colormap';
            app.JetColormapButton_DM.Position = [559 23 107 26];

            % Create SystemStatusLabel
            app.SystemStatusLabel = uilabel(app.CaTSperUIFigure);
            app.SystemStatusLabel.Position = [967 959 84 22];
            app.SystemStatusLabel.Text = 'System Status';

            % Create DEBUGMsgLabel
            app.DEBUGMsgLabel = uilabel(app.CaTSperUIFigure);
            app.DEBUGMsgLabel.FontWeight = 'bold';
            app.DEBUGMsgLabel.Position = [1060 958 427 22];
            app.DEBUGMsgLabel.Text = '';

            % Create ClearMemoryButton
            app.ClearMemoryButton = uibutton(app.CaTSperUIFigure, 'push');
            app.ClearMemoryButton.ButtonPushedFcn = createCallbackFcn(app, @ClearMemoryButtonPushed, true);
            app.ClearMemoryButton.FontWeight = 'bold';
            app.ClearMemoryButton.Position = [1256 923 112 29];
            app.ClearMemoryButton.Text = 'Clear Memory';

            % Create SaveTDFDDMButton
            app.SaveTDFDDMButton = uibutton(app.CaTSperUIFigure, 'push');
            app.SaveTDFDDMButton.ButtonPushedFcn = createCallbackFcn(app, @SaveTDFDDMButtonPushed, true);
            app.SaveTDFDDMButton.FontWeight = 'bold';
            app.SaveTDFDDMButton.Position = [1374 923 109 29];
            app.SaveTDFDDMButton.Text = 'Save TD/FD/DM';

            % Create CaTSperLabel
            app.CaTSperLabel = uilabel(app.CaTSperUIFigure);
            app.CaTSperLabel.FontSize = 37;
            app.CaTSperLabel.FontWeight = 'bold';
            app.CaTSperLabel.FontAngle = 'italic';
            app.CaTSperLabel.Position = [81 923 158 48];
            app.CaTSperLabel.Text = 'CaTSper';

            % Create ImportTHzFilesButton
            app.ImportTHzFilesButton = uibutton(app.CaTSperUIFigure, 'push');
            app.ImportTHzFilesButton.ButtonPushedFcn = createCallbackFcn(app, @ImportTHzFilesButtonPushed, true);
            app.ImportTHzFilesButton.BackgroundColor = [1 1 1];
            app.ImportTHzFilesButton.FontSize = 13;
            app.ImportTHzFilesButton.FontWeight = 'bold';
            app.ImportTHzFilesButton.Position = [251 923 135 29];
            app.ImportTHzFilesButton.Text = 'Import THz Files';

            % Create ProjectsEditField
            app.ProjectsEditField = uieditfield(app.CaTSperUIFigure, 'text');
            app.ProjectsEditField.FontWeight = 'bold';
            app.ProjectsEditField.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ProjectsEditField.Position = [396 925 722 25];

            % Create Image
            app.Image = uiimage(app.CaTSperUIFigure);
            app.Image.Position = [24 927 58 58];
            app.Image.ImageSource = fullfile(pathToMLAPP, 'dotTHz_logo.png');

            % Create DeployButton
            app.DeployButton = uibutton(app.CaTSperUIFigure, 'push');
            app.DeployButton.ButtonPushedFcn = createCallbackFcn(app, @DeployButtonPushed, true);
            app.DeployButton.BackgroundColor = [1 1 1];
            app.DeployButton.FontSize = 13;
            app.DeployButton.FontWeight = 'bold';
            app.DeployButton.Position = [1129 923 120 29];
            app.DeployButton.Text = 'Deploy';

            % Show the figure after all components are created
            app.CaTSperUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = CaTSper_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.CaTSperUIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.CaTSperUIFigure)
        end
    end
end