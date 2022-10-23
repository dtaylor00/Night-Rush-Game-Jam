extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var respawn_point = $RespawnPoint

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		body.position.x = respawn_point.position.x
		body.position.y = respawn_point.position.y
		AudioController.play_respawn()
	pass




func _on_Countdown_timeout():
	pass # Replace with function body.
