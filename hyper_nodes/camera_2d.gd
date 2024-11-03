extends Node2D

@export var FOLLOW_SPEED:float = 5

var mouse_position:Vector2
var not_moving:bool = true

func _ready():
	set_physics_process(false)

func _input(event):
	if not_moving:
		
		if event.is_action_pressed('confirm_move_camera'):
			not_moving = false
			return
		
		if event.is_action_pressed('move_camera'):
			var d = abs(position - get_global_mouse_position()) - abs(get_view_size($Camera2D) *0.3)
			if (d.x  >= 0) or (d.y >= 0):
				not_moving = false
		return
		
	if event.is_action_released('move_camera') or event.is_action_released('confirm_move_camera') :
		not_moving = true
		return
		
	mouse_position = get_global_mouse_position()
	set_physics_process(true)
	
func _physics_process(delta):
	position = position.lerp(mouse_position, .1)

# 获取 Camera2D 视野大小
func get_view_size(camera: Camera2D) -> Vector2:
	var view_size = get_viewport_rect().size / camera.zoom   # 根据缩放比例计算视野大小
	return get_viewport_rect().size / camera.zoom
