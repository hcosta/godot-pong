extends RigidBody2D

@export var speed = 450
@export var ball : Ball
@export var auto_mode : bool

var initial_position : Vector2

func _ready():
	initial_position = global_position

func _physics_process(delta):
	# Rectificar la posición horizontal a la que tenía al principio
	global_position.x = initial_position.x
	
	if auto_mode:
		var distance_vector = ball.position - position
		var direction = distance_vector.normalized()
		linear_velocity.y = direction.y * speed
	else:
		# Definir un vector de dirección
		var movement = Vector2.ZERO  # (0,0)
		# Dependiendo del control le asignamos un movimiento arriba o abajo
		if Input.is_action_pressed("ui_up"):
			movement = Vector2.UP  # (0, -1)
		elif Input.is_action_pressed("ui_down"):
			movement = Vector2.DOWN  # (0, 1)
		# Realizamos el movimiento aplicando la fuerza al cuerpo
		linear_velocity = movement * speed
