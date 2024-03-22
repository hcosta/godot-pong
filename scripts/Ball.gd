extends CharacterBody2D

class_name Ball  # Esto nos servirá para saber más adelante si un nodo es una bola

@export var speed : int = 200
@export var speed_multiplier : float = 1.03 # Un 3% más rápido por colisión

@onready var trail_2d = $Trail2D
@onready var hit = $"../Hit"
@onready var bounce = $"../Bounce"

var initial_position : Vector2

func _ready():
	initial_position = global_position

func _physics_process(delta):
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		var normal_vector = collision.get_normal()
		velocity = velocity.bounce(normal_vector) * speed_multiplier
		# Dependiendo del tipo de colisión reproducir un sonido u otro
		if collision.get_collider() is RigidBody2D:
			hit.play()
		elif collision.get_collider() is StaticBody2D:
			bounce.play()

func start():
	# Establecemos la posición y la velocidad de la bola
	position = initial_position
	velocity = [Vector2(-1, -1), Vector2(-1, 1), Vector2(1, -1), Vector2(1, 1)].pick_random()
	trail_2d.clear_points()
