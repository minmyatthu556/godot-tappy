extends CharacterBody2D

const GRAVITY: float = 1900.0
const POWER: float = -400.0
@onready var animated_sprite = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

func _ready():
	pass 

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	fly()
	
	move_and_slide()
	
	if is_on_floor() == true:
		die()


func fly() -> void:
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = POWER
		animation_player.play("fly")


func  die() -> void:
	animated_sprite.stop()
	set_physics_process(false)
