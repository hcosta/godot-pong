extends Label

var points : int = 0

func _ready():
	text = "0"
	
func score():
	points += 1
	text = str(points)
