extends AnimationPlayer

@onready var platform_3 = $".."
@onready var animation = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if platform_3.move == true:
		animation.play("moving")
	else:
		animation.pause()
