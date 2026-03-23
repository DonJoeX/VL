@echo on
color 30
:: Sysnative forza le app a 32-bit a vedere la vera cartella System32 a 64-bit
C:\Windows\Sysnative\setres.exe -w 1366 -h 768 -f
powershell -Command "Start-Sleep -Seconds 1"
pause
