extends Node3D

#make enemies spawn higher up by like 2 change the randomness so the y isnt random
@onready var pause_menu: Control = $"Pause Menu"

var paused = false



@export var enemy_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		pauseMenu()


func _on_initial_mob_timer_timeout() -> void:
	var big_demon = enemy_scene.instantiate()
	var big_demon_spawn_location = get_node("SpawnPath/SpawnLocation")
	big_demon_spawn_location.progress_ratio = randf() # Give the spawn location a random offset.
	var player_position = $Player.position
	big_demon.initialize(big_demon_spawn_location.position, player_position)
	add_child(big_demon)

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused
