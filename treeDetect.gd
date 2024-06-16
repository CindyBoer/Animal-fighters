extends Node2D

var detectAreas = []

func _ready():
	detectAreas = get_children() 

func isColliding(currentDir):
	return validDirections().find(currentDir) == -1

func validDirections(): 
	var res = []
	for i in detectAreas: 
		if i.get_overlapping_bodies().size() <= 0: 
			res.append(getDirection(i))
	if(res.size() <= 0):
		res = [Vector2(0, 0)]
	
	return res
			
func getDirection(entity):
	return entity.getDir()
	
