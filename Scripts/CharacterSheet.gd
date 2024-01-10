extends Control

#some preloads to make this all faster
var NumberStat = preload("res://Scene/NumberStat.tscn")
var Skill = preload("res://Scene/skill.tscn")

#We will use the actual node tree as our object, with groups to classify wha everything is
#however the original creation of objects will be passed on a preset.
#this will allow for further creation of different types of sheets later

@export
var char5e = {  # TODO finish this
	"Name" = "Unnamed",
	"Stats" = ["Str", "Dex", "Con", "Int", "Wis", "Cha"],
	"Skills" = [
		["Athletics",Globals.STR_SKILL], ["Acrobatics",Globals.DEX_SKILL], ["Sleight of Hand",Globals.DEX_SKILL], 
		["Stealth", Globals.DEX_SKILL], ["Arcana", Globals.INT_SKILL], ["History", Globals.INT_SKILL], 
		["Investigation", Globals.INT_SKILL], ["Nature", Globals.INT_SKILL], ["Religion", Globals.INT_SKILL], 
		["Animal Handling",Globals.WIS_SKILL], ["Insight",Globals.WIS_SKILL], ["Medicine", Globals.WIS_SKILL], 
		["Perception", Globals.WIS_SKILL], ["Survival", Globals.WIS_SKILL], ["Deception", Globals.CHA_SKILL], 
		["Intimidation", Globals.CHA_SKILL], ["Performance", Globals.CHA_SKILL], ["Persuasion", Globals.CHA_SKILL]
		],
}

#set everything up
func createSheet():
	#Change Name to be created here?
	
	#stats - TODO change that to work with groups and be normal
	
	#skills
	var skillList = get_node("Skills List")
	for skill in char5e.get("Skills"):
		var skillNode = Skill.instantiate()
		skillNode.createGUI(skill[0], skill[1], 0)
		skillList.add_child(skillNode)
	skillList.add_theme_constant_override("separation", floor(skillList.get_size().y / len(char5e.get("Skills"))))

#using defined globals we will update the whole sheet
func updateSheet():
	for child in self.get_children():
		for group in child.get_groups():
			match group:
				"Name":
					child.set_text(char5e.get("Name"))

func _ready():
	createSheet()
	updateSheet()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
