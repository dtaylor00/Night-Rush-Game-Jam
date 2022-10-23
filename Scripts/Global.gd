extends Node

#onready var scene_manager = load("res://Scenes/SceneManager.tscn").instance();
onready var scene_manager= null;
var goal_enabled = false
var current_level = 1


func load_menu():
	var path := "res://Scenes/MenuScene.tscn"
	var resource := load(path)
	scene_manager.transition_to(resource)

func load_level(level_name: String): 
	goal_enabled = false
	var path := "res://Scenes//Levels/%s.tscn" % level_name
	var resource := load(path)
	print(scene_manager)
	scene_manager.transition_to(resource)

func get_scene_name():
	return scene_manager.current_scene_name 
