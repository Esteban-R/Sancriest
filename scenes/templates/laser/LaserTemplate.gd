extends Area2D

var motion = Vector2(800,0)

func _physics_process(delta):
	translate(motion*delta)

func _on_Visibility_screen_exited():
	queue_free()

func _on_LaserTemplate_area_entered(area):
	if area.is_in_group("enemy"):
		area.life-=1
		self.queue_free()
		
