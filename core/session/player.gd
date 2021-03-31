class_name Player


# TODO 4.0: Use Team type (cyclic dependency)
var _team
var _controller: Controller
var _statistic := Statistic.new()
var _id: int


func _init(player_id: int) -> void:
	_id = player_id
	_controller = PlayerController.new(self)
	_controller.set_network_master(player_id)


# TODO 4.0: Use Team type for return type (cyclic dependency)
func get_team():
	return _team


func get_controller() -> Controller:
	return _controller


func get_statistic() -> Statistic:
	return _statistic


func get_network_master() -> int:
	return _id
