extends Control

var units: Array[String] = ["Tank", "Fighter", "Range"]

@onready var unit_list: HBoxContainer = $PanelContainer/HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for unit in units:
		print(unit)