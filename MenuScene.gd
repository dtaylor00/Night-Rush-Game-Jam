extends Control


func _ready():
	print("ready")


func _on_StartButton_pressed():
	Global.load_level("Level1")

func _on_QuitButton_pressed():
	get_tree().quit()
