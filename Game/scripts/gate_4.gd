extends Area2D
@onready var sound = $"../sound"

func _on_body_entered(body):
	body.position = Vector2(3464, -1710)
	sound.play()

