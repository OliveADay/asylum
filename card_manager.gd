extends Node2D
@export var cards = [Node2D]
var rand = RandomNumberGenerator.new()

func _ready() -> void:
	var secret = 1
	var amount = 0
	for card in cards:
		get_node(card).secret=secret
		amount+=1
		if amount==5:
			secret+=1
			amount = 0
	
