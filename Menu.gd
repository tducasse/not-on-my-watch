extends Control

onready var Play = $Play

#onready var UI = $VBoxContainer
#onready var Credits = $Credits
#onready var CreditsDialog = $CreditsDialog
#onready var BackgroundMusic = $BackgroundMusic
#onready var DialogMusic = $DialogMusic

#func _on_Credits_pressed():
#	CreditsDialog.popup_centered()


func _on_Play_pressed():
#	BackgroundMusic.stop()
#	DialogMusic.play()
#	UI.visible = false
#	Credits.visible = false
	var dialog = Dialogic.start('main')
	Play.visible = false
	add_child(dialog)
