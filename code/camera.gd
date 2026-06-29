extends Node2D
var follow = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(1.1).timeout
	follow = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Camera2D.global_position = Global.character_position
	$Camera2D/RichTextLabel.text = Global.timer_str
	$Camera2D/class.text = "Get to: " + Global.clas
	if follow == true:
		$Camera2D/Sprite2D.look_at(Global.positio)
		$Camera2D/Sprite2D.rotation_degrees -= 90
