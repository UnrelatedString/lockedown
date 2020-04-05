extends KinematicBody2D

export var speed = 125
var screen_size #this feels like it belongs somewhere else
onready var fog = get_node("Camera2D/Fog")

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	else:
		fog.playing = true;
	if(!test_move(transform,velocity * delta)):
		position += velocity * delta;
		fog.playing = false;
