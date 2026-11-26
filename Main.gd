extends Node2D

var enemy_scene = preload("res://enemy.tscn")
var score = 0
var playing = true

func _ready():
	randomize()
	$spawnTimer.connect('timeout', self, '_on_spawnTimer_timeout')
	$AudioStreamPlayer2D.play()

func _on_spawnTimer_timeout():
	var e = enemy_scene.instance()
	e.position = Vector2(rand_range(30, 510), -50)
	add_child(e)
	if score >= 20:
		$spawnTimer.wait_time = 0.3

func add_score():
	if playing:
		score += 1
		$UI/scoreLabel.text = str(score)
		
func change_speed():
	if score >= 20:
		$player.speed = 500

func change_enemy_size():
	var e = enemy_scene.instance()
	if score >= 10:
		e.set_scale(5)
		add_child(e)


func game_over():
	if not playing:
		return
	playing = false
	$spawnTimer.stop()
	$player.set_physics_process(false)
	$UI/gameOverLabel.visible = true
	$AudioStreamPlayer2D.stop()
	get_tree().change_scene('res://GameOver.tscn')

func _input(event):
	if not playing and event is InputEventScreenTouch and event.pressed:
		get_tree().reload_current_scene()
