# Ship Area
extends Node2D

var _throttle

func _input(_event):
	_throttle = Input.get_action_strength("ui_thrust")
	
	animate_throttle()
	if (_throttle > 0):
		print("throttle = ", _throttle)


func animate_throttle():
	var level = 0
	
	if _throttle > .6:
		level = 6
	elif _throttle > .5:
		level = 5
	elif _throttle > .4:
		level = 4
	elif _throttle > .3:
		level = 3
	elif _throttle > .2:
		level = 1
	elif _throttle > .1:
		level = 1
	
	$ShipBody/ShipSprite.frame = level
