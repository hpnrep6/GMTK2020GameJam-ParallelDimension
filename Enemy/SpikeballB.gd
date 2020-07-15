extends KinematicBody2D

export var velocity = Vector2(150, 130)
onready var sprite = $Sprite

func _physics_process(delta):
	sprite.rotation_degrees += 720 * delta
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)

func _on_Area2D_body_entered(body):
	if body.name == "PlayerL" or body.name == "PlayerR":
		global.restart()
