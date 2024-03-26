extends Control

@onready var option_button = $HBoxContainer/OptionButton as OptionButton

const WINDOW_MODE_ARRAY : Array[String] = [
	"Full-Screen",
	"Window Mode",
	"Boarderless Window",
	"Boarderless Full-Screen"
]


func _ready():
	add_window_mode_items()
	option_button.item_selected.connect(on_window_mode_selected)
	load_data()


func load_data() -> void:
	on_window_mode_selected(SettingsDataContainer.get_window_mode_index())
	option_button.select(SettingsDataContainer.get_window_mode_index())


func add_window_mode_items() -> void:
	for window_mode in WINDOW_MODE_ARRAY:
		option_button.add_item(window_mode)


func on_window_mode_selected(index : int) -> void:
	SettingsSignalBus.emit_on_window_mode_selected(index)
	match index:
		0: #Full-Screen Mode
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1: #Window Mode
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2: #Boarderless Windowed
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3: #Boarderless Full-screen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
