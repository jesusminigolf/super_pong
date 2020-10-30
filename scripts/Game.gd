extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player = preload("res://scene/Player.tscn")

var player_left = player.instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(player_left)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
