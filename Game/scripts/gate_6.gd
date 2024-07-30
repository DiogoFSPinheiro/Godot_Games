extends Area2D
@onready var sound = $"../sound"

func _on_body_entered(body):
	body.position = Vector2(1320, 388)
	Global.spawn_point = Vector2(1320, 388)
	sound.play()
