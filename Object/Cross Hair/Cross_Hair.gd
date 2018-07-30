extends Area2D

var target

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	global_position = get_global_mouse_position()

func set_state(state):
	$CollisionShape2D.disabled = state

func get_target():
	return target

func _on_Cross_Hair_body_entered(body):
	target = body
