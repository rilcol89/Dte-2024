extends CharacterBody3D

# Define player's movement speed
var sprinting_speed = 8
var jump_force = 10
var gravity = 20
var walking_speed = 5 
var crouching_speed = 5
@onready var spring_arm_3d = $SpringArm3D
@onready var camera_3d = $SpringArm3D/Camera3D
var speed = walking_speed

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta):
	print(is_on_floor())
	# Player movement
	var input_direction = Vector3()
	input_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_direction.z = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_direction= input_direction.rotated(Vector3.UP, rotation.y).normalized()
	velocity.x = input_direction.x * speed
	velocity.z = input_direction.z * speed

func _process(delta):
	
	
	if Input.is_action_pressed("sprint"):
		# Code to handle sprinting
		pass
	if Input.is_action_pressed("crouch"):
		# Code to handle crouching
		pass




	# Apply gravity
	velocity.y -= gravity * delta

	# Jumping
	if is_on_floor() and Input.is_action_pressed("jump"):
		velocity.y = jump_force

	# Apply movement
	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation_degrees.y -= event.relative.x * 0.1
		spring_arm_3d.rotation_degrees.x -= event.relative.y * 0.1
		spring_arm_3d.rotation_degrees.x = clamp(spring_arm_3d.rotation_degrees.x, -80, 80)
