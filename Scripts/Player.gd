extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const SENSITIVITY = 0.003


@onready var head = $Head
@onready var camera = $Head/Camera3D

var canThrowBomb = true
var Bomb = preload("res://Player/basic_bomb.tscn")

#make it so the mouse toggles being captured or not on esc presses






func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if Input.is_action_pressed("throw"):
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_released("throw") && canThrowBomb:
		bombThrow()
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func bombThrow():
	var bomb_ins = Bomb.instantiate()
	bomb_ins.position = $Head/Camera3D/BombReleasePoint/BombPos.global_position
	get_tree().current_scene.add_child(bomb_ins)
	
	canThrowBomb = false
	$ThrowTimer.start()
	
	var player_rotation = $Head.global_transform.basis.z.normalized()
	var force = -7
	var bomb_up_dir = 3.5
	
	bomb_ins.apply_central_impulse(player_rotation * force + Vector3(0, bomb_up_dir, 0))

func _on_throw_timer_timeout() -> void:
	canThrowBomb = true
