@echo off
set delay=1

echo "****************************************************************"
echo "* Improved proper start script for Fat-32 formatted USB drives *"
echo "* This also fixes the broken paths by using %%CD:~0,3%% instead. *"
echo "* %%~dp0 has not been changed for starting eclipse as it was    *"
echo "* not neccesary to fix that line.                              *"
echo "* Set 'delay' in StartScript.bat to anything but 1 if you      *"
echo "* do not want to read text in the cmd and just want to start   *"
echo "* eclipse as quickly as possible.                              *"
echo "*                                     Script Creator: Bokoblin *"
echo "*                                         Maintainer: Berny23  *"
echo "****************************************************************"

mkdir "%~dp0..\..\Data\tmp"

if exist "%CD%\App\eclipse\jre\bin\javaw.exe" (
  start /d "%~dp0..\eclipse" eclipse.exe
) else (
    echo.
    echo ] Java was not found in the jre folder of eclipse.
    echo ] We shall create a jre folder and copy Java from CommonFiles/OpenJDK64 to the jre folder.
    echo ] Press any key to continue.
    echo.
    IF /I "%delay%" EQU "1" TIMEOUT /T 15
    xcopy "%~dp0..\..\..\CommonFiles\OpenJDK64" "%~dp0..\eclipse\jre" /e /i
    echo.
    echo ] Done. Starting Eclipse...
    echo ] Press any key to continue.
    IF /I "%delay%" EQU "1" TIMEOUT /T 15
    echo.
    echo ] Starting Eclipse...
    start /d "%~dp0..\eclipse" eclipse.exe
)