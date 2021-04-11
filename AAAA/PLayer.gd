extends KinematicBody2D


var velocity : Vector2
export var move_speed = 2000


func _process(delta: float) -> void:
	
	velocity.x = -int(Input.is_action_pressed('ui_left')) + int(Input.is_action_pressed('ui_right'))
	velocity.y = -int(Input.is_action_pressed('ui_up')) + int(Input.is_action_pressed('ui_down'))
	
	velocity = velocity.normalized()
	self.move_and_slide(velocity * move_speed * delta)
	
	_animation_state_machine()


func _animation_state_machine():
	
	var new_anim
	
	if velocity == Vector2.ZERO:
		new_anim = 'idle'
	else:
		new_anim = 'walk'
	
	if new_anim != $AnimationPlayer.current_animation:
		$AnimationPlayer.play(new_anim)
	



