extends Node2D
var world_resource = preload("res://world.tscn")

func _on_button_pressed() -> void:
	$CanvasLayer.queue_free()
	var world = world_resource.instantiate()
	get_tree().root.add_child(world)
	
