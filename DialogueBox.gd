extends Control

signal dialogue_finished
@onready var speaker_label = $Panel/VBoxContainer/SpeakerName
@onready var dialogue_label = $Panel/VBoxContainer/DialogueText
var dialogue_lines = []
var current_index = 0

func _ready():
	var test = [
		{"speaker": "kiki", "text": "hahaha"},
		{"speaker": "kiki", "text": "nounou il est gros"},
		{"speaker": "kiki", "text": "mais je l'aime"}
	]
	start_dialogue(test)


func start_dialogue(lines):
	if lines:
		dialogue_lines = lines
		current_index = 0
		visible = true
		next_line()
	

func next_line():
	if current_index < dialogue_lines.size():
		speaker_label.text = dialogue_lines[current_index]["speaker"]
		dialogue_label.text = dialogue_lines[current_index]["text"]
		current_index += 1
	else:
		dialogue_finished.emit()

func _input(event):
	if not visible:
		return
	if event is InputEventMouseButton and event.pressed:
		next_line()
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			next_line()
