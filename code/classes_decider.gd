extends Node2D
var clas = 'none'
var posi2 = 'none'
var positio = 'none'
var run = 10
var close_check = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(1).timeout
	find_new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	posi2 = $"../../map/contol".global_position
	Global.timer_str = str("%.1f" % $"../Timer".time_left)

func find_new():
	var random = randi_range(1,9)
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
	elif random == 8:
		clas = "bio"
		positio = $bio.global_position
	elif random == 9:
		clas = "sst"
		positio = $sst.global_position
	Global.positio = positio
	Global.clas = clas.to_upper()
	close_check = false
	if ((posi2).distance_to(positio)) < 1536:
		close_check = true
	posi2 = positio
	print(clas)
	find_timer()
func find_timer():
	if close_check == false:
		$"../Timer".wait_time = 14+ (positio.distance_to(Global.character_position))/(run*10)
	else:
		$"../Timer".wait_time = 21 + (positio.distance_to(Global.character_position))/(run*10)
	$"../Timer".start()
	run += 1
	print(run)
func _on_eng_body_entered(body: Node2D) -> void:
	if body.name == "character":
		if clas == "eng":
			find_new()


func _on_eng_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_pe_body_entered(body: Node2D) -> void:
	if body.name == "character":
		if clas == "pe":
			find_new()


func _on_pe_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_re_body_exited(body: Node2D) -> void:
	pass


func _on_re_body_entered(body: Node2D) -> void:
	if body.name == "character":
		if clas == "re":
			find_new()


func _on_mat_body_entered(body: Node2D) -> void:
	if body.name == "character":
		if clas == "mat":
			find_new()


func _on_mat_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_csc_body_entered(body: Node2D) -> void:
	if body.name == "character":
		if clas == "csc":
			find_new()

func _on_csc_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_phy_body_entered(body: Node2D) -> void:
	if body.name == "character":
		if clas == "phy":
			find_new()


func _on_phy_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_che_body_entered(body: Node2D) -> void:
	if body.name == "character":
		if clas == "che":
			find_new()


func _on_che_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_bio_body_entered(body: Node2D) -> void:
	if body.name == "character":
		if clas == "bio":
			find_new()


func _on_bio_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_sst_body_entered(body: Node2D) -> void:
	if body.name == "character":
		if clas == "sst":
			find_new()

func _on_sst_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
