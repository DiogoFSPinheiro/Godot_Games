extends CharacterBody2D

var SPEED = 100
const JUMP_VELOCITY = -300.0
@onready var game_manager = %GameManager
@onready var animated_sprite = $AnimatedSprite2D
var player_start = Vector2(-41,-208)
var player_position = null
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var near_block = false
var facing_right = true
var facing_left = false
var target = null
var blocks_in_range = []
var block_offset = Vector2()
@onready var grab_area = $grab_area

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or near_block == true):
		velocity.y = JUMP_VELOCITY
		
	var direction = Input.get_axis("move_left", "move_right")
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle_v2")
		else:
			animated_sprite.play("run_v2")
	else:
		animated_sprite.play("jump_v2")
	
	if direction != 0 && (near_block == false && !Input.is_action_just_pressed("grab")):
		update_direction(direction)
		
	if direction == 0 && Input.is_action_just_pressed("flip"):
		self.scale.x = -1
		if facing_right == true:
			facing_right = false
			facing_left = true
		else:
			facing_right = true
			facing_left = false
			

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()  
	
	if near_block and Input.is_action_pressed("grab"):
		move_block(delta, direction)
	
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
		

func _ready() -> void:
	self.position = Global.spawn_point

func update_direction(new_direction_x):
	if new_direction_x > 0 and not facing_right:
		facing_right = true
		facing_left = false
		self.scale.x = -1
	elif new_direction_x < 0 and not facing_left:
		facing_right = false
		facing_left = true
		self.scale.x = -1


func _on_grab_area_body_entered(body):
	if body.is_in_group("Blocks"):
		if not blocks_in_range.has(body):
			blocks_in_range.append(body)
		target = blocks_in_range[0]
		SPEED = 51
		near_block = true

func _on_grab_area_body_exited(body):
	if body.is_in_group("Blocks"):
		blocks_in_range.erase(body) 
		if blocks_in_range.size() > 0:
			target = blocks_in_range[0]
		else:
			target = null
			near_block = false
			SPEED = 100

# tenho de mover no mesmo processo para eles nao descincronizarem	
func move_block(delta, direction): 
	if target:
		var move_vector = Vector2(direction * SPEED * delta, 0)
		target.move_and_collide(move_vector)


	
	
