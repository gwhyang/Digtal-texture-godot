extends Node2D


var ploy1:Array[float] = [1,2,3,4,5,6,7]
@onready var line1p = $line1



# Called when the node enters the scene tree for the first time.
func _ready():
	var p1:Vector2= Vector2(300,0)
	var p2:Vector2= Vector2(300,400)
	var p3:Vector2= Vector2(0,400)
	var ploy2:Array[Vector2] = [p1, -2.0 * p1 + p2 +p3,p1-p2] 
	
	var fcoeffs1 = Toolscript.ploy_to_fseries(ploy1,10,-10,10,200)
	var fcoeffs2 = Toolscript.ploy2fs_2d(ploy2,10,-10,10,200)
	
	print(Toolscript.ploy_caculte2d(ploy2,0.003))
	

	var line2p = Line2D.new()
	
	#line1p.default_color = Color(1,1,1,1)
	
	var line1f = Line2D.new()
	var line2f = Line2D.new()
	
	var n:Array = range(300)
	var x:float = 0
	var point:Vector2
	for i in range(1000):
		x = float(i)/1000.0
		point = Toolscript.ploy_caculte2d(ploy2,x)
		
		line1p.add_point(point,i)
		if i % 10 == 0:
			print(x)
			print(line1p.get_point_position(i))
			print(i)
