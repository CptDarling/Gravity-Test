class_name SpawnPoint extends Node2D

# This provides a radius for our spawn position
@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D

const OBJECT_RB_2D = preload("res://scenes/object_rb_2d.tscn")

signal spawned_mob(mob)

@export var enabled: bool = false

func _on_trigger_timeout() -> void:
	if !enabled:
		return

	var obj = OBJECT_RB_2D.instantiate()

	# where are we going to put this mob then?
	var x: float = position.x
	var y: float = position.y

	# with a little random offset within the spawn radius
	var radius: float = collision_shape_2d.shape.radius
	x = randf_range(-radius, radius)
	y = randf_range(-radius, radius)

	# yes, just here
	var _position: Vector2 = Vector2(x, y)
	obj.position = _position

	# despatch the mob
	spawned_mob.emit(obj)
