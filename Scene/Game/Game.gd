extends Node2D

class_name Game

const GEM = preload("res://Scene/Gem/Gem.tscn")
const EXPLODE = preload("res://assets/explode.wav")

@onready var paddle: Area2D = $Paddle
@onready var timer: Timer = $Timer
@onready var scoring_sound: AudioStreamPlayer2D = $ScoringSound
@onready var background_sound: AudioStreamPlayer = $BackgroundSound
@onready var score_label: Label = $ScoreLabel

var _score: int = 0
static var _vp_r: Rect2

static func get_vpr() -> Rect2:
	return _vp_r

func _ready() -> void:
	update_vp()
	get_viewport().size_changed.connect(update_vp)
	spawn_gems()
	
func update_vp() -> void:
	_vp_r = get_viewport_rect()
	
func _process(delta: float) -> void:
	pass
	
func spawn_gems() -> void:
	var new_gem: myGem = GEM.instantiate()
	
	var pos_x = randf_range(
		_vp_r.position.x,
		_vp_r.end.x
	)
	
	new_gem.position = Vector2(pos_x, -50)
	new_gem.gem_off_screen.connect(_on_gem_off_screen)
	
	add_child(new_gem)

func stop_all() -> void:
	background_sound.stop()
	background_sound.stream = EXPLODE
	background_sound.play()
	paddle.set_process(false)
	timer.stop()
	
	for child in get_children():
		if child is myGem:
			child.set_process(false)

func _on_timer_timeout() -> void:
	spawn_gems()

func _on_gem_off_screen() -> void:
	stop_all()

func _on_paddle_area_entered(area: Area2D) -> void:
	if scoring_sound.playing == false:
		scoring_sound.position = area.position
		scoring_sound.play()
	
	_score += 1
	score_label.text = '%03d' % _score
