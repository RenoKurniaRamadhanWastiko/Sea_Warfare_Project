extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
#dont change this script!
func do_damage(damage):
	var dmg = int(0.6*damage)
	get_parent().do_damage(dmg)