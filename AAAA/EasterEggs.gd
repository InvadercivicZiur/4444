extends CanvasLayer


var counter = 0

var sprites = [
	"res://assets/EasterEgg1.png",
	"res://assets/EasterEgg2.png",
	"res://assets/EasterEgg3.png",
	"res://assets/EasterEgg4.png",
	"res://assets/EasterEgg5.png"
]




func _on_Right_pressed() -> void:
	counter += 1
	if counter > sprites.size() - 1:
		counter = 0
	$Control/TextureRect.texture = load(sprites[counter])
	


func _on_Left_pressed() -> void:
	counter -= 1
	if counter < 0:
		counter = sprites.size() - 1
	$Control/TextureRect.texture = load(sprites[counter])
	


func _on_Button_pressed() -> void:
	OS.shell_open('https://www.youtube.com/watch?v=0_hdqKJafmw&t=388s')
