Write-Host "Building OSRSFishing.pck..." -ForegroundColor Green

# Update this path to point to your Godot executable
$GODOT_PATH = "C:\Program Files\Godot\Godot_v3.5.1-stable_win64.exe"

# Check if Godot exists
if (!(Test-Path $GODOT_PATH)) {
    Write-Host "Godot executable not found at $GODOT_PATH" -ForegroundColor Red
    Write-Host "Please update the path in this script to point to your Godot installation." -ForegroundColor Yellow
    Pause
    exit 1
}

# Export the PCK file
Write-Host "Exporting PCK file using Godot..." -ForegroundColor Yellow
& $GODOT_PATH --export-pack "PCK" OSRSFishing.pck --no-window --quit

# Check if export was successful
if (Test-Path "OSRSFishing.pck") {
    Write-Host "Successfully created OSRSFishing.pck" -ForegroundColor Green
    Write-Host "Moving PCK file to mod folder..." -ForegroundColor Yellow
    Copy-Item "OSRSFishing.pck" -Destination "..\GDWeave\mods\OSRSFishing\" -Force
    Write-Host "Done!" -ForegroundColor Green
} else {
    Write-Host "Failed to create PCK file." -ForegroundColor Red
    Write-Host "Make sure Godot is installed and the path is correct." -ForegroundColor Yellow
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") 