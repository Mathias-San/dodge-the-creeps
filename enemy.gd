extends Area2D

var speed = 350

func _ready():
	connect("body_entered", self, "_on_body_entered")

func _physics_process(delta):
	position.y += speed * delta
	if position.y > 1300:
		get_parent().add_score()
		queue_free()

func _on_body_entered(_body):
	get_parent().game_over()
