# Ship
extends Node2D

const ROTATE_LEFT = 0
const ROTATE_RIGHT = 1
const ROTATE_SPEED = 3

var _angle = 0

var thrust = Vector2(0, 250)
var torque = 20000

func _ready():
	_angle = 0


#func _process(delta):
#	if (Input.is_action_pressed("ui_left")):
#		rotate(ROTATE_LEFT)
#	elif (Input.is_action_pressed("ui_right")):
#		rotate(ROTATE_RIGHT)
	

func _integrate_forces(state):
	print("input")
	
	if Input.is_action_pressed("ui_up"):
		print("thrust")
		self.applied_force = thrust.rotated(rotation)
	else:
		self.applied_force = Vector2()
	var rotation_dir = 0
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1

	self.applied_torque = rotation_dir * torque



func _input(_event):
	pass
	
	
func rotate(dir):
	if dir == ROTATE_LEFT:
		_angle -= ROTATE_SPEED
	elif dir == ROTATE_RIGHT:
		_angle += ROTATE_SPEED

	$ShipBody.set_rotation_degrees(_angle)


func thrust():
	print("thrust")
