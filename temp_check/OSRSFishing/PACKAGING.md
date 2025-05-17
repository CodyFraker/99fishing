# Packaging the OSRS Fishing Mod

This document explains how to package the OSRS Fishing mod for distribution.

## Prerequisites

1. Godot Engine (same version as Webfishing uses)
2. Python 3.x (for running the conversion script)
3. All fish images saved from OSRS Wiki

## Step 1: Prepare Fish Resources

1. Run the conversion script to update all fish resource files:
   ```bash
   python tools/convert_fish_resources.py path/to/original/fish GDWeave/mods/OSRSFishing/assets/fish
   ```

2. Make sure all fish images are saved in the `GDWeave/mods/OSRSFishing/assets/fish/images` directory.

## Step 2: Create the Godot Project

1. Create a new Godot project with the same version as Webfishing.
2. Copy all the files from `GDWeave/mods/OSRSFishing` into your project.
3. Make sure the file structure looks like:
   ```
   project/
     assets/
       fish/
         images/
           *.png
         *.tres
     main.gd
   ```

4. The `main.gd` script should be at the project root.

## Step 3: Export the PCK File

1. In Godot, go to Project > Export.
2. Add a PCK/ZIP export preset.
3. Configure the export:
   - Export Path: `OSRSFishing.pck`
   - Export Mode: Export resources
   - Include filter: `*.gd,*.tres,assets/*`
4. Click "Export PCK/ZIP" and save the file.

## Step 4: Package the Mod for Distribution

1. Create a folder structure that matches the Thunderstore requirements:
   ```
   GDWeave/
     mods/
       OSRSFishing/
         manifest.json
         OSRSFishing.pck
   manifest.json (Thunderstore manifest)
   icon.png
   README.md
   ```

2. Make sure the Thunderstore manifest includes:
   ```json
   {
     "name": "OSRSFishing",
     "version_number": "1.0.0",
     "website_url": "https://github.com/yourusername/OSRSFishing",
     "description": "Adds Old School RuneScape inspired fishing to Webfishing",
     "dependencies": [
       "NotNet-GDWeave-1.0.0"
     ]
   }
   ```

3. Zip the entire folder and upload to Thunderstore or distribute manually.

## Testing the Mod

1. Install GDWeave in your Webfishing game directory.
2. Copy the `GDWeave/mods/OSRSFishing` folder to your game's `GDWeave/mods` directory.
3. Launch the game and check if the mod is loaded. 