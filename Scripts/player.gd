extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
var direction = Vector2.ZERO

@export var  speed = 1
var items = 0
var inventory = {}

func pick(item):
	var it = item.get_item()
	if it in inventory.keys():
		inventory[it] += it.get_amount()
	else:
		inventory[it] = it.get_amount()

func movement():
	velocity = Vector2.ZERO
	var directionX = Input.get_axis("leftMove", "rightMove")
	var directionY = Input.get_axis("upMove", "downMove")
	direction = Vector2(directionX, directionY)
	
	velocity = direction.normalized() * speed
	
	move_and_slide()
	
	if velocity == Vector2.ZERO:
		anim.play("idle")
	elif velocity.x != 0:
		if velocity.x > 0:
			anim.play("walkRight")
		else:
			anim.play("walkLeft")
	else:
		if velocity.y > 0:
			anim.play("walkDown")
		else:
			anim.play("walkUp")
		
func _physics_process(delta):
	movement()


