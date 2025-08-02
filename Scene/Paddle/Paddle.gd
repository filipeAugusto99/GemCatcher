extends Area2D

const SPEED: float = 500
const MARGIN: float = 47

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	var movement = Input.get_axis('button-left', 'button-right')
	position.x += delta * SPEED * movement
	
	position.x = clampf(
		position.x,
		Game.get_vpr().position.x + MARGIN,
		Game.get_vpr().end.x - MARGIN
	)
	

	
