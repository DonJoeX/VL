@ECHO OFF
color 30
REM powershell -Command "Set-DisplayResolution -Width 1366 -Height 768 -Force"
powershell -Command "Start-Sleep -Seconds 1"
setres -w 1366 -h 768 -f
pause
