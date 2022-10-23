extends Avatar

onready var right_move_sprites = $RightSprites
onready var left_move_sprites = $LeftSprites
onready var right_jump_sprites = $JumpRight
onready var left_jump_sprites = $JumpLeft
onready var current_sprites = right_move_sprites

func _physics_process(_delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL) 

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("run_right") - Input.get_action_strength("run_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
	)
	
func set_current_sprites(var new_sprites):
	current_sprites.visible = false
	current_sprites = new_sprites
	current_sprites.visible = true
	
func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	var output: = linear_velocity
	output.x = speed.x * direction.x
	
	
	output.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		output.y = speed.y * direction.y
	if is_jump_interrupted:
		output.y = 0.0
		
		
	# Lord forgive me for my sins and the spaghetti that is the animation logic
	var prev_direction;
	if(current_sprites == right_jump_sprites || current_sprites == right_move_sprites):
		prev_direction = "right"
	else: 
		prev_direction = "left"
	if(!is_on_floor()):
		if(output.x == 0):
			if(prev_direction == "right"):
				set_current_sprites(right_jump_sprites)
			elif(prev_direction == "left"):
				set_current_sprites(left_jump_sprites)
		elif(output.x > 0):			
				set_current_sprites(right_jump_sprites)
		else:
				set_current_sprites(left_jump_sprites)
		current_sprites.get_node("AnimationPlayer").current_animation = "jump"
	elif(output.x == 0 && is_on_floor()):
		if(prev_direction == "right"):
			set_current_sprites(right_move_sprites)
		elif(prev_direction == "left"):
			set_current_sprites(left_move_sprites)
		current_sprites.get_node("AnimationPlayer").current_animation = "idle"
	elif(output.x > 0):
			set_current_sprites(right_move_sprites)
			current_sprites.get_node("AnimationPlayer").current_animation = "run"
	else:
			set_current_sprites(left_move_sprites)
			current_sprites.get_node("AnimationPlayer").current_animation = "run"
		
	return output
