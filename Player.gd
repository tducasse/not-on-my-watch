extends KinematicBody2D

onready var Anim = $Anim
onready var MoveAnim = $MoveAnim

var velocity = Vector2.ZERO
var speed = 200
var sprite_offset = 7

func _ready():
	Anim.position.x = sprite_offset
	Anim.flip_h = true

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		Anim.stop()
		Anim.frame = 0
		Anim.play()
	else:
		velocity = Vector2.ZERO
		if Input.is_action_pressed('right'):
			velocity.x += 1 * delta
			Anim.flip_h = true
			if(Anim.position.x < 0):
				Anim.position.x = sprite_offset
		if Input.is_action_pressed('left'):
			velocity.x -= 1 * delta
			Anim.flip_h = false
			if(Anim.position.x > 0):
				Anim.position.x = -sprite_offset
		if Input.is_action_pressed('down'):
			velocity.y += 1 * delta
		if Input.is_action_pressed('up'):
			velocity.y -= 1 * delta
		velocity = velocity.normalized() * speed
	if velocity != Vector2.ZERO:
		MoveAnim.play("move")
	else:
		if MoveAnim.is_playing():
			MoveAnim.stop()
			MoveAnim.seek(0, true)
	velocity = move_and_slide(velocity)