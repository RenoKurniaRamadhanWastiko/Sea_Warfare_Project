extends KinematicBody2D

export(int) var speed
export(int) var hull
export(float) var rotation_speed = 1.1

var velocity = Vector2()

func _ready():
	pass

func _process(delta):
	control(delta)
	move_and_slide(velocity)
	pass

func control(delta):
	pass

func do_damage(damage):
	pass