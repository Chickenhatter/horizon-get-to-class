extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Node2D.position.x = (Global.character_position.x)/34.08
	$Node2D.position.y = (Global.character_position.y)/34.08
	if Global.clas == 'pe':
		$Node2D2/Sprite2D.global_position = $Node2D2/pe.global_position
