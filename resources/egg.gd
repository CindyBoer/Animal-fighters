extends CharacterBody2D 

var direction = Vector2(0,1)
var speed = 0;


func _ready():
	pass
	
func _physics_process(delta):
	
	velocity = direction * speed 
	move_and_slide() 
	
	
func fire(direction, speed): 
	self.direction = direction.normalized()
	self.speed = speed


func splash():
	$EggBody.play_splash_animation() 
	$SplashTimer.start()
	speed  = 0;


func _on_area_2d_body_entered(body):
	splash()


func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	splash()


func _on_splash_timer_timeout():
	queue_free()  
	

