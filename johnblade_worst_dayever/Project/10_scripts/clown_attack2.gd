extends State
class_name EnemyAttack_2

@export var enemy: CharacterBody3D
@export var move_speed := 2.0
var player: CharacterBody3D
@onready var collision_shape_3d: CollisionShape3D = $"../../../CollisionShape3D"

func Enter():
		#Global.jhealth -= 1
		#print("kill")
		player = get_tree().get_first_node_in_group("Player")
		await get_tree().create_timer(randi_range(0.5, 1.5)).timeout
		$"../../../AnimationTree/attackanim".play("sweep")
		
#func Physics_Update(delta: float):


	


func _on_attackanim_animation_finished(anim_name: StringName) -> void:
	Transitioned.emit(self, "idle")
	print("return to idle")


func _on_area_3d_body_entered(body: Node3D) -> void:
	Global.jhealth -= 10
	pass # Replace with function body.
