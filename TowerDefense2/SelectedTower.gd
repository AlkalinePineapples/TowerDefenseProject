extends Node2D

var selectedtower
var CanPlace = true
var ATower = preload("res://Towers/arrow_tower.tscn")

func _ready():
	$Footprint.monitoring = true

func _physics_process(delta):
	global_position = get_global_mouse_position()
	if CanPlace == true:
		if Input.is_action_just_pressed("Click"):
			get_parent().add_child(selectedtower)
			visible = false

func _on_arrow_button_pressed():
	if get_parent().cash >= 25:
		get_parent().cash -= 25
		print(str(get_parent().cash))
		CanPlace = true
		visible = true
		selectedtower = ATower.instantiate()
		$Footprint/CollisionShape2D.shape.size = Vector2(90,90)
		$Sprite2D.scale = Vector2(0.6, 0.6)
		$Sprite2D.texture = preload("res://icon.svg")


func _on_footprint_area_entered(area):
		CanPlace = false


func _on_footprint_area_exited(area):
		CanPlace = true
		updatedetection()


func updatedetection():
	$Footprint.set_deferred("monitoring", false)
	await(get_tree().create_timer(0.1))
	$Footprint.set_deferred("monitoring", true)
