extends RigidBody3D


var damage = 50


var Explosion = preload("res://Explosion Effects/explosion_effect.tscn")


# Called when body collides with something.
func _on_body_entered(body):
	linear_damp = 0.3 # Dampens body's movement.
	angular_damp = 1.5 # Dampens body's rotation.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_fuse_timer_timeout() -> void:
	var explosion_ins = Explosion.instantiate()
	explosion_ins.position = $Radius/CollisionShape3D.global_position
	get_tree().current_scene.add_child(explosion_ins)
	
	var bodies = $Radius.get_overlapping_bodies()
	
	for obj in bodies:
		if obj.is_in_group("enemy"):
			var ray_params = PhysicsRayQueryParameters3D.create(global_transform.origin, obj.global_transform.origin)
			var result = get_world_3d().direct_space_state.intersect_ray(ray_params)
			if result.collider.is_in_group("enemy"):
				obj.enemy_hit(damage)
			
	queue_free()
