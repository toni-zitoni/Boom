extends CharacterBody3D


# Minimum speed of the Big Demon in meters per second.
@export var min_speed = 10
# Maximum speed of the Big Demon in meters per second.
@export var max_speed = 18

var health = 25


func enemy_hit(damage):
	health -= damage
	if health <= 0:
		queue_free()

func _physics_process(_delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * _delta
		
	move_and_slide()

func initialize(start_position, player_position):
	look_at_from_position(start_position, player_position, Vector3.UP)
	rotate_y(randf_range(-PI / 4, PI / 4))
	
	var random_speed = randi_range(min_speed, max_speed)
	velocity = Vector3.FORWARD * random_speed
	velocity = velocity.rotated(Vector3.UP, rotation.y) # Rotate the mob's velocity based on the direction it is looking.
