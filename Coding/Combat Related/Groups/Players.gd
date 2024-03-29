extends Node2D

var characters : Array = []
var index : int = 0

func _ready():
	characters = get_children()
	for i in range(characters.size()):
		characters[i].position = Vector2(0, i * 115)
		var character = characters[i]
		character.position.x -= 10 * i  # Add 10 * i to the X-coordinate
	characters[0].selector()

func _on_enemies_next_player():
	if index < characters.size() - 1:
		index += 1
		switch_selector(index, index - 1)
	else:
		index = 0
		switch_selector(index, characters.size() - 1)

func switch_selector(x,y):
	characters[x].selector()
	characters[y].hide_selector()
