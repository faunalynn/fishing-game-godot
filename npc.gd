extends Node2D

signal npc_clicked(npc_name)

var npc_name = ""

func _ready():
	$Area2D.input_event.connect(_on_clicked)
	

func _on_clicked(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		npc_clicked.emit(npc_name)
