extends Area2D

class_name Enemy

onready var muzzle:Position2D = get_node("Muzzle/Muzzle")
onready var reaction:Timer=get_node('Reaction')
onready var  rayCast:RayCast2D= get_node("Muzzle/RayCast2D") 
const bulletPath:String = 'entites/bullet/EnemyBullet.tscn'

func _ready():
	rayCast.collide_with_areas=true

func react()->void:
	pass

func shoot()->void:
	var bullet = load(bulletPath).instance()
	
	add_child(bullet)
	
	bullet._start(muzzle.position)
	
	bullet.z_index=-1

	reaction.start()


func _on_Reaction_timeout():
	if rayCast.is_colliding():
		var collider = rayCast.get_collider()
		
		if collider is Player:
			var player = collider

			
			
	shoot()
