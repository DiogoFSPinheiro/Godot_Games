extends RigidBody2D

@onready var collision = $CollisionShape2D
@onready var player = $"../../Player"

var is_being_pushed = false
var move_speed = 0.68
var target = null

#func _physics_process(delta):
	#get_body()
	#if is_being_pushed:
	#	var direction = Input.get_axis("move_left", "move_right")
	#	if direction != 0 && Input.is_action_pressed("grab"):
	#		var move_vector = Vector2(direction * move_speed * delta, 0)
	#		target.position += move_vector
	#		move_and_collide(move_vector)
	#	else:
	#		position.x += 0

func get_body():
	if player.near_block == true:
		is_being_pushed = true
		target = player.target
		
	else:
		target = null
		is_being_pushed = false



