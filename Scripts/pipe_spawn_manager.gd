extends Node2D

@onready var spawn_timer = $Timer

func timer_change_wait_time():
	var spawn_time = randf_range(0.5, 3.0)
	spawn_timer.wait_time = spawn_time

func pipe_spawn_rng():
	var pipe_spawn
	var pipe_spawn_instance
	
	var pipe_spawn_num = randi_range(0,1)
	
	match pipe_spawn_num:
		0:
			pipe_spawn = preload("res://Scenes/Pipe Spawn/pipe_spawn.tscn")
			pipe_spawn_instance = pipe_spawn.instantiate()
			place_pipe_in_world(pipe_spawn_instance)
		1:
			pipe_spawn = preload("res://Scenes/Pipe Spawn/pipe_spawn_2.tscn")
			pipe_spawn_instance = pipe_spawn.instantiate()
			place_pipe_in_world(pipe_spawn_instance)
		_:
			print("Invalid number")

func place_pipe_in_world(pipe_spawn_instance):
	var pipe_spawn_pos = Vector2(720,0)
	pipe_spawn_instance.position = pipe_spawn_pos
	add_child(pipe_spawn_instance)
	timer_change_wait_time()
	spawn_timer.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	pipe_spawn_rng()
