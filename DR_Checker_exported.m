classdef DR_Checker_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        DynamicRangeCheckerUIFigure     matlab.ui.Figure
        Image                           matlab.ui.control.Image
        SampleIDEditField               matlab.ui.control.EditField
        SampleIDEditFieldLabel          matlab.ui.control.Label
        MeasurementTypeButtonGroup      matlab.ui.container.ButtonGroup
        ReflectionButton                matlab.ui.control.RadioButton
        TransmissionButton              matlab.ui.control.RadioButton
        SampleInformationPanel          matlab.ui.container.Panel
        AbsorptionYaxisfittingCheckBox  matlab.ui.control.CheckBox
        UpperlimitFrequencySlider       matlab.ui.control.Slider
        UpperlimitFrequencySliderLabel  matlab.ui.control.Label
        FrequencyLimitTHzEditField      matlab.ui.control.NumericEditField
        FrequencyLimitTHzEditFieldLabel  matlab.ui.control.Label
        ThicknessmmEditField            matlab.ui.control.NumericEditField
        ThicknessmmEditFieldLabel       matlab.ui.control.Label
        CutoffSettingPanel              matlab.ui.container.Panel
        CutoffFrequencySlider           matlab.ui.control.Slider
        CutoffFrequencyLabel_2          matlab.ui.control.Label
        NoiseFloorEditField             matlab.ui.control.NumericEditField
        NoiseFloorEditFieldLabel        matlab.ui.control.Label
        CutoffFrequencyEditField        matlab.ui.control.NumericEditField
        CutoffFrequencyLabel            matlab.ui.control.Label
        DynamicRangeCheckerLabel        matlab.ui.control.Label
        UIAxes2                         matlab.ui.control.UIAxes
        UIAxes1                         matlab.ui.control.UIAxes
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % This in-line code annotation of DR_Checker v1.0 aims to provide a detailed explanation of the
    % script, function and processes of the DR_Checker app
    % Definitions of parameters are not annotated for conciseness.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    properties (Access = private)
        CallingApp % Main app object
    end
    
    properties (Access = public)
        refF
        refE
        samA
        n_eff
    end
    
    methods (Access = private)
        
        % findNF defines the noise floor as the reference amplitude
        % at the first frequency greater than the specified cutoff
        % frequency, and then runs the functions plotAx1 and plotAx2
        function findNF(app)
            % find the noise floor for the given reference data
            
            % extract reference frequency, reference frequency domain amplitude and
            % sample absorption coefficient
            refF = app.refF;
            refE = app.refE;
            samA = app.samA;

            lbFreq = round(min(refF)/10^12*100)/100;
            ubFreq = round(max(refF)/10^12*100)/100;

            app.CutoffFrequencySlider.Limits = [lbFreq ubFreq];
            app.CutoffFrequencyEditField.Limits = [lbFreq ubFreq];
            app.UpperlimitFrequencySlider.Limits = [lbFreq ubFreq];
            app.FrequencyLimitTHzEditField.Limits = [lbFreq ubFreq];

            % extract the cutoff frequency value as indicated from the slider
            cutoffF = app.CutoffFrequencySlider.Value; % THz
            % convert the value into units of Hz
            cutoffF = cutoffF * 10^12;
            
            % find the index of the first reference freqency that has a
            % value greater than the cutoff frequency
            cfLoc = find(refF>cutoffF,1);
            
            % if thickness value is not available or equals to zero, display warning message
            if isequal(app.ThicknessmmEditField.Value,0)
                    fig = app.DynamicRangeCheckerUIFigure;
                    ID = app.SampleIDEditField.Value;
                    msg = strcat("[",(ID),"]"," doesn't have thickness information.");
                    uialert(fig,(msg),'Invalid Thickness');
                    return;
                end
            
            % if there is no frequency greater than the cutoff frequency,
            % display warning message
            if isempty(cfLoc)
                cutoffF = refF(end);
                fig = app.DynamicRangeCheckerUIFigure;
                maxF = num2str(cutoffF*10^-12,'%.2f');
                msg = strcat("The cutoff frquency data is not defined."," Max. Freq.:",(maxF));
                uialert(fig,(msg),'Invalid Data');
                return;
            end
            
%             noFl = mean(refE(cfLoc:end));
            % find the reference amplitude at the first
            % frequency greater than the cutoff frequency
            noFl = refE(cfLoc);
            
            % define the above reference amplitude as the noise floor
            app.NoiseFloorEditField.Value = noFl;   
            
            % run the functions plotAx1 and plotAx2
            plotAx1(app);
            plotAx2(app);
        end
        
        % plotAx1 determines the normalised reference frequency domain
        % amplitude, and plots it against frequency with the cutoff frequency
        % indicated
        function plotAx1(app)
            % extract values
            ax = app.UIAxes1;
            noFl = app.NoiseFloorEditField.Value;
            cutoffF = app.CutoffFrequencyEditField.Value;
            % convert frequency into units of terahertz            
            refF = app.refF.* 10^-12;
            % cutoff frequency is already in units of terahertz and hence
            % the following line of code
            cutoffF = cutoffF;
            % normalise the reference amplitude with the noise floor
            refE = app.refE./noFl;
            
            % plots the normalised reference amplitude against
            % frequency, the cutoff frequency is also plotted for
            % indication purposes
            plot(ax,refF,refE,"LineWidth",1);
            hold(ax,"on")
            xline(ax,cutoffF,'--r',{'Cutoff Frequency',(cutoffF)});
            yline(ax,1,'--b',{'Noise Floor'});
            hold(ax,"off")
            xlim(ax,"auto");
            
        end
        
        % plotAx2 determines the upper limit of detectable absorption,
        % plots it and the sample absorption coefficient against frequency,
        % and also the specified upper limit frequency
        function plotAx2(app)
            % extract values
            samA = app.samA;
            limitFreq = app.FrequencyLimitTHzEditField.Value;
            noFl = app.NoiseFloorEditField.Value;
            thickness = app.ThicknessmmEditField.Value;
            % convert frequency into units of terahertz
            refF = app.refF.*10^-12;
            % normalise the reference amplitude values with the noise floor
            refE = app.refE./noFl;
            
            % definitions
            c = 299792458; % the speed of light
            n_medium = 1; % refractive index of medium
            n_reference = 1; % refractive indx of the reference
            n_sample = app.n_eff;
               
            % calculate the maximum absorption coefficient
            % the logarithm base is e.
            % this is calculated by referencing equation 3 from Jepsen and Fischer (DOI: 10.1364/ol.30.000029)
            % the calculation is broken down into steps
            ref_factor = 4.*n_medium.*n_reference./((n_medium + n_reference).^2);
            sam_factor = 4.*n_medium.*n_sample./((n_medium + n_sample).^2);
            scaleFactor = ref_factor./sam_factor;
                
            scaledRefDRMag = refE.*scaleFactor;
                
            % upper limit of detectable absorption
            DRlimit = 2./(thickness*0.1).*log(scaledRefDRMag);
            
            ax = app.UIAxes2;

            xlim(ax,"auto");
            
            % if the box for the absorption spectrum y-axis fitting
            % is checked, use auto generated y-axis limits
            if app.AbsorptionYaxisfittingCheckBox.Value
                ylim(ax,"auto");
            % if the box for the absorption spectrum y-axis fitting
            % is unchecked, use the default y-axis limits
            else
                ylim(ax,[-100,500]);
            end

            % deleting graphics objects, that are specified by 'ax', from the axes
            cla(ax)
            hold(ax,"on")
            
            % plot the upper limit of detectable absorption against frequency
            plot(ax,refF,DRlimit,'-','LineWidth',1);
            % plot the sample absorption coefficients against frequency
            plot(ax,refF,samA,'LineWidth',1);
            % plot the upper limit frequency
            xline(ax,limitFreq,'--r',{'Upper-limit Frequency',(limitFreq)});
            hold(ax,"off")
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, mainapp, refF, refE, samA, n_eff, thickness, sampleID)
            % startupFcn extracts values for running the app, checks the
            % measurement type and runs the findNF function

            %Store main app object
            app.CallingApp = mainapp;
            app.refF = refF;
            app.refE = refE;
            app.samA = samA;
            app.n_eff = n_eff;
            cutoffF = app.CutoffFrequencySlider.Value;
            limitFreq = app.UpperlimitFrequencySlider.Value;
                   
            % extract values     
            app.ThicknessmmEditField.Value = thickness;
            app.CutoffFrequencyEditField.Value = cutoffF;            
            app.SampleIDEditField.Value = sampleID;
            app.FrequencyLimitTHzEditField.Value = limitFreq;
            
            % check measurement tyep: transmission or reflecton
            measType = app.MeasurementTypeButtonGroup.SelectedObject.Text;
            
            if isequal(measType,'Reflection')
                % put logics and equations for reflection measurement                                
            end
            
            % runs the findNF function
            findNF(app);           

        end

        % Callback function
        function ApplyButtonPushed(app, event)
            % APPLYButtonPushed updates the upper limit frequency value as
            % specified by the user on the edit field, runs the updateFreqRange function from the
           % CaTSper app and deletes the dialog box
            
            % Call main app's public function
            
            % extract the updated upper limit frequency value specified by
            % the user in the edit field
            limitFreq = app.FrequencyLimitTHzEditField.Value;
             
            % run the updateFreqRange function from the CaTSper app
            updateFreqRange(app.CallingApp,limitFreq,0);
            
            % Delete the dialog box
            delete(app)
        end

        % Callback function
        function APPLYALLButtonPushed(app, event)
            % APPLYALLButtonPushed updates the upper limit frequency value as
            % specified by the user on the edit field, runs the updateFreqRange function from the
            % CaTSper app and deletes the dialog box    
            
            % Call main app's public function

            % extract the updated upper limit frequency value specified by
            % the user in the edit field
            limitFreq = app.FrequencyLimitTHzEditField.Value;
            
            % run the updateFreqRange function from the CaTSper app
            updateFreqRange(app.CallingApp,limitFreq,1);
            
            % Delete the dialog box
            delete(app)
        end

        % Value changed function: CutoffFrequencySlider
        function CutoffFrequencySliderValueChanged(app, event)
            % CutoffFrequencySliderValueChanged updates the cutoff frequency
            % edit field with the new value that is specified by the user on
            % the slider, and runs the findNF and plotAx1 function
            
            % extract the updated cutoff frequency value specified by
            % the user in the slider
            value = app.CutoffFrequencySlider.Value;
            % update the cutoff frequency edit field with the new value
            app.CutoffFrequencyEditField.Value = value;
            % run findNF and plotAx1 functions
            findNF(app);
            plotAx1(app);
        end

        % Value changed function: CutoffFrequencyEditField
        function CutoffFrequencyEditFieldValueChanged(app, event)
            % CutoffFrequencyEditFieldValueChanged updates the cutoff frequency
            % slider with the new value that is specified by the user on
            % the edit field, and runs the findNF and plotAx1 function
            
            % extract the updated cutoff frequency value specified by
            % the user in the edit field
            value = app.CutoffFrequencyEditField.Value;
            % update the cutoff frequency slider with the new value
            app.CutoffFrequencySlider.Value = value;
            % run findNF and plotAx1 functions
            findNF(app);
            plotAx1(app);
        end

        % Value changed function: UpperlimitFrequencySlider
        function UpperlimitFrequencySliderValueChanged(app, event)
            % UpperlimitFrequencySliderValueChanged updates the upper limit frequency
            % edit field with the new value that is specified by the user on
            % the slider, and runs the plotAx2 function    
            
            % extract the updated upper limit frequency value specified by
            % the user in the slider
            value = app.UpperlimitFrequencySlider.Value;
            % update the upper limit frequency edit field with the new value
            app.FrequencyLimitTHzEditField.Value = value;
            % run the plotAx2 function
            plotAx2(app);
        end

        % Value changed function: FrequencyLimitTHzEditField
        function FrequencyLimitTHzEditFieldValueChanged(app, event)
            % FrequencyLimitTHzEditFieldValueChanged updates the upper limit frequency
            % slider with the new value that is specified by the user on
            % the edit field, and runs the plotAx2 function    
            
            % extract the updated upper limit frequency value specified by
            % the user in the edit field
            value = app.FrequencyLimitTHzEditField.Value;
            % update the upper limit frequency slider with the new value
            app.UpperlimitFrequencySlider.Value = value;
            % run the plotAx2 function
            plotAx2(app);            
        end

        % Value changed function: AbsorptionYaxisfittingCheckBox
        function AbsorptionYaxisfittingCheckBoxValueChanged(app, event)
            % AbsorptionspectrumYaxisfittingCheckBoxValueChanged extracts the updated 
            % value from the absorption spectrum y-axis fitting box and runs the plotAx2 function

            % extract the updated value from the absorption spectrum y-axis fitting box 
            value = app.AbsorptionYaxisfittingCheckBox.Value;
            % run the plotAx2 function
            plotAx2(app);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create DynamicRangeCheckerUIFigure and hide until all components are created
            app.DynamicRangeCheckerUIFigure = uifigure('Visible', 'off');
            app.DynamicRangeCheckerUIFigure.Position = [100 100 843 693];
            app.DynamicRangeCheckerUIFigure.Name = 'Dynamic Range Checker';
            app.DynamicRangeCheckerUIFigure.Icon = fullfile(pathToMLAPP, 'Images', 'CaT_logo.png');

            % Create UIAxes1
            app.UIAxes1 = uiaxes(app.DynamicRangeCheckerUIFigure);
            title(app.UIAxes1, 'Normalized Dynamic Range and Noise Floor')
            xlabel(app.UIAxes1, 'Frequency (THz)')
            ylabel(app.UIAxes1, 'Dynamic Range')
            app.UIAxes1.PlotBoxAspectRatio = [1.80656934306569 1 1];
            app.UIAxes1.FontWeight = 'bold';
            app.UIAxes1.XLim = [0 7];
            app.UIAxes1.YLim = [0 3000];
            app.UIAxes1.XTickLabelRotation = 0;
            app.UIAxes1.YTickLabelRotation = 0;
            app.UIAxes1.YScale = 'log';
            app.UIAxes1.YMinorTick = 'on';
            app.UIAxes1.ZTickLabelRotation = 0;
            app.UIAxes1.LineWidth = 1;
            app.UIAxes1.Box = 'on';
            app.UIAxes1.XGrid = 'on';
            app.UIAxes1.YGrid = 'on';
            app.UIAxes1.Position = [279 347 550 330];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.DynamicRangeCheckerUIFigure);
            title(app.UIAxes2, 'Absorption Spectrum')
            xlabel(app.UIAxes2, 'Frequency (THz)')
            ylabel(app.UIAxes2, 'Absorption coefficient [cm^{-1}]')
            app.UIAxes2.PlotBoxAspectRatio = [1.80656934306569 1 1];
            app.UIAxes2.FontWeight = 'bold';
            app.UIAxes2.XLim = [0 7];
            app.UIAxes2.YLim = [-100 500];
            app.UIAxes2.XTickLabelRotation = 0;
            app.UIAxes2.YTickLabelRotation = 0;
            app.UIAxes2.ZTickLabelRotation = 0;
            app.UIAxes2.LineWidth = 1;
            app.UIAxes2.Box = 'on';
            app.UIAxes2.XGrid = 'on';
            app.UIAxes2.YGrid = 'on';
            app.UIAxes2.Position = [279 11 550 330];

            % Create DynamicRangeCheckerLabel
            app.DynamicRangeCheckerLabel = uilabel(app.DynamicRangeCheckerUIFigure);
            app.DynamicRangeCheckerLabel.FontSize = 18;
            app.DynamicRangeCheckerLabel.FontWeight = 'bold';
            app.DynamicRangeCheckerLabel.Tooltip = {'Jepsen et al. 2005: Dynamic range in terahertz time-domain transmission and reflection spectroscopy'};
            app.DynamicRangeCheckerLabel.Position = [63 638 217 23];
            app.DynamicRangeCheckerLabel.Text = 'Dynamic Range Checker';

            % Create CutoffSettingPanel
            app.CutoffSettingPanel = uipanel(app.DynamicRangeCheckerUIFigure);
            app.CutoffSettingPanel.Title = 'Cutoff Setting';
            app.CutoffSettingPanel.Position = [24 359 234 167];

            % Create CutoffFrequencyLabel
            app.CutoffFrequencyLabel = uilabel(app.CutoffSettingPanel);
            app.CutoffFrequencyLabel.HorizontalAlignment = 'right';
            app.CutoffFrequencyLabel.Position = [11 39 101 22];
            app.CutoffFrequencyLabel.Text = 'Cutoff Frequency';

            % Create CutoffFrequencyEditField
            app.CutoffFrequencyEditField = uieditfield(app.CutoffSettingPanel, 'numeric');
            app.CutoffFrequencyEditField.Limits = [0 20];
            app.CutoffFrequencyEditField.ValueDisplayFormat = '%.2f';
            app.CutoffFrequencyEditField.ValueChangedFcn = createCallbackFcn(app, @CutoffFrequencyEditFieldValueChanged, true);
            app.CutoffFrequencyEditField.Position = [132 39 90 22];

            % Create NoiseFloorEditFieldLabel
            app.NoiseFloorEditFieldLabel = uilabel(app.CutoffSettingPanel);
            app.NoiseFloorEditFieldLabel.HorizontalAlignment = 'right';
            app.NoiseFloorEditFieldLabel.Position = [45 9 67 22];
            app.NoiseFloorEditFieldLabel.Text = 'Noise Floor';

            % Create NoiseFloorEditField
            app.NoiseFloorEditField = uieditfield(app.CutoffSettingPanel, 'numeric');
            app.NoiseFloorEditField.Editable = 'off';
            app.NoiseFloorEditField.Position = [132 9 90 22];

            % Create CutoffFrequencyLabel_2
            app.CutoffFrequencyLabel_2 = uilabel(app.CutoffSettingPanel);
            app.CutoffFrequencyLabel_2.HorizontalAlignment = 'right';
            app.CutoffFrequencyLabel_2.Position = [5 116 101 22];
            app.CutoffFrequencyLabel_2.Text = 'Cutoff Frequency';

            % Create CutoffFrequencySlider
            app.CutoffFrequencySlider = uislider(app.CutoffSettingPanel);
            app.CutoffFrequencySlider.Limits = [1 7];
            app.CutoffFrequencySlider.ValueChangedFcn = createCallbackFcn(app, @CutoffFrequencySliderValueChanged, true);
            app.CutoffFrequencySlider.Position = [24 103 195 3];
            app.CutoffFrequencySlider.Value = 3.5;

            % Create SampleInformationPanel
            app.SampleInformationPanel = uipanel(app.DynamicRangeCheckerUIFigure);
            app.SampleInformationPanel.Title = 'Sample Information';
            app.SampleInformationPanel.Position = [25 154 234 195];

            % Create ThicknessmmEditFieldLabel
            app.ThicknessmmEditFieldLabel = uilabel(app.SampleInformationPanel);
            app.ThicknessmmEditFieldLabel.HorizontalAlignment = 'right';
            app.ThicknessmmEditFieldLabel.Position = [33 70 90 22];
            app.ThicknessmmEditFieldLabel.Text = 'Thickness (mm)';

            % Create ThicknessmmEditField
            app.ThicknessmmEditField = uieditfield(app.SampleInformationPanel, 'numeric');
            app.ThicknessmmEditField.ValueDisplayFormat = '%.3f';
            app.ThicknessmmEditField.Editable = 'off';
            app.ThicknessmmEditField.Position = [135 70 90 22];

            % Create FrequencyLimitTHzEditFieldLabel
            app.FrequencyLimitTHzEditFieldLabel = uilabel(app.SampleInformationPanel);
            app.FrequencyLimitTHzEditFieldLabel.HorizontalAlignment = 'right';
            app.FrequencyLimitTHzEditFieldLabel.Position = [3 39 124 22];
            app.FrequencyLimitTHzEditFieldLabel.Text = 'Frequency Limit (THz)';

            % Create FrequencyLimitTHzEditField
            app.FrequencyLimitTHzEditField = uieditfield(app.SampleInformationPanel, 'numeric');
            app.FrequencyLimitTHzEditField.Limits = [0 20];
            app.FrequencyLimitTHzEditField.ValueDisplayFormat = '%.3f';
            app.FrequencyLimitTHzEditField.ValueChangedFcn = createCallbackFcn(app, @FrequencyLimitTHzEditFieldValueChanged, true);
            app.FrequencyLimitTHzEditField.Position = [136 39 90 22];

            % Create UpperlimitFrequencySliderLabel
            app.UpperlimitFrequencySliderLabel = uilabel(app.SampleInformationPanel);
            app.UpperlimitFrequencySliderLabel.HorizontalAlignment = 'right';
            app.UpperlimitFrequencySliderLabel.Position = [6 149 124 22];
            app.UpperlimitFrequencySliderLabel.Text = 'Upper-limit Frequency';

            % Create UpperlimitFrequencySlider
            app.UpperlimitFrequencySlider = uislider(app.SampleInformationPanel);
            app.UpperlimitFrequencySlider.Limits = [1 7];
            app.UpperlimitFrequencySlider.ValueChangedFcn = createCallbackFcn(app, @UpperlimitFrequencySliderValueChanged, true);
            app.UpperlimitFrequencySlider.Position = [24 136 195 3];
            app.UpperlimitFrequencySlider.Value = 3.5;

            % Create AbsorptionYaxisfittingCheckBox
            app.AbsorptionYaxisfittingCheckBox = uicheckbox(app.SampleInformationPanel);
            app.AbsorptionYaxisfittingCheckBox.ValueChangedFcn = createCallbackFcn(app, @AbsorptionYaxisfittingCheckBoxValueChanged, true);
            app.AbsorptionYaxisfittingCheckBox.Text = 'Absorption Y-axis fitting';
            app.AbsorptionYaxisfittingCheckBox.Position = [81 12 147 22];
            app.AbsorptionYaxisfittingCheckBox.Value = true;

            % Create MeasurementTypeButtonGroup
            app.MeasurementTypeButtonGroup = uibuttongroup(app.DynamicRangeCheckerUIFigure);
            app.MeasurementTypeButtonGroup.Title = 'Measurement Type';
            app.MeasurementTypeButtonGroup.Position = [23 537 234 52];

            % Create TransmissionButton
            app.TransmissionButton = uiradiobutton(app.MeasurementTypeButtonGroup);
            app.TransmissionButton.Text = 'Transmission';
            app.TransmissionButton.Position = [16 6 93 22];
            app.TransmissionButton.Value = true;

            % Create ReflectionButton
            app.ReflectionButton = uiradiobutton(app.MeasurementTypeButtonGroup);
            app.ReflectionButton.Enable = 'off';
            app.ReflectionButton.Text = 'Reflection';
            app.ReflectionButton.Position = [122 6 75 22];

            % Create SampleIDEditFieldLabel
            app.SampleIDEditFieldLabel = uilabel(app.DynamicRangeCheckerUIFigure);
            app.SampleIDEditFieldLabel.HorizontalAlignment = 'right';
            app.SampleIDEditFieldLabel.Position = [24 600 62 22];
            app.SampleIDEditFieldLabel.Text = 'Sample ID';

            % Create SampleIDEditField
            app.SampleIDEditField = uieditfield(app.DynamicRangeCheckerUIFigure, 'text');
            app.SampleIDEditField.Position = [95 600 163 22];

            % Create Image
            app.Image = uiimage(app.DynamicRangeCheckerUIFigure);
            app.Image.Position = [15 638 48 49];
            app.Image.ImageSource = fullfile(pathToMLAPP, 'Images', 'dotTHz_logo.png');

            % Show the figure after all components are created
            app.DynamicRangeCheckerUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = DR_Checker_exported(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.DynamicRangeCheckerUIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.DynamicRangeCheckerUIFigure)
        end
    end
end