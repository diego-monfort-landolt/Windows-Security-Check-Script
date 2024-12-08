@echo off
echo Starte Microsoft Teams, Outlook und zuletzt verwendete Dokumente...

:: Microsoft Teams starten
start "" "C:\Users\%USERNAME%\AppData\Local\Microsoft\Teams\Update.exe" --processStart "Teams.exe"

:: Outlook starten
start "" "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"

:: Zuletzt verwendete Dokumente öffnen
for /f "tokens=*" %%i in ('dir "%USERPROFILE%\Recent" /b /o-d /a') do (
    start "" "%%i"
    goto :done
)
:done

echo Vorgang abgeschlossen.
pause

