extends CharacterBody2D

@export var speed = 700

func _physics_process(delta):
	
	var direction = Input.get_axis("ui_up", "ui_down")
	velocity.y = direction * speed;
	
	move_and_slide()
	position.y = clamp(position.y, 98, 550)
