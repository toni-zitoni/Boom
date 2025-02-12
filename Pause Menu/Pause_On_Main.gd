extends Node


#Youll probably have to change this to whatever it is once you add it to your game.
@onready var pause_menu: Control = $"Pause Menu"

var paused = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		pauseMenu()

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused
