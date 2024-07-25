extends AnimationPlayer

@onready var platform_2 = $".."
@onready var animation = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if platform_2.move == true:
		animation.play("teste")
	else:
		pass
