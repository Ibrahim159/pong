extends CharacterBody2D

@export var speed = 700


func _physics_process(delta):
	
	var direction = Input.get_axis("up_w", "down_s")
	velocity.y = direction * speed;
	
	move_and_slide()
	position.y = clamp(position.y, 98, 550)
