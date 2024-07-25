extends Area2D

@onready var game_manager = %GameManager
@onready var animated_sprite = $AnimatedSprite2D
@export var checkpoint_id : String

func _ready():
	if Global.is_checkpoint_collected(checkpoint_id):
		animated_sprite.play("checked")
	else:
		animated_sprite.play("un_checked")

func _on_body_entered(body: Node) -> void:
	if body and Global.coin > 0:
		Global.update_spawn(global_position, checkpoint_id)
		Global.coin -= 1 
		animated_sprite.play("checked")
