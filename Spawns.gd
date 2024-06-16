extends Node2D

var mobLoader 
var spawnPoints

var p = 75

func _ready():  
	randomize()
	mobLoader = preload("res://mob.tscn") 
	spawnPoints = []
	
	for i in range(1, get_child_count()):
		spawnPoints.append(get_child(i))
	
	for i in  spawnPoints:	
		if( randf() * 100 <= p):
			spawnMob(i.position)
	
	setTimer()
	
func setTimer(): 
	$spawnTimer.set_wait_time(randf()* 5 + 10) 
	$spawnTimer.start()
		
func spawnMob(cor): 
	var currentMob = mobLoader.instantiate() 
	currentMob.position = cor
	get_parent().add_child.call_deferred(currentMob)

#get random spawnpoint and make sure there is no collision between wolfs spawning	
func getRandom(allReadySpawned):
	var sp = spawnPoints[ randi() % spawnPoints.size()]
	var try = 0
	
	while(allReadySpawned.find(sp) != -1) || try >= 10:
		sp = spawnPoints[ randi() % spawnPoints.size()]
		try += 1
	
	return sp

func spawnMobs(n):
	var allReadySpawned = []
	
	for i in range(0,n): 
		var sp = getRandom(allReadySpawned)
		allReadySpawned.append(sp)
		
		spawnMob(sp.position) 

func _on_spawn_timer_timeout(): 
	setTimer() 
	spawnMobs(2)
	
	 
	
