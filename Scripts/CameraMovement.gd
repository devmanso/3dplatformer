# ----------------------------------------------------------------------------------- #
# -------------- FEEL FREE TO USE IN ANY PROJECT, COMMERCIAL OR NON-COMMERCIAL ------ #
# ---------------------- 3D PLATFORMER CONTROLLER BY SD STUDIOS --------------------- #
# ---------------------------- ATTRIBUTION NOT REQUIRED ----------------------------- #
# ----------------------------------------------------------------------------------- #

extends Node3D

# ---------- VARIABLES ---------- #

var mouse_sensitivity : float

# Assign Camera Node here it might be named different in your Project
@onready var camera = $Camera3D

# ---------- FUNCTIONS ---------- #

func _ready():
	
	if !(Config.get_config("InputSettings", "MouseSensitivity")):
		mouse_sensitivity = 0.5  # Default value if setting or section does not exist
	else :
		mouse_sensitivity = float(Config.get_config("InputSettings", "MouseSensitivity")) * .5
	top_level = true
	# Confining Mouse Cursor in the game view so it doesnt get in the way of gameplay
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Handling Camera Movement
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.x -= event.relative.y * mouse_sensitivity
		rotation_degrees.x = clamp(rotation_degrees.x, -60, -0)
		
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		rotation_degrees.y = wrapf(rotation_degrees.y, 0, 360)
