extends CharacterBody2D
var moving
var collision = get_slide_collision(0)
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direct = "none"
func _physics_process(delta: float) -> void:
	Global.character_position = $".".global_position
	var movement = Vector2.ZERO
	if Input.is_action_pressed('ui_w'):
		movement = Vector2.UP.rotated(deg_to_rad(rotation_degrees))
	if Input.is_action_pressed('ui_s'):
		movement = Vector2.DOWN.rotated(deg_to_rad(rotation_degrees))
	if Input.is_action_pressed('ui_a'):
		$".".rotation_degrees -= 3
	if Input.is_action_pressed('ui_d'):
		$".".rotation_degrees += 3
	velocity = movement * SPEED
	var collision = move_and_collide(velocity * delta)
	if collision:
		var smack = collision.get_normal()
		var push = velocity.bounce(smack).normalized()
		var original_speed = velocity.length()
		var collider = collision.get_collider()
		if smack.y > 0.5:
			direct = ("up")
		elif smack.y < -0.5:
			direct = ("dow")
		elif smack.x > 0.5:
			direct = ("left")
		elif smack.x < -0.5:
			direct = ("right")
		else:
			direct = "none"
		if "velocity" in collider:
			if ((velocity - collider.velocity)).dot(smack) < 0:
				velocity = velocity.slide(smack)
				move_and_collide(velocity * delta)
			elif ((velocity - collider.velocity)).dot(smack) > 0:
				velocity = velocity.slide(smack)
				move_and_collide(velocity * delta)
			else:
				velocity = push * original_speed
	$Icon2.scale.x = (1.5*(sin((2*PI*($".".rotation_degrees+45)/180)))+4.5)
	$CollisionPolygon2D.scale.x = (1.5*(sin((2*PI*($".".rotation_degrees+45)/180)))+4.5)/6
	$Icon2.rotation_degrees = -$".".rotation_degrees
	$Icon2/arrow.rotation_degrees = $".".rotation_degrees
	$CollisionPolygon2D.rotation_degrees = -$".".rotation_degrees
