extends Control

#signal timeout
var timer_started = false

onready var label = $Label
onready var timer = $Timer
func _process(delta: float) -> void:
	label.text = String(int(timer.time_left))

func _on_Timer_timeout() -> void:
	print("timeout")
	Global.is_dead = true
#	emit_signal("timerout")
	pass # Replace with function body.
 


func _on_LightSwitch_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body.name == "Player" && !timer_started):
		timer_started = true
		timer.start(Global.get_level_timer())


func _on_Bed_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body.name == "Player" && timer_started):
		timer.stop()
		timer_started = false
