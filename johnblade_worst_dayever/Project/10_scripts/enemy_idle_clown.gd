extends State
class_name EnemyIdle

@export var enemy: CharacterBody3D
@export var move_speed := 0.75

var player:  CharacterBody3D

var move_direction: Vector3
var wander_time: float

func randomize_wander():
		move_direction = Vector3(randf_range(-0.5, 0.5), 0, 0).normalized()
		wander_time = randf_range(1, 2)

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()

func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else: 
		randomize_wander()
		
func Physics_Update(delta: float):
	if enemy:
			enemy.velocity = move_direction * move_speed
	var direction = player.global_position - enemy.global_position
	
	if direction.length() <= 5:
		Transitioned.emit(self, "Follow")
