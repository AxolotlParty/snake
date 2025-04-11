class_name Grid

var columns:int
var rows:int
var tile_size:int

func convert(index: int) -> Vector2i:
	var column = index / rows
	var row = index % rows
	return Vector2(column * tile_size, row * tile_size)
