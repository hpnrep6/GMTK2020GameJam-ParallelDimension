extends KinematicBody2D

var acceleration = 600
var maxSpeed = 128
var friction = 0.2
var gravity = 500
var jumpForce = 300
var downForce = 50

var groundDelay = 0

var velocity = Vector2.ZERO

onready var sprite = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	global.playerL = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var xInput = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	
	if xInput != 0:
		velocity.x += xInput * acceleration * delta
		velocity.x = clamp(velocity.x, -maxSpeed, maxSpeed)
		sprite.set_frame(1)
		sprite.flip_h = xInput < 0
	else:
		sprite.set_frame(0)
	velocity.y += gravity * delta
	
	if(is_on_floor()):
		groundDelay = 0.2
		
	if groundDelay >= 0:
		if xInput == 0:
			velocity.x = lerp(velocity.x, 0, friction)
		if(Input.is_action_just_pressed("ui_up")):
			velocity.y -= jumpForce
			AudioManager.Bounce()
		groundDelay -= delta
	else:
		if xInput == 0:
			velocity.x = lerp(velocity.x, 0, friction)
		if(Input.is_action_just_pressed("ui_down")):
			velocity.y += downForce
	
	velocity = move_and_slide(velocity, Vector2.UP)
