extends Area2D

const speed:int = 100

func _start(_position:Vector2)->void:
	position=_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float)->void:
	position.y-=10*delta*speed


