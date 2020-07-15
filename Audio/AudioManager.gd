extends Node2D

onready var bounce = $Bounce
onready var background = $Bkg
onready var trigger = $Trig
# Called when the node enters the scene tree for the first time.
func _ready():
	background.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Bounce():
	bounce.play()
	
func Trigger():
	pass
	#trigger.play()

