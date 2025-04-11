extends Node2D

var cell_scene = load("res://Entities/Cell/Cell.tscn")
var grid:Grid
@export var light_colour: Color
@export var dark_colour: Color
	
func set_cells(cells: Array) -> void:
	print(cells)
	_clear_children()
	for index in cells:
		var cell = cell_scene.instantiate()
		cell.index = index
		cell.grid = grid
		cell.light_colour = light_colour
		cell.dark_colour = dark_colour
		add_child(cell)

func _clear_children():
	for child in self.get_children():
		child.queue_free()
