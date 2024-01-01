extends Control

@export
var CharacterName = "Unnamed"

#using defined globals we will update the whole sheet
func updateSheet():
	for child in self.get_children():
		#print(child.name)
		match child.name:
			"CharacterNameLabel":
				child.set_text(CharacterName)

func _ready():
	updateSheet()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
