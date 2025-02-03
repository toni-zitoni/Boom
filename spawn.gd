extends Node3D

@export var enemy_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_initial_mob_timer_timeout() -> void:
	var big_demon = enemy_scene.instantiate()
	var big_demon_spawn_location = get_node("SpawnPath/SpawnLocation")
	big_demon_spawn_location.progress_ratio = randf() # Give the spawn location a random offset.
	var player_position = $Player.position
	big_demon.initialize(big_demon_spawn_location.position, player_position)
	add_child(big_demon)
