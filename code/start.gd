extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.character_position = Vector2(0,0)
	timer_str = 1
	positio = 0
	clas = ""
	quick_black = false
	quick_up_down = false
	call_char_mov = false
	if Global.game == true:
		$Sprite2D.self_modulate.a = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.game == true:
		pass
