extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 5

const DASH_SPEED = 15
var dashing = false
var can_dash = true


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	#Handle Dash
	if Input.is_action_just_pressed("Dash") and can_dash:
		dashing = true
		can_dash = false
		$Dash_Timer.start()
		$Can_Dash.start()


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("Walk_left", "Walk_right", "Jump", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if dashing:
			velocity.x = direction.x * DASH_SPEED
		else:
			velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
#Dash_timer Signal
func _on_dash_timer_timeout() -> void:
	dashing = false 

#Can_dash signal, resets ability to dash
func _on_can_dash_timeout() -> void:
	can_dash = true
