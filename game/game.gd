extends Node2D

@export var pipes_scenes: PackedScene

@onready var pipes_holder = $PipesHolder
@onready var spawn_u = $SpawnU
@onready var spawn_l = $SpawnL
@onready var spawn_timer = $SpawnTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	spwan_pipes() 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func spwan_pipes() -> void:
	var pos_y = randf_range(spawn_u.position.y, spawn_l.position.y)
	var new_pipes = pipes_scenes.instantiate()
	
	new_pipes.position = Vector2(spawn_l.position.x, pos_y)
	pipes_holder.add_child(new_pipes)

func _on_spawn_timer_timeout():
	spwan_pipes()
