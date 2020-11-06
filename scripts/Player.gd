extends Area2D

const speed = 400

var going_up = 0
var going_down = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func set_going_up(_going_up):
	going_up = _going_up

func set_going_down(_going_down):
	going_down = _going_down

func _physics_process(delta):
	self.position.y += delta * (going_down - going_up) * speed
	if self.position.y <= 12 + 60: self.position.y = 12 + 60
	if self.position.y >= 708 - 60: self.position.y = 708 - 60

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
