extends Node

var gameLoader = null
var currentGame = null 

func _ready(): 
	$Game_over.hide() 
	gameLoader = preload("res://survivors_game.tscn")
	
	
func _game_over(): 
	$Game_over.show() 
	currentGame.queue_free()
	currentGame = null  
	
	
func play(character): 
	currentGame = gameLoader.instantiate()
	add_child(currentGame)
	var player = get_node("Game/Player") 
	player.game_over.connect(_game_over)
	player.quit.connect(_quit)
	currentGame.setCharacter(character)
	$Menu.hide()
	
func restart(): 
	$Menu.show()
	$Game_over.hide()

func _quit():
	currentGame.queue_free()
	currentGame = null 
	$Menu.show() 
	

