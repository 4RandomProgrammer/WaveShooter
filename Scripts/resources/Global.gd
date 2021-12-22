extends Node

var node_creation_parent = null

func set_node_creation_parent(node):
	node_creation_parent = node
	
func get_node_creation_parent():
	return node_creation_parent

func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
