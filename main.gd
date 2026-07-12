extends Node

var current_location = 0 	#enum de la location en cours
var current_turn = 0 		# a quel tour nous sommes
var current_scene = null 	#référence à la scène enfant active

const LOCATIONS = [
	"home",
	"sad_river",
	"broken_gate",
	"forgotten_river",
	"tavern",
	"burning_river",
	"prison",
	"crying_river",
	"hidden_door"
]

func _ready():
	pass

func go_to_next_location():
	current_location += 1
	if current_location >= LOCATIONS.size():
		current_location = 0
		current_turn += 1
	go_to_location(current_location)


func go_to_location(loc_index):
	for child in $SceneContainer.get_children():
		child.queue_free()
	var path = "res://scenes/" + LOCATIONS[loc_index] + ".tscn"
	var scene = load(path)
	var instance = scene.instantiate()
	current_scene = instance
	$SceneContainer.add_child(instance)
	instance.location_finished.connect(go_to_next_location)
