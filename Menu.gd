extends Control

onready var Box = $Box
onready var Title = $Title
onready var TitleColor = $TitleColor
onready var ButtonColor = $ButtonColor


func _on_Play_pressed():
	var dialog = Dialogic.start('main')
	Box.visible = false
	Title.visible = false
	TitleColor.visible = false
	ButtonColor.visible = false
	add_child(dialog)
