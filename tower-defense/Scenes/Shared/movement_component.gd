class_name MovementComponent
extends Node

@export var movement_speed: int = 1

func move_toward(position: Vector2, delta: float) -> void:
	var moving_unit := owner as Node2D
	
	if moving_unit == null:
		return

	moving_unit.global_position = moving_unit.global_position.move_toward(
		position,
		movement_speed * delta
	)