extends CharacterBody2D

var speed = 600


func _physics_process(delta):
	
	var direction = Input.get_axis("up_w", "down_s")
	velocity.y = direction * speed;
	
	move_and_slide()
