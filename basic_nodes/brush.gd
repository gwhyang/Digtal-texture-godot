extends Node2D

@export var FOLLOW_SPEED : float = 1
var mouse_position: Vector2 = Vector2.ZERO

'''
func _input(event):
	mouse_position = get_global_mouse_position()
	
func _physics_process(delta):
	position = position.lerp(mouse_position, delta * FOLLOW_SPEED)
'''
