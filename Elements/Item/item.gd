extends Node2D

var item = ""

func SetItem(itemName):
	$Sprite2D.texture = load('res://Assets/Air Dungeon/Items/%s.png' % itemName)
	item = itemName
	
func _input(event):
	if event.is_action_pressed("interact"):
		var pl = get_parent().get_parent().get_player()
		if abs(pl.position.x - position.x) < 200 and abs(pl.position.y - position.y) < 200:
			get_parent().remove_child(self)
			pl.pick(self)
	
