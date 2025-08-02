extends Node2D

const GEM = preload("res://Scene/Gem/Gem.tscn")

@onready var paddle: Area2D = $Paddle
@onready var timer: Timer = $Timer

func _ready() -> void:
	spawn_gems()
	
func _process(delta: float) -> void:
	pass

func spawn_gems() -> void:
	var new_gem: myGem = GEM.instantiate()
	
	var x_pos = randf_range(
		get_viewport_rect().position.x,
		get_viewport_rect().end.x
	)
	
	new_gem.position = Vector2(x_pos, -50)
	
	new_gem.gem_off_screen.connect(_on_gem_off_screen)
	
	add_child(new_gem)

func stop_all() -> void:
	paddle.set_process(false)
	timer.stop()
	
	for child in get_children():
		if child is myGem:
			child.set_process(false)

func _on_timer_timeout() -> void:
	spawn_gems()
	
func _on_gem_off_screen() -> void:
	stop_all()
