extends Node2D
@onready var timer: Node2D = $timer
var buttons_pressed := 0
var timer_end = false

func _ready() -> void:
	await timer.Timer(7.0)
	#after this is completed...
	timer_end = true 


func _process(delta: float) -> void:
	if buttons_pressed == 4:
		if Global.minigames_done > 1:
			get_tree().change_scene_to_file("res://Scene/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scene/timer_scene.tscn")
	
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		get_tree().change_scene_to_file("res://Scene/timer_scene.tscn")
		
	elif Global.lives <= 0:
		get_tree().change_scene_to_file("res://Scene/lose_screen.tscn")
