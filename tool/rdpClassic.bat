@echo off

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERRORE] Esegui questo script come amministratore
    echo.
    pause
    exit /b
)

echo Applicazione della modifica al Registro di Sistema.....
:: 1. Disabilita il nuovo layout di avviso reindirizzamento risorse (Windows 11)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client" /v "RedirectionWarningDialogVersion" /t REG_DWORD /d 1 /f

:: 2. Disabilita il timeout per inattivita RDP (MaxIdleTime = 0)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "MaxIdleTime" /t REG_DWORD /d 0 /f

:: 3. Disabilita l'avviso per certificati di sicurezza non validi/untrusted (AuthenticationLevel = 0)
reg add "HKLM\SOFTWARE\Microsoft\Terminal Server Client" /v "AuthenticationLevel" /t REG_DWORD /d 0 /f

:: 4. Disabilita la richiesta di conferma sull'autore sconosciuto della connessione (CredSSP)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client" /v EnableCredSSPSupport /t REG_DWORD /d 0 /f

:: 5. Disabilita l'avviso di avvio per file RDP non firmati / editori sconosciuti
reg add "HKLM\SOFTWARE\Microsoft\Terminal Server Client" /v ShowPublisherWarning /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Terminal Server Client" /v ShowPublisherWarning /t REG_DWORD /d 0 /f

if %errorlevel% equ 0 (
    echo.
    echo [OK] Modifica applicata con successo!
) else (
    echo.
    echo [ERRORE] Impossibile applicare la modifica.
)

echo.
pause
