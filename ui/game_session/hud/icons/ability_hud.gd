class_name AbilityHUD
extends IconHUD


var ability: Ability setget set_ability
var action: String setget set_action

onready var _key_label: Label = $KeyLabel


func set_action(new_action: String) -> void:
	action = new_action
	var event = InputMap.get_action_list(action).front()
	if event is InputEventMouseButton:
		match event.button_index:
			BUTTON_LEFT:
				_key_label.text = "LMB"
			BUTTON_RIGHT:
				_key_label.text = "RMB"
	elif event is InputEventKey:
		_key_label.text = OS.get_scancode_string(event.scancode)
	else:
		assert("Unknown event type")


func set_ability(new_ability: Ability) -> void:
	if ability:
		ability.get_cooldown().disconnect("started", self, "_display_timer")
	ability = new_ability

	if not ability:
		return

	texture = load(Utils.get_script_icon(ability.script))

	var cooldown: TimerRef = ability.get_cooldown()
	if cooldown:
		# warning-ignore:return_value_discarded
		cooldown.connect("started", self, "_display_timer")
