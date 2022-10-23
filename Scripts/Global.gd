extends Node

#onready var scene_manager = load("res://Scenes/SceneManager.tscn").instance();
onready var scene_manager= null;
var goal_enabled = false
var current_level = 1
var is_dead = false


func load_menu():
	var path := "res://Scenes/MenuScene.tscn"
	var resource := load(path)
	scene_manager.transition_to(resource)
	current_level = 1
	MusicController.set_calm()

func load_level(level_name: String): 
	goal_enabled = false
	
	if(level_name == "Level4"):
		load_menu()
		return
	
	var path := "res://Scenes//Levels/%s.tscn" % level_name
	var resource := load(path)
	scene_manager.transition_to(resource)
	
func get_level_timer():
	match current_level:
		1: return 121
		2: return 121
		3: return 61
		4: return 301
		_: return 61
	

func get_scene_name():
	return scene_manager.current_scene_name 
