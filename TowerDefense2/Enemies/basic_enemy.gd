extends PathFollow2D

var health = 5
var speed = 40

func _physics_process(delta):
	progress += speed * delta
	if progress_ratio >= 1:
		get_node("/root/Game").kills += 1
		queue_free()


func _on_hitbox_area_entered(area):
	area.queue_free()
	health -= area.damage
	if health <= 0:
		get_node("/root/Game").money += 10
		get_node("/root/Game").kills += 1
		queue_free()
