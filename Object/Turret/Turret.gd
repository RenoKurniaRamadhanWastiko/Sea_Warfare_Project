extends Node2D

var target = Vector2()
export (PackedScene) var bullet 

func _ready():
	pass

func _process(delta):
	control(delta)

func control(delta):
	pass