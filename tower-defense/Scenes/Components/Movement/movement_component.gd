class_name MovementComponent
extends Node

@export var movement_speed: int = 40

func move_toward(position: Vector2, delta: float) -> void:
	var moving_unit := owner as Node2D
	
	if moving_unit == null:
		return

	print("Moving towards: x:%d, y:%d" % [position.x, position.y])

	moving_unit.global_position = moving_unit.global_position.move_toward(
		position,
		movement_speed * delta
	)