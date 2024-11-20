extends CharacterBody2D
var gravity = 1200
var jump_strength = -280
var is_flapping = false
var is_collided = false
var death_threshold = 820

 


func _ready():
	set_process(true)
	velocity = Vector2.ZERO
	
	


func _physics_process(delta):
	velocity.y += gravity * delta
	if position.x < -75:  # Если птичка выходит за левую границу
		end_game()
		return
	if is_flapping:
		velocity.y = jump_strength
		is_flapping = false
	move_and_slide()
	if position.y > get_viewport().size.y:
		end_game()
		return
		if position.y > death_threshold:
			end_game()
			get_tree().change_scene_to_file("res://menu.tscn")
			return
			
					


func flappy():
	if not is_collided:
		is_flapping = true
	
func _input(event):
	if event.is_action_pressed("jump") or event.is_action_pressed("ui_select"):
		flappy()  
	if event is InputEventScreenTouch and event.pressed:
		flappy()

		
func _on_body_entered(body):
	if body.is_in_group("Obstacle"):
		is_collided = true  # Устанавливаем состояние столкновения
		

func _on_body_exited(body):
	if body.is_in_group("Obstacle"):
		is_collided = false

		

func end_game():
	get_tree().change_scene_to_file("res://menu.tscn")

	

	 
