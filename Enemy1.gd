extends KinematicBody2D

const GRAVITY = 10
const SPEED = 60
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var direction = 1


func _physics_process(delta):
	velocity.x = SPEED
	
	if direction == 1:
		$AnimatedSprite.flip_h = false
	else:
		velocity = velocity * -1
		$AnimatedSprite.flip_h = true
	
	
	
	velocity.y += GRAVITY
	
	velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1
	
	
