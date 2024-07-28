extends RigidBody2D

@onready var ray_cast_left = $RayCast_left
@onready var ray_cast_right = $RayCast_right
@onready var animated_sprite_2d = $AnimatedSprite2D


# Get the gravity from the project settings to be synced with RigidBody nodes.

func _physics_process(delta):
	if ray_cast_right.is_colliding():
		animated_sprite_2d.flip_h = false
	if ray_cast_left.is_colliding():
		animated_sprite_2d.flip_h = true
	if Global.colide == true:
		self.set_collision_mask_value(1, false)
		
	
