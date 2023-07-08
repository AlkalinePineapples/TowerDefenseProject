extends PathFollow2D

var health = 5
var speed = 40

func _physics_process(delta):
	progress += speed * delta
	if progress_ratio >= 1:
		queue_free()
