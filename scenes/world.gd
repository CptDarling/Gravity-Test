class_name World extends Node2D

@onready var spawn_point: SpawnPoint = %SpawnPoint

func _on_spawn_point_spawned_mob(mob: Variant) -> void:
	spawn_point.add_child(mob)
