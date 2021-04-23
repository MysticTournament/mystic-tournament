class_name IconHUD
extends TextureRect


onready var _cooldown_progress: TextureProgress = $CooldownProgress
onready var _cooldown_label: NumericLabel = $CooldownLabel
onready var _tween: Tween = $Tween


func _display_timer(time: float, invert: bool = false) -> void:
	_cooldown_progress.max_value = time

	# Animation
	if invert:
		# warning-ignore:return_value_discarded
		_tween.interpolate_property(_cooldown_progress, "value", 0, time, time)
	else:
		# warning-ignore:return_value_discarded
		_tween.interpolate_property(_cooldown_progress, "value", time, 0, time)
	# warning-ignore:return_value_discarded
	_tween.interpolate_method(_cooldown_label, "set_ceil", time, 0, time)

	# Reset cooldown text at end
	# warning-ignore:return_value_discarded
	_tween.interpolate_callback(_cooldown_label, time, "set_text", String())

	# warning-ignore:return_value_discarded
	_tween.start()
