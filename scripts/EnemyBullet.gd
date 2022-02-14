extends Area2D

class_name EnemyBullet

const speed:int = 100

func _start(_position:Vector2)->void:
	position=_position

func _process(delta:float)->void:
	position.y+=10*delta*speed




func _on_EnemyBullet_area_entered(area):
	if area is Player:
		area.damaged()
