extends Node2D

var enemies: Array = []
var action_queue: Array = []
var is_battling: bool = false
var enemy_size: int = 0
var index: int = 0
signal next_player

@onready var choice = $"../CanvasLayer/Choice"



func _ready():
	enemies = get_children()
	for i in enemies.size():
		enemies[i].position = Vector2(0, i * 115)
		enemies[i].position.x += 10 * i  # Add 10 * i to the X-coordinate
	show_choice()

func _process(_delta):
	if not choice.visible:
		if Input.is_action_just_pressed("up"):
			if index > 0:
				index -= 1
				switch_selector(index, index + 1)
		if Input.is_action_just_pressed("down"):
			if index < enemies.size() -1:
				index += 1
				switch_selector(index, index -1)
		if Input.is_action_just_pressed("interact"):
			action_queue.push_back(index)
			emit_signal("next_player")
	if action_queue.size() == enemies.size() and not is_battling:
		is_battling = true
		_action(action_queue)



func _action(stack):
	for i in stack:
		enemies[i].take_damage(1)
		await get_tree().create_timer(0.5).timeout
	action_queue.clear()
	is_battling = false
	show_choice()



func switch_selector(x,y):
	enemies[x].selector()
	enemies[y].hide_selector()
	
func show_choice():
	choice.show()
	choice.find_child("Attack").grab_focus()

func _reset_selector():
	index = 0
	for enemey in enemies:
		enemey.hide_selector()

func _start_choosing():
	_reset_selector()
	enemies[0].selector()

func _on_attack_pressed():
	choice.hide()
	_start_choosing()
