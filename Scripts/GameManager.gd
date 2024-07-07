extends Node3D

# ---------- VARIABLES ---------- #

var score : int = 0
var death_count : int = 0

# ---------- FUNCTIONS ---------- #

func _process(_delta):
	show_mouse_cursor()
	if death_count == 3:
		death_count = 0
		get_tree().reload_current_scene()

# Making Cursor visible using "mouse_visible" key which is assigned in Project Settings > Input Map
func show_mouse_cursor():
	if Input.is_action_just_pressed("mouse_visible"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif Input.is_action_just_pressed("mouse_recapture"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func add_score():
	score += 1

func add_death():
	death_count += 1
