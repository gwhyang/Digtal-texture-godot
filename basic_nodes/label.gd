extends Label

var dragging:bool = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	text = "FPS = " + str(Engine.get_frames_per_second())

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("Click") and DragManager.pick_data == null:
		# 进入拖拽状态
		dragging = true
		DragManager.start_pick(self,0)
