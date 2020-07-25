extends KinematicBody2D


export var flyingSpeed: int
export var jumpySpeed: int
export var gravity: int

var velocity = Vector2(0, 0)


func _physics_process(delta):
	apply_gravity(delta)

	$AnimatedSprite.play("flying")

	velocity.x = flyingSpeed

	tap(delta)

	velocity = move_and_slide(velocity, Vector2.UP)


func tap(delta):
	if (Input.is_action_just_pressed("tap")):
		velocity.y = jumpySpeed
		rotate(20 * delta)


func apply_gravity(delta):
	if (!Input.is_action_pressed("tap")):
		velocity.y = gravity
	if (rotation_degrees > 0):
		rotate(-25 * delta)
