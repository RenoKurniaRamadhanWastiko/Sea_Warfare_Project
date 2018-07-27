extends "res://Object/Turret/Turret.gd"

var can_shoot = true

func control(delta):
	$Turret_Texture.look_at(get_global_mouse_position())
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_shoot:
		var munition = bullet.instance()
		var sec_munition = bullet.instance()
		#first bullet
		$Bullet.add_child(munition)
		munition.rotation = $Turret_Texture.rotation
		munition.set_target(get_global_mouse_position())
		munition.position = $Turret_Texture/Muzzle.position.rotated($Turret_Texture.rotation)
		#second bullet
		$Bullet.add_child(sec_munition)
		sec_munition.rotation = $Turret_Texture.rotation
		sec_munition.set_target(get_global_mouse_position())
		sec_munition.position = $Turret_Texture/MuzzleB.position.rotated($Turret_Texture.rotation)
		can_shoot = false
		$Cannon_cooldown.start()

func _on_Cannon_cooldown_timeout():
	$Cannon_cooldown.stop()
	can_shoot = true
