extends Area2D

@onready var platform = $".."
var move = false

func _process(delta):
	if move == true:
		platform.move = true
	else:
		platform.move = false
		


func _on_body_exited(body):
	if body.is_in_group("Blocks"):
		move = true


func _on_body_entered(body):
	if body.is_in_group("Blocks"):
		move = false
