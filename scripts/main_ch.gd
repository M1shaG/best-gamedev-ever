extends CharacterBody2D

@export var speed = 400
var main_ch: Sprite2D

func _ready():
	main_ch = $Sprite2D
func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_direction.x != 0:
		if input_direction.x > 0:
			main_ch.rotation_degrees = 180
		if input_direction.x < 0:
			main_ch.rotation_degrees = 0
			
	if input_direction.y < 0:
		main_ch.rotation_degrees = 90
	if input_direction.y > 0:
		main_ch.rotation_degrees = 270
	
	velocity = input_direction * speed
	
	

func _physics_process(delta):
	get_input()
	move_and_slide()
