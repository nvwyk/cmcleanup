@echo off
title Cleanup Script

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrator privileges.
    echo Please run the script as an administrator.
    pause
    exit /b
)

set "currentUser=%username%"
set "folders=C:\Users\%currentUser%\.cmclient;C:\Users\%currentUser%\AppData\Local\Temp;C:\Windows\Temp;C:\Users\%currentUser%\AppData\Roaming\.minecraft\assets;C:\Users\%currentUser%\AppData\Roaming\.minecraft\libraries;C:\Users\%currentUser%\AppData\Roaming\.minecraft\logs"

for %%i in (%folders%) do (
    echo Cleaning %%i
    rd /s /q "%%i" 2>nul
    mkdir "%%i"
)

echo.
echo Cleanup completed. CMClient developer team.
echo.
pause
