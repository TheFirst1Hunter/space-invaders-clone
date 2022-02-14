extends CanvasLayer

class_name HUD

onready var healthNodes = get_node("health").get_children()

onready var lable = get_node("points/Label")

var HP:int = 3

func _ready():
	pass


func set_score(score:int):
	lable.text="score: %d" % score


func damaged():
	HP -= 1
	removeHealthSprite()

func removeHealthSprite():
	var icon:Sprite = healthNodes[HP]

	# Tween wroks perectly but we should simplyfy this

	# var tween:Tween = icon.get_node('Tween')

	# tween.interpolate_property(icon,"position",icon.position,Vector2(icon.position.x,-20),1.5,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)

	# tween.interpolate_property(icon,"modulate",Color(1,1,1,1),Color(1,1,1,0),1,Tween.TRANS_LINEAR,Tween.EASE_OUT)

	
	# tween.start()
	icon.visible=false

