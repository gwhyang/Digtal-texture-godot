extends Node


#reyurn all body that meet judge_func and parameter
func recursive_search_node(body:Node,parameter,judge_func:Callable) -> Node:
	if body:
		if parameter:
			if judge_func:
				if judge_func.call(body,parameter): return body
				for body1 in body.get_children():#返回body的所有子节点为元素所组成的数组，并分别递归
					return recursive_search_node(body1,parameter,judge_func)
				return null
			printerr("judgefunction ", judge_func ," is not vaild.")
			return null
		printerr("parameter ", parameter ," is not vaild.")
		return null
	printerr("body ", body ," is not vaild.")
	return null

func bfs_search_node(body:Node,parameter,judge_func:Callable) -> Node:
	if not body: 
		printerr("body ", body ," is not vaild.")
		return null
	if not parameter: 
		printerr("parameter ", parameter ," is not vaild.")
		return null
	if not judge_func:
		printerr("judgefunction ", judge_func ," is not vaild.")
		return null
	if judge_func.call(body,parameter): return body
	var parent_queue:Array[Node]  = [body]
	var child_queue:Array[Node]
	while !parent_queue.is_empty():
		for node in parent_queue:
			if judge_func.call(node,parameter):return node
			child_queue.append_array(node.get_children())
		var temp = parent_queue
		parent_queue = child_queue
		child_queue = temp
# 清空子队列以准备下次迭代使用
		child_queue.clear()
	return null

func meet_name(body:Node,name:String) -> bool:
	return body.name.to_lower() == name.to_lower()

func normal_vector2d(vec2:Vector2):
	return Vector2(-vec2.y,vec2.x)

func ploy_caculte(coeffs:Array[float],independent:float) ->float:
	var outcome:float = 0
	for n in range(0,coeffs.size()):
		outcome += coeffs[n] * (independent ** n)
	return outcome

func ploy_caculte2d(coeffs:Array[Vector2],independent:float) ->Vector2:
	var outcome:Vector2 = Vector2.ZERO
	for n in range(0,coeffs.size()):
		outcome += coeffs[n] * (independent ** n)
	return outcome


func integral(function:Callable,start:float,end:float,accuracy:int) -> float:
	var outcome:float = 0 
	var pace:float = (end - start) / accuracy
	for n in range(accuracy +1):
		outcome += function.call(start + n * pace)
	return outcome / (end - start)

func ploy_to_fseries(ploy:Array[float],num_term:int,start:float,end:float,accuracy:int) -> Array[float]:
	
	
	var fseries:Array[float] = []
	var fl:float
	var outcome:float
	
	var pace:float = (end - start) / accuracy
	
	for f in range(num_term):
		outcome = 0 
		for n in range(accuracy):
			outcome += ploy_caculte(ploy,start +n* pace) * sin(f * (start * pace +n* pace))
		fseries.append(outcome / (end -start)) 
		
	return fseries
	

func ploy2fs_2d(ploy:Array[Vector2],num_term:int,start:float,end:float,accuracy:int) -> Array[Vector2]:
	var ployx:Array[float] = []
	var ployy:Array[float] = []
	var coeffs:Array[Vector2] = []
	
	for i in ploy:
		ployx.append(i.x)
		ployy.append(i.y)
	
	ployx = ploy_to_fseries(ployx,num_term,start,end,accuracy)
	ployy = ploy_to_fseries(ployy,num_term,start,end,accuracy)
	
	for i in range(num_term):
		coeffs.append(Vector2(ployx[i],ployy[i]))
	
	return coeffs
		
