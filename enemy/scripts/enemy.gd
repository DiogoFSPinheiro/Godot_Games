extends CharacterBody2D

# Enemy parameters
@export var speed: float = 200.0  # Movement speed of the enemy
@onready var last_sight_timer = $last_sight_timer
@onready var line_of_sight = $RayCast2D

# Internal variables
var _player: Node2D = null
var _player_detected: bool = false  # Whether player is in detection range
var _lost_sight: bool = true  # Track if we have lost sight but still moving
var _last_known_direction: Vector2 = Vector2.ZERO  # Last known direction of the player
var _lost_sight_timer: float = 0.0  # Countdown timer for losing sight

func _ready():
	pass

# Main function to update movement
func _physics_process(delta: float) -> void:
	if _player_detected and _player:
		line_of_sight.target_position = _player.global_position - global_position
		line_of_sight.force_raycast_update()
		if line_of_sight.is_colliding() == false or line_of_sight.get_collider() == _player:
			_lost_sight = false
			print("estou a ver")
			_follow_player(delta)
		else:
			if not _lost_sight:
				# Start the lost sight timer and save the last direction
				print("nao vejo")
				_lost_sight = true
				_last_known_direction = (_player.global_position - global_position).normalized()
				last_sight_timer.start()
	if (_lost_sight or not _player_detected) and last_sight_timer.is_stopped() == false:
			# Continue moving in the last known direction
			print("nao vejo mas estou a procura")
			_follow_last_known_direction(delta)
			

# Continue moving in the last known direction
func _follow_last_known_direction(delta: float) -> void:
	velocity = _last_known_direction * speed
	move_and_slide()

# Follow the player
func _follow_player(delta: float) -> void:
		var direction = (_player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()

# Signal for when the player enters detection range
func _on_detection_area_body_entered(body):
	if body.name == "player":
		_player = body  # Store a reference to the player node
		_player_detected = true

# Signal for when the player exits detection range
func _on_detection_area_body_exited(body):
	if body.name == "player":
		_player_detected = false
		_last_known_direction = (_player.global_position - global_position).normalized()
		if not _lost_sight:
			last_sight_timer.start()

func _on_last_sight_timer_timeout():
	velocity = Vector2.ZERO
	print("nao encontrei")
	_lost_sight = true
