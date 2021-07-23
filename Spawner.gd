extends Node2D

var Spider = preload("res://Spider.tscn")
onready var timer = $Timer

export(NodePath) var target_path
export(NodePath) var entities_path

signal hit()
signal win()
signal score()

var time = 1.5

var start = 0

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
	[100, -30],
	[150, -30],
	[200, -30],
	[256, -30],
	[300, -30],
	[350, -30],
	[412, -30],
	[512, -30],
]

var target_pos = null


func _ready():
	randomize()
	target_pos = get_node(target_path).position
	timer.wait_time = time
	timer.start()
	start = OS.get_unix_time()
	
func _process(_delta):
	var current = OS.get_unix_time()
	if current - start > 20:
		start = current
		time = time - 0.2
		if time <= 0:
			emit_signal("win")


func get_random_pos():
	return random_pos[randi() % random_pos.size()]


func spawn():
	var spider = Spider.instance()
	get_node(entities_path).add_child(spider)
	var pos = get_random_pos()
	var rand_speed = (1 / time) * 80
	var speed = rand_range(rand_speed-20, rand_speed+20) + 40
	spider.init(Vector2(pos[0], pos[1]), target_pos, speed)
	var _signal = spider.connect("hit", self, "on_hit")
	var _signal2 = spider.connect("score", self, "on_score")


func on_hit():
	emit_signal("hit")


func on_score():
	emit_signal("score")
	

func _on_Timer_timeout():
	spawn()
