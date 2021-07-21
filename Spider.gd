extends KinematicBody2D

var target_pos = null
var speed = 100

func _ready():
	pass 


func init(spawn_pos, goal_pos):
	position.x = spawn_pos.x
	position.y = spawn_pos.y
	target_pos = goal_pos

func _process(delta):
	position = position.move_toward(target_pos, delta * speed)
