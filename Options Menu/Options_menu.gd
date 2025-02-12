extends Control

#Replace the reference here with the first level
var main_menu = "res://Main Menu/Main_menu.tscn"


func _on_option_1_pressed() -> void:
	pass # Replace with function body.


func _on_option_2_pressed() -> void:
	pass # Replace with function body.


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file(main_menu)
