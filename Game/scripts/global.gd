#extends Node

#var spawn_point = Vector2(1344,-64)

	
#func update_spawn(new_point):
#	spawn_point = new_point

extends Node

var spawn_point = Vector2(1344, -64)
var collected_checkpoints = {}
var collected_items = {}
var coin = 0

func update_spawn(new_point, checkpoint_id):
	spawn_point = new_point
	collected_checkpoints[checkpoint_id] = true

func is_checkpoint_collected(checkpoint_id):
	return collected_checkpoints.has(checkpoint_id) and collected_checkpoints[checkpoint_id]

func collect_item(item_id):
	coin += 1
	collected_items[item_id] = true

func is_item_collected(item_id):
	return item_id in collected_items and collected_items[item_id]
