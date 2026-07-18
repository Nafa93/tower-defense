class_name UnitPanel
extends Control

signal unit_added(displayable_unit: DisplayableUnit)

@export var available_units: Array[DisplayableUnit] = []

@onready var unit_list: HBoxContainer = $PanelContainer/HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_build_buttons()

func _build_buttons() -> void:
	for available_unit in available_units:
		var button := Button.new()
		button.text = available_unit.name
		button.icon = available_unit.icon
		button.expand_icon = true

		button.gui_input.connect(
			_on_unit_button_gui_input.bind(available_unit)
		)

		unit_list.add_child(button)


func _on_unit_button_gui_input(event: InputEvent, unit: DisplayableUnit) -> void:
	var mouse_event = event as InputEventMouseButton

	if mouse_event == null: 
		return

	if mouse_event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		unit_added.emit(unit)
