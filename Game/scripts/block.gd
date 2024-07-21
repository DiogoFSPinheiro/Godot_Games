extends RigidBody2D

@onready var collision = $CollisionShape2D

var is_being_pushed = false
var move_speed = 50

func _physics_process(delta):
	if is_being_pushed:
		var direction = Input.get_axis("move_left", "move_right")
		if direction != 0 && Input.is_action_pressed("grab"):
			var move_vector = Vector2(direction * move_speed * delta, 0)
			move_and_collide(move_vector)
		else:
			position.x += 0

func _on_area_2d_body_entered(body):
	if body:
		is_being_pushed = true

func _on_area_2d_body_exited(body):
	if body:
		is_being_pushed = false

