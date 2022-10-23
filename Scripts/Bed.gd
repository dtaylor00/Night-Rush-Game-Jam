extends Area2D


onready var sprite = $AnimatedSprite
onready var collider = $CollisionShape2D
onready var camera = $Camera2D


func _on_LightSwitch_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body.name == "Player"):
		Global.goal_enabled = true

func _on_Bed_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body.name == "Player" && Global.goal_enabled):
		body.queue_free()
		sprite.play()
		camera.current = true
		MusicController.set_calm()

func _on_AnimatedSprite_animation_finished():
	sprite.stop()
	sprite.frame = 6
	Global.current_level += 1;
	var next_level = "Level" + String(Global.current_level)
	Global.load_level(next_level)


