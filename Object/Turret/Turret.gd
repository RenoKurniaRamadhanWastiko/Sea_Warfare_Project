extends Node2D

const TURRET_LINING_MARGIN = 1.2

var target = Vector2()
var current_dir = Vector2()
var target_dir = Vector2()
var above_min = false

signal fire

export(float) var turret_speed = 1
export(float) var cannon_cooldown = 1
export(float) var normalized_accuration = 70
export(float) var minimum_range = 50

export (PackedScene) var bullet 

func _ready():
	var world = get_parent().get_parent().get_parent()
	$Cannon_cooldown.set_wait_time(cannon_cooldown)
	connect('fire',world,'on_shoot')
	pass

func _process(delta):
	control(delta)

func control(delta):
	pass