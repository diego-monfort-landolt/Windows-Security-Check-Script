@echo off
echo Aktualisiere den Computer, lösche den Cache und führe Netzwerk- und Gruppenrichtlinien-Updates durch...

:: Windows Update ausführen
echo Starte Windows Update...
powershell -Command "Install-Module PSWindowsUpdate -Force; Install-WindowsUpdate -AcceptAll -AutoReboot"

:: Temporäre Dateien und Cache löschen
echo Lösche temporäre Dateien und Cache...
del /s /q %temp%\*
del /s /q C:\Windows\Temp\*

:: DNS-Cache leeren
echo Leere den DNS-Cache...
ipconfig /flushdns

:: Gruppenrichtlinien aktualisieren
echo Aktualisiere Gruppenrichtlinien...
gpupdate /force

:: Warten, um sicherzustellen, dass alle Aufgaben abgeschlossen sind
timeout /t 10 /nobreak >nul

:: Computer herunterfahren
echo Der Computer wird in 60 Sekunden heruntergefahren...
shutdown /s /t 60

echo Vorgang abgeschlossen.
pause
