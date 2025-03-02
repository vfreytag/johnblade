extends CharacterBody3D


const SPEED = 7
const JUMP_VELOCITY = 6
const DOUBLE_JUMP_VELOCITY = 8

const DASH_SPEED = 20
const CROUCH_SPEED = 3

var dashing = false
var can_dash = true
var crouching = false
var jumped = false
var has_d_jumped = false

@onready var animated_sprite_3d: AnimatedSprite3D = $AnimatedSprite3D
@onready var collision_shape_3d: Vector3 = $CollisionShape3D.shape.size



#all movement affected by gravity
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if is_on_floor():
		has_d_jumped = false
		if crouching == false:
			$CollisionShape3D.shape.size = Vector3(Global.jx, Global.standheight, Global.jz)
			animated_sprite_3d.play("stand")
		
	if Input.is_action_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumped = true 
		#animated_sprite_3d.play("jump")
		$CollisionShape3D.shape.size = Vector3(Global.jx, Global.jump1height, Global.jz)
		
	elif has_d_jumped == false and Input.is_action_just_pressed("Jump"):
		velocity.y = DOUBLE_JUMP_VELOCITY
		#animated_sprite_3d.play("double_jump")
		$CollisionShape3D.shape.size = Vector3(Global.jx, Global.jump2height, Global.jz)
		has_d_jumped = true
		
	if not is_on_floor() and jumped == true and has_d_jumped == false:
		animated_sprite_3d.play("jump")
		$CollisionShape3D.shape.size = Vector3(Global.jx, Global.jump1height, Global.jz)
		
	if has_d_jumped == true:
		animated_sprite_3d.play("double_jump")
		
	# Handle double-jump.
	#if Input.is_action_just_pressed("Jump") and jumped == true and has_d_jumped == false:
		#velocity.y = DOUBLE_JUMP_VELOCITY
	#	has_d_jumped = true
		
	#Handle Dash input and variables
	if Input.is_action_just_pressed("Dash") and can_dash:
		dashing = true
		can_dash = false
		$Dash_Timer.start()
		$Can_Dash.start()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("Walk_left", "Walk_right", "Jump", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	
	
	#handles sprite flip
	if input_dir.x < 0:
		animated_sprite_3d.flip_h = false
	elif input_dir.x > 0:
		animated_sprite_3d.flip_h = true
		
	if is_on_floor and input_dir.x == 0 and crouching == false:
		animated_sprite_3d.play("stand")
		$CollisionShape3D.shape.size = Vector3(Global.jx, Global.standheight, Global.jz)
	
	#handles velocity
	if direction:
		if dashing:
			velocity.x = direction.x * DASH_SPEED
			animated_sprite_3d.play("dash")
		elif crouching:
			velocity.x = direction.x * CROUCH_SPEED
			#animated_sprite_3d.play("crouch")
		else:
			velocity.x = direction.x * SPEED
			if is_on_floor():
				animated_sprite_3d.play("run")
				$CollisionShape3D.shape.size = Vector3(Global.jx, Global.standheight, Global.jz)
		#velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#animated_sprite_3d.play("stand")
		#velocity.z = move_toward(velocity.z, 0, SPEED)


	#handle crouch
	if Input.is_action_just_pressed("Crouch") and crouching == false:
		print("crouching")
		crouching = true
		animated_sprite_3d.play("crouch")
		$CollisionShape3D.shape.size = Vector3(Global.jx, Global.crouchheight, Global.jz)
		#print (collision_shape_3d)

		
	elif Input.is_action_just_pressed("Crouch") and crouching == true:
		crouching = false
		$CollisionShape3D.shape.size = Vector3(Global.jx, Global.standheight, Global.jz)
		print("standing")
		if not is_on_floor():
			animated_sprite_3d.play("stand")

	move_and_slide()
	
	
	

#Dash_timer Signal
func _on_dash_timer_timeout() -> void:
	dashing = false 

#Can_dash signal, resets ability to dash
func _on_can_dash_timeout() -> void:
	can_dash = true
