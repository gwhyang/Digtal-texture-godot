extends Node

@onready var sfx = $SFX
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	pass
	
func sfx_play(name) -> void :
	var player = sfx.get_node(name) as AudioStreamPlayer
	if player: player.play()
	else: printerr(name," is not included in SFX")
