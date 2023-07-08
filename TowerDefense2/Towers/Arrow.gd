extends Area2D

var movement = Vector2.ZERO
var speed = 10
var damage = 1
var look_vec = Vector2.ZERO
var target

func _ready():
	if target != null:
		self.look_at(target.global_position)
		look_vec = target.global_position - global_position

func _physics_process(delta):
	movement = Vector2.ZERO
	movement = movement.move_toward(look_vec, delta)
	movement = movement.normalized() * speed
	global_position += movement


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
