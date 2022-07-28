extends Node2D

#---------------------------Start of Variables-------------------------.!
var level : int
var countdown : int
var time_between_levels : int
var score : int

#Enemies.!
const enemies = [
	preload("res://scenes/enemies/enemy_one/EnemyOne.tscn"),
	preload("res://scenes/enemies/enemy_two/EnemyTwo.tscn"),
	preload("res://scenes/enemies/enemy_three/EnemyThree.tscn"),
	preload("res://scenes/enemies/enemy_four/EnemyFour.tscn")
]

var scene_player = preload("res://scenes/players/player_one/PlayerOne.tscn")
#---------------------------End of Variables-------------------------.!
func _ready():
	OS.window_fullscreen = true
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

#Enemies.!
func spawn_enemies():
	randomize()
	var enemy
	if level == 1 || level == 2:
		enemy = enemies[0].instance()
	elif level == 3:
		enemy = choise_list(enemies).instance()
	else:
		enemy = choise_list(enemies).instance()
		
	enemy.position = Vector2(Utils.screen_size.x+60,
	rand_range(0,Utils.screen_size.y))
	$EnemyContainer.call_deferred("add_child",enemy)
	
func choise_list(list):
	randomize()
	var random_index=randi()%list.size()
	return list[random_index]

func _on_SpawnEnemyTimer_timeout():
	spawn_enemies()

#Button new game.!
func _on_Hud_new_game():
	level=1
	time_between_levels=30
	countdown=time_between_levels
	score=0
	
	$Hud.set_game_information("score",score)
	$Hud.set_game_information("countdown",countdown)
	$Hud.set_game_information("level",level)
	
	for x in $EnemyContainer.get_children():
		x.queue_free()
		
	var player = scene_player.instance()
	call_deferred("add_child",player)
	
	$SpawnEnemyTimer.start()
	$NextLevelTimer.start()

#Levels.!
func _on_NextLevelTimer_timeout():
	if countdown > 0:
		countdown-=1
		$Hud.set_game_information("countdown",countdown)
	else:
		$SpawnEnemyTimer.stop()
		
	if $EnemyContainer.get_child_count()==0 && countdown<=0:
		level+=1
		countdown+=time_between_levels*level+10
		$Hud.show_text("LEVEL++")
		$Hud.set_game_information("level",level)
		yield(get_tree().create_timer(3),"timeout")
		$Hud.hide_text()
		$SpawnEnemyTimer.start()
