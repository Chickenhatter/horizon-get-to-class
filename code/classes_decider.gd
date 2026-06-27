extends Node2D
var clas = 'none'
var positio = 'none'
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	find_new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func find_new():
	var random = randi_range(1,10)
	if random == 1:
		clas = "eng"
		positio = $eng.global_position
	elif random == 2:
		clas = "pe"
		positio = $pe.global_position
	elif random == 3:
		clas = "re"
		positio = $re.global_position
	elif random == 4:
		clas = "mat"
		positio = $mat.global_position
	elif random == 5:
		clas = "csc"
		positio = $csc.global_position
	elif random == 6:
		clas = "phy"
		positio = $phy.global_position
	elif random == 7:
		clas = "che"
		positio = $che.global_position


func _on_eng_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_eng_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_pe_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_pe_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_re_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_re_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_mat_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_mat_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_csc_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_csc_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_phy_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_phy_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_che_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_che_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_bio_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_bio_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_sst_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_sst_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
