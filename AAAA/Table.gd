extends Area2D




var player_near = false



func _ready():
	self.connect("area_exited", self, '_exit')


func _input(event):
	
	if Input.is_action_just_pressed("ui_accept"):
		if player_near == true:
			get_tree().change_scene('res://Questions.tscn')
	


func _exit(area):
	if area.is_in_group('player'):
		player_near = false


func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		player_near = true

