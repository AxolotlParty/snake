extends Node2D

@onready var grid: Grid = Grid.new()
@onready var background = $Background

func _ready() -> void:
	grid.columns = 20
	grid.rows = 10
	grid.tile_size = 16
	background.set_grid(grid)
