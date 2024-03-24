class_name MainMenu
extends Control

@onready var start_new_game_button = $MarginContainer/Buttons/VBoxContainer/Start_New_Game_Button as Button
@onready var continue_button = $MarginContainer/Buttons/VBoxContainer/Continue_Button as Button
@onready var options_button = $MarginContainer/Buttons/VBoxContainer/Options_Button as Button
@onready var quit_button = $MarginContainer/Buttons/VBoxContainer/Quit_Button as Button
@onready var start_level = preload("res://Scenes/Areas/test_scene.tscn") as PackedScene
@onready var options_menu = $"Options Menu" as OptionsMenu
@onready var margin_container = $MarginContainer as MarginContainer


func _on_start_new_game_button_pressed():
	get_tree().change_scene_to_packed(start_level)

func _on_continue_button_pressed():
	pass # Replace with function body.


func _on_options_button_pressed():
	margin_container.visible = false
	options_button.set_process(true)
	options_menu.visible = true

func _on_exit_options_menu_button_pressed():
	margin_container.visible = true
	options_menu.visible = false

func _on_quit_button_pressed():
	get_tree().quit()
