extends Sprite

var motion = Vector2(-5,0)

func _process(delta):
	translate(motion*delta)
	
	if self.position.x <= -Utils.screen_size.x:
		self.position.x = Utils.screen_size.x
