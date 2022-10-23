extends Node2D

onready var current_scene = $CurrentScene.get_child(0)
onready var current_scene_name = current_scene.name

var next_scene = null
var next_scene_name = ""

func _ready():
	Global.scene_manager = self
	print("scene man ready")
	pass


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if(Global.get_scene_name() == "Level1"):
			Global.load_level("Level2")
		else:
			Global.load_level("Level1")

func transition_to(resource):
	if(resource):
		next_scene = resource.instance()
		next_scene_name = next_scene.name
		$TransitionScene.transition()
	pass

func _on_TransitionScene_transitioned():
	print("transitioned")
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(next_scene)
	current_scene = next_scene
	current_scene_name = next_scene_name
	next_scene = null
	next_scene_name = ""
