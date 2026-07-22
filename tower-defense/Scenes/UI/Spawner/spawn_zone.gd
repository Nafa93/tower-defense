class_name SpanwZone
extends Area2D

@export var max_rows: int = 2
@export var max_columns: int = 4
@export var unit_size: int = 32

@onready var collision_shape: CollisionShape2D = $CollisionShape2D

var _max_spaces: int = 0
var _assigned_units: Array[DisplayableUnit] = []
var _next_position: Array[int] = [0, 0]
var _spawn_zone_origin: Vector2 

func _ready() -> void:
	var rectangle_shape: RectangleShape2D = collision_shape.shape as RectangleShape2D

	rectangle_shape.size.x = max_columns * unit_size
	rectangle_shape.size.y = max_rows * unit_size
	
	collision_shape.debug_color = Color.ALICE_BLUE

	_spawn_zone_origin = collision_shape.global_position

	print(collision_shape.global_position)

	_calculate_available_spaces()

func _calculate_available_spaces() -> void:
	_max_spaces = max_columns * max_rows

func _on_unit_panel_unit_added(displayable_unit: DisplayableUnit) -> void:
	if _assigned_units.size() < _max_spaces:
		_assigned_units.append(displayable_unit)
		_spawn_at_next_position(displayable_unit)
	else:
		print("Not enough space")

func _spawn_at_next_position(displayable_unit: DisplayableUnit) -> void:
	print("Spawning at x: %d, y: %d" % [_next_position[0], _next_position[1]])

	var instance = displayable_unit.scene.instantiate() as Node2D

	instance.global_position = Vector2(
		_spawn_zone_origin.x + (unit_size * _next_position[0]),
		_spawn_zone_origin.y - (unit_size * _next_position[1])
	)
	
	print("Spawning at x: %d, y: %d" % [_spawn_zone_origin.x + (unit_size * _next_position[0]), _spawn_zone_origin.y - (unit_size * _next_position[1])])

	add_child(instance)
	
	# El algoritmo deberia hacer que las posiciones se tomen de adelante hacia atras alternando las filas
	if _next_position[0] < max_columns - 1:
		_next_position[0] += 1
	else:
		_next_position[0] = 0
		_next_position[1] += 1