extends Sprite

const BLOOD_PARTICLES = preload("res://Scripts/resources/blood.tscn")

var speed = 100
var velocity = Vector2.ZERO
var stun = false
var hp = 3

func _physics_process(delta):
	if Global.player != null and !stun:
		velocity = global_position.direction_to(Global.player.global_position)
	elif stun:
		velocity = lerp(velocity, Vector2.ZERO, 0.3) 
	
	if hp <= 0:
		if Global.get_node_creation_parent() != null:
			var blood_instance = Global.instance_node(BLOOD_PARTICLES, global_position, Global.get_node_creation_parent())
			blood_instance.rotation = velocity.angle()
		queue_free()
		
	global_position += velocity * speed * delta


func _on_HitBox_area_entered(area):
	if area.is_in_group("Enemy_damager") and !stun: #necessita-se dessa forma, pois caso
		$StunTimer.start()
		velocity = -velocity * 6
		stun = true
		hp -= 1
		modulate = Color.white
		area.get_parent().queue_free()


func _on_StunTimer_timeout():
	modulate = Color("ff0000")
	stun = false
