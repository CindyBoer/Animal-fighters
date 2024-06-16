extends AnimatedSprite2D

func play_walk_animation():
	#%AnimationPlayer.play("idle")
	self.set_animation("walk")
	play() 

func play_hit_animation(): 
	self.set_animation("hit") 
	play() 

