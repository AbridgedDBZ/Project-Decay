extends CharacterBody2D

@onready var progress_bar = $ProgressBar
@onready var _selector = $Selector
@onready var animation_player = $AnimationPlayer

@export var MAX_HEALTH: float = 7

var health: float = 7:
	set(value):
		health = value
		_update_progress_bar()
		_play_animation()
		
func _update_progress_bar():
	progress_bar.value = (health/MAX_HEALTH) * 100

func _play_animation():
	animation_player.play("hurt")

func selector():
	_selector.show()
	animation_player.play("select")

func hide_selector():
	_selector.hide()

func take_damage(value):
	health -= value
