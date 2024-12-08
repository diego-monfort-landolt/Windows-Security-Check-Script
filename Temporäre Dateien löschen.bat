@echo off
echo Lösche temporäre Dateien...

del /s /q %temp%\*
del /s /q C:\Windows\Temp\*

echo Temporäre Dateien gelöscht.
pause
