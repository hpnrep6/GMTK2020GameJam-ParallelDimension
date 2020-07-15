extends KinematicBody2D

var velocity = Vector2()
export var speed = 30

var player = global.playerL

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rotation_degrees += 720 * delta
	if player == null:
		player = global.playerL
		return
	velocity = position.direction_to(player.position) * speed
	if(position.distance_to(player.position) > 1):
		velocity = move_and_slide(velocity)


func _on_Area2D_body_entered(body):
	if body.name == "PlayerL":
		global.restart()
