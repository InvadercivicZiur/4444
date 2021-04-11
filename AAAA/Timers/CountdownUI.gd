extends CanvasLayer


signal count_down_over

onready var NTimer = $Control/Timer


var seconds_passed = 0
var minutes_passed = 0
var total_time_passed = 0.0


"""
HOW TO USE!!!

use start_countdown(minutes = 1, seconds = 15) to start the clock.

when the timer hits zero the 'count_down_over' signal is emited.

I don't see a reason for needing the current time of a count down.
However, adding that functionallity would be easy. Just
refer to the CountUpUI node for an example.

there is no need for a stop_timer function.
"""



func _ready() -> void:
	start_countdown(0, 5)


func start_countdown(minutes, seconds):
	
	total_time_passed = minutes/60
	total_time_passed += seconds
	
	seconds_passed = minutes/60 + seconds
	
	$Control/Timer.start(1)
	$Control/Label.text = str('time left ',minutes, ':', seconds)


func _on_Timer_timeout() -> void:
	if total_time_passed <= 0:
		emit_signal('count_down_over')
		
	else:
		if seconds_passed == 60:
			minutes_passed -= 1
			seconds_passed = 60
		
		seconds_passed -= 1
		total_time_passed -= 1
		$Control/Timer.start(1)
		$Control/Label.text = str('time left ',minutes_passed, ':', seconds_passed)
	

