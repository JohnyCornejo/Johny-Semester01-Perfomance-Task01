extends Area2D
signal hit


@export var speed = 400
@onready var background_music = $"../BackgroundMusic"
@onready var enemy_hit = $"../EnemyHit"


func _process(delta):
	var velocity = Vector2.ZERO 
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	
	
	



	



	















func _on_body_entered(body):
	hide()
	emit_signal("hit")
	enemy_hit.play()
	background_music.stop()
	
	$CollisionShape2D.set_deferred("disabled", true)

