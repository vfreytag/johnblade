extends Node3D

#var atk_array = [stab(), sweep(),slash()]
var anim_array = ["stab", "sweep", "slash"]
var attacking = false
var e_health = 100

func _ready():
		pass
		
func _init():
	print ("enemyloaded")
	attacking = false


func stab():
	$AnimationTree/attackanim.play("stab")
	print("stab")
	
func sweep():
	$AnimationTree/attackanim.play("sweep")
	print("sweep")
	
func slash():
	$AnimationTree/attackanim.play("slash")
	print("slash")

func _on_area_3d_body_entered(CharacterBody3D):
	#if (body.name == "CharacterBody3D"):
		Global.jhealth -= 10
		print (Global.jhealth)

#func attack():
	#$AnimationTree/attackanim.play("stab")

#randi_("stab", "sweep") 


func _on_attackanim_animation_finished(anim_name):
	if anim_name == "stab":
		attacking = false
		$AnimationTree/attackanim.play("idle")
		print("idle")
	if anim_name == "slash":
		attacking = false
		$AnimationTree/attackanim.play("idle")
		print("idle")
	if anim_name == "sweep":
		attacking = false
		$AnimationTree/attackanim.play("idle")
		print("idle")
		
	
func _process(delta):
	if attacking == false:
		idle()
		
func idle():
	if $JohnRange.is_colliding():
		[stab(), sweep(), slash()].pick_random()
		attacking = true
		print("AAAA")
		#else:
			
