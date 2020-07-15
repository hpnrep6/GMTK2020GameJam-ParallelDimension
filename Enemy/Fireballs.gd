extends Node2D

export(float) var rotationSpeed = 45

func _process(delta):
	rotation_degrees += rotationSpeed * delta


func _on_Area2D_body_entered(body):
	if body.name == "PlayerL":
		global.restart()
