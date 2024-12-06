@echo off 
tasklist | findstr /i "cmd.exe powershell.exe" 
if %errorlevel% equ 0 (
   echo Verdächtige Prozesse gefunden: cmd.exe oder powershell.exe 
   ) else ( 
    echo Keine verdächtigen Prozesse gefunden. 
    ) 
  pause