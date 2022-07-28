extends Area2D

#---------------------------Start of Variables-------------------------.!
var motion = Vector2()
var life : int = 3
var player_score : int = 10
#---------------------------End of Variables-------------------------.!
func _physics_process(delta):
	translate(motion*delta)
	death()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func death():
	if life <= 0:
		Utils.main_node.get_node("Hud").set_game_information("score",player_score)
		self.queue_free()
