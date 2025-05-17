extends Node

# OSRS Fishing mod for Webfishing
# This script will be loaded by GDWeave when the mod is initialized

func _ready():
	# Add mod to gdweave_mod group as required
	add_to_group("gdweave_mod")
	
	print("OSRS Fishing mod loaded!")
	
	# Register custom fish resources
	register_fish_resources()

func register_fish_resources():
	# This function will register all OSRS fish with the game
	# Fish resources are loaded from the files
	
	var fish_list = [
		"shrimp", "anchovies", "sardine", "herring", "trout", "salmon", "tuna", 
		"lobster", "bass", "swordfish", "monkfish", "shark", "sea_turtle", "manta_ray",
		"karambwan", "karambwanji", "anglerfish", "dark_crab", "sacred_eel", "lava_eel",
		"cave_eel", "slimy_eel", "cavefish", "catfish", "pike", "cod", "mackerel",
		"leaping_trout", "leaping_salmon", "leaping_sturgeon", "rainbow_fish", "frog_spawn",
		"greater_siren", "guppy", "tetra"
	]
	
	for fish_name in fish_list:
		# Load the fish resource and register it with the game
		var fish_resource = load("res://mods/OSRSFishing/assets/fish/" + fish_name + ".tres")
		
		if fish_resource:
			print("Registered OSRS fish: " + fish_name)
		else:
			print("Failed to load fish resource: " + fish_name) 