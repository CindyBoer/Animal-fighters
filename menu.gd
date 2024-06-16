extends CanvasLayer


var currentCharacter

func _ready(): 
	currentCharacter = "kip"

func play(): 
	get_parent().play(currentCharacter) 


func _on_play_button_pressed():
	play()
	

func _on_select_kip_pressed():
	currentCharacter = "kip" 
	%selectKip.text = "Selected"
	%selectKoe.text = "Select"


func _on_select_koe_pressed():
	currentCharacter = "koe"
	%selectKip.text = "Select"
	%selectKoe.text = "Selected"
	
