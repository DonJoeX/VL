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

echo Installazione Convertitore...

C:\TSS\pdf5019\Install.exe -u -s


@ECHO Attendere...

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Print\Printers\VLSPOOLER50" /f


@ECHO Attendere...

C:\TSS\pdf5019\Install.exe -s "VLSPOOLER50" -n "TSS S.p.A." -c "07EFCDAB01000100E45932D3E2E8CF175BA1A9B09A8944CC4E6ECC718981832D8CE03A4E0B6227E756E0D4EF7A19F270BFCF3AE36CA1"

regsvr32 /s C:\Windows\SysWOW64\cdintf500.dll
regsvr32 /s C:\Windows\System32\cdintf500.dll


@ECHO Operazione Completata


