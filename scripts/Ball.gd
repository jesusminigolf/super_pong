extends Area2D

export var speed = 200
var velocity = Vector2()

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
	
	
