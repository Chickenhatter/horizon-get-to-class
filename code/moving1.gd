extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var last_position: Vector2

func _ready() -> void:
	last_position = global_position

func _physics_process(delta: float) -> void:
	var current_velocity = (global_position - last_position) / delta
	last_position = global_position
	velocity = current_velocity
