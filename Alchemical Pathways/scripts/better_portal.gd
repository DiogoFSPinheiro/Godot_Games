extends Area2D
@onready var sound = $sound
@export var coord_x = 0
@export var coord_y = 0
# Called when the node enters the scene tree for the first time.
func _on_body_entered(body):
	body.global_position = Vector2(coord_x, coord_y)
	Global.spawn_point = Vector2(coord_x, coord_y)
	sound.play()
