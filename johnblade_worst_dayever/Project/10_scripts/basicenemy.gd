extends Node3D

var e_health = 100

func _ready():
		pass
		
func _init():
	print ("enemyloaded")

func _process(delta):
		if $JohnRange.is_colliding():
	#		attack()
			print("hi")

func _on_area_3d_body_entered(CharacterBody3D):
	#if (body.name == "CharacterBody3D"):
		if Global.block == true:
				Global.jhealth -= 5
				print (Global.jhealth, "blocked")
		else:
				Global.jhealth -= 10
				print (Global.jhealth, "not so blocked")

#func attack():
#	$AnimationTree/attackanim.current_animation = stab
