extends Line2D

@export var anchor:Node2D
@export var point_count:int = 100
@export var is_point_count_limited:bool = true

func _physics_process(delta):
	if is_point_count_limited:
		if get_point_count() >= point_count:
			remove_point(0)
	drawpoint()

func drawpoint() -> void:
	add_point(anchor.global_position)
