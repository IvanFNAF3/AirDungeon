extends Node2D

@onready var item = preload("res://Scenes/item.tscn")

func _ready():
	var items = ['Berries', 'Branch', 'Cactus', 'Meat', 'Bone', 'Wood', 'CraftedWood']
	for i in range(17):
		randomize()
		var a = int(randf_range(0, 7))
		var newItem = item.instantiate()
		$Items.add_child(newItem)
		newItem.SetItem(items[a])
		newItem.position = Vector2(int(randf_range(-2000, 1800)), int(randf_range(-1500, 2000)))
	pass
	
func get_player():
	return $Player

func update_label(value):
	get_parent().update_label(value);
