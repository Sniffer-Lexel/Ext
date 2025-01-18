@echo off
:: Batch script to download multiple files to specific paths

:: Define paths and URLs
set "ghostmenu_path=C:\Windows\System32\GhostMenu.dll"
set "ghostmenu_url=https://raw.githubusercontent.com/Sniffer-Lexel/Ext/c76387227dc0f2c63e5c8e35e993d5f07af76754/GhostMenu.dll"

:: Download files using curl
curl -o "%ghostmenu_path%" "%ghostmenu_url%"
