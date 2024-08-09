extends Area2D

@onready var animated_sprite = $AnimatedSprite2D
@export var checkpoint_id : String
var on = false

func _ready():
	if Global.is_checkpoint_collected(checkpoint_id):
		animated_sprite.play("checked")
		on = true
	else:
		animated_sprite.play("un_checked")
		on = false

func _on_body_entered(body: Node) -> void:
	if body and Global.coin > 0:
		Global.update_spawn(global_position, checkpoint_id)
		if on == false:
			Global.coin -= 1
			$sound.play()
			on = true
		animated_sprite.play("checked")
		

