extends Panel;

@onready var main_menu_options: VBoxContainer = $MainMenuOptions

var currentIndex = 0;
var selection : Array;

func _ready() -> void:
	selection = main_menu_options.get_children()
	for node in selection:
		node.focus_mode = Control.FOCUS_CLICK
	selection[currentIndex].grab_focus()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_down"):
		if currentIndex == (selection.size())-1:
			currentIndex = 0;
		else:
			currentIndex += 1;
		print(currentIndex);
		selection[currentIndex].grab_focus()
		get_viewport().set_input_as_handled();
		
	elif event.is_action_pressed("ui_up"):
		if currentIndex == 0:
			currentIndex = (selection.size())-1;
		else:
			currentIndex -= 1;
		print(currentIndex);
		selection[currentIndex].grab_focus()
		get_viewport().set_input_as_handled();
		
	
	if event.is_action_pressed("accept"):
		print(selection[currentIndex].text, " : ", currentIndex);
		
		match selection[currentIndex].text:
			"Continue":
				get_tree().change_scene_to_file("res://continue_screen.tscn")
			"New Game":
				get_tree().change_scene_to_file("res://new_game.tscn")
			"Report A Bug":
				get_tree().change_scene_to_file("res://report.tscn")
			"Credits":
				get_tree().change_scene_to_file("res://credits.tscn")
			"Options":
				get_tree().change_scene_to_file("res://options.tscn")
			"Exit":
				get_tree().quit();
		#get_viewport().set_input_as_handled();
	
	if event.is_action_pressed("back"):
		get_tree().quit();
		get_viewport().set_input_as_handled();
