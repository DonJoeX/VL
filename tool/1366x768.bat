@echo off
color 30
title Cambio Risoluzione Schermo

:MENU
cls
echo ============================================
echo         SELEZIONA RISOLUZIONE SCHERMO
echo ============================================
echo.
echo [1] Risoluzione 1366 x 768
echo [2] Risoluzione 1280 x 800
echo [3] Inserisci risoluzione personalizzata
echo [4] Esci
echo.
set /p scelta="Scegli un'opzione (1-4): "

if "%scelta%"=="1" goto RES_1366
if "%scelta%"=="2" goto RES_1280
if "%scelta%"=="3" goto RES_CUSTOM
if "%scelta%"=="4" goto FINE
echo Option non valida! Riprova.
timeout /t 2 >nul
goto MENU

:RES_1366
set W=1366
set H=768
goto ESEGUI

:RES_1280
set W=1280
set H=800
goto ESEGUI

:RES_CUSTOM
cls
echo ============================================
echo       RISOLUZIONE PERSONALIZZATA
echo ============================================
echo.
set /p W="Inserisci la larghezza (w): "
set /p H="Inserisci l'altezza (h): "
goto ESEGUI

:ESEGUI
echo.
echo Impostazione risoluzione a %W%x%H% in corso...
:: Sysnative forza le app a 32-bit a vedere la vera cartella System32 a 64-bit
C:\Windows\Sysnative\setres.exe -w %W% -h %H% -f

if %ERRORLEVEL% EQU 0 (
    echo Risoluzione modificata con successo!
) else (
    echo Si e' verificato un errore durante l'esecuzione di setres.exe.
)
timeout /t 3 >nul
goto FINE

:FINE
exit
