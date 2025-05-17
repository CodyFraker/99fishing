extends Node

# OSRS Fishing mod for Webfishing
# This script will be loaded by GDWeave

const ID = "ShrimpPoboy.99Fishing"
onready var Lure = get_node("/root/SulayreLure")

func _ready():
	# Add mod to gdweave_mod group as required
	add_to_group("gdweave_mod")
	
	pass #print#("OSRS Fishing mod loaded!")
	register_fish_resources()

func register_fish_resources():
	
	
	var fish_list = [
		"shrimp", "anchovies", "sardine", "herring", "trout", "salmon", "tuna", 
		"lobster", "bass", "swordfish", "monkfish", "shark", "sea_turtle", "manta_ray",
		"karambwan", "karambwanji", "anglerfish", "dark_crab", "sacred_eel", "lava_eel",
		"cave_eel", "slimy_eel", "cavefish", "catfish", "pike", "cod", "mackerel",
		"leaping_trout", "leaping_salmon", "leaping_sturgeon", "rainbow_fish", "frog_spawn",
		"greater_siren", "guppy", "tetra"
	]
	
	for fish_name in fish_list:
		var resource_path = "mod://Resources/" + fish_name + ".tres"
		Lure.add_content(ID, fish_name, resource_path)
		pass #print#("Registered OSRS fish: " + fish_name) 
