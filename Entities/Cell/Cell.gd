extends Node2D

var index: int
var light_colour: Color
var dark_colour: Color
var grid:Grid
	
func _draw() -> void:
	var grid_position = grid.convert(index)
	var base_size = grid.tile_size
	
	var steps = [
		{ "offset": 0, "inset": 0, "color": light_colour },
		{ "offset": 1, "inset": 2, "color": dark_colour },
		{ "offset": 3, "inset": 6, "color": light_colour },
		{ "offset": 4, "inset": 16, "color": dark_colour },
	]
	
	for step in steps:
		var pos = grid_position + Vector2i(step.offset, step.offset)
		var size = Vector2i(base_size - step.inset, base_size - step.inset)
		draw_rect(Rect2i(pos, size), step.color)
