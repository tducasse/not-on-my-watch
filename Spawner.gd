extends Node2D

var Spider = preload("res://Spider.tscn")
onready var timer = $Timer

export(NodePath) var target_path

var time = 2.0

var random_pos = [
	[100, 100]
]

var target_pos = null


func _ready():
	randomize()
	target_pos = get_node(target_path).position
	timer.start()


func get_random_pos():
	return random_pos[randi() % random_pos.size()]


func spawn():
	var spider = Spider.instance()
	add_child(spider)
	var pos = get_random_pos()
	spider.init(Vector2(pos[0], pos[1]), target_pos)


func _process(_delta):
	pass

func _on_Timer_timeout():
	spawn()
