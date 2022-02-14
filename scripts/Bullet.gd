extends Area2D

const speed:int = 100

func _start(_position:Vector2)->void:
	position=_position

func _process(delta:float)->void:
	position.y-=10*delta*speed




func _on_Bullet_area_entered(area):
	if area is Enemy:
		area.queue_free()	
