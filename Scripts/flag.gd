extends Area2D

@export var coinCount = 6
@export_file("*.tscn") var next_scene
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node('.').visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_body_entered(body):
	if body.is_in_group("player") and coinCount<=body.score:
		get_tree().change_scene_to_file(next_scene)


func _on_player_max_coin():
	get_node('.').visible=true
