classdef AcquisitionDialog_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        AcquisitionDialogUIFigure       matlab.ui.Figure
        Image                           matlab.ui.control.Image
        SystemReadyLampLabel            matlab.ui.control.Label
        SystemReadyLamp                 matlab.ui.control.Lamp
        MeasurementDetailsPanel         matlab.ui.container.Panel
        STOPButton                      matlab.ui.control.Button
        ACQUIREButton                   matlab.ui.control.Button
        NumericValueEditField_2         matlab.ui.control.NumericEditField
        NumericValueEditFieldLabel      matlab.ui.control.Label
        Metadata2EditField              matlab.ui.control.EditField
        Metadata2EditFieldLabel         matlab.ui.control.Label
        NumericValueEditField_1         matlab.ui.control.NumericEditField
        NumericValueEditField_2Label    matlab.ui.control.Label
        Metadata1EditField              matlab.ui.control.EditField
        Metadata1EditFieldLabel         matlab.ui.control.Label
        DescriptionEditField            matlab.ui.control.EditField
        DescriptionEditFieldLabel       matlab.ui.control.Label
        ModeDropDown                    matlab.ui.control.DropDown
        ModeDropDownLabel               matlab.ui.control.Label
        SampleEditField                 matlab.ui.control.EditField
        SampleEditFieldLabel            matlab.ui.control.Label
        ReferenceAcquisitionPanel       matlab.ui.container.Panel
        RemoveReferenceButton           matlab.ui.control.Button
        ReferenceButton                 matlab.ui.control.Button
        ReferenceLamp                   matlab.ui.control.Lamp
        ReferenceLampLabel              matlab.ui.control.Label
        RemoveBaselineButton            matlab.ui.control.Button
        BaselineButton                  matlab.ui.control.Button
        BaselineLamp                    matlab.ui.control.Lamp
        BaselineLampLabel               matlab.ui.control.Label
        SubtractBaselineCheckBox        matlab.ui.control.CheckBox
        MeasurementSettingsPanel        matlab.ui.container.Panel
        TimesecEditField                matlab.ui.control.NumericEditField
        TimesecEditFieldLabel           matlab.ui.control.Label
        AverageNumberEditField          matlab.ui.control.NumericEditField
        IntervalsecLabel                matlab.ui.control.Label
        MeasurementCountEditField       matlab.ui.control.NumericEditField
        MeasurementCountEditFieldLabel  matlab.ui.control.Label
        MultiscanSwitch                 matlab.ui.control.Switch
        MultiscanSwitchLabel            matlab.ui.control.Label
        StatusEditField                 matlab.ui.control.EditField
        StatusButton                    matlab.ui.control.Button
    end

    
    properties (Access = private)
        MainApp % Main app
        numAcq % total number of acquisitions
        TecllNew % Acquistion table cell
        matBaseline % Baseline matrix [time stamps; amplitudes]
        matReference % Reference matrix [time stamps; amplitudes]
        processStop % Is Stop-button pressed?
    end
    
    methods (Access = private)
        
        function updateMain(app)
            % Call main app's public function
            updateTableRemote(app.MainApp,app.TecllNew);
        end
      
        function updateTecllNew(app,TcellNew)
            TecllNew = app.TecllNew;
            TecllNew = [TecllNew, TcellNew];
            app.TecllNew = TecllNew;
        end

        function addMeasurement(app)
                numAcq = app.numAcq;
                fig = app.AcquisitionDialogUIFigure;
                singleOption = false;
                curCol = size(app.TecllNew,2);

                measMat = readWaveform(app,singleOption);

                if isempty(measMat)                    
                    return;
                end
                
                timeAxis = table2array(measMat(1,2:end));
                eAmp = table2array(measMat(2:end,2:end));
                timeStamps = table2array(measMat(2:end,1));
                clear("measMat");

                measNum = size(eAmp,1);
                TcellNew = cell(22,measNum);
                numAcq = numAcq + measNum;
                digitNum = ceil(log10(measNum+1));
                digitNumFormat = strcat('%0',num2str(digitNum),'d');

                for idx = 1:measNum
                    sampleName = app.SampleEditField.Value;
                    description = app.DescriptionEditField.Value;
                    description = strcat(sprintf(digitNumFormat,idx),'_',description);
                    mode = app.ModeDropDown.Value;
                    timeStamp = timeStamps(idx);
                    datetimeValue = datetime(timeStamp, 'ConvertFrom', 'posixtime');
                    datetimeValue.Format = 'yyyy-MM-dd HH:mm:ss.SSS';
                    datetimeValue = char(datetimeValue);

                    md1Des = app.Metadata1EditField.Value;
                    md2Des = app.Metadata2EditField.Value;
                    md1Val = app.NumericValueEditField_1.Value;
                    md2Val = app.NumericValueEditField_2.Value;
                    md3Val = [];
                    md4Val = [];
                    md5Val = [];


                    if ~isempty(md1Des)
                        mdDescription = md1Des;
                    else
                        mdDescription = [];
                    end

                    if ~isempty(md2Des)
                        mdDescription = strcat(mdDescription,',',md2Des);
                    end


                    if isempty(md1Val)
                        md1Val = [];
                    end

                    if isempty(md2Val)
                        md2Val = [];
                    end

                    matBaseline = app.matBaseline;
                    matRefernece = app.matReference;

                    % Baseline subtraction check
                    if app.SubtractBaselineCheckBox.Value

                        if isempty(matBaseline)
                            uialert(fig,'No valid baseline','Acquisition aborted');
                            return;
                        end

                        if ~isempty(matRefernece)
                            try
                                matRefernece(2,:) = matRefernece(2,:) - matBaseline(2,:);
                            catch
                                uialert(fig,'Inconsist Waveform length','Baseline subtraction aborted');
                                return;
                            end
                        end

                        if ~isempty(eAmp)
                            try
                                eAmp(idx,:) = eAmp(idx,:) - matBaseline(2,:);
                            catch
                                uialert(fig,'Inconsist Waveform length','Baseline subtraction aborted');
                                return;
                            end
                        end                    
                    end

                    dsDescription = "Sample"; % dataset description
                    ds1 = [timeAxis;eAmp(idx,:)];

                    if ~isempty(matRefernece)
                        ds2 = [matRefernece(1,:);matRefernece(2,:)];
                        dsDescription = strcat(dsDescription,',',"Reference");
                    else
                        ds2 = [];
                    end

                    ds3 = [];
                    ds4 = [];

                    TcellNew{1,idx} = curCol+idx;
                    TcellNew{2,idx} = sampleName;
                    TcellNew{3,idx} = description;
                    TcellNew{4,idx} = 0; % Instrument profile
                    TcellNew{5,idx} = 0; % User profile
                    TcellNew{6,idx} = datetimeValue; % measurement start time
                    TcellNew{7,idx} = mode; % THz-TDS/THz-Imaging/Transmission/Reflection
                    TcellNew{8,idx} = []; % coordinates

                    TcellNew{9,idx} = mdDescription; % metadata description
                    TcellNew{10,idx} = md1Val;
                    TcellNew{11,idx} = md2Val;
                    TcellNew{12,idx} = md3Val; 
                    TcellNew{13,idx} = md4Val; 
                    TcellNew{14,idx} = md5Val; 

                    TcellNew{15,idx} = []; % not used
                    TcellNew{16,idx} = []; % not used
                    TcellNew{17,idx} = []; % not used

                    TcellNew{18,idx} = dsDescription; % dataset description
                    TcellNew{19,idx} = ds1;
                    TcellNew{20,idx} = ds2;
                    TcellNew{21,idx} = ds3; 
                    TcellNew{22,idx} = ds4; 
                end

                updateTecllNew(app,TcellNew);
                app.numAcq = numAcq;
        end
        
        function measMat = readWaveform(app,singleOption)
            measAverage = app.AverageNumberEditField.Value;
            measTime = app.TimesecEditField.Value;
            measCount = app.MeasurementCountEditField.Value;
            measMode = app.MultiscanSwitch.Value;
            pythonScript = 'getPulse_ml.py';
            progressFile = 'progress.txt';
            delete(progressFile);
            measurementFile = 'measurements.csv';
            runPython = true;
            measMat =[];
            
            if singleOption
                command = sprintf('python %s --average %i', pythonScript, measAverage);
                mode = "Single-measurement";
            else
                if isequal(measMode,'count')
                    command = sprintf('python %s --average %i --count %i &', pythonScript, measAverage, measCount);
                else
                    command = sprintf('python %s --average %i --time %i &', pythonScript, measAverage, measTime);
                end
                mode = "Multi-measurement";
            end

            msg = strcat(mode," started");
            app.StatusEditField.Value = msg;
            drawnow

            system(command);
            pause(0.5);
            
            while runPython
                pause(0.5);
                
                try
                    msg = fileread(progressFile);
                catch
                    msg = "Python run error!";
                    runPython = false;
                end

                if app.processStop
                    msg = "Measurement aborted!";
                    runPython = false;
                end

                if contains(msg,'done')
                    msg = "Measurement done!";
                    runPython = false;
                    measMat = readtable(measurementFile);
                end

                app.StatusEditField.Value = msg;
                drawnow
            end

        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, mainapp, Tcell)
            % Store main app object
            app.MainApp = mainapp;
            app.TecllNew = Tcell;
            app.numAcq = 0;
        end

        % Close request function: AcquisitionDialogUIFigure
        function AcquisitionDialogUIFigureCloseRequest(app, event)
            % Enable Acquire button in main app, if the app is still open
            if isvalid(app.MainApp)
                app.MainApp.AcquirefromTeraSmartButton.Enable = "on";
                app.MainApp.DeployDataButton.Enable = "on";
                app.MainApp.ClearMemoryButton.Enable = "on";
            end

            % Delete the dialog box
            delete(app)            
        end

        % Button pushed function: ACQUIREButton
        function ACQUIREButtonPushed(app, event)
            app.SystemReadyLamp.Color = [0.85,0.33,0.10];
            app.SystemReadyLampLabel.Text = "Scaning...";
            app.processStop = false;
            fig = app.AcquisitionDialogUIFigure;
            drawnow

            addMeasurement(app);
            app.SystemReadyLamp.Color = "Green";
            app.SystemReadyLampLabel.Text = "Ready";
            drawnow         

            % Update Main App table
            updateTableRemote(app.MainApp,app.TecllNew);
        end

        % Button pushed function: STOPButton
        function STOPButtonPushed(app, event)
            app.CurrentCountEditField.Value = 0;
            app.MeasurementCountEditField.Value = 1;
            app.TimesecEditField.Value = 0;
            app.TimeLeftsecEditField.Value = 0;
            app.processStop = true;
        end

        % Button pushed function: BaselineButton
        function BaselineButtonPushed(app, event)
            single = true;
            try
                measMat = readWaveform(app,single);
                timeAxis = table2array(measMat(1,2:end));
                eAmp = table2array(measMat(2,2:end));
                app.matBaseline = [timeAxis;eAmp];
            catch
                app.BaselineLamp.Color = [0.85,0.33,0.10];
                return
            end

            app.BaselineLamp.Color = "Green";

        end

        % Button pushed function: ReferenceButton
        function ReferenceButtonPushed(app, event)
            single = true;
            try
                measMat = readWaveform(app,single);
                timeAxis = table2array(measMat(1,2:end));
                eAmp = table2array(measMat(2,2:end));
                app.matReference = [timeAxis;eAmp];
            catch
                app.ReferenceLamp.Color = [0.85,0.33,0.10];
                return
            end

            app.ReferenceLamp.Color = "Green";
        end

        % Button pushed function: RemoveBaselineButton
        function RemoveBaselineButtonPushed(app, event)
            app.matBaseline = [];
            app.BaselineLamp.Color = [0.85,0.33,0.10];
        end

        % Button pushed function: RemoveReferenceButton
        function RemoveReferenceButtonPushed(app, event)
            app.matReference = [];
            app.ReferenceLamp.Color = [0.85,0.33,0.10];
        end

        % Value changed function: MultiscanSwitch
        function MultiscanSwitchValueChanged(app, event)
            value = app.MultiscanSwitch.Value;

            if isequal(value,'count')
                app.TimesecEditField.Editable = "off";
                app.MeasurementCountEditField.Editable = "on";
                app.MeasurementCountEditField.BackgroundColor = [0.302 0.7451 0.9333];
                app.TimesecEditField.BackgroundColor = [1,1,1];
            else % time mode
                app.TimesecEditField.Editable = "on";
                app.TimesecEditField.BackgroundColor = [0.302 0.7451 0.9333];
                app.MeasurementCountEditField.BackgroundColor = [1,1,1];
                app.MeasurementCountEditField.Editable = "off";

            end

            app.TimesecEditField.Value = 0;
            app.MeasurementCountEditField.Value = 1;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create AcquisitionDialogUIFigure and hide until all components are created
            app.AcquisitionDialogUIFigure = uifigure('Visible', 'off');
            app.AcquisitionDialogUIFigure.Position = [100 100 437 537];
            app.AcquisitionDialogUIFigure.Name = 'TeraSmart Control';
            app.AcquisitionDialogUIFigure.Icon = fullfile(pathToMLAPP, 'CaT_logo.png');
            app.AcquisitionDialogUIFigure.CloseRequestFcn = createCallbackFcn(app, @AcquisitionDialogUIFigureCloseRequest, true);

            % Create StatusButton
            app.StatusButton = uibutton(app.AcquisitionDialogUIFigure, 'push');
            app.StatusButton.FontWeight = 'bold';
            app.StatusButton.Position = [17 500 59 27];
            app.StatusButton.Text = 'Status';

            % Create StatusEditField
            app.StatusEditField = uieditfield(app.AcquisitionDialogUIFigure, 'text');
            app.StatusEditField.Editable = 'off';
            app.StatusEditField.BackgroundColor = [0.9412 0.9412 0.9412];
            app.StatusEditField.Position = [86 501 330 26];

            % Create MeasurementSettingsPanel
            app.MeasurementSettingsPanel = uipanel(app.AcquisitionDialogUIFigure);
            app.MeasurementSettingsPanel.Title = 'Measurement Settings';
            app.MeasurementSettingsPanel.FontWeight = 'bold';
            app.MeasurementSettingsPanel.Position = [15 403 409 88];

            % Create MultiscanSwitchLabel
            app.MultiscanSwitchLabel = uilabel(app.MeasurementSettingsPanel);
            app.MultiscanSwitchLabel.HorizontalAlignment = 'center';
            app.MultiscanSwitchLabel.FontWeight = 'bold';
            app.MultiscanSwitchLabel.Position = [5 37 64 22];
            app.MultiscanSwitchLabel.Text = 'Multi-scan';

            % Create MultiscanSwitch
            app.MultiscanSwitch = uiswitch(app.MeasurementSettingsPanel, 'slider');
            app.MultiscanSwitch.Items = {'count', 'time'};
            app.MultiscanSwitch.ValueChangedFcn = createCallbackFcn(app, @MultiscanSwitchValueChanged, true);
            app.MultiscanSwitch.FontWeight = 'bold';
            app.MultiscanSwitch.Position = [116 37 43 19];
            app.MultiscanSwitch.Value = 'count';

            % Create MeasurementCountEditFieldLabel
            app.MeasurementCountEditFieldLabel = uilabel(app.MeasurementSettingsPanel);
            app.MeasurementCountEditFieldLabel.HorizontalAlignment = 'right';
            app.MeasurementCountEditFieldLabel.FontWeight = 'bold';
            app.MeasurementCountEditFieldLabel.Position = [206 36 120 22];
            app.MeasurementCountEditFieldLabel.Text = 'Measurement Count';

            % Create MeasurementCountEditField
            app.MeasurementCountEditField = uieditfield(app.MeasurementSettingsPanel, 'numeric');
            app.MeasurementCountEditField.Limits = [0 100000];
            app.MeasurementCountEditField.ValueDisplayFormat = '%.0f';
            app.MeasurementCountEditField.FontWeight = 'bold';
            app.MeasurementCountEditField.BackgroundColor = [0.302 0.7451 0.9333];
            app.MeasurementCountEditField.Position = [332 36 67 22];
            app.MeasurementCountEditField.Value = 1;

            % Create IntervalsecLabel
            app.IntervalsecLabel = uilabel(app.MeasurementSettingsPanel);
            app.IntervalsecLabel.HorizontalAlignment = 'right';
            app.IntervalsecLabel.FontWeight = 'bold';
            app.IntervalsecLabel.Position = [2 8 101 22];
            app.IntervalsecLabel.Text = 'Average Number';

            % Create AverageNumberEditField
            app.AverageNumberEditField = uieditfield(app.MeasurementSettingsPanel, 'numeric');
            app.AverageNumberEditField.Limits = [0 10000];
            app.AverageNumberEditField.ValueDisplayFormat = '%.0f';
            app.AverageNumberEditField.FontWeight = 'bold';
            app.AverageNumberEditField.BackgroundColor = [0.9294 0.6941 0.1255];
            app.AverageNumberEditField.Position = [110 8 66 22];
            app.AverageNumberEditField.Value = 1;

            % Create TimesecEditFieldLabel
            app.TimesecEditFieldLabel = uilabel(app.MeasurementSettingsPanel);
            app.TimesecEditFieldLabel.HorizontalAlignment = 'right';
            app.TimesecEditFieldLabel.FontWeight = 'bold';
            app.TimesecEditFieldLabel.Position = [207 8 64 22];
            app.TimesecEditFieldLabel.Text = 'Time (sec)';

            % Create TimesecEditField
            app.TimesecEditField = uieditfield(app.MeasurementSettingsPanel, 'numeric');
            app.TimesecEditField.Limits = [0 100000];
            app.TimesecEditField.ValueDisplayFormat = '%.0f';
            app.TimesecEditField.Editable = 'off';
            app.TimesecEditField.FontWeight = 'bold';
            app.TimesecEditField.Position = [332 8 67 22];

            % Create ReferenceAcquisitionPanel
            app.ReferenceAcquisitionPanel = uipanel(app.AcquisitionDialogUIFigure);
            app.ReferenceAcquisitionPanel.Title = 'Reference Acquisition';
            app.ReferenceAcquisitionPanel.FontWeight = 'bold';
            app.ReferenceAcquisitionPanel.FontSize = 13;
            app.ReferenceAcquisitionPanel.Position = [15 270 409 126];

            % Create SubtractBaselineCheckBox
            app.SubtractBaselineCheckBox = uicheckbox(app.ReferenceAcquisitionPanel);
            app.SubtractBaselineCheckBox.Text = 'Subtract Baseline';
            app.SubtractBaselineCheckBox.FontWeight = 'bold';
            app.SubtractBaselineCheckBox.Position = [15 76 123 22];

            % Create BaselineLampLabel
            app.BaselineLampLabel = uilabel(app.ReferenceAcquisitionPanel);
            app.BaselineLampLabel.HorizontalAlignment = 'right';
            app.BaselineLampLabel.Position = [10 46 51 22];
            app.BaselineLampLabel.Text = 'Baseline';

            % Create BaselineLamp
            app.BaselineLamp = uilamp(app.ReferenceAcquisitionPanel);
            app.BaselineLamp.Position = [70 46 20 20];
            app.BaselineLamp.Color = [0.851 0.3294 0.102];

            % Create BaselineButton
            app.BaselineButton = uibutton(app.ReferenceAcquisitionPanel, 'push');
            app.BaselineButton.ButtonPushedFcn = createCallbackFcn(app, @BaselineButtonPushed, true);
            app.BaselineButton.FontWeight = 'bold';
            app.BaselineButton.Position = [101 43 135 27];
            app.BaselineButton.Text = 'Baseline';

            % Create RemoveBaselineButton
            app.RemoveBaselineButton = uibutton(app.ReferenceAcquisitionPanel, 'push');
            app.RemoveBaselineButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveBaselineButtonPushed, true);
            app.RemoveBaselineButton.FontWeight = 'bold';
            app.RemoveBaselineButton.Position = [245 43 156 27];
            app.RemoveBaselineButton.Text = 'Remove Baseline';

            % Create ReferenceLampLabel
            app.ReferenceLampLabel = uilabel(app.ReferenceAcquisitionPanel);
            app.ReferenceLampLabel.HorizontalAlignment = 'right';
            app.ReferenceLampLabel.Position = [7 12 60 22];
            app.ReferenceLampLabel.Text = 'Reference';

            % Create ReferenceLamp
            app.ReferenceLamp = uilamp(app.ReferenceAcquisitionPanel);
            app.ReferenceLamp.Position = [70 12 20 20];
            app.ReferenceLamp.Color = [0.851 0.3255 0.098];

            % Create ReferenceButton
            app.ReferenceButton = uibutton(app.ReferenceAcquisitionPanel, 'push');
            app.ReferenceButton.ButtonPushedFcn = createCallbackFcn(app, @ReferenceButtonPushed, true);
            app.ReferenceButton.FontWeight = 'bold';
            app.ReferenceButton.Position = [101 9 135 27];
            app.ReferenceButton.Text = 'Reference';

            % Create RemoveReferenceButton
            app.RemoveReferenceButton = uibutton(app.ReferenceAcquisitionPanel, 'push');
            app.RemoveReferenceButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveReferenceButtonPushed, true);
            app.RemoveReferenceButton.FontWeight = 'bold';
            app.RemoveReferenceButton.Position = [245 9 155 27];
            app.RemoveReferenceButton.Text = 'Remove Reference';

            % Create MeasurementDetailsPanel
            app.MeasurementDetailsPanel = uipanel(app.AcquisitionDialogUIFigure);
            app.MeasurementDetailsPanel.Title = 'Measurement Details';
            app.MeasurementDetailsPanel.FontWeight = 'bold';
            app.MeasurementDetailsPanel.FontSize = 13;
            app.MeasurementDetailsPanel.Position = [16 48 409 212];

            % Create SampleEditFieldLabel
            app.SampleEditFieldLabel = uilabel(app.MeasurementDetailsPanel);
            app.SampleEditFieldLabel.HorizontalAlignment = 'right';
            app.SampleEditFieldLabel.Position = [9 155 46 22];
            app.SampleEditFieldLabel.Text = 'Sample';

            % Create SampleEditField
            app.SampleEditField = uieditfield(app.MeasurementDetailsPanel, 'text');
            app.SampleEditField.Position = [82 155 163 22];

            % Create ModeDropDownLabel
            app.ModeDropDownLabel = uilabel(app.MeasurementDetailsPanel);
            app.ModeDropDownLabel.HorizontalAlignment = 'right';
            app.ModeDropDownLabel.Position = [259 155 35 22];
            app.ModeDropDownLabel.Text = 'Mode';

            % Create ModeDropDown
            app.ModeDropDown = uidropdown(app.MeasurementDetailsPanel);
            app.ModeDropDown.Items = {'TX', 'RX'};
            app.ModeDropDown.Position = [306 155 83 22];
            app.ModeDropDown.Value = 'TX';

            % Create DescriptionEditFieldLabel
            app.DescriptionEditFieldLabel = uilabel(app.MeasurementDetailsPanel);
            app.DescriptionEditFieldLabel.HorizontalAlignment = 'right';
            app.DescriptionEditFieldLabel.Position = [9 123 65 22];
            app.DescriptionEditFieldLabel.Text = 'Description';

            % Create DescriptionEditField
            app.DescriptionEditField = uieditfield(app.MeasurementDetailsPanel, 'text');
            app.DescriptionEditField.Position = [81 123 310 22];

            % Create Metadata1EditFieldLabel
            app.Metadata1EditFieldLabel = uilabel(app.MeasurementDetailsPanel);
            app.Metadata1EditFieldLabel.HorizontalAlignment = 'right';
            app.Metadata1EditFieldLabel.Position = [9 91 65 22];
            app.Metadata1EditFieldLabel.Text = 'Metadata 1';

            % Create Metadata1EditField
            app.Metadata1EditField = uieditfield(app.MeasurementDetailsPanel, 'text');
            app.Metadata1EditField.Position = [82 91 142 22];

            % Create NumericValueEditField_2Label
            app.NumericValueEditField_2Label = uilabel(app.MeasurementDetailsPanel);
            app.NumericValueEditField_2Label.HorizontalAlignment = 'right';
            app.NumericValueEditField_2Label.Position = [227 91 83 22];
            app.NumericValueEditField_2Label.Text = 'Numeric Value';

            % Create NumericValueEditField_1
            app.NumericValueEditField_1 = uieditfield(app.MeasurementDetailsPanel, 'numeric');
            app.NumericValueEditField_1.Position = [318 91 70 22];

            % Create Metadata2EditFieldLabel
            app.Metadata2EditFieldLabel = uilabel(app.MeasurementDetailsPanel);
            app.Metadata2EditFieldLabel.HorizontalAlignment = 'right';
            app.Metadata2EditFieldLabel.Position = [9 60 65 22];
            app.Metadata2EditFieldLabel.Text = 'Metadata 2';

            % Create Metadata2EditField
            app.Metadata2EditField = uieditfield(app.MeasurementDetailsPanel, 'text');
            app.Metadata2EditField.Position = [82 60 142 22];

            % Create NumericValueEditFieldLabel
            app.NumericValueEditFieldLabel = uilabel(app.MeasurementDetailsPanel);
            app.NumericValueEditFieldLabel.HorizontalAlignment = 'right';
            app.NumericValueEditFieldLabel.Position = [228 60 83 22];
            app.NumericValueEditFieldLabel.Text = 'Numeric Value';

            % Create NumericValueEditField_2
            app.NumericValueEditField_2 = uieditfield(app.MeasurementDetailsPanel, 'numeric');
            app.NumericValueEditField_2.Position = [318 60 70 22];

            % Create ACQUIREButton
            app.ACQUIREButton = uibutton(app.MeasurementDetailsPanel, 'push');
            app.ACQUIREButton.ButtonPushedFcn = createCallbackFcn(app, @ACQUIREButtonPushed, true);
            app.ACQUIREButton.BackgroundColor = [1 1 1];
            app.ACQUIREButton.FontSize = 14;
            app.ACQUIREButton.FontWeight = 'bold';
            app.ACQUIREButton.FontColor = [0 0.4471 0.7412];
            app.ACQUIREButton.Position = [17 12 185 33];
            app.ACQUIREButton.Text = 'ACQUIRE';

            % Create STOPButton
            app.STOPButton = uibutton(app.MeasurementDetailsPanel, 'push');
            app.STOPButton.ButtonPushedFcn = createCallbackFcn(app, @STOPButtonPushed, true);
            app.STOPButton.BackgroundColor = [1 1 1];
            app.STOPButton.FontSize = 14;
            app.STOPButton.FontWeight = 'bold';
            app.STOPButton.FontColor = [0.851 0.3255 0.098];
            app.STOPButton.Position = [213 12 185 33];
            app.STOPButton.Text = 'STOP';

            % Create SystemReadyLamp
            app.SystemReadyLamp = uilamp(app.AcquisitionDialogUIFigure);
            app.SystemReadyLamp.Position = [31 15 20 20];

            % Create SystemReadyLampLabel
            app.SystemReadyLampLabel = uilabel(app.AcquisitionDialogUIFigure);
            app.SystemReadyLampLabel.Position = [60 13 83 22];
            app.SystemReadyLampLabel.Text = 'System Ready';

            % Create Image
            app.Image = uiimage(app.AcquisitionDialogUIFigure);
            app.Image.Position = [252 5 167 38];
            app.Image.ImageSource = fullfile(pathToMLAPP, 'MENLO-Logo.png');

            % Show the figure after all components are created
            app.AcquisitionDialogUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = AcquisitionDialog_exported(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.AcquisitionDialogUIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.AcquisitionDialogUIFigure)
        end
    end
end