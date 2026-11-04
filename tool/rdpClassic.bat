@echo off

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERRORE] Esegui questo script come amministratore
    echo.
    pause
    exit /b
)

echo Applicazione della modifica al Registro di Sistema...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client" /v "RedirectionWarningDialogVersion" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "MaxIdleTime" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Terminal Server Client" /v "AuthenticationLevel" /t REG_DWORD /d 0 /f

if %errorlevel% equ 0 (
    echo.
    echo [OK] Modifica applicata con successo!
) else (
    echo.
    echo [ERRORE] Impossibile applicare la modifica.
)

echo.
pause
