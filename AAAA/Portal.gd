extends Sprite


func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		get_node('/root/Mane/CanvasLayer/Control').show()


func _on_Area2D_body_exited(body: Node) -> void:
	if body.name == 'Player':
		get_node('/root/Mane/CanvasLayer/Control').hide()


