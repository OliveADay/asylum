extends Node2D
@export var cards = [Node2D]
var rand = RandomNumberGenerator.new()

func _ready() -> void:
	var secret = 1
	var amount = 0
	for card in cards:
		card=secret
		amount+=1
		if amount==4:
			secret+=1
	
