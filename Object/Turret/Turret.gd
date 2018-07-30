extends Node2D

const TURRET_LINING_MARGIN = 1.2

var target = Vector2()
var current_dir = Vector2()
var target_dir = Vector2()
var above_min = false

signal fire
signal cross_hair

export(float) var turret_speed = 1
export(float) var cannon_cooldown = 1
export(float) var normalized_accuration = 70
export(float) var minimum_range = 50
export(int) var damage = 10
export (PackedScene) var bullet 
export(PackedScene) var cross_hair

var cursor


func _ready():
	var world = get_parent().get_parent().get_parent()
	var ship = get_parent().get_parent()
	cursor = cross_hair.instance()
	$Cannon_cooldown.set_wait_time(cannon_cooldown)
	connect('fire',world,'on_shoot',[],1)
	connect('cross_hair',ship,'add_cross_hair',[],1)
	emit_signal('cross_hair',cursor)

func _process(delta):
	control(delta)

func control(delta):
	pass
