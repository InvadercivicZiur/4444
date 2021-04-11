extends AnimationPlayer







func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	self.play(self.get_animation_list()[randi() % self.get_animation_list().size() - 1])
