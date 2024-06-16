extends CharacterBody2D 

@export var speed : int = 100
@export var MAX_DISTANCE : int = 300 


var direction : Vector2 = Vector2(0, 0)
var distance : int = 0;


func _ready():
	randomize()
	$AnimatedSprite2D.play_walk_animation()
	direction = getDirection()

func _physics_process(delta):
	if(distance >= MAX_DISTANCE):
		distance = 0
		direction = getDirection()

	if $treeDetect.isColliding(direction):
		direction = getDirection()
	velocity = direction * speed 
	distance += velocity.length() * delta
	move_and_slide() 

func getDirection():
		var validDirs = $treeDetect.validDirections()
		var res = validDirs[randi() % validDirs.size()]
		return res  
		
func _on_hitbox_body_entered(body):
	dead()

func dead(): 
	$AnimatedSprite2D.play_hit_animation()
	$deadTimer.start() 
	speed = 0

func _on_dead_timer_timeout():
	queue_free()  

