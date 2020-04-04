extends "res://MainMenuButton.gd"

signal play_displayed
var time = 0;
var title = false;

func _ready():
	._ready();
	get_node("../../Title").connect("displayed", self, "_on_Title_displayed");

func _on_Title_displayed():
	title = true;

func _pressed():
	._pressed();
	get_tree().change_scene("ingame.tscn");

func _process(delta):
	if(title && time<0.8):
		time += delta
	elif(title && time>=0.8):
		show()
		title = false
	
func _get_max_text():
	return "play game";

func _on_finished_text():
	emit_signal("play_displayed");
