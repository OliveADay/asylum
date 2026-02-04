extends Area2D

var mouseOn = false
var rand = RandomNumberGenerator.new()
var secret = 1;
var maxWait = 1;
var currentWait = 0;

func switch():
	secret = rand.randi_range(1,4);

func _ready() -> void:
	switch();

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") and mouseOn:
		$Sprite2D.frame = secret;
		currentWait = maxWait;
	if currentWait > 0:
		currentWait-=delta;
	else:
		$Sprite2D.frame = 0;
func _on_mouse_entered() -> void:
	mouseOn = true

func _on_mouse_exited() -> void:
	mouseOn = false
