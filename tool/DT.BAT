@echo off
setlocal
color 30

:: Controlla i privilegi di amministratore
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Errore: Esegui questo file come amministratore.
    pause
    exit /b
)

echo Verifica percorso DesktopTelematico...
echo.

:: Definizione dei percorsi da testare
set "PATH1=C:\PROG_CONTROLLI"
set "PATH2=C:\DesktopTelematico"

:: Controllo Percorso 1
if exist "%PATH1%\desktoptelematico\DesktopTelematico.exe" (
    echo Trovato in: %PATH1%
    set "FINAL_PATH=%PATH1%"
    set "EXE_PATH=%PATH1%\desktoptelematico"
    goto :APPLY_REG
)

:: Controllo Percorso 2
if exist "%PATH2%\desktoptelematico\DesktopTelematico.exe" (
    echo Trovato in: %PATH2%
    set "FINAL_PATH=%PATH2%"
    set "EXE_PATH=%PATH2%\DesktopTelematico"
    goto :APPLY_REG
)

:: Se non trovato in nessuno dei due
echo [ERRORE] DesktopTelematico.exe non trovato nei percorsi specificati.
pause
exit /b

:APPLY_REG
echo Applicazione chiavi di registro...

:: Scrittura Valore Predefinito (Eseguibile)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\DesktopTelematico" /ve /t REG_SZ /d "%EXE_PATH%" /f >nul

:: Scrittura Valore Path (Cartella)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\DesktopTelematico" /v "Path" /t REG_SZ /d "%FINAL_PATH%" /f >nul

if %errorLevel% == 0 (
    echo.
    echo Configurazione completata con successo!
    echo Percorso impostato: %FINAL_PATH%
) else (
    echo.
    echo Si e verificato un errore durante l'aggiornamento del registro.
)

pause