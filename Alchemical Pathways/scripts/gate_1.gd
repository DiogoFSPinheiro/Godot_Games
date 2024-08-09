extends Area2D
@onready var sound = $"../sound"

func _on_body_entered(body):
	body.position = Vector2(1915, -1425)
	sound.play()
