#!/usr/bin/env python3
"""
OSRS Fish Resource Converter

This script helps convert fish resource files to the correct format for the OSRS Fishing mod.
It updates the image paths and can set OSRS-specific descriptions.

Usage:
    python convert_fish_resources.py path/to/input/fish path/to/output/fish
"""

import os
import sys
import re

# OSRS fish descriptions (add more as needed)
FISH_DESCRIPTIONS = {
    "shrimp": "A small, pink crustacean caught at low levels.",
    "anchovies": "Tiny, silvery fish caught at low levels.",
    "sardine": "A small, common fish caught at low levels.",
    "herring": "A small, silver-colored fish.",
    "trout": "A medium-sized freshwater fish.",
    "salmon": "A medium-sized freshwater fish with pinkish flesh.",
    "tuna": "A large ocean fish prized for its meat.",
    "lobster": "A large crustacean with powerful claws.",
    "bass": "A medium-sized fish found in various waters.",
    "swordfish": "A large predatory fish with a distinctive sword-like bill.",
    "monkfish": "An ugly but tasty deepwater fish.",
    "shark": "A dangerous predatory fish with sharp teeth.",
    "sea_turtle": "A rare aquatic reptile with a hard shell.",
    "manta_ray": "A large, flat sea creature that glides through the water.",
    "karambwan": "A poisonous octopus-like creature used in potions.",
    "karambwanji": "A tiny bait fish used to catch karambwan.",
    "anglerfish": "A rare fish that can heal based on your Hitpoints level.",
    "dark_crab": "A rare crustacean found in the Wilderness.",
    "sacred_eel": "A mysterious eel found in Zul-Andra.",
    "lava_eel": "A fiery eel that can somehow survive in lava.",
    "cave_eel": "An eel adapted to the darkness of underground caves.",
    "slimy_eel": "A slippery eel found in murky swamps.",
    "cavefish": "A fish adapted to life in underground lakes.",
    "catfish": "A whiskered fish found in muddy waters.",
    "pike": "A predatory freshwater fish with a long body.",
    "cod": "A common whitefish found in northern waters.",
    "mackerel": "A fast-swimming fish found in schools.",
    "leaping_trout": "A trout with exceptional jumping abilities.",
    "leaping_salmon": "A salmon that can leap up waterfalls.",
    "leaping_sturgeon": "A large prehistoric fish known for its jumping ability.",
    "rainbow_fish": "A colorful fish with scales that shimmer like a rainbow.",
    "frog_spawn": "The eggs of frogs, found in shallow ponds.",
    "greater_siren": "A large, eel-like amphibian found in murky waters.",
    "guppy": "A small, colorful tropical fish.",
    "tetra": "A small, brightly colored tropical fish."
}

def convert_fish_resource(input_file, output_dir, fish_name):
    """Convert a single fish resource file to the new format."""
    try:
        # Try reading with UTF-8 encoding first
        with open(input_file, 'r', encoding='utf-8') as f:
            content = f.read()
    except UnicodeDecodeError:
        # If that fails, try with latin-1 which should handle all byte values
        try:
            with open(input_file, 'r', encoding='latin-1') as f:
                content = f.read()
        except Exception as e:
            print(f"Error reading {fish_name}.tres: {e}")
            return
    
    # Update the image path
    content = re.sub(r'\[ext_resource path=".*?" type="Texture"', 
                   f'[ext_resource path="res://mods/OSRSFishing/assets/fish/images/{fish_name}.png" type="Texture"', 
                   content)
    
    # Update the description if available
    if fish_name in FISH_DESCRIPTIONS:
        content = re.sub(r'item_description = ".*?"', 
                       f'item_description = "{FISH_DESCRIPTIONS[fish_name]}"', 
                       content)
    
    # Write the output file
    output_file = os.path.join(output_dir, f"{fish_name}.tres")
    os.makedirs(os.path.dirname(output_file), exist_ok=True)
    
    try:
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Converted {fish_name}.tres")
    except Exception as e:
        print(f"Error writing {fish_name}.tres: {e}")

def main():
    if len(sys.argv) != 3:
        print(__doc__)
        sys.exit(1)
    
    input_dir = sys.argv[1]
    output_dir = sys.argv[2]
    
    # Create output directory if it doesn't exist
    os.makedirs(output_dir, exist_ok=True)
    
    # Process all fish resource files
    for filename in os.listdir(input_dir):
        if filename.endswith(".tres"):
            fish_name = os.path.splitext(filename)[0]
            input_file = os.path.join(input_dir, filename)
            convert_fish_resource(input_file, output_dir, fish_name)
    
    print(f"All fish resources converted to {output_dir}")

if __name__ == "__main__":
    main() 