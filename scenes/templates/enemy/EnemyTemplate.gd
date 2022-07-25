extends Area2D

#---------------------------Start of Variables-------------------------.!
var motion = Vector2()
#---------------------------End of Variables-------------------------.!
func _physics_process(delta):
	translate(motion*delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
