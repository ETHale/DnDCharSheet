extends Control

#some preloads to make this all faster
var NumberStat = preload("res://Scene/NumberStat.tscn")

@export
var characterName = "Unnamed"

#below refer to specific stats - these will be NumberStats scenes
var str

#set everything up
func createSheet():
	for child in self.get_children():
		match child.name:
			"Str":
				str = NumberStat.instantiate()
				child.add_child(str)

#using defined globals we will update the whole sheet
func updateSheet():
	for child in self.get_children():
		#print(child.name)
		match child.name:
			#character name
			"CharacterNameLabel":
				child.set_text(characterName)
			
			#strength stat
			"Str":
				str.updateNumber()
				child.find_child("Label").set_text(str(str.getNumber()))

func _ready():
	createSheet()
	updateSheet()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
