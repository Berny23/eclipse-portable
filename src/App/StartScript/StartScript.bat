@echo off
set delay=1

echo "***************************************************************"
echo "*Improved proper start script for Fat-32 formatted USB drives *"
echo "*This also fixes the broken paths by using %%CD:~0,3%% instead  *"
echo "*%%~dp0 has not been changed for starting eclipse as it was    *"
echo "*not neccesary to fix that line.                              *"
echo "*set 'delay' in StartScript.bat to anything but 1 if you      *"
echo "*do not want to read text in the cmd and just want to start   *"
echo "*eclipse as quickly as possible.             Cred: Bokoblin   *"
echo "***************************************************************"

mkdir "%~dp0..\..\Data\tmp"

if exist "%CD%\App\eclipse\jre\bin\javaws.exe" (
  start /d "%~dp0..\eclipse" eclipse.exe
) else (
    echo "Java was not found in the jre folder of eclipse. We shall create a jre folder and copy Java from CommonFiles/Java64 to the jre folder"
    echo "The copying process will start in 15 seconds or when you press any button."
    IF /I "%delay%" EQU "1" TIMEOUT /T 15
    xcopy "%~dp0..\..\..\CommonFiles\Java64" "%~dp0..\eclipse\jre" /e /i
    echo "Done. Starting Eclipse in 15 seconds or when user presses a button..."
    IF /I "%delay%" EQU "1" TIMEOUT /T 15
    echo "Starting Eclipse..."
    start /d "%~dp0..\eclipse" eclipse.exe
)