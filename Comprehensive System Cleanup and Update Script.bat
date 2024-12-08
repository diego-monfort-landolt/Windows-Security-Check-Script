@echo off
echo Starte Systembereinigung und Updates...

:: Funktion zum Löschen von Verzeichnissen
:delete_dir
if exist %1 (
    echo Lösche %1...
    rmdir /S /Q %1
) else (
    echo %1 nicht gefunden.
)
goto :eof

:: Teams Cache löschen
call :delete_dir "%APPDATA%\Microsoft\Teams"

:: Outlook Cache löschen
call :delete_dir "%USERPROFILE%\AppData\Local\Microsoft\Outlook"
call :delete_dir "%USERPROFILE%\AppData\Local\Microsoft\Outlook\RoamCache"

:: Edge Cache löschen
call :delete_dir "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Cache"

:: Chrome Cache löschen
call :delete_dir "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache"

:: Firefox Cache löschen
call :delete_dir "%USERPROFILE%\AppData\Local\Mozilla\Firefox\Profiles\*.default-release\cache2"

:: Temporäre Dateien löschen
echo Lösche temporäre Dateien...
del /s /q %temp%\*
del /s /q C:\Windows\Temp\*

:: DNS-Cache leeren
echo Leere DNS-Cache...
ipconfig /flushdns

:: Gruppenrichtlinien aktualisieren
echo Aktualisiere Gruppenrichtlinien...
gpupdate /force

:: Windows Update ausführen
echo Führe Windows Update aus...
powershell -Command "Install-Module PSWindowsUpdate -Force; Install-WindowsUpdate -AcceptAll -AutoReboot"

echo Vorgang abgeschlossen.
pause
