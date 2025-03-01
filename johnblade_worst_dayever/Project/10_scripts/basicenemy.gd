extends Node3D

var e_health = 100

func _ready():
		pass
		
func _init():
	print ("enemyloaded")

func _process(delta):
		pass

func _on_area_3d_body_entered(CharacterBody3D):
	#if (body.name == "CharacterBody3D"):
		Global.jhealth -= 10
		print (Global.jhealth)
