extends CanvasLayer
#---------------------------Start of Variables-------------------------.!
onready var main_buttons = $Control/MainMenuButtons
onready var score = $Control/GameInformation/ScoreLabel
onready var countdown = $Control/GameLevel/NextLevelLabel
onready var level = $Control/GameLevel/LevelLabel

signal new_game

var total_score : int
#---------------------------End of Variables-------------------------.!
func _on_ButtonPlay_pressed():
	main_buttons.hide()
	$Control/GameTitle.hide()
	$Control/Decoration.hide()
	
	show_text("GET READY.!")
	yield(get_tree().create_timer(3),"timeout")
	$Control/GameInformation.show()
	hide_text()
	emit_signal("new_game")
	

func _on_ButtonQuit_pressed():
	get_tree().quit()
	
func show_text(text):
	$Control/MainMessage.text = text
	$Control/MainMessage.show()
	
func hide_text():
	$Control/MainMessage.hide()
	
func set_game_information(type,value):
	match type:
		"score":
			total_score+=value
			score.text = str(total_score)
		"countdown":
			countdown.text = str("NEXT LEVEL","\n",value)
		"level":
			level.text = str("LEVEL","\n",value)
