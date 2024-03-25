extends Control

func resume():
	get_tree().paused = false
	hide()
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	show()

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("RESET")

func test_esc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		resume()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	test_esc()

func _on_resume_pressed():
	resume() # Replace with function body.

func _on_main_menu_pressed():
	var to_main_menu := func():
		resume()
		get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")
	to_main_menu.call_deferred()


func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().quit()
