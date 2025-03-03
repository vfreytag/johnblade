extends State
class_name EnemyFollow

@export var enemy: CharacterBody3D
@export var move_speed := 2.0
var player: CharacterBody3D
@onready var collision_shape_3d: CollisionShape3D = $"../../../CollisionShape3D"



func Enter():
		player = get_tree().get_first_node_in_group("Player")
		
func Physics_Update(delta: float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 1:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector3()

	if direction.length() > 5:
		print("not following")
		Transitioned.emit(self, "idle")
	if direction.length() <= 5:
		if $"../../Mid_Juan".is_colliding():
		#$JohnRange.is_colliding()
			print("time2attack")
			Transitioned.emit(self, "Attack_1")
		elif $"../../Bottom_Juan".is_colliding():
			Transitioned.emit(self, "Attack_2")
		elif $"../../Top_Juan".is_colliding():
			Transitioned.emit(self, "Attack_3")
		
