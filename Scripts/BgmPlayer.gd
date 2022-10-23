extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current = "res://Assets/calm.mp3"
var calm = "res://Assets/calm.mp3"
var danger = "res://Assets/danger.mp3"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func set_music(path):
	if(current != path):
		var file = File.new()
		if(file.file_exists(path)):
			file.open(path, file.READ)
			var buffer = file.get_buffer(file.get_len())
			var stream = AudioStreamMP3.new()
			stream.data = buffer
			self.stream = stream
			self.play()
			current = path


func _on_LightSwitch_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body.name == "Player"):
		set_music(danger)

