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
       ) echo Überprüfe auf verdächtige Prozesse... tasklist | findstr /i "cmd.exe powershell.exe" 
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