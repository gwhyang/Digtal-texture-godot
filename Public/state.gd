extends Node
class_name State

#signals--------------------
signal transitioned
#-----------------------------
func _enter()->void:
	pass

func _exit()->void:
	pass

func _state_update() -> void:
	pass

func _physic_state_update()-> void :
	pass

func _transitionable()->bool:
	return 0
	pass
