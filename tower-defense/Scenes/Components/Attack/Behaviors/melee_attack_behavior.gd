class_name MeleeAttackBehavior
extends AttackBehavior


func _perform_attack(attacker: Node2D, target: Node2D, damage: int) -> void:
	if attacker == null or target == null:
		return

	if is_instance_valid(target) and target.has_method("receive_damage"):
		target.receive_damage(damage)