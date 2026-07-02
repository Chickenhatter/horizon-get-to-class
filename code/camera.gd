extends Node2D
var follow = false
var unblack = true
var black = false
var down = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Camera2D/black.self_modulate.a = 1
	await get_tree().create_timer(1.1).timeout
	follow = true
	down = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D.global_position = Global.character_position
	
	if down == false:
		$Camera2D/RichTextLabel.text = str(randi_range(1,1000))
		$Camera2D/class.text = str(randi_range(1,1000))
	else:
		$Camera2D/RichTextLabel.text = Global.timer_str
		$Camera2D/class.text = "Get to: " + Global.clas
	
	
	if Global.quick_black == true:
		$Camera2D/RichTextLabel.text = str(randi_range(1,1000))
		$Camera2D/class.text = str(randi_range(1,1000000))
		$Camera2D/black.self_modulate.a += delta*2
	
	
	if follow == true:
		$Camera2D/Sprite2D.look_at(Global.positio)
		$Camera2D/Sprite2D.rotation_degrees -= 90
	
	if unblack == true:
		$Camera2D/black.self_modulate.a -= delta/2
	
	if Global.quick_black == true:
		player()
	
	if Global.quick_up_down == true:
		$Camera2D/Sprite2D/Sprite2D.self_modulate.a = 0
		black = true
		down = false
		unblack = true
		Global.quick_up_down = false
	
	if black == true:
		print('a')
		$Camera2D/black.self_modulate.a += delta
	
	if Global.quick_black == false:
		if $Camera2D/black.self_modulate.a < 0:
			$Camera2D/black.self_modulate.a = 0
			Global.quick_up_down = false
			unblack = false
			down = true
			$Camera2D/Sprite2D/Sprite2D.self_modulate.a = 0.5
		if $Camera2D/black.self_modulate.a > 1:
			$Camera2D/AudioStreamPlayer2D.play()
			await get_tree().create_timer(1.0).timeout
			$Camera2D/black.self_modulate.a = 1
			Global.quick_up_down = false
			black = false

func player():
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://scenes/end.tscn")

func play():
	$Camera2D/AudioStreamPlayer2D.play()
