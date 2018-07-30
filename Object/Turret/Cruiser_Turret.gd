extends "res://Object/Turret/Turret.gd"

var can_shoot = true
var lining_up = false
var aiming = false
var cannon_locked = true



func control(delta):
	
	#toggle aiming
	if Input.is_action_just_pressed("ui_accept"):
		if aiming == true:
			aiming = false
			cannon_locked = true
		elif aiming == false:
			aiming = true
			cannon_locked = false
	aim_turret(delta)
	trajectory_correction()
	var in_target_range = in_range()

	#Trigger
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_shoot and lining_up and not cannon_locked and in_target_range:
		var munition = bullet.instance()
		var sec_munition = bullet.instance()
		var direction
		var target_pos
		#first bullet
		munition.set_damage(damage)
		munition.set_accuration(normalized_accuration)
		target_pos = $Turret_Texture/Muzzle.global_position
		direction = Vector2(1,0).rotated($Turret_Texture.global_rotation)
		emit_signal('fire',munition,target_pos,direction)
		#second bullet
		sec_munition.set_damage(damage)
		sec_munition.set_accuration(normalized_accuration)
		target_pos = $Turret_Texture/MuzzleB.global_position
		direction = Vector2(1,0).rotated($Turret_Texture.global_rotation)
		emit_signal('fire',sec_munition,target_pos,direction)
		can_shoot = false
		$Cannon_cooldown.start()

func _on_Cannon_cooldown_timeout():
	$Cannon_cooldown.stop()
	can_shoot = true

#can shoot when the turret lining up to the target
func trajectory_correction():
	var distance_lining
	distance_lining = abs(current_dir.x-target_dir.x)+abs(current_dir.y-target_dir.y)*15
	if distance_lining<=TURRET_LINING_MARGIN:
		lining_up = true
	else:
		lining_up = false

func aim_turret(delta):
	#Turret Aiming
	if aiming:
		cursor.show()
		cursor.set_state(false)
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		target_dir = (get_global_mouse_position() - self.global_position).normalized()
		current_dir = Vector2(1,0).rotated($Turret_Texture.global_rotation)
		$Turret_Texture.global_rotation = current_dir.linear_interpolate(target_dir,turret_speed*delta).angle()
	elif not aiming:
		cursor.hide()
		cursor.set_state(true)
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func in_range():
	var distance = abs(global_position.x-get_global_mouse_position().x)+abs(global_position.y-get_global_mouse_position().y)
	if distance>minimum_range:
		return true
	else:
		return false
	
