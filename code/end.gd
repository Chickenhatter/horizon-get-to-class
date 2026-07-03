extends Node2D
var down = false
var up = false
var day = 0
var period = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	day = floor(Global.bell/6)
	Global.bell -= day * 6
	day = day % 5
	period = str(Global.bell % 6)
	if day == 0:
		day = 'monday'
	if day == 1:
		day = 'tuesday'
	if day == 2:
		day = 'wednesday'
	if day == 3:
		day = 'thursday'
	if day == 4:
		day = 'friday'
	
	
	
	
	
	
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
