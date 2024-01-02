extends Control

@export
var number = 0
#dictionary of modifiers
@export
var modifiers = {}
var baseNumber = 10

#returns 1 on success 0 on failure
func addModifier(name, value):
	#check the key isn't already in modifiers
	if (!modifiers.has(name)):
		modifiers[name] = value
		return 1
	return 0

#returns 1 on success 0 on failure
func removeModifier(name):
	#check the key is real
	if (modifiers.has(name)):
		modifiers.erase(name)
		return 1
	return 0

func updateNumber():
	number = baseNumber
	for mod in modifiers:
		number += mod

func getNumber():
	return number

#returns the modifier for the number stat
# for example if the total strength score was 16 it would be a +3
func getStatModifier():
	return floor(number/2 - 5)
