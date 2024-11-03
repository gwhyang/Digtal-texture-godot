extends Node
class_name StateMachine


@export var init_state:State

var states:Dictionary = {}
var current_state:State



func _ready():
	var printerr_list:String
	
	for state in get_children():
		if state is State:
			states[state.name.to_lower()] = state
			state.transitioned.connect(_change_state)
		else : printerr_list += ", " ;printerr_list += state.name;
		
	#print error when something worong was put
	if !printerr_list.is_empty() : printerr("the children Node [",printerr_list,"] are not a State" )
		#else: printerr("the children Node ",state.name," is not a State" )
	
	if init_state:
		init_state._enter()
		current_state = init_state
	else: printerr("haven't set the initial state")
	
	
	pass

func _change_state(state:State,new_state:String):
	if state != current_state: 
		printerr("current state is ",current_state.name," instead of " ,new_state)
		return
	if states.get(new_state.to_lower()) :current_state = states.get(new_state.to_lower());print(1)
	else: print("null" if not new_state else new_state," is not in children state of ", self.name)
	pass

func _physics_process(delta):
	if current_state :
		current_state._physic_state_update()
	pass

func _process(delta):
	if current_state :
		current_state._state_update()
	
