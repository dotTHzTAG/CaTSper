# CaTSper
(Cambridge Terahertz Spectrum Analyser)

   <img src="/Images/CaTSper_splash.png" height ="300">

**Installation guide (standalone version)**

Please download the installer and run it on your local computer as decribed below. 

## For Windows

*MATLAB Application Installation:*
 -	Download and run [CaTSperInstaller_Windows_web.exe](CaTSperInstaller_Windows_web.exe) (an internect connection is necessary for installation.)
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

> *Please run CaTSPer as administrator!!!*

## For Mac OS
 
*MATLAB Application Installation:*
 -	Download and run [CaTSperInstaller_Mac_web.app](CaTSperInstaller_Mac_web.app) (an internect connection is necessary for installation.)
 -	The MATLAB Installer will launch. Click **Next**.
 -	Click **Next**, then click **Begin Install**

 *Unlock 'json' files after installation*
 -	Move to the application folder at /Applications/CaTSPer/application
 -	Unlock *'config_default.json'* file.
 -	To unlock a json file:
>   1) Double-click the file and try to change its content. When a warning message pops up, Select 'Unlock'.
>   2) Right-click the file and change its file permissions from *Read* to *Read & Write*.

 
 <img src="/Images/dotTHzProject_logo.png" height ="150">

## For the source code modification

CaTSper.mlapp is a MATLAB App-Designer (version r2023a) file and runs on MATLAB environment. If MATLAB is not installed in your PC, please visit https://uk.mathworks.com/products/matlab.html and install the latest version before you run CaTSper. 

In the repository, there is a pair of .mlapp and .m files. Basically, .m file is a text version of .mlapp for code-reviewing and version-tracking and not necessary for running the tool. In case you modify *.mlapp file and commit it back to the repository, please update and upload the associated .m file as well so that users can easily track the changes in the code.

*Please follow the instructions below.*
1. **MATLAB** needs to be installed in your computer to modify CaTSper.
2. Download *.mlapp and \images files.
 - **CaTSper.mlapp** : CaTSper MATLAB App-designer file
 - **DR_Checker.mlapp** : CaTSper dynamic range checker MATLAB App-designer file
 - **.\images\CaT_logo.png** : logo image
 - **.\images\dotTHz_logo.png** : logo image
3. Double click **CaTSper.mlapp** to launch the software.
> Note: 'Sigal Processing Toolbox' is necessary to fully operate the app.*

*Installation Process*
 1. Open MATLAB: Launch MATLAB on your computer.
 2. Open Add-Ons Explorer: Click on the "Add-Ons" button on the MATLAB toolbar. This will open the Add-Ons Explorer.
 3. Search for the Toolbox: In the Add-Ons Explorer, type "Signal Processing Toolbox" into the search bar and press Enter.
 4. Select the Toolbox: From the search results, locate the "Signal Processing Toolbox" and click on it.
 5. Install the Toolbox: Click the "Install" button. If prompted, follow the on-screen instructions to complete the installation. You may need to log in with your MathWorks account.

For detailed descriptions for CaTSper and step-by-step tutorial, please visit [dotTHz documentation](https://github.com/dotTHzTAG/Documentation).
