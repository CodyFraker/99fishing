Write-Host "Packaging OSRS Fishing Mod..." -ForegroundColor Green

# Define directories
$modDir = "GDWeave\mods\OSRSFishing"
$outputZip = "OSRSFishing_Mod.zip"

# Check if the mod directory exists
if (!(Test-Path $modDir)) {
    Write-Host "Error: Mod directory not found at $modDir" -ForegroundColor Red
    exit 1
}

# Check if all necessary files exist
$requiredFiles = @(
    "$modDir\manifest.json",
    "$modDir\OSRSFishing.gd"
)

foreach ($file in $requiredFiles) {
    if (!(Test-Path $file)) {
        Write-Host "Error: Required file not found: $file" -ForegroundColor Red
        exit 1
    }
}

# Check if fish resources exist
$fishCount = (Get-ChildItem "$modDir\assets\fish\*.tres" -ErrorAction SilentlyContinue | Measure-Object).Count
if ($fishCount -eq 0) {
    Write-Host "Error: No fish resource files found in $modDir\assets\fish\" -ForegroundColor Red
    exit 1
}

# Check if fish images exist
$imageCount = (Get-ChildItem "$modDir\assets\fish\images\*.png" -ErrorAction SilentlyContinue | Measure-Object).Count
if ($imageCount -eq 0) {
    Write-Host "Error: No fish image files found in $modDir\assets\fish\images\" -ForegroundColor Red
    exit 1
}

# Create the zip file
Write-Host "Creating zip archive..." -ForegroundColor Yellow
try {
    Compress-Archive -Path $modDir -DestinationPath $outputZip -Force
    Write-Host "Successfully created $outputZip" -ForegroundColor Green
} catch {
    Write-Host "Error creating zip file: $_" -ForegroundColor Red
    exit 1
}

Write-Host "`nInstructions for installing the mod:" -ForegroundColor Cyan
Write-Host "1. Extract the contents of $outputZip to your Webfishing game directory"
Write-Host "2. Make sure the files end up in the GDWeave\mods\OSRSFishing directory"
Write-Host "3. Launch Webfishing to play with the mod!"
Write-Host "`nEnjoy your OSRS Fishing experience in Webfishing!" -ForegroundColor Green

Write-Host "`nPress any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") 