extends AnimationPlayer

@onready var animation = $"."
@onready var platform_8 = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if platform_8.move == true:
		animation.play("move")
	else:
		animation.pause()
