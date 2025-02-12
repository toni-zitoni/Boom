extends Control

var main_menu = "res://Main Menu/Main_menu.tscn"

@onready var main = $"../"

func _on_resume_pressed() -> void:
	main.pauseMenu()


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file(main_menu)
