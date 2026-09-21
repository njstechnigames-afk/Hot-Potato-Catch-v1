extends Node2D
const TimerScene = preload("res://Scene/timer.tscn") # Point to your timer file path
var themed_timer: Node2D = null

var garlic_collected = 0
var timer_end = false 

func _ready() -> void:
	# Instantiate the file as a node and add it to the scene automatically
	themed_timer = TimerScene.instantiate()
	add_child(themed_timer)
	
	for child in get_children():
		# Check if the child has that garlic signal
		if child.has_signal("garlic_collected"):
			# Connect it so it triggers your +1 function automatically
			child.garlic_collected.connect(_on_garlic_signal_received)
	
	# Now this will run smoothly without needing to drag anything into the scene dock!
	await themed_timer.Timer(10.0) 
	timer_end = true

func _on_garlic_signal_received():
	garlic_collected += 1
	print("Potato collected! Current count: ", garlic_collected)


		#Below you can see that I have a function that I named. I grab a 
		#function from it that was created in it's script and use `await` to 
		# tell the script to wait for a signal, or for when a function finshes


func _process(delta: float) -> void: # running every frame brochacho
	
	if garlic_collected == 3: # the double equals is just an argument asking if it's the same, with "=" it'll give an error
		if Global.minigames_done > 3: # we access a global script and see how many minigames have been compeleted
			get_tree().change_scene_to_file("res://Scene/done_screen.tscn") # change current play scene into another, but you make your own finish screen in a later challenge, dont worry abt this rn
		else:
			get_tree().change_scene_to_file("res://Scene/timer_scene.tscn") # go back to the intermission scene
	
	if timer_end: # if the timer does end...
		Global.minigames_done -=1 #go back a minigame
		Global.lives -= 1 # lose ur
		get_tree().change_scene_to_file("res://Scene/timer_scene.tscn") # back to intermission
		if Global.lives <= 0:
			var tree = Engine.get_main_loop() as SceneTree
			if tree:
				tree.change_scene_to_file("res://Scene/lose_screen.tscn")
		

func garlic_collect() -> void: # cool function that you connect to those garlics
	garlic_collected = garlic_collected +1
	return
