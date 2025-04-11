extends Node2D

const Enums = preload("res://Stages/Play/State/Enums.gd")
@onready var game_state: GameState = GameState.new()
@onready var grid: Grid = Grid.new()
@onready var background = $Background
@onready var snake = $Snake

var update_interval = 0.4
var accumulator = 0.0

func _ready() -> void:
	# Setup Game
	grid.columns = 20
	grid.rows = 10
	grid.tile_size = 16
	
	#Setup Renderer
	background.grid = grid
	background.set_cells(range(grid.rows * grid.columns))
	
	# TODO: Render Food
	
	# TODO: Setup State
	game_state.grid = grid
	game_state.reset_game()
	
	snake.grid = grid
	snake.set_cells(game_state.snake)

func _unhandled_input(event):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_UP: game_state.set_direction(Enums.Direction.Up)
			KEY_DOWN: game_state.set_direction(Enums.Direction.Down)
			KEY_LEFT: game_state.set_direction(Enums.Direction.Left)
			KEY_RIGHT: game_state.set_direction(Enums.Direction.Right)

func _physics_process(delta):
	accumulator += delta
	while accumulator >= update_interval:
		accumulator -= update_interval
		update_game()
		
func update_game() -> void:
	game_state.update()
	# TODO: Update Food
	snake.set_cells(game_state.snake)
