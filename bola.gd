extends CharacterBody2D

var speed = 600
var initial_direction = Vector2(1,1).normalized()
var direction = initial_direction 
var last_hit = null;
var score_p1 = 0
var score_p2 = 0

func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	
	if collision:
		direction = direction.bounce(collision.get_normal())
		
	if position.x < 0 or position.x > 1152:
		direction.x = -direction.x
		
		position = Vector2(576, 324)
		
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
