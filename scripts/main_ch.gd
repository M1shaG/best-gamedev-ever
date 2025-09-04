extends CharacterBody2D

@export var speed = 400
@export var attack_duration = 1
@export var rotation_speed = 360.0  

var main_ch: AnimatedSprite2D
var weapon: Sprite2D
var rotating = false
var rotation_timer = 0.0

func _ready():
	main_ch = $main
	weapon = $weapon

func weapon_attack():
	if not rotating:
		$weapon_sound.play()
		weapon.visible = true
		weapon.rotation = 0
		rotation_timer = 0.0
		rotating = true

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	if Input.is_action_just_pressed("weapon_attack"):
		weapon_attack()
	
	if input_direction != Vector2.ZERO:
		main_ch.rotation = input_direction.angle() + PI

func _physics_process(delta):
	get_input()
	move_and_slide()
	
	if rotating:
		weapon.rotation += deg_to_rad(rotation_speed) * delta
		rotation_timer += delta

		if rotation_timer >= attack_duration:
			rotating = false
			weapon.visible = false
