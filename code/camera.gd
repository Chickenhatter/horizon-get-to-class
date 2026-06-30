extends Node2D
var follow = false
var unblack = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Camera2D/black.self_modulate.a = 1
	await get_tree().create_timer(1.1).timeout
	follow = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D.global_position = Global.character_position
	$Camera2D/RichTextLabel.text = Global.timer_str
	$Camera2D/class.text = "Get to: " + Global.clas
	if follow == true:
		$Camera2D/Sprite2D.look_at(Global.positio)
		$Camera2D/Sprite2D.rotation_degrees -= 90
	
	if unblack == true:
		$Camera2D/black.self_modulate.a -= delta/3
	
	if Global.quick_black == true:
		$Camera2D/black.self_modulate.a -= delta/3
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scenes/end.tscn")
	
	if $Camera2D/black.self_modulate.a < 0:
		$Camera2D/black.self_modulate.a = 0
		Global.quick_black = false
		Global.quick_up_down = false
		unblack = false
	if $Camera2D/black.self_modulate.a > 1:
		$Camera2D/black.self_modulate.a = 1
		Global.quick_black = false
		Global.quick_up_down = false
		unblack = false
