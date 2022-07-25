extends Area2D

#---------------------------Start of Variables-------------------------.!
var motion = Vector2()
var speed : int = 10

var life = 3

var maximum_rotation : float = 0.45
var speed_rotation : float = 0.035

export (Color) var color
var change_tam : int = 64

var scene_blue_laser = preload("res://scenes/weapons/player/blue_shot/BlueShot.tscn")

var can_shot : bool = true
#---------------------------End of Variables-------------------------.!
func _physics_process(delta):
	movement(delta)
	default_shot()
	death()
	new_mechanics()
#---------------------------start of Functions-------------------------.!
func movement(frame_time) -> void:
	if Input.is_action_pressed("ui_right"):
		motion.x += speed
	if Input.is_action_pressed("ui_left"):
		motion.x -= speed
	if Input.is_action_pressed("ui_up"):
		motion.y -= speed
		rotation = max(rotation-speed_rotation,-maximum_rotation)
	if Input.is_action_pressed("ui_down"):
		motion.y += speed
		rotation = min(rotation+speed_rotation,maximum_rotation)
	
	position.x = clamp(position.x,50,Utils.screen_size.x-50)
	position.y = clamp(position.y,50,Utils.screen_size.y-50)
	
	motion.x = lerp(motion.x, 0, 0.05)
	motion.y = lerp(motion.y, 0, 0.05)
	rotation = lerp(rotation, 0, 0.1)
	
	#Animation Idle.!
	if motion.length()>=0 && motion.length()<1:
		$Animation.play("idle")
	else:
		$Animation.stop()

	position+=motion*frame_time

func default_shot() -> void:
	if Input.is_action_just_pressed("ui_select") && can_shot:
		
		var blue_shot = scene_blue_laser.instance()
			
		if rotation_degrees >= 6:
			$CannonOne.position = Vector2(560,170)
			blue_shot.rotation_degrees = 40
			blue_shot.motion = Vector2(800,800)
		elif rotation_degrees <= -6:
			$CannonOne.position = Vector2(560,-30)
			blue_shot.rotation_degrees = -40
			blue_shot.motion = Vector2(800,-800)
		else:
			$CannonOne.position = Vector2(600,100)
			blue_shot.rotation_degrees = 0
			blue_shot.motion = Vector2(800,0)
		
		blue_shot.position = $CannonOne.global_position	
		Utils.main_node.call_deferred("add_child",blue_shot)
		can_shot=false			
		yield(get_tree().create_timer(0.3),"timeout")
		can_shot=true
	
func _draw():
	draw_rect(Rect2(Vector2(100,200),Vector2(change_tam,128)),color)
	#draw_circle(Vector2(0,0),300, color)

func new_mechanics():
		#New Mechanics.!
	if Input.is_action_pressed("ui_end"):
		change_tam+=10
		update()
		
	if Input.is_action_pressed("ui_home"):
		change_tam-=10
		update()

func death():
	if life <= 0:
		print("Death")

func _on_PlayerTemplate_area_entered(area):
	if area.is_in_group("enemy"):
		area.queue_free()
