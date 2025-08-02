extends Area2D

class_name myGem

signal gem_off_screen

const SPEED: float = 300.0

func _process(delta: float) -> void:
	#Esse codigo faz a gema cair verticalmente
	position.y += delta * SPEED
	
	if position.y > get_viewport_rect().end.y:
		gem_off_screen.emit()
		die()

func die() -> void:
	set_process(false)
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	die()
