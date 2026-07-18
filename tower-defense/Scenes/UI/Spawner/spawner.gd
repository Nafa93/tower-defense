extends Marker2D


func _on_unit_panel_unit_added(displayable_unit: DisplayableUnit) -> void:
	var scene: PackedScene = displayable_unit.scene
	var instance = scene.instantiate()
	add_child(instance)
