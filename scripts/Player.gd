extends Area2D

class_name Player

var velocity:Vector2 = Vector2(0,0)

export(int) var speed = 10 

export(NodePath) var HUD_path;

var HUD:HUD

const bulletPath:String = 'entites/bullet/Bullet.tscn'

var can_shoot:bool=true

onready var muzzle:Position2D = get_node('muzzle')

onready var cooldown_timer:Timer = get_node("Cooldown")

var HP:int = 3

func _ready():
	HUD = get_node(HUD_path)

func _shoot()->void:
	var bullet = load(bulletPath).instance()

	
	bullet._start(muzzle.global_position)
	get_parent().add_child(bullet)

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

func damaged():
	if HP-1 == -1:
		queue_free()
	HP-=1
	HUD.damaged()
