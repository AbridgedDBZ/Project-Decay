class_name OptionsMenu
extends Control

@onready var exit_options_menu_button = $MarginContainer/VBoxContainer/Exit_Options_Menu_Button as Button
@onready var settings_tab_container = $"MarginContainer/VBoxContainer/Settings Tab Container"



func _ready():
	#settings_tab_container.exit_options_menu.connect(_on_exit_options_menu_button_pressed)
	set_process(false)



func _on_exit_options_menu_button_pressed():
	SettingsSignalBus.emit_settings_dictionary(SettingsDataContainer.create_storage_dictionary())
	set_process(false)
