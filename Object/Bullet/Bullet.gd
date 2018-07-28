extends KinematicBody2D

onready var parent = get_parent()

export(int) var speed = 200
export(float) var blt_x_offset = 10
export(float) var blt_y_offset = 10
export(float) var target_offset = 10
export(int) var damage = 10

var target  = Vector2()
var liniear_velcoity = Vector2()
var moving =  false

func _ready():
	set_physics_process(true)
	# Called every time the node is added to the scene.
	# Initialization here

func _physics_process(delta):
	control(delta)
	move_and_slide(liniear_velcoity)
	pass

func init_bullet(target_pos, target_dir):
	position = target_pos
	rotation = target_dir.angle()

func control(delta):
	pass

func set_target(point):
	pass

func set_damage(dmg):
	damage = dmg
	