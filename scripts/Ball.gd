extends Area2D

export var speed = 400
export var max_increase = 2
var velocity = Vector2()

func _process(delta):
	var rectangulo = $Shape
	#print("POS Y BOLA = " + str($Shape.get_shape()))

var start_time

func _ready():
	start_time = OS.get_unix_time()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# actualizamos la posición de la bola
	print(OS.get_unix_time() - start_time)
	var time_since_begin = (OS.get_unix_time() - start_time) * 0.05
	position += velocity.normalized() * (speed * delta + (time_since_begin if time_since_begin < max_increase else max_increase))
	# comprobamos rebotes con el límite de arriba y de abajo
	if position.y <= 12 + 15 and velocity.y < 0:
		position.y = 12 + 15
		velocity.y *= -1
	elif position.y >= 708 - 15 and velocity.y > 0:
		position.y = 708 - 15
		velocity.y *= -1
	
	
	
func _on_Ball_area_entered(area):
	if area.is_in_group("player"):
		var vertical_distance =  self.position.y - area.position.y
		if (self.position.y > area.position.y + 30 || self.position.y < area.position.y - 120):
			return
		#print("VEL VERT = " + str(vertical_distance))
		velocity.x *= -1
		velocity.y += vertical_distance / 50
