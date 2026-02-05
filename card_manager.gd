extends Node2D
@export var cards = [Node2D]
var rand = RandomNumberGenerator.new()

func _ready() -> void:
	var num = rand.randi_range(1,4)
	
