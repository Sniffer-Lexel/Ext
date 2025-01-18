@echo off
start "" C:\Windows\System32\sccp.exe

:waitForClose
timeout /t 1 /nobreak >nul
tasklist | find /i "sccp.exe" >nul
if errorlevel 1 (
    del /f C:\Windows\System32\sccp.exe
    echo sccp.exe has been closed and deleted.
) else (
    goto waitForClose
)
