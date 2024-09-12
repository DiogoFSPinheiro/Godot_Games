extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer
@export var item_id : String
@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.is_item_collected(item_id):
		queue_free()
	else:
		animated_sprite.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(_body):
	Global.path += 1
	Global.collect_item(item_id)
	animation_player.play("pickUp")
