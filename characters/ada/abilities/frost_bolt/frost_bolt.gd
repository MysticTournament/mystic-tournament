class_name FrostBolt, "res://characters/ada/abilities/frost_bolt/frost_bolt.png"
extends BaseAbility

const FrostBoltProjectileScene: PackedScene = preload("res://characters/ada/abilities/frost_bolt/frost_bolt_projectile.tscn")

func use(caster: BaseActor) -> void:
	.use(caster)
	var projectile: KinematicBody = FrostBoltProjectileScene.instance()
	projectile.global_transform = caster.get_projectile_spawn_pos().global_transform
	projectile.caster = caster
	projectile.rotation = caster.get_controller().get_look_rotation()
	GameSession.map.add_child(projectile)
