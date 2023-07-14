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
		
	if Input.is_action_just_pressed("flip_animation"):
		$AnimatedSprite.flip_h = true
		# or $AnimatedSprite.flip_v = true for vertical flipping
		
	if Input.is_action_just_pressed("rotate_animation"):
		# Rotate the animation by 45 degrees clockwise
		$AnimatedSprite.rotate(deg2rad(45))
		
	velocity = move_and_slide(velocity)
	
func _ready():
	$AnimatedSprite.connect("frame_changed", self, "_on_frame_changed")
	$AnimatedSprite.connect("animation_finished", self, "_on_animation_finished")

func _on_animation_finished():
	# Perform actions or trigger events
	print("Animation finished!")
	# Additional code here...
	
func _on_frame_changed():
	# Perform actions based on the current frame
	var currentFrame = $AnimatedSprite.frame
	print("Current frame: ", currentFrame)
	# Additional code here...
 
