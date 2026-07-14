extends Node2D

signal location_finished

var current_location = ""


func _ready():
	$DepartButton.pressed.connect(_on_depart_pressed)
	setup_port()
	
func setup_port():
	for child in $NPCContainer.get_children():
		child.queue_free()
	if GameData.PORT_DATA.has(current_location):
		for npc_name in GameData.PORT_DATA[current_location]["npcs"]:
			load_npc(npc_name)
	
func _on_depart_pressed():
	location_finished.emit()

func load_npc(npc_name):
	var scene = load("res://npc.tscn")
	var instance = scene.instantiate()
	instance.npc_name = npc_name
	$NPCContainer.add_child(instance)
	instance.npc_clicked.connect(_on_npc_clicked(npc_name))

func _on_npc_clicked(npc_name):
	var dialogues = GameData.NPC_DATA[npc_name]["dialogues"]
	var dialogue = dialogues[min(GameData.current_turn, dialogues.size() - 1)]
	$DialogueBox.start_dialogue(dialogue)
