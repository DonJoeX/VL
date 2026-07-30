@echo off
color 30

:: Controlla i privilegi di amministratore
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Errore: Esegui questo file come amministratore.
    pause
    exit /b
)

echo Privilegi di amministratore confermati.
echo Verifico la presenza dell'installer...

:: Individua il percorso corretto dell'installer tra i 3 possibili
set "INSTALL_DIR="
if exist "C:\TSS\pdf5019\Install.exe" (
    set "INSTALL_DIR=C:\TSS\pdf5019"
) else if exist "C:\TSVL\Studio24\PDFDriver5019\Install.exe" (
    set "INSTALL_DIR=C:\TSVL\Studio24\PDFDriver5019"
) else if exist "C:\IlSole24Ore\Studio24\PDFDriver5019\Install.exe" (
    set "INSTALL_DIR=C:\IlSole24Ore\Studio24\PDFDriver5019"
)

:: Se non trova l'installer in nessuno dei percorsi, si arresta
if not defined INSTALL_DIR (
    echo.
    echo Errore: Impossibile trovare Install.exe nei percorsi previsti:
    echo  - C:\TSS\pdf5019\
    echo  - C:\TSVL\Studio24\PDFDriver5019\
    echo  - C:\IlSole24Ore\Studio24\PDFDriver5019\
    echo.
    echo Verifica la presenza della cartella e riprova.
    pause
    exit /b
)

echo Trovato installer in: %INSTALL_DIR%
echo.
echo Disinstallazione Convertitore precedente...

"%INSTALL_DIR%\Install.exe" -u -s

echo Attendere la pulizia del registro...
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Print\Printers\VLSPOOLER50" /f >nul 2>&1

echo Installazione e configurazione nuova stampante...
"%INSTALL_DIR%\Install.exe" -s "VLSPOOLER50" -n "TSS S.p.A." -c "07EFCDAB01000100E45932D3E2E8CF175BA1A9B09A8944CC4E6ECC718981832D8CE03A4E0B6227E756E0D4EF7A19F270BFCF3AE36CA1"

echo Registrazione componenti DLL...
if exist "C:\Windows\SysWOW64\cdintf500.dll" regsvr32 /s C:\Windows\SysWOW64\cdintf500.dll
if exist "C:\Windows\System32\cdintf500.dll" regsvr32 /s C:\Windows\System32\cdintf500.dll

echo.
echo ===================================
echo   Operazione Completata con successo!
echo ===================================
pause
