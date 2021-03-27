class_name BaseAbility


signal used

var _cooldown: AbilityCooldown


func use(_caster: BaseActor) -> void:
	if _cooldown:
		_cooldown.start()
	emit_signal("used")


func get_cooldown() -> AbilityCooldown:
	return _cooldown
