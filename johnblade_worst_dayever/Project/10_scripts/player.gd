##extends "res://Project/10_scripts/johnmovement.gd"

#var health = 100
##var chocheal = 25


#signal health_updated(health)
##signal killed() 
#signal hit


func _init():
	print(Global.jhealth)
	Global.jhealth = 100
	
func _process(delta):
	if Global.jhealth == 0:
		get_tree().reload_current_scene() #DEATH

#func _on_body_entered(body):
#	hide()
#	hit.emit()
#	print ("ow!")


func _input(event):
	if event.is_action_pressed("consume_choc"):
		consume_choc()
	
func consume_choc():
	if Global.inv_choc > 0:
		Global.inv_choc -= 1
		Global.jhealth += chocheal
	

	
#func start(pos):
	#position = pos
	#print ("hi!")
	#show()
	#$CollisionShape2D.disabled = false
