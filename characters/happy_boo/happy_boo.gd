extends AnimatedSprite2D

func play_idle_animation():
	#%AnimationPlayer.play("idle")
	self.set_animation("idle")
	play()


func play_walk_animation():
	#%AnimationPlayer.play("walk")
	self.set_animation("walk")
	play()
