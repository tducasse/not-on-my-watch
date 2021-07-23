extends KinematicBody2D

var target_pos = null
var speed = null
onready var Anim = $AnimationPlayer
var stop = false

signal hit()
signal score()

func _ready():
	pass 


func init(spawn_pos, goal_pos, spd):
	position.x = spawn_pos.x
	position.y = spawn_pos.y
	target_pos = goal_pos
	speed = spd

func _process(delta):
	if not stop:
		position = position.move_toward(target_pos, delta * speed)
	if position.distance_to(target_pos) < 10:
		emit_signal("hit")
		queue_free()


func _on_Hurtbox_area_entered(_area):
	if Anim.current_animation == "death":
		return
	stop = true
	emit_signal("score")
	Anim.play("death")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "death":
		queue_free()
