extends CharacterBody2D

@export var speed = 700.0
var initial_direction = Vector2(1,1).normalized()
var direction = initial_direction 
var last_hit = null;
var score_p1 = 0
var score_p2 = 0

func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	_winner()
	
	if collision:
		direction = direction.bounce(collision.get_normal())
		speed += 25.0
		last_hit = direction
		
	if position.x < 0 or position.x > 1152:
		direction.x = -direction.x
		speed = 700.0
		position = Vector2(576, 324)
		
		if last_hit != null and last_hit.x < 0:
			direction = initial_direction * -1
		if last_hit != null and last_hit.x > 0:
			direction = initial_direction 
			
	if position.y < 0 or position.y > 648:
		direction.y = -direction.y
		
	direction = direction.normalized()




func _on_area_2d_body_entered(body):
	var label = get_parent().get_node("Label2")
	score_p2 += 1
	label.set_text(str(score_p2));


func _on_area_2d_2_body_entered(body):
	var label = get_parent().get_node("Label")
	score_p1 += 1
	label.set_text(str(score_p1));

func _winner():
	if score_p1 >= 10:
		var label = get_parent().get_node("Label")
		label.set_text(str(score_p1)  + "\nWinner!\nPress enter to restart")
		_reset_game()
		
	
	if score_p2 >= 10:
		var label = get_parent().get_node("Label2")
		label.set_text(str(score_p2)  + "\nWinner!\nPress enter to restart")
		_reset_game()

func _reset_game():
	get_parent().get_node("paleta1").speed = 0
	get_parent().get_node("paleta2").speed = 0
	var timer = get_parent().get_node("Timer")
	get_parent().remove_child(timer)
	speed = 0;
	
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()
