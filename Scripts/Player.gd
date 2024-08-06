extends CharacterBody2D


var moveSpeed : float = 100.0
var jumpForce : float = 200.0
var gravity : float = 500.0


var score : int = 0
@export var totalCoins : int = 6
@onready var score_text : Label = get_node("CanvasLayer/ScoreText")
signal maxCoin


func _ready():
	score_text.text = str("COINS: 0/",totalCoins)
	
func _process(delta):
	if velocity.x!=0 and is_on_floor():
		$AnimatedSprite2D.play("walking")
	elif velocity.x==0 and is_on_floor():
		$AnimatedSprite2D.set_frame_and_progress(1,0)
	else:
		$AnimatedSprite2D.set_frame_and_progress(0,0)
	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity*delta
	
	velocity.x=0
	
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= moveSpeed
		$AnimatedSprite2D.scale.x=1.0
	

	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += moveSpeed
		$AnimatedSprite2D.scale.x=-1.0

	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y = -jumpForce
		
		
	move_and_slide()
	
	if global_position.y > 200:
		game_over()
	
func game_over():
	get_tree().reload_current_scene()

func addScore(amount):
	score+=amount
	score_text.text = str("COINS: ", score,"/",totalCoins)
	if score >= totalCoins:
		emit_signal("maxCoin")

