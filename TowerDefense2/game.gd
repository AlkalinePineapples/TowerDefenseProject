extends Node

var cash = 50
var wave = 0:
	get:
		return wave
	set(value):
		wave = value
		if wave >= len(wave_mobs):
			get_tree().change_scene_to_file("res://win.tscn")

var mobs_spawn_left = 0
var wave_mobs = [05,06,10,15,20,40,00]
var mob_type = [01,01,01,01,01,01,01]
var kills = 0:
	get:
		return kills
	set(value):
		kills = value
		if kills == wave_mobs[wave - 1]:
			$WaveTimer.start()

var mob
var MobInstance
var ATower = preload("res://Towers/arrow_tower.tscn")
var Basic = preload("res://Enemies/basic_enemy.tscn")

func set_mob_type():
	if mob_type[wave - 1] == 1:
		mob = Basic

func _on_wave_timer_timeout():
	wave += 1
	print(str(wave))
	kills = 0
	set_mob_type()
	mobs_spawn_left = wave_mobs[wave - 1]
	$EnemyTimer.start()


func _on_enemy_timer_timeout():
	MobInstance = mob.instantiate()
	$Area2D/Path2D.add_child(MobInstance)
	mobs_spawn_left -= 1
	if mobs_spawn_left <= 0:
		$EnemyTimer.stop()

