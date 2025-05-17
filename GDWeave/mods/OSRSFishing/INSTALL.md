# Installing the OSRS Fishing Mod

This guide will help you install the OSRS Fishing mod for Webfishing without requiring Godot.

## Prerequisites

1. Make sure you have [GDWeave](https://thunderstore.io/c/webfishing/p/NotNet/GDWeave/) installed
2. Locate your Webfishing game directory

## Installation Steps

1. First, make sure GDWeave is installed in your Webfishing game directory
2. Create the following folder structure in your game directory:
   ```
   GDWeave/
     mods/
       OSRSFishing/
         assets/
           fish/
             images/
   ```

3. Copy the following files to their respective locations:
   - `manifest.json` → `GDWeave/mods/OSRSFishing/`
   - `OSRSFishing.gd` → `GDWeave/mods/OSRSFishing/`
   - All `.tres` files → `GDWeave/mods/OSRSFishing/assets/fish/`
   - All fish images (PNG files) → `GDWeave/mods/OSRSFishing/assets/fish/images/`

4. The directory structure should look like:
   ```
   GDWeave/
     mods/
       OSRSFishing/
         manifest.json
         OSRSFishing.gd
         assets/
           fish/
             shrimp.tres
             shark.tres
             ... (other fish files)
             images/
               shrimp.png
               shark.png
               ... (other fish images)
   ```

## Verifying the Installation

1. Launch Webfishing
2. If GDWeave is working correctly, you should see:
   - A message in the game console indicating "OSRS Fishing mod loaded!"
   - The OSRS fish should be available in the game

## Troubleshooting

If the mod doesn't work:

1. Make sure GDWeave is properly installed
2. Check that all file paths are correct
3. Verify that the file permissions allow the game to read the mod files
4. Look for any error messages in the GDWeave logs

## Uninstalling

To uninstall the mod, simply remove the `GDWeave/mods/OSRSFishing` directory. 