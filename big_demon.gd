extends CharacterBody3D

# Minimum speed of the Big Demon in meters per second.
@export var min_speed = 10
# Maximum speed of the Big Demon in meters per second.
@export var max_speed = 18


func _physics_process(_delta):
	move_and_slide()

func initialization(start_position, player_position)
