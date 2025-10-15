extends Control

@onready var PROGRESS_BAR = $background/ProgressBar

var PROGRESS = []
var PROGRESS_STATUS = 0

func _ready():
	ResourceLoader.load_threaded_request(SLoader.LOAD_SCEN)
	
func _physics_process(delta):
	PROGRESS_STATUS = ResourceLoader.load_threaded_get_status(SLoader.LOAD_SCEN, PROGRESS)
	PROGRESS_BAR.value = int(PROGRESS[0] * 100)
	
	if PROGRESS_STATUS == ResourceLoader.THREAD_LOAD_LOADED:
		var SCEN = ResourceLoader.load_threaded_get(SLoader.LOAD_SCEN)
		get_tree().change_scene_to_packed(SCEN)
	
	
	
	
	
	
