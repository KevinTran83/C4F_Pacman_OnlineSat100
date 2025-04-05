extends CharacterBody2D

@export var speed : float = 100
@export var range : float = 300

@onready var agent : NavigationAgent2D     = $NavAgent
@onready var rng   : RandomNumberGenerator = RandomNumberGenerator.new()

var moveDir : Vector2

func pickRandomPoint() -> Vector2:
    return global_position + Vector2 ( rng.randf_range(-1,1),
                                       rng.randf_range(-1,1)
                                     )\
                           * range
                        
func targetPlayer() -> Vector2:
    return get_tree().root.get_node("Game").get_node("Pacman").global_position

func _process(delta: float) -> void:
    if agent.is_navigation_finished():
      agent.target_position = targetPlayer()
    
func _physics_process(delta: float) -> void:
    moveDir = (agent.get_next_path_position() - global_position).normalized()
    velocity = moveDir * speed
    move_and_slide()
