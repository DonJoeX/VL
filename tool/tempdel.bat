@ECHO OFF
color 30
cls
echo ========================================================
echo   ANALISI E PULIZIA SPAZIO DISCO (C:)
echo ========================================================
echo.

echo Calcolo spazio iniziale...
for /f "tokens=3" %%a in ('fsutil volume diskfree C: ^| findstr /i "libero totali"') do (
    set "spazio_iniziale=%%a"
    goto :mostra_iniziale
)
:mostra_iniziale
echo    - Spazio libero iniziale: %spazio_iniziale% byte
echo.

powershell -command "Get-ChildItem 'C:\Windows\SystemTemp' -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue"
powershell -command "Get-ChildItem 'C:\Windows\Temp' -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue"
powershell -command "Get-ChildItem 'C:\Windows\System32\config\systemprofile\AppData\Local\CrashDumps' -Recurse | Remove-Item -Recurse -Force"
powershell -command "Get-ChildItem 'C:\Users\*\AppData\Local\CrashDumps' -Recurse | Remove-Item -Force"
powershell -command "Get-ChildItem 'C:\Users\*\Downloads\*.exe' -ErrorAction SilentlyContinue | Remove-Item -Force"

del C:\TSVL\Studio24\VLBIL15\BACKUP /q
del C:\TSVL\Studio24\VLBIL16\BACKUP /q
del C:\TSVL\Studio24\VLBIL17\BACKUP /q
del C:\TSVL\Studio24\VLBIL18\BACKUP /q
del C:\TSVL\Studio24\VLBIL19\BACKUP /q
del C:\TSVL\Studio24\VLBIL20\BACKUP /q
del C:\TSVL\Studio24\VLBIL21\BACKUP /q
del C:\TSVL\Studio24\VLBIL22\BACKUP /q
del C:\TSVL\Studio24\VLBIL23\BACKUP /q
del C:\TSVL\Studio24\VLBIL24\BACKUP /q
del C:\TSVL\Studio24\VLBIL25\BACKUP /q
del C:\TSVL\Studio24\VLBIL26\BACKUP /q
del C:\PROG_CONTROLLI\Desktop_telematico.7z /q
rd /s /q "C:\Program Files\Actalis"
del C:\TSVL\Studio24Installazione\Studio24\DB\Base\Components\SQLEXPR_x64_ENU.exe  /q
del C:\TSVL\Studio24Installazione\Studio24\DB\Base\Components\SQLEXPR_x64_ITA.exe /q
del C:\TSVL\Studio24Installazione\Studio24\DB\Base\Components\SSMS-Setup-ENU.exe /q
del C:\TSVL\Studio24Installazione\Studio24\DB\Base\Components\SSMS-Setup-ITA.exe /q

echo Calcolo spazio finale...
for /f "tokens=3" %%a in ('fsutil volume diskfree C: ^| findstr /i "libero totali"') do (
    set "spazio_finale=%%a"
    goto :mostra_finale
)
:mostra_finale
echo    - Spazio libero finale:   %spazio_finale% byte
echo.

echo ========================================================
echo   OPERAZIONE TERMINATA
echo ========================================================

timeout /t 10 /nobreak
