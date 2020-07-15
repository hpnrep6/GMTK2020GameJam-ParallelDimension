extends Control

func _on_Button_button_down():
	global.level = 0
	get_tree().change_scene(global.levelArray[global.level])

