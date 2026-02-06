extends Area2D

var mouseOn = false
var rand = RandomNumberGenerator.new()
var secret = 1;
var maxWait = 1000000000;
var startWait = 5
var currentWait = 0;
var has_been_clicked = false
signal clicked(secret:int)
	
func reset():
	$Sprite2D.frame = secret
	currentWait = startWait

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") and mouseOn and $Sprite2D.frame != secret:
		$Sprite2D.frame = secret
		currentWait = maxWait
		clicked.emit(secret)
	if currentWait > 0:
		currentWait-=delta
		$Sprite2D.frame = secret
	else:
		$Sprite2D.frame = 0
func _on_mouse_entered() -> void:
	mouseOn = true

func _on_mouse_exited() -> void:
	mouseOn = false
