extends Area2D

class_name myGem

signal gem_off_screen

const SPEED: float = 300

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	position.y += delta * SPEED

	if position.y > Game.get_vpr().end.y:
		gem_off_screen.emit()
		die()

func die() -> void:
	set_process(false)
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	die()
