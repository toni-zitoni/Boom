extends RigidBody3D


# Called when body collides with something.
func _on_body_entered(body):
	linear_damp = 0.3 # Dampens body's movement.
	angular_damp = 1.5 # Dampens body's rotation.
	
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
