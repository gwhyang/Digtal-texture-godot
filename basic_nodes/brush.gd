extends Node2D



var dragging:bool = false
'''
func _input(event):
	mouse_position = get_global_mouse_position()
	
func _physics_process(delta):
	position = position.lerp(mouse_position, delta * FOLLOW_SPEED)
'''

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("Click") and DragManager.pick_data == null:
		# 进入拖拽状态
		dragging = true
		DragManager.start_pick(self,1)
