@echo off
setlocal

echo Removing Arobas Music registry key...
reg delete "HKEY_CURRENT_USER\SOFTWARE\Arobas Music" /f >nul 2>&1

echo Removing Local AppData folder...
rmdir /s /q "C:\Users\nikob\AppData\Local\Arobas Music" 2>nul

echo Removing Roaming AppData folder...
rmdir /s /q "C:\Users\nikob\AppData\Roaming\Arobas Music" 2>nul

echo Done. Guitar Pro 8 config has been reset.
pause
