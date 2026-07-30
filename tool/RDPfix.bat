@echo off
title Configurazione chiave registro Terminal Services

echo.
echo Configurazione in corso...

REM Creazione chiave e valore
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services\Client" ^
 /v "RedirectionWarningDialogVersion" ^
 /t REG_DWORD ^
 /d 1 ^
 /f

if %errorlevel%==0 (
    echo.
    echo Operazione completata con successo.
) else (
    echo.
    echo Si e verificato un errore durante la configurazione.
)

echo.
pause
