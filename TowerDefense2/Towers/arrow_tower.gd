extends Node2D

var enemies = []
var arrow = preload("res://Towers/arrow.tscn")
var current_enemy
var cost
var damage = 1
var firerate = 1

func _enter_tree():
	global_position = get_global_mouse_position()

func _physics_process(delta):
	if enemies != []:
		current_enemy = enemies[0]

func set_shoot_timer():
	$ShootTimer.wait_time = firerate

func _on_shoot_timer_timeout():
	set_shoot_timer()
	if current_enemy != []:
		var a = arrow.instantiate()
		a.damage = damage
		a.global_position = global_position
		a.target = current_enemy
		get_parent().add_child(a)


func _on_range_area_entered(area):
	enemies.append(area)
	print("enemy spotted")


func _on_range_area_exited(area):
	enemies.erase(area)
