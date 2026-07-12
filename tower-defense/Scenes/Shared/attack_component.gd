class_name AttackComponent
extends Node

@export var attack_damage: int = 10
@export var attack_range: float = 32.0
@export var attack_cooldown: float = 1.0
@export var attack_behavior: AttackBehavior

var _can_attack: bool = true

func can_attack(target: Node2D) -> bool:
	var attacker := owner as Node2D
	
	if attacker == null:
		return false
	
	return (
		_can_attack 
		and attacker.global_position.distance_to(target.global_position) <= attack_range
	)

func attack(target: Node2D) -> void:
	if not can_attack(target):
		return

	if not target.has_method("receive_attack"):
		return
	
	attack_behavior.perform_attack(owner, target, attack_damage)

	_start_cooldown()


func _start_cooldown() -> void:
	_can_attack = false
	await get_tree().create_timer(attack_cooldown).timeout
	_can_attack = true
