extends Node2D

var Player = preload("res://scene/Player.tscn")
var ball = preload("res://scene/Ball.tscn").instance()

const speed = 320

var player_left = Player.instance()
var player_right = Player.instance()

# var player_right_texture = load("res://images/player2.png") TODO: diferentes colores para los sprites

func _ready():
	# OS.set_borderless_window(true)
	add_child(player_right)
	add_child(player_left)
	add_child(ball)
	
	ball.position.x = get_viewport().size.x / 2
	ball.position.y = get_viewport().size.y / 2
	ball.velocity = Vector2(1, 0)

	player_left.get_node("Sprite").texture = load("res://images/player1.png")
	player_left.position.x = 50
	player_left.position.y = get_viewport().size.y / 2
	
	player_right.get_node("Sprite").texture = load("res://images/player2.png")
	player_right.position.x = get_viewport().size.x - 50
	player_right.position.y = get_viewport().size.y / 2
	
	print(get_viewport().size.x)
	
	
	
func _input(event):
	if Input.is_action_just_pressed("left_up"): player_left.set_going_up(1)
	if Input.is_action_just_pressed("left_down"): player_left.set_going_down(1)
	if Input.is_action_just_pressed("right_up"): player_right.set_going_up(1)
	if Input.is_action_just_pressed("right_down"): player_right.set_going_down(1)
	
	if Input.is_action_just_released("left_up"): player_left.set_going_up(0)
	if Input.is_action_just_released("left_down"): player_left.set_going_down(0)
	if Input.is_action_just_released("right_up"): player_right.set_going_up(0)
	if Input.is_action_just_released("right_down"): player_right.set_going_down(0)


