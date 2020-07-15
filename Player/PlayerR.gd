extends KinematicBody2D

var maxSpeed = 60
var acceleration = 2000
var velocity = Vector2()
var isMoving = false
var deltaTime

onready var sprite = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	global.playerR = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	deltaTime = delta
	if not isMoving:
		applyFriction(acceleration * delta)
	velocity = move_and_slide(velocity)
	isMoving = false

func getInput():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	if axis.x == 1:
		moveDown()
	#return axis.normalized()

func moveRight():
	isMoving = true
	applyMovement(acceleration * deltaTime * Vector2(1,0))
	sprite.flip_v = false
	sprite.rotation_degrees = 90
	
func moveLeft():
	isMoving = true
	applyMovement(acceleration * deltaTime * Vector2(-1,0))
	sprite.flip_v = false
	sprite.rotation_degrees = -90
	
func moveUp():
	isMoving = true
	applyMovement(acceleration * deltaTime * Vector2(0,-1))
	sprite.rotation_degrees = 0
	sprite.flip_v = false

	
func moveDown():
	isMoving = true
	applyMovement(acceleration * deltaTime * Vector2(0,1))
	sprite.rotation_degrees = 0
	sprite.flip_v = true

	
func applyFriction(amount):
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	else:
		velocity = Vector2.ZERO
		
func applyMovement(amount):
	velocity += amount
	velocity = velocity.clamped(maxSpeed)
	
func reload():
	get_tree().reload_current_scene()

func returnToStart():
	global.level = 0
	get_tree().change_scene(global.levelArray[global.level])
