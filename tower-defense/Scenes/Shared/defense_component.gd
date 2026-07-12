class_name DefenseComponent
extends Node

@export var armor: int = 5

func reduce_damage(damage: int) -> int:
	return max(damage - armor, 0)