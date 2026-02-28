extends CharacterBody2D

var max_jumps = 1
var jump_count = 0

func double_jump():
	max_jumps = 2
	jump_count = 0






var SPEED = 250.0
var JUMP_VELOCITY = -500.0

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if is_on_floor():
		jump_count = 0
	
	if Input.is_action_just_pressed("up") and max_jumps > jump_count:
		velocity.y = JUMP_VELOCITY 
		jump_count += 1
	
	var direction := Input.get_axis("right", "left")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("default")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("default")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func die():
	animated_sprite_2d.play("die")

func bounce():
	JUMP_VELOCITY = -500.0

	
