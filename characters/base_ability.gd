class_name BaseAbility


signal used

var _cooldown: TimerRef


func use(_caster: BaseActor) -> void:
	if _cooldown:
		_cooldown.start()
	emit_signal("used")


func get_cooldown() -> TimerRef:
	return _cooldown
