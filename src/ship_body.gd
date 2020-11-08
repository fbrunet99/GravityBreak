extends RigidBody2D


var thrust = Vector2(0, -250)
var torque = 500

func _ready():
	pass


func _integrate_forces(state):
	
	if Input.is_action_pressed("ui_thrust"):
		applied_force = thrust.rotated(rotation)
	else:
		applied_force = Vector2()
	var rotation_dir = 0
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1
#
	self.applied_torque = rotation_dir * torque
