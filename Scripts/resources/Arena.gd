extends Node2D

const ENEMY_1 = preload("res://Scripts/Enemy/Enemy.tscn")

func _ready():
	Global.set_node_creation_parent(self)

func _exit_tree():
	Global.set_node_creation_parent(null)


func _on_Enemy_spawn_timer_timeout():
	var enemy_pos = Vector2(rand_range(-160, 670), rand_range(-90, 390)) #criando inimigos baseados na tela que configurada dentro do projeto
	
	while enemy_pos.x < 640 and enemy_pos.x > -80 or enemy_pos.y < 360 and enemy_pos.y > -45:
		enemy_pos = Vector2(rand_range(-160, 670), rand_range(-90, 390)) #fazendo reset para que não caia dentro da área do player e spawne o inimigo em cima dele
	
	Global.instance_node(ENEMY_1, enemy_pos, self)
