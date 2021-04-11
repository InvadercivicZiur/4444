extends CanvasLayer


signal timer_update

onready var NTimer = $Control/Timer


var seconds_passed = 0
var minutes_passed = 0
var total_time_passed = 0.0



"""
HOW TO USE!!!

use start_timer() to start the clock.
every second the timer_update signal is emitted.
you can connect any node to this signal. the signal passes total time in seconds.

EXAMPLE:
func _on_CountUpUI_timer_update(time_so_far) -> void:
	
	if time_so_far > 6:
		get_node(CountUpUI).stop()
		print(time_so_far)
	

!!!
when you connect the signal the time_so_far parameter
is not written in the function automatically.
!!!

when the desired time has passed, call stop_timer()

"""




func _ready() -> void:
	start_timer()


func start_timer():
	
	total_time_passed = 0
	seconds_passed = 0
	minutes_passed = 0
	
	$Control/Timer.start(1)
	$Control/Label.text = str('time spent ',minutes_passed, ':', seconds_passed)


func stop_timer():
	
	$Control/Timer.stop()
	total_time_passed = 0
	seconds_passed = 0
	minutes_passed = 0


func _on_Timer_timeout() -> void:
	
	emit_signal('timer_update', [total_time_passed])
	
	if minutes_passed == 60:
		minutes_passed += 1
		seconds_passed = 0
	
	seconds_passed += 1
	total_time_passed += 1
	$Control/Timer.start(1)
	$Control/Label.text = str('time spent ',minutes_passed, ':', seconds_passed)
	
	




