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
	total+=1
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
			click_amount = 0
			$card_win_player.play()
			print("card")
	if total == 20:
			$CanvasLayer.visible = true
			$win_player.play()
			
	


func _on_button_pressed() -> void:
	print("scene load")
	$CanvasLayer.visible = false
	get_tree().reload_current_scene()
