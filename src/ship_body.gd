# Ship Body
extends RigidBody2D


var thrust = Vector2(0, -250)
var throttle = 0
var torque = 500

func _ready():
	pass

#func _input(event):
#	print(event.as_text())

func _integrate_forces(state):
	throttle = Input.get_action_strength("ui_thrust")

	if Input.is_action_pressed("ui_thrust"):
		applied_force = thrust.rotated(rotation) * throttle
	else:
		applied_force = Vector2()


	var rotation_dir = 0
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1
#
	self.applied_torque = rotation_dir * torque
