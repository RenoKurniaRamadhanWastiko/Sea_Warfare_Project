extends "res://Object/Ship/Ship.gd"

func control(delta):
	var body_rot_dir=0
	#ship rotation
	if Input.is_action_pressed("ui_left") and sailing:
		if current_speed<0:
			body_rot_dir -=0.75
		else:
			body_rot_dir -=1
	if Input.is_action_pressed("ui_right")and sailing:
		if current_speed<0:
			body_rot_dir +=0.75
		else:
			body_rot_dir +=1
	#ship velocity
	target_velocity = Vector2(0,0)
	target_speed = 0
	if int(abs(current_speed))<minimum_sailing_speed:
		sailing = false
	if Input.is_action_pressed('ui_up'):
		target_speed = speed
		sailing = true
	elif Input.is_action_pressed('ui_down'):
		target_speed = -speed/2
		sailing = true
	#engine
	current_speed = lerp(current_speed,target_speed,acceleration/100)
	target_velocity = Vector2(target_speed,0).rotated(rotation)
	velocity = velocity.linear_interpolate(target_velocity,acceleration/100)
	target_rot_speed = rotation_speed * (abs(current_speed)/speed)
	rotation +=target_rot_speed * body_rot_dir * delta

func do_damage(damage):
	print(damage)

