extends CharacterBody2D

var speed = 600
var initial_direction = Vector2(1,1).normalized()
var direction = initial_direction 
var last_hit = null;

func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	
	if collision:
		direction = direction.bounce(collision.get_normal())
		
	if position.x < 0 or position.x > 1152:
		direction.x = -direction.x
		
		position = Vector2(576, 324)
		
		direction = initial_direction
		print(direction)
	if position.y < 0 or position.y > 648:
		direction.y = -direction.y
		
	direction = direction.normalized()
