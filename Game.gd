extends Node2D

var lives = 3
onready var Heart = $Lives/heart
onready var Heart2 = $Lives/heart2
onready var Heart3 = $Lives/heart3
onready var Score = $Score
onready var Bed = $Bed

var score = 0

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
	if lives > 0:
		lives-=1
		if lives < 3:
			Heart3.visible = false
		if lives < 2:
			Heart2.visible = false
		if lives < 1:
			Heart.visible = false
		return
	print("lost")


func _on_Spawner_win():
	print("win")


func _on_Spawner_score():
	score = score + 10
	Score.text = "Score: "+ str(score)
