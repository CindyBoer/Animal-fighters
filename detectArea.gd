extends Area2D

@export var dir : Vector2

func getDir():
	return dir.normalized();
