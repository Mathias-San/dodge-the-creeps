extends KinematicBody2D

var speed = 400

func _physics_process(_delta):
	var dir = Input.get_action_strength("right") - Input.get_action_strength("left")
	if dir < 0:
		$Sprite.flip_h = true
	
	elif dir > 0:
		$Sprite.flip_h = false
	

	move_and_slide(Vector2(dir * speed,0))
	position.x = clamp(position.x, 32, 508)
