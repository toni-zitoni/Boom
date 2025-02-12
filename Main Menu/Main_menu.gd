extends Control

#Replace the reference here with the first level
var level = "res://Pause Menu/main.tscn"
var options = "res://Options Menu/Options_menu.tscn"

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file(level)

#If you dont have an options menu, just delete the button and the following function
func _on_options_pressed() -> void:
	get_tree().change_scene_to_file(options)


func _on_quit_pressed() -> void:
	get_tree().quit()
