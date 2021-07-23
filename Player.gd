extends KinematicBody2D

onready var Anim = $Anim
onready var MoveAnim = $MoveAnim
onready var Hitbox = $Anim/Hitbox/CollisionShape2D

var velocity = Vector2.ZERO
var speed = 180
var sprite_offset = 7
var attacking = false

func _ready():
	Anim.position.x = sprite_offset
	Anim.flip_h = true
	Anim.frame = 0
	Hitbox.disabled = true

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		Anim.stop()
		Hitbox.disabled = false
		Anim.frame = 0
		Anim.play()
		attacking = true
	else:
		velocity = Vector2.ZERO
		if Input.is_action_pressed('right'):
			velocity.x += 1 * delta
			Anim.flip_h = true
			if(Anim.position.x < 0):
				Anim.position.x = sprite_offset
				Hitbox.position.x = Anim.position.x + sprite_offset * 2
		if Input.is_action_pressed('left'):
			velocity.x -= 1 * delta
			Anim.flip_h = false
			if(Anim.position.x > 0):
				Anim.position.x = -sprite_offset
				Hitbox.position.x = -sprite_offset
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
	if not attacking:
		velocity = move_and_slide(velocity)


func _on_Anim_animation_finished():
	Hitbox.disabled = true
	attacking = false

