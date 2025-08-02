extends Area2D

const SPEED: float = 500.0
const MARGIN: int = 47

func _ready() -> void:
	pass # Replace with function body.



func _physics_process(delta: float) -> void:
	'''
	Essa funcao faz com que o paddle se 
	movimente ao apertar as teclas A ou D
	'''
	var movement = Input.get_axis('button-left', 'button-right')
	position.x += delta * SPEED * movement
	
	position.x = clampf(
		position.x,
		get_viewport_rect().position.x + MARGIN,
		get_viewport_rect().end.x - MARGIN
	)
