extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Node2D.position.x = (Global.character_position.x)/34.08
	$Node2D.position.y = (Global.character_position.y)/34.08
	if Global.clas == 'PE':
		$Node2D2/pointer.global_position = $Node2D2/pe.global_position
	if Global.clas == 'ENG':
		$Node2D2/pointer.global_position = $Node2D2/eng.global_position
	if Global.clas == 'MAT':
		$Node2D2/pointer.global_position = $Node2D2/mat.global_position
	if Global.clas == 'RE':
		$Node2D2/pointer.global_position = $Node2D2/re.global_position
	if Global.clas == 'CSC':
		$Node2D2/pointer.global_position = $Node2D2/csc.global_position
	if Global.clas == 'PHY':
		$Node2D2/pointer.global_position = $Node2D2/phy.global_position
	if Global.clas == 'CHE':
		$Node2D2/pointer.global_position = $Node2D2/che.global_position
	if Global.clas == 'BIO':
		$Node2D2/pointer.global_position = $Node2D2/bio.global_position
	if Global.clas == 'SST':
		$Node2D2/pointer.global_position = $Node2D2/sst.global_position
