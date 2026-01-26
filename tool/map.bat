@echo off
title Mappatura Unita di Rete TSSShare
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

echo.
echo Operazione completata.
pause
