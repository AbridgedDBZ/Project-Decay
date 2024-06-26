class_name Maatet
extends CharacterBody2D

@export var speed = 150

var current_dir = "none"



func _ready():
	$AnimatedSprite2D.play("f_idle")
	if globala.next_scene_position != Vector2(0,0):
		position = globala.next_scene_position



func player():
	pass



func get_input():
	var input_direction := Input.get_vector("left", "right", "up", "down")
	
	if Input.is_action_pressed("right"):
		current_dir = "right"
		play_anim(1)
		velocity = input_direction * speed
	elif Input.is_action_pressed("left"):
		current_dir = "left"
		play_anim(1)
		velocity = input_direction * speed
	elif Input.is_action_pressed("down"):
		current_dir = "down"
		play_anim(1)
		velocity = input_direction * speed
	elif Input.is_action_pressed("up"):
		current_dir = "up"
		play_anim(1)
		velocity = input_direction * speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0



func _physics_process(_delta):
	get_input()
	move_and_slide()



func play_anim(movement):
	var anim = $AnimatedSprite2D
	var dir = current_dir
	
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("s_walk")
		elif movement == 0:
			anim.play("s_idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("s_walk")
		elif movement == 0:
			anim.play("s_idle")
	
	
	if dir == "down":
		anim.flip_h = true
		if movement == 1:
			anim.play("f_walk")
		elif movement == 0:
			anim.play("f_idle")
	if dir == "up":
		anim.flip_h = true
		if movement == 1:
			anim.play("b_walk")
		elif movement == 0:
			anim.play("b_idle")
