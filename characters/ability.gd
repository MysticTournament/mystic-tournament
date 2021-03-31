class_name Ability


signal used

var _cooldown: TimerRef


func use(_caster: Actor) -> void:
	if _cooldown:
		_cooldown.start()
	emit_signal("used")


func get_cooldown() -> TimerRef:
	return _cooldown
