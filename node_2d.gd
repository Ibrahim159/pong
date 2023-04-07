extends Node2D	


func _process(delta):
	if get_tree().paused == true && Input.is_action_just_pressed("ui_accept"):
		get_tree().paused = false
		print("restart")
		get_tree().reload_current_scene()
