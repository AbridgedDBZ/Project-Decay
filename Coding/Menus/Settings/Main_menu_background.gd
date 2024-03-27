extends ParallaxBackground

@onready var sky = $Sky
@onready var clouds = $Clouds
@onready var mountains = $Mountains
@onready var dunes = $Dunes
@onready var ground = $Ground
@export var CLOUD_SPEED = -2
@export var MOUNTAIN_SPEED = 5
@export var DUNE_SPEED = 15
@export var GROUND_SPEED = 20



func _process(delta) -> void:
	clouds.motion_offset.x += CLOUD_SPEED * delta
	mountains.motion_offset.x += MOUNTAIN_SPEED * delta
	dunes.motion_offset.x += DUNE_SPEED* delta
	ground.motion_offset.x += GROUND_SPEED * delta
