extends "res://scenes/templates/power/PowerTemplate.gd"

func _on_PowerBomb_area_entered(area):
	if area.is_in_group("player"):
		var enemies = Utils.main_node.get_node("EnemyContainer").get_children()
		for x in enemies:
			x.life=0
