extends Node

var current_turn = 0
var current_location = 0

const LOCATIONS = [
	"home",
	"sad_river",
	"broken_gate",
	"forgotten_river",
	"tavern",
	"burning_river",
	"prison",
	"crying_river",
	"hidden_door"
]

const PORT_DATA = {
	"broken_gate": {
		"npcs": ["cerberus", "hecate", "thanatos", "three_judges", "empousa" ],
		"background": "broken_gate_bg"
	},
	"tavern": {
		"npcs": ["silene", "morphee", "hypnos", "hecate", "lethe", "phantasos_phobetor", "eurynomos"],
		"background": "tavern_bg"
	},
	"prison": {
		"npcs": ["sisyphe", "danaides", "cronos", "tantale", "ixion", "tityos", "hecatonchires", "cyclopes", "promethee"],
		"background": "prison_bg"
	},
	"hidden_door": {
		"npcs": ["hermes", "hades"],
		"background": "hidden_door_bg"
	}
}


const NPC_DATA = {
	"cerberus": {
		"dialogues": [
			[{"speaker": "Charon", "text": "Mon grand..."}],
			[{"speaker": "Cerberus", "text": "..."}]
		]
	},
	"silene": {
		"dialogues": [
			[{"speaker": "Silene", "text": "..."}]
		]
	}
}

const FISH_DATA = {
	# tes 28 poissons ici
}
