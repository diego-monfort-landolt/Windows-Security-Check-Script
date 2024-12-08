@echo off
echo Aktualisiere Outlook und lösche den Cache...

:: Outlook schließen
taskkill /IM outlook.exe /F

:: Outlook Cache-Ordner löschen
rmdir /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Outlook"
rmdir /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Outlook\RoamCache"

:: Warten, um sicherzustellen, dass Outlook vollständig geschlossen ist
timeout /t 5 /nobreak >nul

:: Outlook neu starten
start "" "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"

echo Vorgang abgeschlossen.
pause
