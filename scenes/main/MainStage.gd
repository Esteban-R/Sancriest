extends Node2D

enum GameLoop{GAMEMENU,INGAME,GAMEOVER}
var current_game = GameLoop.GAMEMENU

func _ready():
	OS.window_fullscreen = true
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		current_game = GameLoop.GAMEOVER
		
	if current_game==GameLoop.GAMEMENU:
		game_menu()
	elif current_game==GameLoop.INGAME:
		in_game()
	else:
		game_over()
		
func game_menu():
	pass
	
func in_game():
	pass
	
func game_over():
	get_tree().quit()
	
