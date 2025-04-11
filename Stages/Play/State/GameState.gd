class_name GameState

const Enums = preload("res://Stages/Play/State/Enums.gd")
var grid: Grid
var score: int = 0
var snake = [61, 51, 41]
var direction: Enums.Direction 
var next_direction: Enums.Direction
var food = Vector2i.ZERO
var random = RandomNumberGenerator.new()
var offsets = {}

func reset_game():
	snake = [61, 51, 41]  
	direction = Enums.Direction.Right
	next_direction = Enums.Direction.Right
	offsets = {
		Enums.Direction.Up: -1,
		Enums.Direction.Down: 1,
		Enums.Direction.Left: -grid.rows,
		Enums.Direction.Right: grid.rows,
	}
	spawn_food()
	

func set_direction(new_direction: Enums.Direction):
	match new_direction:
		Enums.Direction.Up: if direction != Enums.Direction.Down: next_direction = Enums.Direction.Up
		Enums.Direction.Down: if direction != Enums.Direction.Up: next_direction = Enums.Direction.Down
		Enums.Direction.Left: if direction != Enums.Direction.Right: next_direction = Enums.Direction.Left
		Enums.Direction.Right: if direction != Enums.Direction.Left: next_direction = Enums.Direction.Right
	
func update() -> void:
	print("Update Game State")
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
	
	var head = snake[0]
	var newHead = head
	
	# Up
	# newHead = head - 1 if (head % grid.columns != 0) else head + (grid.rows - 1)

	# Down
	newHead = head + 1 if (head % grid.columns != 0) else head % grid.columns
	
	snake.insert(0, newHead)
	snake.pop_back()


elif direction == "down":
		if head >= grid_width * (grid_height - 1):
			new_head = head % grid_width
		else:
			new_head = head + grid_width
			
