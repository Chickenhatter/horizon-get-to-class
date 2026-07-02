extends Node2D
var down = false
var up = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.game = true
	$Node2D/Sprite2D.self_modulate.a = 1
	await get_tree().create_timer(2).timeout
	down = true
	print('test')
	await get_tree().create_timer(4).timeout
	up = true
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/start.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if down == true:
		$Node2D/Sprite2D.self_modulate.a -= delta
	if $Node2D/Sprite2D.self_modulate.a < 0:
		down = false
		$Node2D/Sprite2D.self_modulate.a = 0
	if up == true:
		$Node2D/Sprite2D.self_modulate.a += delta*1.5
