extends AnimatedSprite2D

func play_splash_animation():
	#%AnimationPlayer.play("idle")
	self.set_animation("splash")
	play() 

func play_default_animation():
	#%AnimationPlayer.play("idle")
	self.set_animation("default")
	play()
