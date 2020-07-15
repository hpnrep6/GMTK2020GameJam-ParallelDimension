extends Area2D


func _on_Area2D_body_entered(body):
	if body.name == "PlayerR":
		global.level += 1
		get_tree().change_scene(global.levelArray[global.level])
