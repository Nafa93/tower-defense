extends Node2D

@export var health_component: HealthComponent
@export var attack_component: AttackComponent
@export var defense_component: DefenseComponent
@export var movement_component: MovementComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var world_pos: Vector2 = get_global_mouse_position()
	
	movement_component.move_toward(world_pos, delta)
