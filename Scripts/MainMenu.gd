extends VBoxContainer

const WORLD = preload ("res://World.tscn")


func _on_stargamebutton_pressed():
	get_tree().change_scene_to_packed(WORLD)


func _on_quit_button_pressed():
	get_tree().quit()
