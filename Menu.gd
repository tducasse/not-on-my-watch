extends Control

onready var Box = $Box
onready var Title = $Title


func _on_Play_pressed():
	var dialog = Dialogic.start('main')
	Box.visible = false
	Title.visible = false
	add_child(dialog)
