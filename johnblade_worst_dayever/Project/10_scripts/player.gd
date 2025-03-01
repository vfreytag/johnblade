extends "res://Project/10_scripts/johnmovement.gd"

var health = 100


signal health_updated(health)
signal killed() 
signal hit

func _init():
	print(Global.jhealth)
	Global.jhealth = 100

func juan_hit():
	print ("ow! my health is now at", Global.jhealth)
	Global.jhealth -= 10
	
func _process(delta):
	if Global.jhealth == 0:
		get_tree().reload_current_scene() #DEATH

func _on_body_entered(body):
	hide()
	hit.emit()
	print ("ow!")
	
#func start(pos):
	#position = pos
	#print ("hi!")
	#show()
	#$CollisionShape2D.disabled = false
