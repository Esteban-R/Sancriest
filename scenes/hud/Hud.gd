extends CanvasLayer

export (Color) var color
onready var check = $Control/CheckButton
var button

func _ready():
	OS.center_window()
	$Control/CheckButton.text = "Hola"
	button = Button.new()
	button.text = "Click Me!"
	button.rect_position = Vector2(100,100)
	button.connect("pressed",self,"_button_pressed")
	add_child(button)
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_down"):
		$Control/CheckButton.disabled = true
		print(check.toggle_mode)
		button.set_text_align(2)
	if Input.is_action_pressed("ui_up"):
		$Control/CheckButton.disabled = false
		print(check.toggle_mode)
		#button.flat = true
		button.set_text_align(0)
	
func _button_pressed():
	button.text = "Esteban Ramirez Ochoa"
	button.margin_right = 500
