extends Area2D

var accum = 0
var motion = Vector2(800,0)

func _physics_process(delta):
	translate(motion*delta)

func _on_Visibility_screen_exited():
	accum+=1
	queue_free()
