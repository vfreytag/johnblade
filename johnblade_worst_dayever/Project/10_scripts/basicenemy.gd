extends Node3D

#@onready var animated_sprite_3d: AnimatedSprite3D = $AnimatedSprite3D
#@onready var collision_shape_3d: Vector3 = $CollisionShape3D.shape.size
#var atk_array = [stab(), sweep(),slash()]
var anim_array = ["stab", "sweep", "slash"]
var attacking = false
var e_health = 100

func _ready():
		await(owner)
		
func _init():
	print ("enemyloaded")
	attacking = false

func _process(delta):
	if attacking == false:
		idle()

func idle():
	if $JohnRange.is_colliding() and attacking == false:
		#atk_array.pick_random()
		print("AAAA")

func stab():
#	$AnimationTree/attackanim.play("stab")
	#$Attack_Waiter.start()
	attacking = true
	print("stab")
	
#func sweep():
#	get_node("AnimationTree/attackanim").play("sweep")
#	#$AnimationTree/attackanim.play("sweep")
#	get_node("Attack_Waiter").start()
#	#$Attack_Waiter.start()
#	attacking = true
#	print("sweep")
	
#func slash():
##	$AnimationTree/attackanim.play("slash")
##	$Attack_Waiter.start()
##	attacking = true
#	print("slash")

func _on_attack_waiter_timeout():
	attacking = false

func _on_area_3d_body_entered(CharacterBody3D):
	#if (body.name == "CharacterBody3D"):
		if Global.block == true:
				Global.jhealth -= 5
				print (Global.jhealth, "blocked")
		else:
				Global.jhealth -= 10
				print (Global.jhealth, "not so blocked")




#func attack():
	#$AnimationTree/attackanim.play("stab")

#randi_("stab", "sweep") 


#func _on_attackanim_animation_finished(anim_name):
#	if anim_name == "stab":
#		attacking = false
#		$AnimationTree/attackanim.play("idle")
#		print("idle")
#	if anim_name == "slash":
#		attacking = false
#		$AnimationTree/attackanim.play("idle")
#		print("idle")
##	if anim_name == "sweep":
#		attacking = false
#		$AnimationTree/attackanim.play("idle")
#		print("idle")
