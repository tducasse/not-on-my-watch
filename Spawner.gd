extends Node2D

var Spider = preload("res://Spider.tscn")
onready var timer = $Timer

export(NodePath) var target_path

var time = 0.5

# 512x288
var random_pos = [
	[530, 140],
	[530, 180],
	[530, 210],
	[530, 240],
	[530, 250],
	[530, 260],
	[530, 280],
	[-30, 140],
	[-30, 180],
	[-30, 210],
	[-30, 250],
	[-30, 260],
	[-30, 270],
	[-30, 280],
	[0, 300],
	[100, 300],
	[150, 300],
	[200, 300],
	[256, 300],
	[300, 300],
	[350, 300],
	[412, 300],
	[512, 300],
]

var target_pos = null


func _ready():
	randomize()
	target_pos = get_node(target_path).position
	timer.wait_time = time
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
