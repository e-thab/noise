extends PanelContainer
class_name Debug

## Debug panel indices
const FPS = 0
const RES_SCALE = 1
const RES = 2
const SHADER = 3
const NOISE = 4

func _process(delta):
	if visible:
		add_property("FPS", Performance.get_monitor(Performance.TIME_FPS), FPS)


func add_property(title : String, value, order : int): # This can either be called once for a static property or called every frame for a dynamic property
	var target
	target = $MarginContainer/VBoxContainer.find_child(title, true, false)
	if !target:
		target = Label.new() # Debug lines are of type Label
		$MarginContainer/VBoxContainer.add_child(target)
		target.name = title
		target.text = title + ": " + str(value)
	elif visible:
		target.text = title + ": " + str(value)
		$MarginContainer/VBoxContainer.move_child(target, order)