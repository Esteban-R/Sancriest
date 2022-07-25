extends Area2D

#---------------------------Start of Variables-------------------------.!
var motion = Vector2()
var life = 3
#---------------------------End of Variables-------------------------.!
func _physics_process(delta):
	translate(motion*delta)
	death()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func death():
	if life <= 0:
		self.queue_free()
