extends Node2D

enum FOLLOW_MODE{direct,lerp}
#dargging method

@export var FOLLOW_SPEED : float = 10

signal drag_released
var follow_method:Callable

var follow_function:Callable
# 拖拽的对象
var pick_data: Node2D
# 第一次鼠标点击位置与精灵位置之间的差值
var d_value: Vector2
var original_z_index:int = -1

func _ready() -> void:
	set_process(false)  # 初始化时禁用 _process 以减少不必要的计算

func _process(delta: float) -> void:
	follow_method.call(delta)
	# 更新 pick_data 的位置，使其跟随鼠标，但保留初始点击时的偏移量

func start_pick(p_pick_data: CanvasItem,follow_mode:FOLLOW_MODE) -> void:
	pick_data = p_pick_data  # 设置要拖动的对象
	
	 # 将对象设为顶层
	original_z_index = pick_data.get_z_index()
	pick_data.set_z_index(1000)
	pick_data.set_process(false) #suspend
	pick_data.set_physics_process(false)
	
	d_value = get_global_mouse_position() - pick_data.global_position
	# 计算鼠标点击位置与对象初始位置的偏移量
	set_darg_func(follow_mode) 
	set_process(true)  # 开启 _process
	set_process_input(true)  # 启用 _input 处理输入事件

func _input(event: InputEvent) -> void:
	if event.is_action_released("Click") and pick_data != null:
		# 当鼠标释放时，停止拖动
		#pick_data.top_level = false  # 重置对象层级
		if original_z_index != -1:
			pick_data.set_z_index(original_z_index)  # 恢复原始位置
		original_z_index = -1
		pick_data.set_process(true)#cancel suspend
		pick_data.set_physics_process(true)
		
		pick_data.dragging = false 
		set_process(false)
		set_process_input(false) 
		pick_data = null
		drag_released.emit

func set_darg_func(follow_mode:FOLLOW_MODE) -> void:
	match follow_mode:
		0: #direct
			follow_method = direct_follow
		1: #lerp
			follow_method = lerp_follow
	


func lerp_follow(delta) -> void:
	pick_data.global_position += (get_global_mouse_position() - d_value - pick_data.global_position) * FOLLOW_SPEED *delta
	
func direct_follow(delta) -> void:
	pick_data.global_position = get_global_mouse_position() -d_value
	
