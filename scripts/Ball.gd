extends Area2D

export var speed = 500
var velocity = Vector2()

func _process(delta):
	var rectangulo = $Shape
	#print("POS Y BOLA = " + str($Shape.get_shape()))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# actualizamos la posición de la bola
	position += velocity.normalized() * speed * delta
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
		#print("VEL VERT = " + str(vertical_distance))
		velocity.x *= -1
		velocity.y += vertical_distance / 50
		"""
		var generator = RandomNumberGenerator.new()
		generator.randomize()
		var new_y = generator.randf_range(-0.75, 0.75)
		print(new_y)
		velocity.y = new_y
		"""		
