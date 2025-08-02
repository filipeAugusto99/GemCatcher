extends Area2D

const SPEED: float = 300.0

func _process(delta: float) -> void:
	#Esse codigo faz a gema cair verticalmente
	position.y += delta * SPEED
