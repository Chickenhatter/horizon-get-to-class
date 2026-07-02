extends Node2D
var down = false
var up = false
var tim = 0
var go = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.character_position = Vector2(0,0)
	Global.timer_str = 1
	Global.positio = 0
	Global.clas = ""
	Global.quick_black = false
	Global.quick_up_down = false
	Global.call_char_mov = false
	if Global.game == true:
		$Sprite2D.self_modulate.a = 1
		down = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if down == true:
		$Sprite2D.self_modulate.a -= delta
	if $Sprite2D.self_modulate.a < 0:
		down = false
		$Sprite2D.self_modulate.a = 0
	
	if up == true:
		$Sprite2D.self_modulate.a += delta
	if go == true:
		tim += delta*40
		$Node2D/Node2D.rotation_degrees = 20*(sin(tim-(PI/2)))


func _on_button_pressed() -> void:
	$AudioStreamPlayer2D.play()
	go = true
	await get_tree().create_timer(1.0).timeout
	up = true
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://scenes/getting_to.tscn")
