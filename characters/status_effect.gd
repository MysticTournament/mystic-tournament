class_name StatusEffect


var caster # TODO 4.0: Use Actor (cyclic dependency)

var _timer: TimerRef
var _modifiers: Dictionary # Contains actor properties as a key and their delta
var _connections: Array # An array of Connection objects

# Contains arguments to call connect / disconnect when applying / clearing an effect
# If sender or target are null, then the actor on which the effect is applied will be used instead
class Connection:
	var sender: Object
	var signal: String
	var target: Object
	var method: String
	var binds: Array

# TODO 4.0: Use Actor for actor (cyclic dependency)
func _init(duration: float, actor = null) -> void:
	_timer = TimerRef.new(duration)
	caster = actor


# TODO 4.0: Use Actor for _actor (cyclic dependency)
func apply(actor) -> void:
	for property_name in _modifiers:
		actor.set(property_name, actor.get(property_name) + _modifiers[property_name])
	for connection in _connections:
		var sender: Object = connection.sender if connection.sender else actor
		var target: Object = connection.target if connection.target else actor
		var result: int = sender.connect(connection.signal, target, connection.method, connection.binds)
		assert(result == OK, "Unable to apply status effect connection")
	_timer.start()


# TODO 4.0: Use Actor for _actor (cyclic dependency)
func clear(actor) -> void:
	for property_name in _modifiers:
		actor.set(property_name, actor.get(property_name) - _modifiers[property_name])
	for connection in _connections:
		var sender: Object = connection.sender if connection.sender else actor
		var target: Object = connection.target if connection.target else actor
		sender.disconnect(connection.signal, target, connection.method)


func get_timer() -> TimerRef:
	return _timer
