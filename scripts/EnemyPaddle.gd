extends RigidBody2D

@export var speed : int = 450
@export var ball : Ball

var initial_position : Vector2

func _ready():
	initial_position = global_position

func _physics_process(delta):
	# Rectificar la posición horizontal a la que tenía al principio
	global_position.x = initial_position.x
	
	var distance_vector = ball.position - position
	var direction = distance_vector.normalized()
	linear_velocity.y = direction.y * speed
