extends CanvasLayer

signal transitioned

#func ready():
#	transition()

func transition():
	$AnimationPlayer.play("fade_to_black")



func _on_AnimationPlayer_animation_finished(anim_name):
	print("animation finished")
	if anim_name == "fade_to_black":
		emit_signal("transitioned")
		$AnimationPlayer.play("fade_to_normal")
