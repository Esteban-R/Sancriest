extends "res://scenes/templates/enemy/EnemyTemplate.gd"

func _ready():
	motion = Vector2(-40,60)
	life=3
	player_score=30
	
func _process(delta):
	if self.position.y >= Utils.screen_size.y-40:
		motion = Vector2(-40,-60)
		
	if self.position.y <= 40:
		motion = Vector2(-40,60)
		
	if self.position.x <= 40:
		$AnimatedSprite.flip_h =true
		motion = Vector2(40,60)
