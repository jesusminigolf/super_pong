extends Area2D

export var speed = 400
export var max_increase = 6
export var grace_time = 2
var velocity = Vector2()

func _process(delta):
	var rectangulo = $Shape
	#print("POS Y BOLA = " + str($Shape.get_shape()))

var start_time
var grace_time_since
var grace = false

func _ready():
	restart_ball()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# actualizamos la posición de la bola
	if grace:
		if OS.get_unix_time() - grace_time_since > grace_time:
			grace = false
			start_time = OS.get_unix_time()
		else:
			return

	var time_since_begin = (OS.get_unix_time() - start_time) * 0.5
	position += velocity.normalized() * (speed * delta + (time_since_begin if time_since_begin < max_increase else max_increase))
	# comprobamos rebotes con el límite de arriba y de abajo
	if position.y <= 12 + 15 and velocity.y < 0:
		position.y = 12 + 15
		velocity.y *= -1
	elif position.y >= 708 - 15 and velocity.y > 0:
		position.y = 708 - 15
		velocity.y *= -1
	
	if position.x < 0 or position.x > 1280:
		restart_ball()
		
	
var rng = RandomNumberGenerator.new()

func restart_ball():
	position.x = 640
	position.y = 360
	velocity.y = 0
	grace_time_since = OS.get_unix_time()
	grace = true

func _on_Ball_area_entered(area):
	if area.is_in_group("player"):
		var vertical_distance =  self.position.y - area.position.y
		rng.randomize()
		velocity.x *= -1
		velocity.y += vertical_distance / 65
		if velocity.y == 0:
			velocity.y = rng.randi_range(-1, 1)
