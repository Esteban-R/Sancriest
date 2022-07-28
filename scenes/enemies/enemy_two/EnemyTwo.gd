extends "res://scenes/templates/enemy/EnemyTemplate.gd"

func _ready():
	motion = Vector2(-20,40)
	life=2
	player_score=20
	
func _process(delta):
	if self.position.y >= Utils.screen_size.y-40:
		motion = Vector2(-20,-40)
		
	if self.position.y <= 40:
		motion = Vector2(-20,40)
