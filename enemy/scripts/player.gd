extends CharacterBody2D

const SPEED = 600.0

func _physics_process(delta):

	var direction = Vector2(Input.get_axis("move_left", "move_right"),Input.get_axis("move_up", "move_down"))
	
	# Normalize to prevent diagonal speed increase
	if direction.length() > 0:
		direction = direction.normalized()
	
	# Apply movement with speed
	velocity = direction * SPEED
	
	# Use move_and_slide with velocity to handle movement
	move_and_slide()
#https://www.youtube.com/watch?v=dCsg0nJO_bU
