extends Node2D

@onready var to_upstairs_cam = $Maatet/Maatet/To_upstairs_cam
@onready var to_downstairs_cam = $Maatet/Maatet/To_downstairs_Cam
@onready var kitchen_cam = $Maatet/Maatet/Kitchen_cam
@onready var hallway_cam = $Maatet/Maatet/Hallway_cam
@onready var tile_map = $TileMap

func _ready():
	to_upstairs_cam.enabled = false
	to_downstairs_cam.enabled = false
	kitchen_cam.enabled = false
	hallway_cam.enabled = false

func _on_to_floor_3_body_entered(_body : CharacterBody2D):
	to_upstairs_cam.enabled = true
	tile_map.set_layer_modulate( 3, Color(1, 1, 1, 0.408))
func _on_to_floor_3_body_exited(_body : CharacterBody2D):
	to_upstairs_cam.enabled = false
	tile_map.set_layer_modulate( 3, Color(1,1,1))

func _on_to_kitchen_body_entered(_body : CharacterBody2D):
	kitchen_cam.enabled = true
	tile_map.set_layer_modulate( 3, Color(1, 1, 1, 0.408))
func _on_to_kitchen_body_exited(_body : CharacterBody2D):
	kitchen_cam.enabled = false
	tile_map.set_layer_modulate( 3, Color(1,1,1))

func _on_to_floor_1_body_entered(_body : CharacterBody2D):
	to_downstairs_cam.enabled = true
	tile_map.set_layer_modulate( 3, Color(1, 1, 1, 0.408))
func _on_to_floor_1_body_exited(_body : CharacterBody2D):
	to_downstairs_cam.enabled = false
	tile_map.set_layer_modulate( 3, Color(1,1,1))

func _on_hallway_body_entered(_body : CharacterBody2D):
	hallway_cam.enabled = true
	tile_map.set_layer_modulate( 4, Color(1, 1, 1, 0.408))
func _on_hallway_body_exited(_body : CharacterBody2D):
	hallway_cam.enabled = false
	tile_map.set_layer_modulate( 4, Color(1,1,1))
