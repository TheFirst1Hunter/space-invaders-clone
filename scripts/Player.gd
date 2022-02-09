extends Area2D

var velocity:Vector2 = Vector2(0,0)
export(int) var speed = 10 
const bulletPath:String = 'entites/bullet/Bullet.tscn'
var can_shoot:bool=true
onready var muzzle:Position2D = get_node('muzzle')
onready var cooldown_timer:Timer = get_node("Cooldown")

func _ready():
	pass # Replace with function body.

func _shoot()->void:
	var bullet = load(bulletPath).instance()

	add_child(bullet)

	bullet._start(muzzle.position)

	bullet.z_index=0

func _process(delta):
	position+=velocity*delta*speed

func _input(event):
	if Input.is_action_pressed('ui_right'):
		velocity.x=1

	if Input.is_action_pressed('ui_left'):
		velocity.x=-1
	
	if !Input.is_action_pressed('ui_left') && !Input.is_action_pressed('ui_right') && velocity.x !=0:
		velocity.x = 0
	
	
	if event.is_action_pressed('ui_accept'):
		_shoot()
		can_shoot=false
		cooldown_timer.start()



func _on_Cooldown_timeout():
	can_shoot=true
