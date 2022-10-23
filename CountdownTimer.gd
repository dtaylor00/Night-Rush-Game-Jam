extends Control

onready var label = $Label
onready var timer = $Timer
func _process(delta: float) -> void:
	label.text = String(int(timer.time_left))

func _on_Timer_timeout() -> void:
	print("timeout")
	pass # Replace with function body.
 
