@echo off
color 30
:: Controlla i privilegi di amministratore
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Privilegi di amministratore confermati.
) else (
    echo Errore: Esegui questo file come amministratore.
    pause
    exit /b
)

echo Internet Settings...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 1001 /t REG_DWORD /d 10000 /f

if %errorLevel% == 0 (
    echo
) else (
    echo Si e verificato un errore.
)

pause
