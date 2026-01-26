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

echo Aggiunta chiave di registro EnableLinkedConnections...

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLinkedConnections" /t REG_DWORD /d "1" /f

if %errorLevel% == 0 (
    echo Operazione completata con successo.
    echo Nota: E' necessario riavviare il computer per applicare le modifiche.
) else (
    echo Si e verificato un errore durante l'aggiunta della chiave.
)

pause
