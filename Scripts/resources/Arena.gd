extends Node2D

func _ready():
	Global.set_node_creation_parent(self)

func _exit_tree():
	Global.set_node_creation_parent(null)
