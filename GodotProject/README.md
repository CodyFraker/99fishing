# OSRS Fishing Godot Project

This is the Godot project for the OSRS Fishing mod for Webfishing.

## Project Structure

- `main.gd` - The main script that will be loaded by GDWeave
- `main.tscn` - A simple scene that loads the main script
- `assets/fish/*.tres` - Resource files for each fish
- `assets/fish/images/*.png` - Fish images from OSRS

## Building the PCK File

### Using the Editor

1. Open this project in Godot (same version as Webfishing uses)
2. Go to Project > Export
3. Select the "PCK" preset
4. Click "Export PCK/ZIP"
5. Save as `OSRSFishing.pck`

### Using Scripts

We've included two scripts to help you build the PCK file:

- `build_pck.bat` - For Windows Command Prompt
- `build_pck.ps1` - For Windows PowerShell

Before running these scripts:

1. Edit the script and update the `GODOT_PATH` variable to point to your Godot executable
2. Run the script
3. The PCK file will be exported and copied to the mod folder

## Modifying Fish Resources

If you need to change any fish resources:

1. Edit the corresponding `.tres` file in `assets/fish/`
2. Rebuild the PCK file

## Final Steps

After building the PCK file:

1. Copy the PCK file to `GDWeave/mods/OSRSFishing/` in your Webfishing game directory
2. Make sure the `manifest.json` file is also in that directory
3. Launch Webfishing and check if the mod loads correctly 