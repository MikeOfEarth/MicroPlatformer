extends Area2D

@export var moveSpeed : float = 30.0
@export var moveDir : Vector2
# Called when the node enters the scene tree for the first time.
var startPos : Vector2
var endPos : Vector2

func _ready():
	startPos = global_position
	endPos = startPos+moveDir


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.move_toward(endPos, moveSpeed*delta)
	
	if global_position==endPos:
		if global_position==startPos:
			endPos = startPos+moveDir
		else:
			endPos = startPos


func _on_body_entered(body):
	if body.is_in_group("player"):
		body.game_over()
