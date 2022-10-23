extends Node

var current = "res://Assets/calm.mp3"
var calm = "res://Assets/calm.mp3"
var danger = "res://Assets/danger.mp3"

onready var music_player = $Music


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_music(path):
	if(current != path):
		var file = File.new()
		if(file.file_exists(path)):
			file.open(path, file.READ)
			var buffer = file.get_buffer(file.get_len())
			var stream = AudioStreamMP3.new()
			stream.data = buffer
			stream.loop = true
			music_player.stream = stream
			music_player.play()
			current = path
			

func set_danger():
	set_music(danger)
	
func set_calm():
	set_music(calm)
