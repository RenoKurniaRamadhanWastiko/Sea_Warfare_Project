extends Node2D

const TURRET_LINING_MARGIN = 0.7

var target = Vector2()
var current_dir = Vector2()
var target_dir = Vector2()


export(int) var turret_speed
export(int) var cannon_cooldown = 1

export (PackedScene) var bullet 

func _ready():
	$Cannon_cooldown.set_wait_time(cannon_cooldown)
	pass

func _process(delta):
	control(delta)

func control(delta):
	pass