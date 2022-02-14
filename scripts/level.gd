extends Node2D

onready var enemy_number = get_node("enemies").get_children().size()

onready var HUD = get_node("HUD")

# func _ready():
# 	print(enemy_number)

func _process(delta):
	var current_enemy_number = get_node("enemies").get_children().size()

	HUD.set_score(enemy_number-current_enemy_number)
