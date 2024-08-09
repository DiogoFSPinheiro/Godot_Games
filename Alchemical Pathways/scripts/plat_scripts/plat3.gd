extends AnimationPlayer

@onready var platform_9 = $".."
@onready var animation = $"."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if platform_9.move == true:
		animation.play("move")
	else:
		animation.pause()
