extends Area2D

var motion = Vector2(0,10)
var type_of_power : String

func _physics_process(delta):
	translate(motion*delta)

func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()

func _on_PowerTemplate_area_entered(area):
	if area.is_in_group("player"):
		self.queue_free()
