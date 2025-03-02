extends CharacterBody3D
class_name SmallClownEnemy

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	move_and_slide()

	if velocity.length() > 0:
		$AnimatedSprite3D.play("run")
	if velocity.x > 0:
		$AnimatedSprite3D.flip_h = true
	else:
		$AnimatedSprite3D.flip_h = false
