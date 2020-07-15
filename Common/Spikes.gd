extends Area2D

func _on_Spikes_body_entered(body):
	if(body.name == "PlayerR"):
		global.restart()
