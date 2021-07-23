extends Node2D

var lives = 3
onready var Heart = $Lives/heart
onready var Heart2 = $Lives/heart2
onready var Heart3 = $Lives/heart3
onready var Score = $Score
onready var Bed = $Bed
onready var Hurt = $Hurt
onready var Hit = $Hit
onready var GameOver = $GameOver
onready var Win = $Win
onready var Spawner = $Spawner

var score = 0

func ready():
	pause_mode = PAUSE_MODE_PROCESS
	GameOver.pause_mode = PAUSE_MODE_PROCESS
	Win.pause_mode = PAUSE_MODE_PROCESS
	Spawner.pause_mode = PAUSE_MODE_STOP


func blink():
	Bed.visible = false
	yield(get_tree().create_timer(0.07), "timeout")
	Bed.visible = true
	yield(get_tree().create_timer(0.07), "timeout")
	Bed.visible = false
	yield(get_tree().create_timer(0.07), "timeout")
	Bed.visible = true

func _on_Spawner_hit():
	blink()
	Hurt.play()
	if lives > 0:
		lives-=1
		if lives < 3:
			Heart3.visible = false
		if lives < 2:
			Heart2.visible = false
		if lives < 1:
			Heart.visible = false
		return
	get_tree().paused = true
	GameOver.popup_centered()


func _on_Spawner_win():
	get_tree().paused = true
	Win.popup_centered()


func _on_Spawner_score():
	Hit.play()
	score = score + 10
	Score.text = "Score: "+ str(score)


func _on_GameOver_back():
	get_tree().paused = false
	var _scene = get_tree().change_scene("res://Menu.tscn")


func _on_GameOver_reset():
	get_tree().paused = false
	var _reload = get_tree().reload_current_scene()


func _on_GameOver_custom_action(action):
	if action == "back":
		get_tree().paused = false
		_on_GameOver_back()
