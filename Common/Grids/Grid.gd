class_name Grid

# This grid is row major ordered grid
# [0, 1, 2]
# [3, 4, 5]
# [6, 7, 8]

const Enums = preload("res://Common/Grids/Enums.gd")
var columns:int
var rows:int

func index_to_position(index: int) -> Vector2i:
	return Vector2i(index % columns, index / columns)
	
func position_to_index(position: Vector2i) -> int:
	return position.x * columns + position.y
	
func move(index: int, direction: Enums.Direction) -> int:
	match direction:
		Enums.Direction.North: return index + columns * (rows - 1) if index < columns else index - columns
		Enums.Direction.South: return index % columns if index >= columns * (rows -1) else index + columns
		Enums.Direction.East: return index - columns + 1 if index % columns == columns - 1 else index + 1
		Enums.Direction.West: return index + columns - 1 if index % columns == 0 else index - 1
		_:
			push_error("Unknown direction")
			return -1
