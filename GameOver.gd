extends AcceptDialog

signal reset()
signal back()


func _ready():
	var back_button = add_button("Back to menu", true, "back")
	var ok_button = get_ok()
	ok_button.text = "Try again"
	var label = get_label()
	label.light_mask = 2
	ok_button.light_mask = 2
	back_button.light_mask = 2
	get_close_button().visible = false
	


func reset():
	emit_signal("reset")


func back():
	emit_signal("back")
