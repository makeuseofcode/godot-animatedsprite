extends KinematicBody2D

const SPEED = 200

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x -= SPEED
	if Input.is_action_pressed("move_right"):
		velocity.x += SPEED
	if Input.is_action_pressed("move_up"):
		velocity.y -= SPEED
	if Input.is_action_pressed("move_down"):
		velocity.y += SPEED
		
	# Play the animation when the "play_animation" action is triggered
	if Input.is_action_just_pressed("play_animation"):
		$AnimatedSprite.play()

	# Stop the animation and reset to the first frame when the "stop_animation" action is triggered
	if Input.is_action_just_pressed("stop_animation"):
		$AnimatedSprite.stop()
		$AnimatedSprite.frame = 0
		
	if Input.is_action_just_pressed("rotate_animation"):
		# Rotate the animation by 45 degrees clockwise
		$AnimatedSprite.rotate(deg2rad(45))
		
	velocity = move_and_slide(velocity)
	
func _ready():
	pass 
