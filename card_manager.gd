extends Node2D
@export var cards = [Node2D]
var rand = RandomNumberGenerator.new()
var card_same_amount = 5
var click_amount = 0
var last_secret = 0
var total = 0
var mistakes = 0

func _ready() -> void:
	for card in cards:
		get_node(card).clicked.connect(clicked)
	reset()

func done() -> bool:
	for card in cards:
		if get_node(card).get_child(0).frame==0:
			return false
	return true
	print("done")

func reset():
	var secret = 1
	var amount = 0
	for card in cards:
		get_node(card).secret=secret
		get_node(card).reset()
		amount+=1
		if amount==card_same_amount:
			secret+=1
			amount = 0
	cards.shuffle()
	print("reset")
func clicked(secret):
	if click_amount == 0:
		last_secret = secret
		click_amount+=1
		mistakes =0
	elif last_secret != secret:
		mistakes+=1
		if(mistakes == 3):
			click_amount = 0
			total= 0
			reset()
			mistakes =0 
	else:
		mistakes =0
		click_amount +=1
		last_secret = secret
		if click_amount ==card_same_amount:
			total+=1
			click_amount = 0
			$card_win_player.play()
			print("card")
		if total == 4 or done():
			$CanvasLayer.visible = true
			$win_player.play()
			
	
