@echo off
title Mappatura e Test Unita TSSShare
cls

echo ================================================
echo    CONFIGURAZIONE MAPPATURA UNITA DI RETE
echo ================================================
echo.

:: Richiesta del nome del server
set /p server="Inserisci il nome del server (es. ServerDati): "

:: Richiesta della lettera dell'unita
set /p lettera="Inserisci la lettera dell'unita desiderata (es. Z): "

echo.
echo Tentativo di mappatura di \\%server%\TSSShare su %lettera%:...

:: Comando per mappare l'unita
net use %lettera%: "\\%server%\TSSShare" /persistent:yes

:: Controllo se il comando precedente ha avuto successo
if %errorlevel% EQU 0 (
    echo.
    echo [OK] Mappatura riuscita!
    echo Avvio del test dell'unita %lettera%:...
    echo.
    
    :: Esegue il test: entra nell'unita e mostra i file
    %lettera%:
    dir
    
    echo.
    echo Test completato. Sopra puoi vedere i file presenti in \\%server%\TSSShare.
) else (
    echo.
    echo [ERRORE] Impossibile mappare l'unita. Verifica il nome del server o la lettera.
)

pause
