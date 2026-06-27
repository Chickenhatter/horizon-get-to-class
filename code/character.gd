extends CharacterBody2D
var moving
var collision = get_slide_collision(0)
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	print(rotation_degrees)
	$"../../Node2D/Path2D/PathFollow2D".progress_ratio += delta/100
	var movement = Vector2.ZERO
	if Input.is_action_pressed('ui_w'):
		movement = Vector2.UP.rotated(deg_to_rad(rotation_degrees))
	if Input.is_action_pressed('ui_s'):
		movement = Vector2.DOWN.rotated(deg_to_rad(rotation_degrees))
	if Input.is_action_pressed('ui_a'):
		$".".rotation_degrees -= 1
	if Input.is_action_pressed('ui_d'):
		$".".rotation_degrees += 1
	velocity = movement * SPEED
	var collision = move_and_collide(velocity * delta)
	if collision:
		var smack = collision.get_normal()
		var push = velocity.bounce(smack).normalized()
		var original_speed = velocity.length()
		if smack.y > 0.5:
			print("up")
		elif smack.y < -0.5:
			print("dow")
		elif smack.x > 0.5:
			print("left")
		elif smack.x < -0.5:
			print("right")
		velocity = push * original_speed
