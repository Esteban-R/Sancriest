extends Node2D

#---------------------------Start of Variables-------------------------.!
var level : int = 1
var level_countdown : float = 30.0
var wait_time_enemy : int = 3

#Enemies.!
const enemies = [
	preload("res://scenes/enemies/enemy_one/EnemyOne.tscn")
]
#---------------------------End of Variables-------------------------.!
func _ready():
	OS.window_fullscreen = true
	$SpawnEnemyTimer.start()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func spawn_enemies():
	randomize()
	var enemy
	if level >= 1 && level <=3:
		enemy = enemies[0].instance()
		
	enemy.position = Vector2(Utils.screen_size.x+60,
	rand_range(0,Utils.screen_size.y))
	$EnemyContainer.call_deferred("add_child",enemy)
	
func choise_list(list):
	randomize()
	var random_index=randi()%list.size()
	return list[random_index]

func _on_SpawnEnemyTimer_timeout():
	spawn_enemies()
