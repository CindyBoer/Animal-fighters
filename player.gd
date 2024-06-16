extends CharacterBody2D

signal game_over 
signal quit

var bullet

var last_direction = Vector2(0, 1)

var canShoot = true

func selectSprite(option):
	
	if option == "kip": 
		$KipStaand.sprite_frames = ResourceLoader.load("res://resources/kipAni.tres")
	if option == "koe":
		$KipStaand.sprite_frames = ResourceLoader.load("res://resources/koeAni.tres")

func fire(): 
	
	if !canShoot:
		return
		
	var currentBullet = bullet.instantiate()
	currentBullet.position = self.position
	get_parent().add_child(currentBullet)
	currentBullet.fire(last_direction, 800)
	canShoot = false;
	$ShootTimeout.start()
	

func _ready():
	bullet = preload("res://resources/egg.tscn")
	self.selectSprite("koe")
	
	
func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", 
	"move_up", "move_down").normalized()
	update_direction(direction)
	velocity = direction * 600;
	move_and_slide()
	
	
	if(Input.is_action_just_pressed("fire")):
		self.fire()
	
	if velocity.length() > 0.0:
		$KipStaand.play_walk_animation()
	else: 
		$KipStaand.play_idle_animation() 
		
func update_direction(direction): 
	if direction != Vector2(0,0): 
		last_direction = direction 

func _on_shoot_timeout_timeout():
	canShoot = true;

func _on_hitbox_body_entered(body):
	emit_signal("game_over") 

func _on_quit_pressed():
	emit_signal("quit")
