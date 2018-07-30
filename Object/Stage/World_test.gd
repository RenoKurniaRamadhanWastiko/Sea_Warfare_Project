extends Node2D


func on_shoot(Bullet,pos,dir):
	add_child(Bullet)
	Bullet.init_bullet(pos,dir,get_global_mouse_position())
