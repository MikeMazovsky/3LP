# Activating a library
extends KinematicBody2D
# Here we define where is the bottom and where are the skies. Serach KinematicBody2D for details.
const UP = Vector2(0, -1)
# Defining the gravity strength
const GRAVITY = 20
# Character speed
const SPEED = 200
# Setting the jump height
const JUMP_HEIGHT = -500
# It's just a description for some random function with x and y, integrated into a variable
var motion = Vector2()
# A built-in function (as far as I know). WTF is delta?..
func _physics_process(delta):
	# For permanent gravity:
	motion.y += GRAVITY
	# Built-in trigger for action after activator
	if Input.is_action_pressed("ui_right"):
		# Using Vector2 argument x, this makes a slide movement with defined speed (150) on X axis
		motion.x = SPEED
		#A thing to turn object around horizontally
		$AnimatedSprite.flip_h = false
		#Activating the named animation
		$AnimatedSprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		#Absolutely the same as above, it's just a full command. And yes, Sprite - is the name of sprite, f.e. it could be Sprite 87 etc.
		get_node("AnimatedSprite").flip_h = true
		$AnimatedSprite.play("Run")
	else:
		motion.x = 0
		$AnimatedSprite.play("Idle")

	# Jump function
	if is_on_floor():
		# I needed this for debugging, nevermind
		#print ("On floor.")
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		#For smooth animation
	else:
		$AnimatedSprite.play("Jump")
	# Look at Search Help (Top-right screen) for details. Also look for KinematicBody2D.
	motion = move_and_slide(motion, UP)
	
	# Makes absolutely nothing.
	pass