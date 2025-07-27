extends Panel;

@onready var main_menu_options: VBoxContainer = $MainMenuOptions

var currentIndex = 0;
var selection : Array;

func _ready() -> void:
	selection = main_menu_options.get_children();
	selection[currentIndex].grab_focus()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("btn_down"):
		if currentIndex == (selection.size())-1:
			currentIndex = 0;
		else:
			currentIndex += 1;
		print(currentIndex);
		selection[currentIndex].grab_focus()
	elif event.is_action_pressed("btn_up"):
		if currentIndex == 0:
			currentIndex = (selection.size())-1;
		else:
			currentIndex -= 1;
		print(currentIndex);
		selection[currentIndex].grab_focus()
	
	if event.is_action_pressed("ui_accept"):
		print(selection[currentIndex].text, " : ", currentIndex);
