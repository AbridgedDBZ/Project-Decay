extends Node

@onready var DEFAULT_SETTINGS : DefaultSettingsResource = preload("res://Scenes/Resources/Settings/DefaultSettings.tres")
@onready var keybeind_resource : PLayerKeybindResource = preload("res://Scenes/Resources/Settings/PlayerRebindDefault.tres")

var window_mode_index : int = 0
var resolution_index : int = 0
var master_volume : float = 0
var music_volume : float = 0
var sfx_volume : float = 0
var loaded_data : Dictionary = {}



func _ready():
	handle_signals()
	create_storage_dictionary()



func create_storage_dictionary() -> Dictionary:
	var settings_container_dict : Dictionary = {
		"window_mode_index" : window_mode_index,
		"resolution_index" : resolution_index,
		"master_volume" : master_volume,
		"music_volume" : music_volume,
		"sfx_volume" : sfx_volume,
		"keybinds" : create_keybinds_dict()
	}
	return settings_container_dict



func create_keybinds_dict() -> Dictionary:
	var keybinds_container_dict = {
		keybeind_resource.LEFT : keybeind_resource.left_key,
		keybeind_resource.RIGHT : keybeind_resource.right_key,
		keybeind_resource.UP : keybeind_resource.up_key,
		keybeind_resource.DOWN : keybeind_resource.down_key,
		keybeind_resource.INTERACT : keybeind_resource.interact_key,
		keybeind_resource.ESC : keybeind_resource.esc_key
	}
	return keybinds_container_dict



func get_window_mode_index() -> int:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_WINDOW_MODE_INDEX
	return window_mode_index

func get_resolution_index() -> int:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_RESOLUTION_INDEX
	return resolution_index

func get_master_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_MASTER_VOLUME
	return master_volume

func get_music_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_MUSIC_VOLUME
	return music_volume

func get_sfx_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_SFX_VOLUME
	return sfx_volume

func get_keybind(action : String):
	if !loaded_data.has("keybinds"):
		match action:
			keybeind_resource.LEFT:
				return keybeind_resource.DEFAULT_LEFT_KEY
			keybeind_resource.RIGHT:
				return keybeind_resource.DEFAULT_RIGHT_KEY
			keybeind_resource.UP:
				return keybeind_resource.DEFAULT_UP_KEY
			keybeind_resource.DOWN:
				return keybeind_resource.DEFAULT_DOWN_KEY
			keybeind_resource.INTERACT:
				return keybeind_resource.DEFAULT_INTERACT_KEY
			keybeind_resource.ESC:
				return keybeind_resource.DEFAULT_ESC_KEY
	else:
		match action:
			keybeind_resource.LEFT:
				return keybeind_resource.left_key
			keybeind_resource.RIGHT:
				return keybeind_resource.right_key
			keybeind_resource.UP:
				return keybeind_resource.up_key
			keybeind_resource.DOWN:
				return keybeind_resource.down_key
			keybeind_resource.INTERACT:
				return keybeind_resource.interact_key
			keybeind_resource.ESC:
				return keybeind_resource.esc_key



func on_window_mode_selected(index : int) -> void:
	window_mode_index = index

func on_resolution_selected(index : int) -> void:
	resolution_index = index

func on_master_sound_set(value : float) -> void:
	master_volume = value

func on_music_sound_set(value : float) -> void:
	music_volume = value

func on_sfx_sound_set(value : float) -> void:
	sfx_volume = value



func set_keybind(action : String, event) -> void:
	match action:
		keybeind_resource.LEFT:
			keybeind_resource.left_key = event
		keybeind_resource.RIGHT:
			keybeind_resource.right_key = event
		keybeind_resource.UP:
			keybeind_resource.up_key = event
		keybeind_resource.DOWN:
			keybeind_resource.down_key = event
		keybeind_resource.INTERACT:
			keybeind_resource.interact_key = event
		keybeind_resource.ESC:
			keybeind_resource.esc_key = event



func on_keybinds_loaded(data : Dictionary) -> void:
	var loaded_left = InputEventKey.new()
	var loaded_right = InputEventKey.new()
	var loaded_up = InputEventKey.new()
	var loaded_down = InputEventKey.new()
	var loaded_interact = InputEventKey.new()
	var loaded_esc = InputEventKey.new()
	
	loaded_left.set_physical_keycode(int(data.left))
	loaded_right.set_physical_keycode(int(data.right))
	loaded_up.set_physical_keycode(int(data.up))
	loaded_down.set_physical_keycode(int(data.down))
	loaded_interact.set_physical_keycode(int(data.interact))
	loaded_esc.set_physical_keycode(int(data.esc))
	
	keybeind_resource.left_key = loaded_left
	keybeind_resource.right_key = loaded_right
	keybeind_resource.up_key = loaded_up
	keybeind_resource.down_key = loaded_down
	keybeind_resource.interact_key = loaded_interact
	keybeind_resource.esc_key = loaded_esc



func on_settings_data_loaded(data : Dictionary) -> void:
	loaded_data = data
	on_window_mode_selected(loaded_data.window_mode_index)
	on_resolution_selected(loaded_data.resolution_index)
	on_master_sound_set(loaded_data.master_volume)
	on_music_sound_set(loaded_data.music_volume)
	on_sfx_sound_set(loaded_data.sfx_volume)
	on_keybinds_loaded(loaded_data.keybinds)



func handle_signals() -> void:
	SettingsSignalBus.on_window_mode_selected.connect(on_window_mode_selected)
	SettingsSignalBus.on_resolution_selected.connect(on_resolution_selected)
	SettingsSignalBus.on_master_sound_set.connect(on_master_sound_set)
	SettingsSignalBus.on_music_sound_set.connect(on_music_sound_set)
	SettingsSignalBus.on_sfx_sound_set.connect(on_sfx_sound_set)
	SettingsSignalBus.load_settings_data.connect(on_settings_data_loaded)
