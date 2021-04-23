class_name StatusEffectsBox
extends HBoxContainer


const StatusEffectHUDScene: PackedScene = preload("res://ui/game_session/hud/icons/status_effect_hud.tscn")


func _add_status_effect(effect: StatusEffect) -> void:
	var effect_hud := StatusEffectHUDScene.instance()
	add_child(effect_hud)
	effect_hud.status_effect = effect


func _remove_status_effect(effect: StatusEffect) -> void:
	for child in get_children():
		if child.status_effect == effect:
			child.free()
			return
	assert(false, 'Effect not found')
