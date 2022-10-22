extends Node2D

const SceneTwo = preload("res://Scenes/Levels/Level2.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$TransitionScene.transition()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_TransitionScene_transitioned():
	print("transitioned")
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(SceneTwo.instance())
