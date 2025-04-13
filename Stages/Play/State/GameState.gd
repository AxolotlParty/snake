class_name GameState

const Enums = preload("res://Common/Grids/Enums.gd")
var grid: Grid
var score: int = 0
var snake = [89, 88, 87]
var direction: Enums.Direction 
var next_direction: Enums.Direction
var food = Vector2i.ZERO
var random = RandomNumberGenerator.new()

func reset_game():
	snake = [89, 88, 87]
	direction = Enums.Direction.East
	next_direction = Enums.Direction.East
	spawn_food()
	

func set_direction(new_direction: Enums.Direction):
	match new_direction:
		Enums.Direction.North: if direction != Enums.Direction.South: next_direction = Enums.Direction.North
		Enums.Direction.South: if direction != Enums.Direction.North: next_direction = Enums.Direction.South
		Enums.Direction.West: if direction != Enums.Direction.East: next_direction = Enums.Direction.West
		Enums.Direction.East: if direction != Enums.Direction.West: next_direction = Enums.Direction.East
	
func update() -> void:
	update_snake()
	# If the snake hits snake, game over
	# If the snake hits food, extra snake, inscrement score
	# If the snake, pops the border, teleport head

func spawn_food():
	food = Vector2i(random.randi_range(0, grid.columns - 1), random.randi_range(0, grid.rows - 1))
	while food in snake:  
		food = Vector2i(random.randi_range(0, grid.columns - 1), random.randi_range(0, grid.rows - 1))

func update_snake():
	direction = next_direction
	snake.insert(0, grid.move(snake[0], direction))
	snake.pop_back()
