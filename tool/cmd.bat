@echo off
:: Imposta la codifica UTF-8 per gestire correttamente eventuali accenti o caratteri speciali nei percorsi
chcp 65001 > nul

echo ===================================================
echo          Esecuzione File da Percorso
echo ===================================================
echo.

:INSERIMENTO
:: Chiede all'utente di digitare o trascinare il file nella finestra
set /p "filepath=Trascina qui il file o inserisci il percorso completo: "

:: Rimuove eventuali virgolette doppie se il percorso e stato trascinato
set "filepath=%filepath:"=%"

:: Verifica se l'utente ha inserito qualcosa
if "%filepath%"=="" (
    echo [ERRORE] Nessun percorso inserito. Riprova.
    echo.
    goto INSERIMENTO
)

:: Verifica se il file esiste davvero
if not exist "%filepath%" (
    echo [ERRORE] Il file specificato non esiste: "%filepath%"
    echo.
    goto INSERIMENTO
)

echo.
echo Avvio di: "%filepath%"...
echo.

:: Esegue il file (usando "start" per gestire correttamente spazi e tipi di file)
start "" "%filepath%"

