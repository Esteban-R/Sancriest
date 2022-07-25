extends Node

#BVariables.!
var number_shots : int = 0

var screen_size setget ,get_screen_size
var main_node setget ,get_main_scene
var amount_shots setget ,get_amount_shots

func get_screen_size():
	return get_tree().get_root().get_visible_rect().size

func get_main_scene():
	var root = get_tree().get_root()
	return root.get_child(root.get_child_count()-1)

func get_amount_shots() -> int:
	number_shots+=1
	return number_shots
