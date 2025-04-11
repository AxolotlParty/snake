extends Node2D

var cell_scene = load("res://Entities/Cell/Cell.tscn")
var grid:Grid
@export var light_colour: Color
@export var dark_colour: Color

func set_grid(grid_value: Grid) -> void:
	grid = grid_value
	clear_children(self)
	_populate_cells()
	
func _populate_cells() -> void:
	for index in range(grid.columns * grid.rows):
		var cell = cell_scene.instantiate()
		cell.index = index
		cell.grid = grid
		cell.light_colour = light_colour
		cell.dark_colour = dark_colour
		add_child(cell)

func clear_children(parent_node: Node):
	for child in parent_node.get_children():
		child.queue_free()
