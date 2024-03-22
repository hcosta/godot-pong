extends Node2D

@onready var ball = $Ball
@onready var timer = $Timer
@onready var player_points = $PlayerPoints
@onready var enemy_points = $EnemyPoints
@onready var point = $Point

var fullscreen : bool = false

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		# Salir del juego
		get_tree().quit()
	if event.is_action_pressed("ui_fullscreen"):
		fullscreen = not fullscreen
		if fullscreen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_player_scored(body: Node2D):
	if body is Ball:
		timer.start()
		player_points.score()
		point.play()

func _on_enemy_scored(body: Node2D):
	if body is Ball:
		timer.start()
		enemy_points.score()
		point.play()
	
func start_game():
	ball.start()
