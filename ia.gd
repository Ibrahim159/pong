extends CharacterBody2D

@export var speed = 700
var initial_direction = Vector2(0,1).normalized()
var direction = initial_direction
var bola_speed
var rand_generate = RandomNumberGenerator.new()

func _physics_process(delta):
	var bola_pos = get_parent().get_node("bola").direction
	bola_speed = get_parent().get_node("bola").speed
	
	direction = Vector2(0, bola_pos.y)
	
	
	move_and_collide(direction * speed * delta)
	position.y = clamp(position.y, 98, 550)


func _on_timer_timeout():
	rand_generate.randomize()
	if bola_speed > 825:
		speed = rand_generate.randf_range(700, 800.0)
	
	if bola_speed < 825:
		speed = rand_generate.randf_range(700.0,bola_speed)
	print(speed)
