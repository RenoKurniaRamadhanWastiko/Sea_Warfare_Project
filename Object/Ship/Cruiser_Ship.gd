extends "res://Object/Ship/Ship.gd"

func control(delta):
	var body_rot_dir=0
	
	if Input.is_action_pressed("ui_left"):
		body_rot_dir -=1
	if Input.is_action_pressed("ui_right"):
		body_rot_dir +=1
	rotation +=rotation_speed * body_rot_dir * delta
	
	velocity = Vector2()
	var target_speed = 0
	if Input.is_action_pressed('ui_up'):
		target_speed = speed
	if Input.is_action_pressed('ui_down'):
		target_speed = -speed/2
	velocity.x = target_speed
	velocity = velocity.rotated(rotation)

func do_damage(damage):
	print(damage)

