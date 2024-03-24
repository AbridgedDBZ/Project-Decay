class_name OptionsMenu
extends Control

@onready var exit_options_menu_button = $MarginContainer/VBoxContainer/Exit_Options_Menu_Button as Button


func _ready():
	set_process(false)

func _on_exit_options_menu_button_pressed():
	set_process(false)
