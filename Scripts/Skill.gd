extends Control

#consts for identifying
const NAME = 0
const TYPE = 1
const MODIFIER = 3

var info = {
	NAME : "skill",
	TYPE : Globals.DEX_SKILL,
	MODIFIER : 0
}

func setName(name):
	self.remove_from_group(info[NAME])
	info[NAME] = name
	self.add_to_group(name, true)
	
func setType(type):
	info[TYPE] = type

func setModifier(num):
	info[MODIFIER] = num

func getInfo():
	return info

func updateGUI():
	self.find_child("Name").set_text(info[NAME])
	self.find_child("Modifier").set_text(str(info[MODIFIER]))

func createGUI(name, type, modifier):
	setName(name)
	setType(type)
	setModifier(modifier)
	updateGUI()
