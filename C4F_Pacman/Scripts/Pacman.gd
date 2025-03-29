extends CharacterBody2D

@export  var speed : float = 100
@onready var sprite : AnimatedSprite2D = get_node("PacmanSprite")

var moveDir : Vector2 = Vector2(0,0)

func _process(delta : float) -> void:
    if Input.is_action_pressed("moveUp"   ) : moveDir = Vector2( 0, -1)
    if Input.is_action_pressed("moveDown" ) : moveDir = Vector2( 0,  1)
    if Input.is_action_pressed("moveRight") : moveDir = Vector2( 1,  0)
    if Input.is_action_pressed("moveLeft" ) : moveDir = Vector2(-1,  0)
    look_at(global_position + moveDir)
    
    if moveDir.length() > 0 : sprite.play("running")
    else                    : sprite.play("idle")

func _physics_process(delta : float) -> void:
    velocity = speed * moveDir
    move_and_slide()
