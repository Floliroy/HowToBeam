local strings = {
	SI_COMBAT_METRICS_LANG = "en",

	--Part 1
	SI_HOWTOBEAM_SPAMMABLE_HEADER = "Spammable",
	SI_HOWTOBEAM_SPAMMABLE_DESC = "Configure which spammable you are using to compare it to radiant.\nMake sure to only select ONE.",
	SI_HOWTOBEAM_PSIJIC_NAME = "Elemental Weapon",
	SI_HOWTOBEAM_PSIJIC_TT = "Are you using Elemental Weapon from Psijic Order as spammable ?",
	SI_HOWTOBEAM_PULSE_NAME = "Force Pulse",
	SI_HOWTOBEAM_PULSE_TT = "Are you using Force Pulse from Destruction Staff as spammable ?",
	SI_HOWTOBEAM_JABS_NAME = "Puncturing Sweep",
	SI_HOWTOBEAM_JABS_TT = "Are you using Puncturing Sweep from Aedric Spear as spammable ?",
	SI_HOWTOBEAM_FLARE_NAME = "Dark Flare",
	SI_HOWTOBEAM_FLARE_TT = "Are you using Dark Flare from Dawn's Wrath as spammable ?",

	--Part 2 
	SI_HOWTOBEAM_SETTINGS_HEADER = "Settings",
	SI_HOWTOBEAM_SETTINGS_DESC = "Other settings to personalize your HowToBeam Add-On.\nComming Soon : Settings to get more accurate results.",
	SI_HOWTOBEAM_HP_NAME = "HP Threshold",
	SI_HOWTOBEAM_HP_TT = "The minimum target's max Health in Million for the alert to be enabled.",
	SI_HOWTOBEAM_SPAMMABLEALERT_NAME = "Spammable Alert",
	SI_HOWTOBEAM_SPAMMABLEALERT_TT = "What alert you want, when you can start use Radiant instead of your Spammable.\nRemember to keep all your DoTs up.",
	SI_HOWTOBEAM_DOTALERT_NAME = "Spear+Blockade Alert",
	SI_HOWTOBEAM_DOTALERT_TT = "What alert you want, when the only DoTs you need to resfresh are Spear and Blockade.",
	SI_HOWTOBEAM_FINISHALERT_NAME = "Radiant Spam Alert",
	SI_HOWTOBEAM_FINISHALERT_TT = "What alert you want, when you can spam Radiant.",
	SI_HOWTOBEAM_UNLOCK_NAME = "Unlock",
	SI_HOWTOBEAM_UNLOCK_TT = "Use it to reposition the alert.",
	SI_HOWTOBEAM_COLOR_NAME = "Alert Color",
	SI_HOWTOBEAM_COLOR_TT = "Choose the color of the alert that you want.",
}

for stringId, stringValue in pairs(strings) do
	ZO_CreateStringId(stringId, stringValue)
	SafeAddVersion(stringId, 1)
end
