extends CharacterBody2D

@export var speed = 400
var main_ch: Sprite2D

func _ready():
	main_ch = $Sprite2D
func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
	if input_direction != Vector2.ZERO:
		main_ch.rotation = input_direction.angle() + PI


func _physics_process(delta):
	get_input()
	move_and_slide()
