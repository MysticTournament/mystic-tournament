class_name HUD
extends Control
# Displays elements overlaid on the screen.
# Every human-controlled player in the game has their own instance of the this class which draws separately of other UI.


onready var _abilities: HBoxContainer = $Abilities
onready var _hp_bar: ValueBar = $HBox/VBox/HPBar
onready var _status_effects_box: StatusEffectsBox = $HBox/VBox/StatusEffectsBox


func _ready() -> void:
	var controller: Controller = GameSession.get_current_player().get_controller()
	var hero: Actor = controller.actor
	for i in _abilities.get_child_count():
		var ability_hud: AbilityHUD = _abilities.get_child(i)
		ability_hud.action = PlayerController.ABILITY_ACTIONS[i]
		ability_hud.ability = hero.get_ability(i)

	# warning-ignore:return_value_discarded
	controller.connect("status_effect_added", _status_effects_box, "_add_status_effect")
	# warning-ignore:return_value_discarded
	controller.connect("status_effect_removed", _status_effects_box, "_remove_status_effect")
	# warning-ignore:return_value_discarded
	controller.connect("health_changed", _hp_bar, "set_value_smoothly")
	_hp_bar.reset(hero.health, hero.max_health)
