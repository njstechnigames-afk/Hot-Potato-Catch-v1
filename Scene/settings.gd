extends Control

@onready var password_input: LineEdit = $DevLogin # Point to your LineEdit node

func _on_login_pressed() -> void:
	# Check if the typed password matches your secret code
	if password_input.text == "RaspberryPi1234":
		# Switch to the dev dashboard scene with the 2 buttons
		get_tree().change_scene_to_file("res://Scene/dev_mode.tscn")
	else:
		# Do nothing if incorrect, exactly as requested
		pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/title_screen.tscn")
