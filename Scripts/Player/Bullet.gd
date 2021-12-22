extends Sprite

var velocity = Vector2.RIGHT
var speed = 250
var look_once = true #variavel para rotacionar a bala

func _physics_process(delta):
	if look_once:
		look_at(get_global_mouse_position())
		look_once = false
	global_position += velocity.rotated(rotation) * speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
