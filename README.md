# CaTSper
(Cambridge Terahertz Spectrum Analyser)

   <img src="/Images/CaTSper_splash.png" height ="300">

**Installation guide (standalone version)**

Please download [CaTSperInstaller_web.exe](CaTSperInstaller_web.exe) and run it on your local computer as decribed below. 

*MATLAB Application Installation:*
 -	Run the CaTSperInstaller_web.exe file (an internect connection is necessary for installation.)
 -	The MATLAB Installer will launch. Click **Next**.
 -	At the ‘Select destination folder’ step, leave ‘Add shortcut to desktop’ **UNCHECKED**.
 -	Click **Next**, then click **Begin Install**

 *Add Shortcut to Desktop:*
 -	Right-click and drag the CaTSPer.exe file at C:\Program Files\CaTSPer\application\ to Windows Desktop
 -	Select **Create shortcut to here.**
 -	Right-click the shortcut and select **properties.**
 -	At the Shortcut tab, click **Advanced…**
 -	Check **Run as administrator.**
 -	Click **OK** and **OK**

 *Please run CaTSPer as administrator!!!*
 
 <img src="/Images/dotTHzProject_logo.png" height ="150">

**For the source code modification**

CaTSper.mlapp is a MATLAB App-Designer (version r2023a) file and runs on MATLAB environment. If MATLAB is not installed in your PC, please visit https://uk.mathworks.com/products/matlab.html and install the latest version before you run CaTSper. 

In the repository, there is a pair of .mlapp and .m files. Basically, .m file is a text version of .mlapp for code-reviewing and version-tracking and not necessary for running the tool. In case you modify *.mlapp file and commit it back to the repository, please update and upload the associated .m file as well so that users can easily track the changes in the code.

Please follow the instructions below.
1. **MATLAB** needs to be installed in your computer to modify CaTSper.
2. Download *.mlapp and \images files.
 - **CaTSper.mlapp** : CaTSper MATLAB App-designer file
 - **DR_Checker.mlapp** : CaTSper dynamic range checker MATLAB App-designer file
 - **.\images\CaT_logo.png** : logo image
 - **.\images\dotTHz_logo.png** : logo image
3. Double click **CaTSper.mlapp** to launch the software.

For detailed descriptions for CaTSper and step-by-step tutorial, please visit [dotTHz documentation](https://github.com/dotTHzTAG/Documentation).
