extends Sprite

var speed = 150
var velocity = Vector2.ZERO
var can_shoot = true

const BULLET = preload("res://Scripts/Player/Bullet.tscn")

func _ready():
	Global.player = self

func _exit_tree():
	Global.player = null

func _physics_process(delta):
	velocity.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	velocity = velocity.normalized()
	
	global_position += speed * velocity * delta
	
	if Input.is_action_pressed("click") and Global.get_node_creation_parent() != null and can_shoot:
		Global.instance_node(BULLET, global_position, get_parent())
		can_shoot = false
		$Reload_Speed.start()


func _on_Reload_Speed_timeout():
	can_shoot = true
