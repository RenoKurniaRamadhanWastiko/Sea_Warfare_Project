extends KinematicBody2D

export(int) var speed
export(int) var hull
export(float) var rotation_speed = 1.1
export(float)var acceleration = 10.0

var velocity = Vector2()
var target_velocity = Vector2()
var target_rot_speed = 0
var current_speed = 0
var target_speed
var minimum_sailing_speed = 0
var sailing = false


func _ready():
	minimum_sailing_speed = speed/10
	
	pass

func _process(delta):
	control(delta)
	move_and_slide(velocity)
	pass

func control(delta):
	pass

func do_damage(damage):
	pass

func add_cross_hair(cursor):
	pass