@echo off
echo Building OSRSFishing.pck...

REM Update this path to point to your Godot executable
set GODOT_PATH="C:\Program Files\Godot\Godot_v3.5.1-stable_win64.exe"

REM Export the PCK file
%GODOT_PATH% --export-pack "PCK" OSRSFishing.pck --no-window --quit

REM Check if export was successful
if exist OSRSFishing.pck (
    echo Successfully created OSRSFishing.pck
    echo Moving PCK file to mod folder...
    copy OSRSFishing.pck ..\GDWeave\mods\OSRSFishing\
    echo Done!
) else (
    echo Failed to create PCK file.
    echo Make sure Godot is installed and the path is correct.
)

pause 