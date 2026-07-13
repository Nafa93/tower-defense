class_name AttackBehavior
extends Node

func _perform_attack(attacker: Node2D, target: Node2D, damage: int) -> void:
	print("Attacker %s attack is not implemented. Can't hit target %s for %d" % [attacker, target, damage])