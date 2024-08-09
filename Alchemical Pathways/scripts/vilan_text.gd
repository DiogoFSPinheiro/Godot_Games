extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.kill == false:
		$Label.text = "Ah! you cant kill me! \nGo back to the tower!"
	else:
		$Label.text = "Where did you get that! \nPlease stay back!!! "
		
