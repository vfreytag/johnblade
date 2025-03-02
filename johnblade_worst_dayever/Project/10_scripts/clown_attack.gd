extends State
class_name EnemyAttack_1

@export var enemy: CharacterBody3D
@export var move_speed := 2.0
var player: CharacterBody3D


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
