This batch script performs basic security checks on a Windows computer. It verifies if there are any other active users, checks for suspicious processes like cmd.exe and powershell.exe, and identifies unknown user accounts. The script helps in monitoring potential unauthorized access and ensuring the security of your system.

Öffne den Editor (Notepad):

Drücke Win + R, gib notepad ein und drücke Enter.

Füge den Skriptcode ein:

Kopiere den folgenden Code und füge ihn in den Editor ein:

batch
@echo off
setlocal

set "current_user=%USERNAME%"
set "active_users="

echo Überprüfe auf angemeldete Benutzer...
for /f "tokens=1,2,3" %%a in ('query user') do (
    if "%%a" neq "Benutzername" (
        if "%%a" neq "%current_user%" (
            set "active_users=%%a"
        )
    )
)

if defined active_users (
    echo Andere Benutzer sind aktiv: %active_users%
) else (
    echo Nur du bist auf dem Computer aktiv.
)

echo Überprüfe auf verdächtige Prozesse...
tasklist | findstr /i "cmd.exe powershell.exe"
if %errorlevel% equ 0 (
    echo Verdächtige Prozesse gefunden: cmd.exe oder powershell.exe
) else (
    echo Keine verdächtigen Prozesse gefunden.
)

echo Überprüfe auf unbekannte Benutzerkonten...
net user | findstr /i /v "%current_user%"
if %errorlevel% equ 0 (
    echo Unbekannte Benutzerkonten gefunden.
) else (
    echo Keine unbekannten Benutzerkonten gefunden.
)

endlocal
pause
Speichere die Datei:

Klicke auf Datei > Speichern unter.

Wähle einen Speicherort (z.B. Desktop).

Gib der Datei einen Namen, z.B. check_security.bat.

Stelle sicher, dass du die Dateierweiterung .bat verwendest.

Klicke auf Speichern.

Schritt 2: Skript ausführen
Finde die gespeicherte .bat-Datei:

Navigiere zu dem Speicherort, an dem du die Datei gespeichert hast (z.B. Desktop).

Führe das Skript aus:

Doppelklicke auf die .bat-Datei, um das Skript auszuführen.

Ein Eingabeaufforderungsfenster wird geöffnet und das Skript wird ausgeführt.

Schritt 3: Ergebnisse überprüfen
Das Skript überprüft:

Angemeldete Benutzer und zeigt an, ob andere Benutzer aktiv sind.

Verdächtige Prozesse (cmd.exe und powershell.exe).

Unbekannte Benutzerkonten.

Die Ergebnisse werden im Eingabeaufforderungsfenster angezeigt.

Automatisches Ausführen beim Start (optional)
Kopiere die .bat-Datei in den Autostart-Ordner:


///
UVP
. Überprüfung auf verdächtige Prozesse
Ein Skript, das nach verdächtigen Prozessen sucht:

batch
@echo off
tasklist | findstr /i "cmd.exe powershell.exe"
if %errorlevel% equ 0 (
    echo Verdächtige Prozesse gefunden: cmd.exe oder powershell.exe
) else (
    echo Keine verdächtigen Prozesse gefunden.
)
pause

Drücke Win + R, gib shell:startup ein und drücke Enter.

Kopiere die .bat-Datei in den geöffneten Ordner.

Das Skript wird nun automatisch beim Starten deines Computers ausgeführt
