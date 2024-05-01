extends TextureRect

func set_item(item_name, amount):
	texture = load("res://Assets/Items/%s.png" % item_name)
	$Amount.text = str(amount)
