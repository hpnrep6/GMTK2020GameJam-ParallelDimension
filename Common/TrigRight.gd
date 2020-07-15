extends Area2D

var playerIn = false
var player

func _process(delta):
	if playerIn:
		$Sprite.set_frame(1)
		global.playerR.moveRight()
	else: 
		$Sprite.set_frame(0)
	
func _on_Area2D_body_entered(body):
	if body.name == "PlayerL":
		playerIn = true
		player = body
		AudioManager.Trigger()


func _on_Area2D_body_exited(body):
	if body.name == "PlayerL":
		playerIn = false
