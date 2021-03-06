extends "res://Object/Bullet/Bullet.gd"

var target_speed = 0

func control(delta):
	#bullet course correction
	if moving:
		look_at(target)
	#bullet impact
	if get_distance(global_position,target) <= target_offset and moving:
		$AnimationPlayer.play("Impact")
		target_speed = 0
		moving = false
	#velocity
	liniear_velcoity = Vector2(target_speed,0).rotated(global_rotation)

	#trajectory calculation
func get_distance(current, target):
	var distance
	distance = abs(current.x-target.x)+abs(current.y-target.y)
	return distance

func bullet_course_offset(course):
	var distance = get_distance(global_position,course)
	course.x+=rand_range(-blt_x_offset-(distance/normalized_accuration),blt_x_offset)+(distance/normalized_accuration)
	randomize()
	course.y+=rand_range(-blt_y_offset-(distance/normalized_accuration),blt_y_offset)+(distance/normalized_accuration)
	return course

func _on_Area_of_impact_body_entered( body ):
	if body.has_method("do_damage"):
		body.do_damage(damage)

func set_target(point):
	target = bullet_course_offset(point)
	target_speed = speed
	moving = true
	
func set_accuration(acc):
	normalized_accuration = acc

func set_damage(dmg):
	damage = dmg

