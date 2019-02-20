local LAM2 = LibStub:GetLibrary("LibAddonMenu-2.0")
-----------------
---- Globals ----
-----------------
HowToBeam = {}
HowToBeam.name = "HowToBeam"
HowToBeam.version = "1.2.1"

local SpammableChoice = {
	[1] = GetString(SI_HOWTOBEAM_PSIJIC_NAME),
	[2] = GetString(SI_HOWTOBEAM_PULSE_NAME),
	[3] = GetString(SI_HOWTOBEAM_JABS_NAME),
	[4] = GetString(SI_HOWTOBEAM_FLARE_NAME),
}

local fire_race = 0
local shock_bonus = 0

---------------------------
---- Variables Default ----
---------------------------
HowToBeam.Default = {
	OffsetX = 873,
	OffsetY = 303,
	Spammable = 1,
	maxTargetHPchoose = 3,
	AlwaysShowAlert = false,
	SpammableAlert = "Start Use Beam",
	DoTAlert = "Only Spear + Blockade",
	FinishAlert = "Beam Them to Death",
	ColorRGB = {1, 0.12, 0.02, 1}
}

-------------------------
---- Settings Window ----
-------------------------
function HowToBeam.CreateSettingsWindow()
	local panelData = {
		type = "panel",
		name = "HowToBeam",
		displayName = "How To Beam",
		author = "Floliroy",
		version = HowToBeam.version,
		slashCommand = "/htbeam",
		registerForRefresh = true,
		registerForDefaults = true,
	}
	
	local cntrlOptionsPanel = LAM2:RegisterAddonPanel("HowToBeam_Settings", panelData)
	
	local optionsData = {
		[1] = {
			type = "header",
			name = GetString(SI_HOWTOBEAM_SETTINGS_HEADER),
		},
		[2] = {
			type = "description",
			text = GetString(SI_HOWTOBEAM_SETTINGS_DESC),
		},
		[3] = {
			type = "dropdown",
			name = GetString(SI_HOWTOBEAM_SPAMMABLE_NAME),
			tooltip = GetString(SI_HOWTOBEAM_SPAMMABLE_TT),
			choices = SpammableChoice,
			default = SpammableChoice[1],
			getFunc = function() return SpammableChoice[HowToBeam.savedVariables.Spammable] end,
			setFunc = function(selected)
				for index, name in ipairs(SpammableChoice) do
					if name == selected then
						HowToBeam.savedVariables.Spammable = index
						HowToBeam.Spammable = index
						break
					end
				end
			end,
		},
		[4] = {
			type = "slider",
			name = GetString(SI_HOWTOBEAM_HP_NAME),
			tooltip = GetString(SI_HOWTOBEAM_HP_TT),
			min = 1,
			max = 20,
			step = 1,
			default = 3,
			getFunc = function() return HowToBeam.savedVariables.maxTargetHPchoose end,
			setFunc = function(newValue) 
				HowToBeam.savedVariables.maxTargetHPchoose = newValue
				HowToBeam.maxTargetHPchoose = newValue
				end,
		},
		[5] = {
			type = "header",
			name = GetString(SI_HOWTOBEAM_CUSTOMIZATION_HEADER),
		},
		[6] = {
			type = "description",
			text = GetString(SI_HOWTOBEAM_CUSTOMIZATION_DESC),
		},
		[7] = {
			type = "checkbox",
			name = GetString(SI_HOWTOBEAM_UNLOCK_NAME),
			tooltip = GetString(SI_HOWTOBEAM_UNLOCK_TT),
			default = false,
			getFunc = function() return HowToBeam.savedVariables.AlwaysShowAlert end,
			setFunc = function(newValue) 
				HowToBeam.savedVariables.AlwaysShowAlert = newValue
				HowToBeamAlert:SetHidden(not newValue)  
			end,
		},
		[8] = {
			type = "editbox",
			name = GetString(SI_HOWTOBEAM_SPAMMABLEALERT_NAME),
			tooltip = GetString(SI_HOWTOBEAM_SPAMMABLEALERT_TT),
			default = "Start Use Beam",
			getFunc = function() return HowToBeam.savedVariables.SpammableAlert end,
			setFunc = function(newValue) 
				HowToBeam.savedVariables.SpammableAlert = newValue
				HowToBeam.SpammableAlert = newValue
				end,
		},
		[9] = {
			type = "editbox",
			name = GetString(SI_HOWTOBEAM_DOTALERT_NAME),
			tooltip = GetString(SI_HOWTOBEAM_DOTALERT_TT),
			default = "Only Spear + Blockade",
			getFunc = function() return HowToBeam.savedVariables.DoTAlert end,
			setFunc = function(newValue) 
				HowToBeam.savedVariables.DoTAlert = newValue
				HowToBeam.DoTAlert = newValue
				end,
		},
		[10] = {
			type = "editbox",
			name = GetString(SI_HOWTOBEAM_FINISHALERT_NAME),
			tooltip = GetString(SI_HOWTOBEAM_FINISHALERT_TT),
			default = "Beam Them to Death",
			getFunc = function() return HowToBeam.savedVariables.FinishAlert end,
			setFunc = function(newValue) 
				HowToBeam.savedVariables.FinishAlert = newValue
				HowToBeam.FinishAlert = newValue
				end,
		},
		[11] = {
			type = "colorpicker",
			name = GetString(SI_HOWTOBEAM_COLOR_NAME),
			tooltip = GetString(SI_HOWTOBEAM_COLOR_TT),
			getFunc = function() return unpack(HowToBeam.savedVariables.ColorRGB) end,
			setFunc = function(r,g,b,a)
				HowToBeam.savedVariables.ColorRGB = {r,g,b,a}
				HowToBeamBoss:SetColor(unpack(HowToBeam.savedVariables.ColorRGB))
			end,
		},
	}
	
	LAM2:RegisterOptionControls("HowToBeam_Settings", optionsData)
end

-------------------------------
---- Champoin Points Table ----
-------------------------------
local CpVariables15 = {
[0]=0.00,[1]=0.00,[2]=0.00,[3]=0.00,
[4]=0.01,[5]=0.01,[6]=0.01,
[7]=0.02,[8]=0.02,[9]=0.02,[10]=0.02,
[11]=0.03,[12]=0.03,[13]=0.03,[14]=0.03,
[15]=0.04,[16]=0.04,[17]=0.04,[18]=0.04,
[19]=0.05,[20]=0.05,[21]=0.05,[22]=0.05,
[23]=0.06,[24]=0.06,[25]=0.06,[26]=0.06,
[27]=0.07,[28]=0.07,[29]=0.07,[30]=0.07,[31]=0.07,
[32]=0.08,[33]=0.08,[34]=0.08,[35]=0.08,[36]=0.08,
[37]=0.09,[38]=0.09,[39]=0.09,[40]=0.09,[41]=0.09,[42]=0.09,
[43]=0.10,[44]=0.10,[45]=0.10,[46]=0.10,[47]=0.10,[48]=0.10,
[49]=0.11,[50]=0.11,[51]=0.11,[52]=0.11,[53]=0.11,[54]=0.11,[55]=0.11,
[56]=0.12,[57]=0.12,[58]=0.12,[59]=0.12,[60]=0.12,[61]=0.12,[62]=0.12,[63]=0.12,
[64]=0.13,[65]=0.13,[66]=0.13,[67]=0.13,[68]=0.13,[69]=0.13,[70]=0.13,[71]=0.13,[72]=0.13,[73]=0.13,[74]=0.13,
[75]=0.14,[76]=0.14,[77]=0.14,[78]=0.14,[79]=0.14,[80]=0.14,[81]=0.14,[82]=0.14,[83]=0.14,
[84]=0.14,[85]=0.14,[86]=0.14,[87]=0.14,[88]=0.14,[89]=0.14,[90]=0.14,[91]=0.14,[92]=0.14,
[93]=0.14,[94]=0.14,[95]=0.14,[96]=0.14,[97]=0.14,[98]=0.14,[99]=0.14,[100]=0.15
}

local CpVariables25 = {
[0]=0.00,[1]=0.00,[2]=0.00,
[3]=0.01,[4]=0.01,
[5]=0.02,[6]=0.02,
[7]=0.03,[8]=0.03,
[9]=0.04,[10]=0.04,
[11]=0.05,[12]=0.05,
[13]=0.06,[14]=0.06,[15]=0.06,
[16]=0.07,[17]=0.07,
[18]=0.08,[19]=0.08,
[20]=0.09,[21]=0.09,[22]=0.09,
[23]=0.10,[24]=0.10,[25]=0.10,
[26]=0.11,[27]=0.11,
[28]=0.12,[29]=0.12,[30]=0.12,
[31]=0.13,[32]=0.13,[33]=0.13,
[34]=0.14,[35]=0.14,[36]=0.14,
[37]=0.15,[38]=0.15,[39]=0.15,
[40]=0.16,[41]=0.16,[42]=0.16,[43]=0.16,
[44]=0.17,[45]=0.17,[46]=0.17,[47]=0.17,
[48]=0.18,[49]=0.18,[50]=0.18,[51]=0.18,
[52]=0.19,[53]=0.19,[54]=0.19,[55]=0.19,
[56]=0.20,[57]=0.20,[58]=0.20,[59]=0.20,[60]=0.20,
[61]=0.21,[62]=0.21,[63]=0.21,[64]=0.21,[65]=0.21,
[66]=0.22,[67]=0.22,[68]=0.22,[69]=0.22,[70]=0.22,[71]=0.22,
[72]=0.23,[73]=0.23,[74]=0.23,[75]=0.23,[76]=0.23,[77]=0.23,[78]=0.23,[79]=0.23,[80]=0.23,
[81]=0.24,[82]=0.24,[83]=0.24,[84]=0.24,[85]=0.24,[86]=0.24,[87]=0.24,[88]=0.24,[89]=0.24,[90]=0.24,
[91]=0.24,[92]=0.24,[93]=0.24,[94]=0.24,[95]=0.24,[96]=0.24,[97]=0.24,[98]=0.24,[99]=0.24,[100]=0.25
}

local CpVariables35 = {
[0]=0.00,[1]=0.00,
[2]=0.01,
[3]=0.02,[4]=0.02,
[5]=0.03,
[6]=0.04,[7]=0.04,
[8]=0.05,
[9]=0.06,[10]=0.06,
[11]=0.07,[12]=0.07,
[13]=0.08,
[14]=0.09,[15]=0.09,
[16]=0.10,[17]=0.10,
[18]=0.11,
[19]=0.12,[20]=0.12,
[21]=0.13,[22]=0.13,
[23]=0.14,[24]=0.14,
[25]=0.15,[26]=0.15,
[27]=0.16,[28]=0.16,
[29]=0.17,[30]=0.17,
[31]=0.18,[32]=0.18,
[33]=0.19,[34]=0.19,
[35]=0.20,[36]=0.20,
[37]=0.21,[38]=0.21,
[39]=0.22,[40]=0.22,[41]=0.22,
[42]=0.23,[43]=0.23,
[44]=0.24,[45]=0.24,[46]=0.24,
[47]=0.25,[48]=0.25,[49]=0.25,
[50]=0.26,[51]=0.26,[52]=0.26,
[53]=0.27,[54]=0.27,[55]=0.27,
[56]=0.28,[57]=0.28,[58]=0.28,
[59]=0.29,[60]=0.29,[61]=0.29,[62]=0.29,
[63]=0.30,[64]=0.30,[65]=0.30,[66]=0.30,
[67]=0.31,[68]=0.31,[69]=0.31,[70]=0.31,[71]=0.31,
[72]=0.32,[73]=0.32,[74]=0.32,[75]=0.32,[76]=0.32,
[77]=0.33,[78]=0.33,[79]=0.33,[80]=0.33,[81]=0.33,[82]=0.33,[83]=0.33,
[84]=0.34,[85]=0.34,[86]=0.34,[87]=0.34,[88]=0.34,[89]=0.34,[90]=0.34,[91]=0.34,
[92]=0.34,[93]=0.34,[94]=0.34,[95]=0.34,[96]=0.34,[97]=0.34,[98]=0.34,[99]=0.24,
[100]=0.35
}

function HowToBeam.Calcul()
	-------------
	---- CPs ----
	-------------
		local ExpertElem = GetNumPointsSpentOnChampionSkill(7, 1)
		local MasterArms = GetNumPointsSpentOnChampionSkill(6, 3)
		local StaffExpert = GetNumPointsSpentOnChampionSkill(6, 4)
		local Thaumaturge = GetNumPointsSpentOnChampionSkill(5, 1)

		local EE = CpVariables15[ExpertElem]
		local Thaum = CpVariables25[Thaumaturge]
		local MaA = CpVariables25[MasterArms]
		local SE = CpVariables35[StaffExpert]
		
	-------------------------	
	---- Damage Modifier ----
	-------------------------
		local MinBerserk = 0
		local MajBerserk = 0
		local MinSlayer = 0
		local MajSlayer	= 0
		
		for i=1,GetNumBuffs("player") do
			local buffName, timeStarted, timeEnding, buffSlot, stackCount, iconFilename, buffType, effectType, abilityType, statusEffectType, abilityId, canClickOff, castByPlayer = GetUnitBuffInfo("player",i)			
			if(zo_strformat(SI_ABILITY_NAME,GetAbilityName(abilityId)) == zo_strformat(SI_ABILITY_NAME, GetAbilityName(62636))) then
				MinBerserk = 0.08
			end
			if(zo_strformat(SI_ABILITY_NAME,GetAbilityName(abilityId)) == zo_strformat(SI_ABILITY_NAME, GetAbilityName(62195))) then
				MajBerserk = 0.25
			end
			if(zo_strformat(SI_ABILITY_NAME,GetAbilityName(abilityId)) == zo_strformat(SI_ABILITY_NAME, GetAbilityName(98103))) then
				MinSlayer = 0.05
			end
			if(zo_strformat(SI_ABILITY_NAME,GetAbilityName(abilityId)) == zo_strformat(SI_ABILITY_NAME, GetAbilityName(93120))) then
				MajSlayer = 0.15
			end
		end
		local damage_bonus = MinBerserk + MajBerserk + MinSlayer + MajSlayer

	-----------------------	
	---- Fire Modifier ----
	-----------------------
		local EngFlames	= 0	
		
		for i=1,GetNumBuffs("reticleover") do
			local buffName, timeStarted, timeEnding, buffSlot, stackCount, iconFilename, buffType, effectType, abilityType, statusEffectType, abilityId, canClickOff, castByPlayer = GetUnitBuffInfo("reticleover",i)		
			if(zo_strformat(SI_ABILITY_NAME,GetAbilityName(abilityId)) == zo_strformat(SI_ABILITY_NAME, GetAbilityName(31104))) then
				EngFlames = 0.10
			end
		end
		local fire_bonus = fire_race + EngFlames
		
	----------------------	
	---- Player Stats ----
	----------------------
		local spelldamage = GetPlayerStat(STAT_SPELL_POWER)
		local currentmagicka, maxmagicka, effmaxmagicka = GetUnitPower("player", POWERTYPE_MAGICKA)
		
		local ActualMagicka = currentmagicka/maxmagicka
		--local effective_bonus = (maxmagicka/10.5+spelldamage) 
		
	----------------------------	
	---- Skills Calculation ----
	----------------------------
		--The 0.08 or 0.00 bonus is fire / shock staff, will maybe add staff bonus later
		local LightAttackBonus = damage_bonus + fire_bonus + 0.08 + EE + MaA + SE
		local LightAttackMABonus = damage_bonus + fire_bonus + 0.08 + EE + MaA
		local BurningLightBonus = damage_bonus + 0.08 + EE + MaA
		local SpearBonus1 = damage_bonus + 0.00 + EE + MaA --Inital Hit
		local SpearBonus2 =	damage_bonus + 0.00 + EE + Thaum --DoT
		local VampBaneBonus1 = damage_bonus + fire_bonus + 0.08 + EE + MaA --Initial Hit
		local VampBaneBonus2 = damage_bonus + fire_bonus + 0.08 + EE + Thaum --DoT
		local JabsBonus = damage_bonus + 0.00 + EE + Thaum
		local FlareBonus = damage_bonus + 0.08 + EE + MaA
		local PsijicBonus1 = damage_bonus + 0.08 + EE + MaA --Inital Hit
		local PsijicBonus2 = damage_bonus + 0.08 + EE + MaA --Orb
		local PulseBonus1 = damage_bonus + fire_bonus + 0.08 + EE + MaA --Fire
		local PulseBonus2 = damage_bonus + shock_bonus + 0.08 + EE + MaA --Shock + Frost
		local RadiantBonus = damage_bonus + 0.08 + EE + MaA
		local FireGlyphBonus = damage_bonus + fire_bonus + 0.08 + EE + MaA
		--Special Factor Value
		local BurningBonus = damage_bonus + fire_bonus + 0.08 + EE + Thaum
		local FlareEmpower = (0.0449355 * maxmagicka + 0.472123 * spelldamage + 0.208275) * 0.4
		
		--Every skills damage 
		--Skills factor are found on uesp : http://esoitem.uesp.net/viewSkills.php
		local LightAttackDamage = (0.0449355 * maxmagicka + 0.472123 * spelldamage + 0.208275) * 1 * (1 + LightAttackBonus)
		local LightAttackMADamage = 1341 * (1 + LightAttackMABonus)
		local FireGlyphDamage1 = 3294 * 0.5 * (1 + FireGlyphBonus)
		local FireGlyphDamage2 = (maxmagicka/10.5 + spelldamage) * 0.167947210695167 * 0.5 * 0.4 * 3 * (1 + BurningBonus) --proc chance * number of ticks
		local BurningLightDamage = (0.06008 * maxmagicka + 0.62977 * spelldamage - 1.14813) * 1 * (1 + BurningLightBonus)
		local SpearDamage1 = (0.05875 * maxmagicka + 0.61572 * spelldamage + 1.83991) * 1 * (1 + SpearBonus1)
		local SpearDamage2 = (0.02473 * maxmagicka + 0.25849 * spelldamage - 0.69002) * 8 * (1 + SpearBonus2)
		local VampBaneDamage1 = (0.06193 * maxmagicka + 0.65031 * spelldamage + 0.19734) * 1 * (1 + VampBaneBonus1)
		local VampBaneDamage2 = (0.12787 * maxmagicka + 1.34217 * spelldamage - 2.44535) * 1.2 * (1 + VampBaneBonus2)
		local VampBaneDamage3 = (maxmagicka/10.5 + spelldamage) * 0.167947210695167 * (6 * 0.06 + 0.2) * 3 * (1 + BurningBonus)
		local JabsDamage = (0.03880 * maxmagicka + 0.40759 * spelldamage - 0.65306) * 4 * (1 + JabsBonus)
		local FlareDamage = (0.18401 * maxmagicka + 1.93241 * spelldamage + 2.74474) * 1 * (1 + FlareBonus)
		local PsijicDamage1 = (0.09614 * maxmagicka + 1.00792 * spelldamage - 1.96746) * 1 * (1 + PsijicBonus1)
		local PsijicDamage2 = (0.05003 * maxmagicka + 0.52442 * spelldamage - 1.0426) * 0.2 * (1 + PsijicBonus2)
		local PsijicDamage3 = (maxmagicka/10.5 + spelldamage) * 0.167947210695167 * (1/3) * 3 * (1 + BurningBonus) 
		local PulseDamage1 = (0.03101 * maxmagicka + 0.32024 * spelldamage + 1.41950) * 1 * (1 + PulseBonus1)
		local PulseDamage2 = (0.03101 * maxmagicka + 0.32024 * spelldamage + 1.41950) * 2 * (1 + PulseBonus2)
		local PulseDamage3 = (maxmagicka/10.5 + spelldamage) * 0.167947210695167 * 0.2 * 3 * (1 + BurningBonus)
		local RadiantDamage = (0.11639 * maxmagicka + 1.22358 * spelldamage - 2.11835) * 1 * (1 + RadiantBonus) * (1 + 0.2 * ActualMagicka)
		local BurningLightSpear = 9 * 0.25 * BurningLightDamage
		local BurningLightJabs = 0.8 * BurningLightDamage

	---------------------------	
	---- Skills Comparison ----
	---------------------------
		local LightAttackTotal = LightAttackDamage + LightAttackMADamage + FireGlyphDamage1 + FireGlyphDamage2
		local SpearTotal = (LightAttackTotal + SpearDamage1 + SpearDamage2 + BurningLightSpear) / 1
		local VampBaneTotal = (LightAttackTotal + VampBaneDamage1 + VampBaneDamage2 + VampBaneDamage3) / 1
		local JabsTotal = (LightAttackTotal + JabsDamage + BurningLightJabs) / 1.3
		local FlareTotal = (LightAttackTotal + FlareDamage + FlareEmpower) / 1.3
		local PsijicTotal = (LightAttackTotal + PsijicDamage1 + PsijicDamage2 + PsijicDamage3) / 1
		local PulseTotal = (LightAttackTotal + PulseDamage1 + PulseDamage2 + PulseDamage3) / 1

		local SpearPercentage = (1 - ((SpearTotal * 1.8 - LightAttackTotal) / RadiantDamage - 1) / 4.8) * 0.5
		local VampBanePercentage = (1 - ((VampBaneTotal * 1.8 - LightAttackTotal) / RadiantDamage - 1) / 4.8) * 0.5
		local JabsPercentage = (1 - ((JabsTotal * 1.8 - LightAttackTotal) / RadiantDamage - 1) / 4.8) * 0.5
		local FlarePercentage = (1 - ((FlareTotal * 1.8 - LightAttackTotal) / RadiantDamage - 1) / 4.8) * 0.5
		local PsijicPercentage = (1 - ((PsijicTotal * 1.8 - LightAttackTotal) / RadiantDamage - 1) / 4.8) * 0.5
		local PulsePercentage = (1 - ((PulseTotal * 1.8 - LightAttackTotal) / RadiantDamage - 1) / 4.8) * 0.5
		
	-------------------------
	---- Boss Percentage ----
	-------------------------
		local currentTargetHP, maxTargetHP, effmaxTargetHP = GetUnitPower("reticleover", POWERTYPE_HEALTH)
		local BossPercentage = currentTargetHP / maxTargetHP
		
		local executeAlert = "Execute Alert Here"
		
		if(maxTargetHP > (HowToBeam.maxTargetHPchoose * 1000000)) then
			if (BossPercentage > SpearPercentage) then
				if ((BossPercentage > VampBanePercentage) and (BossPercentage > 0.25)) then
					if ((HowToBeam.Spammable == 1) and (BossPercentage < PsijicPercentage)) then --Psijic Spammable
						HowToBeamAlert:SetHidden(false)
						executeAlert = HowToBeam.SpammableAlert
					elseif ((HowToBeam.Spammable == 2) and (BossPercentage < PulsePercentage)) then --Pulse Spammable
						HowToBeamAlert:SetHidden(false)
						executeAlert = HowToBeam.SpammableAlert
					elseif ((HowToBeam.Spammable == 3) and (BossPercentage < JabsPercentage)) then --Jabs Spammable
						HowToBeamAlert:SetHidden(false)
						executeAlert = HowToBeam.SpammableAlert
					elseif ((HowToBeam.Spammable == 4) and (BossPercentage < FlarePercentage)) then --Flare Spammable
						HowToBeamAlert:SetHidden(false)
						executeAlert = HowToBeam.SpammableAlert
					else 
						HowToBeamAlert:SetHidden(true)
						executeAlert = ""
					end
				else 
					HowToBeamAlert:SetHidden(false)
					executeAlert = HowToBeam.DoTAlert
				end
			else 
				HowToBeamAlert:SetHidden(false)
				executeAlert = HowToBeam.FinishAlert
			end
		else 		
			HowToBeamAlert:SetHidden(not HowToBeam.savedVariables.AlwaysShowAlert)
			executeAlert = "Execute Alert Here"
		end
		HowToBeamBoss:SetText(string.format("%s", executeAlert))
end
 
function HowToBeam:Initialize()
	--Settings
	HowToBeam.CreateSettingsWindow()
	
	--Saved Variables
	HowToBeam.savedVariables = ZO_SavedVars:New("HowToBeamVariables", 1, nil, HowToBeam.Default)
	EVENT_MANAGER:UnregisterForEvent(HowToBeam.name, EVENT_ADD_ON_LOADED)
	
	--UI
	HowToBeamAlert:SetHidden(true)
	HowToBeamAlert:ClearAnchors()
	HowToBeamAlert:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, HowToBeam.savedVariables.OffsetX, HowToBeam.savedVariables.OffsetY)
	
	HowToBeamBoss:SetColor(unpack(HowToBeam.savedVariables.ColorRGB))
	HowToBeam.AlwaysShowAlert = HowToBeam.savedVariables.AlwaysShowAlert
	EVENT_MANAGER:UnregisterForEvent(HowToBeam.name, EVENT_ADD_ON_LOADED)
	
	--Calculation
	local race = GetUnitRaceId("player")
	if race == 7 then
		fire_race = 0.04
		shock_bonus = 0.04
	elseif race == 4 then
		fire_race = 0.07
		shock_bonus = 0.02
	end	
	HowToBeam.Spammable = HowToBeam.savedVariables.Spammable
	HowToBeam.maxTargetHPchoose = HowToBeam.savedVariables.maxTargetHPchoose
	HowToBeam.SpammableAlert = HowToBeam.savedVariables.SpammableAlert
	HowToBeam.DoTAlert = HowToBeam.savedVariables.DoTAlert
	HowToBeam.FinishAlert = HowToBeam.savedVariables.FinishAlert
	
	--EVENT_MANAGER:RegisterForEvent(HowToBeam.name, EVENT_POWER_UPDATE, HowToBeam.Calcul)
	EVENT_MANAGER:RegisterForUpdate(HowToBeam.name, 333, HowToBeam.Calcul)
	EVENT_MANAGER:RegisterForEvent(HowToBeam.name, EVENT_RETICLE_TARGET_CHANGED, HowToBeam.Calcul)
	EVENT_MANAGER:UnregisterForEvent(HowToBeam.name, EVENT_ADD_ON_LOADED)
	
end

function HowToBeam.SaveLoc()
	HowToBeam.savedVariables.OffsetX = HowToBeamAlert:GetLeft()
	HowToBeam.savedVariables.OffsetY = HowToBeamAlert:GetTop()
end	
 
function HowToBeam.OnAddOnLoaded(event, addonName)
	if addonName ~= HowToBeam.name then return end
		HowToBeam:Initialize()
end

EVENT_MANAGER:RegisterForEvent(HowToBeam.name, EVENT_ADD_ON_LOADED, HowToBeam.OnAddOnLoaded)