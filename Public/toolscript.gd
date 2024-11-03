
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
