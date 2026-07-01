extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var last_position: Vector2

func _ready() -> void:
	last_position = global_position

func _physics_process(delta: float) -> void:
	$"..".progress += 211.776333333*delta
	var current_velocity = (global_position - last_position) / delta
	last_position = global_position
	velocity = current_velocity
	$side.global_rotation = 0
	$forward.global_rotation = 0
	$CollisionShape2D.global_rotation_degrees = 90
	if cos(2*PI*($".".global_rotation_degrees)/180) < 0:
		$side/side.play("no")
		$forward/forward.play("them")
		$CollisionShape2D.scale.y = 1
	else:
		$forward/forward.play("no")
		$side/side.play("them")
		$CollisionShape2D.scale.y = 0.3
