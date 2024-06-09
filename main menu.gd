extends Control

# Connect this signal to your buttons' "pressed" signal
signal button_pressed(String button_name)

func _ready():
	# Connect each button's "pressed" signal to this script's "on_button_pressed" function
	connect_buttons()

func connect_buttons():
	# Connect each button's "pressed" signal to the "on_button_pressed" function
	for button in get_node("ButtonContainer").get_children():
		if button is Button:
			button.connect("pressed", self, "on_button_pressed")

func on_button_pressed():
	# Determine which button was pressed and emit a signal with its name
	var button_name = get_node(button_path).get_text()
	emit_signal("button_pressed", button_name)
