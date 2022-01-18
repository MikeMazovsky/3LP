extends RichTextLabel

var dialog = [ "Damn it! There are only three little piggies and a whole lot of troubles with them!", "Everyone knows, that these lazy boys has built themself a nice houses, but there aren't many people, who knows that in fact they have actually STOLEN YOUR HOUSE!" ]

var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON && event.is_pressed:
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible-characters(get_visible_characters()+1)