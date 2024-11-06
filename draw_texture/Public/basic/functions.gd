func _pow(float_number:float,complex_number:Complex):
	if complex_number is Complex:
		var angle:float = complex_number.i * log(float_number)
		var length:float = float_number ** Complex.r
		return Complex.new(cos(angle),sin(angle)) * length


		
		
