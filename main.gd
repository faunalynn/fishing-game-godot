extends Node

var current_location = 0 	#enum de la location en cours
var current_turn = 0 		# a quel tour nous sommes
var current_scene = null 	#référence à la scène enfant active

func _ready():
	go_to_location(current_location)

func go_to_next_location():
	current_location += 1
	if current_location >= GameData.LOCATIONS.size():
		current_location = 0
		current_turn += 1
	go_to_location(current_location)


func go_to_location(loc_index):
	for child in $SceneContainer.get_children():
		child.queue_free()
	var path = "res://scenes/" + GameData.LOCATIONS[loc_index] + ".tscn"
	var scene = load(path)
	var instance = scene.instantiate()
	instance.current_location = GameData.LOCATIONS[loc_index]
	current_scene = instance
	$SceneContainer.add_child(instance)
	instance.location_finished.connect(go_to_next_location)
