extends Node

var playerR
var playerL

var ln1 = "res://Levels/Level-1.tscn"
var l0 = "res://Levels/Level0.tscn"
var l1 = "res://Levels/Level1.tscn"
var l2 = "res://Levels/Level2.tscn"
var l3 = "res://Levels/Level3.tscn"
var l4 = "res://Levels/Level4.tscn"
var l5 = "res://Levels/Level5.tscn"
var l6 = "res://Levels/Level6.tscn"
var lf = "res://Levels/LevelFinal.tscn"

var levelArray 
# Called when the node enters the scene tree for the first time.
var level = 0

func _ready():
	levelArray = [ln1,l0,l1,l2,l3,l4,l5,l6,lf]
	
func _process(delta):
	if(Input.is_key_pressed(KEY_P)):
		if(level > 0 and level != 8):
			restart()
	elif(Input.is_key_pressed(KEY_ESCAPE)):
		if(level > 0 and level != 8):
			playerR.returnToStart()
		
func restart():
	playerR.reload()
