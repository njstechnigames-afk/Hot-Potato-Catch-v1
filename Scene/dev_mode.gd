extends Control

func _on_teleport_1_pressed() -> void:
	Global.minigames_done = 1
	get_tree().change_scene_to_file("res://Scene/minigame_1.tscn")


func _on_teleport_2_pressed() -> void:
	Global.minigames_done = 2
	get_tree().change_scene_to_file("res://Scene/minigame_2.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/settings.tscn")
