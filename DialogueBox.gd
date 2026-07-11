extends Control

var dialogue_lines = []
var current_index = 0

func _ready():
	pass

func start_dialogue(lines):
	if lines:
		dialogue_lines = lines
	current_index = 0
	visible = true
	next_line()
	

func next_line():
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		next_line()
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			next_line()
