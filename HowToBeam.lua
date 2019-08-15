-----------------
---- Globals ----
-----------------
HowToBeam = HowToBeam or {}
local HowToBeam = HowToBeam

HowToBeam.name = "HowToBeam"
HowToBeam.version = "2.1"

local cpt = 0
local lastHP = {}
local currentDPS
local targetName

local sV

local STRING_PULSE_UNMORPHED = zo_strformat(SI_ABILITY_NAME, GetAbilityName(46340))
local STRING_CRUSHING_SHOCK = zo_strformat(SI_ABILITY_NAME, GetAbilityName(46348))
local STRING_FORCE_PULSE = zo_strformat(SI_ABILITY_NAME, GetAbilityName(46356))
local STRING_ELEMENTAL_WEAPON = zo_strformat(SI_ABILITY_NAME, GetAbilityName(103571))
local STRING_SWEEP_UNMORPHED = zo_strformat(SI_ABILITY_NAME, GetAbilityName(26114))
local STRING_PUNCTURING_SWEEP = zo_strformat(SI_ABILITY_NAME, GetAbilityName(26797))
local STRING_FLARE_UNMORPHED = zo_strformat(SI_ABILITY_NAME, GetAbilityName(22057))
local STRING_DARK_FLARE = zo_strformat(SI_ABILITY_NAME, GetAbilityName(22110))
local STRING_SUN_FIRE = zo_strformat(SI_ABILITY_NAME, GetAbilityName(21726))
local STRING_VAMPIRE_BANE = zo_strformat(SI_ABILITY_NAME, GetAbilityName(21729))
local STRING_REFLECTIVE_LIGHT = zo_strformat(SI_ABILITY_NAME, GetAbilityName(21732))
local STRING_SOLAR_BARRAGE = zo_strformat(SI_ABILITY_NAME, GetAbilityName(22095))
local STRING_ENTROPY = zo_strformat(SI_ABILITY_NAME, GetAbilityName(28567))
local STRING_DEGENERATION = zo_strformat(SI_ABILITY_NAME, GetAbilityName(40457))
local STRING_STRUCTURED_ENTROPY = zo_strformat(SI_ABILITY_NAME, GetAbilityName(40452))
local STRING_SOUL_TRAP = zo_strformat(SI_ABILITY_NAME, GetAbilityName(26768))
local STRING_SOUL_SPLIT_TRAP = zo_strformat(SI_ABILITY_NAME, GetAbilityName(40328))
local STRING_CONSUMING_TRAP = zo_strformat(SI_ABILITY_NAME, GetAbilityName(40317))
local STRING_FLAME_REACH = zo_strformat(SI_ABILITY_NAME, GetAbilityName(38944))
local STRING_FLAME_TOUCH = zo_strformat(SI_ABILITY_NAME, GetAbilityName(29073))
local STRING_SHOCK_REACH = zo_strformat(SI_ABILITY_NAME, GetAbilityName(38978))
local STRING_SHOCK_TOUCH = zo_strformat(SI_ABILITY_NAME, GetAbilityName(29089))

HowToBeam.DotsUsed = {}
---------------------------
---- Variables Default ----
---------------------------
HowToBeam.Default = {
	OffsetX = 800,
	OffsetY = 300,
	Enable = true,
	UsingMA = true,
	Glyph = 1,
	infusedGlyph = false,
	showWhatToDrop = false,
	maxTargetHPchoose = 3,
	SpammableAlert = "Start Use Beam",
	DoTAlert = "Only Spear + Blockade",
	FinishAlert = "Beam Them to Death",
	ColorRGB = {1, 0.12, 0.02, 1},
}

---------------
-- FUNCTIONS --
---------------
local damageBonus, fireBonus, spellDamage, currentMagicka, maxMagicka, effMaxMagicka
local lightAttackTotal
function HowToBeam.UnpackDatas(skillName)
	if HowToBeam.Datas[skillName] then
		local skill = HowToBeam.Datas[skillName]
		local totalDmg = lightAttackTotal

		for i = 1, #skill.bonus do
			local bonus = damageBonus
			if skill.bonus[i].empower then
				bonus = 0
			else
				if skill.bonus[i].fire_bonus then
					bonus = bonus + fireBonus
				end
				if skill.bonus[i].fire_staff then
					bonus = bonus + 0.08
				end
				if skill.bonus[i].expertElem then
					bonus = bonus + HowToBeam.ExpertElem
				end
				if skill.bonus[i].masterArms then
					bonus = bonus + HowToBeam.MasterArms
				end
				if skill.bonus[i].staffExpert then
					bonus = bonus + HowToBeam.StaffExpert
				end
				if skill.bonus[i].thaumaturge then
					bonus = bonus + HowToBeam.Thaumaturge
				end
			end

			local dmg = (skill.factor[i].magicka * maxMagicka + skill.factor[i].spellDamage * spellDamage + skill.factor[i].additional) * skill.factor[i].mulitplier * (1 + bonus)
			totalDmg = totalDmg + dmg
		end

		return totalDmg / skill.castTime
	else
		d("HowToBeam Missing Datas for: |cFF0000" .. skillName .. "|r" )
	end
end

function HowToBeam.GetThresholdPercentage(dmgToCompare, radiantDmg)
	return (1 - ((dmgToCompare * 1.8 - lightAttackTotal) / radiantDmg - 1) / 4.8) * 0.5
end

function GetLightAttackTotal(dmg, ma)
	local total = dmg
	if (sV.UsingMA == true) then
		total = total + ma
	end
	if (sV.Glyph == 1) then
		local fireGlyphBonus = damageBonus + fireBonus + 0.08 + HowToBeam.ExpertElem + HowToBeam.MasterArms
		local burningBonus = damageBonus + fireBonus + 0.08 + HowToBeam.ExpertElem + HowToBeam.Thaumaturge
		local fireGlyphDamage1
		if sV.infusedGlyph then
			fireGlyphDamage1 = 3294 * 0.5 * (1 + fireGlyphBonus)
		else
			fireGlyphDamage1 = 2534 * 0.5 * (1 + fireGlyphBonus)
		end
		local fireGlyphDamage2 = (maxMagicka/10.5 + spellDamage) * 0.167947210695167 * 0.5 * 0.4 * 2.5 * (1 + burningBonus)
		total = total + fireGlyphDamage1 + fireGlyphDamage2
	elseif (sV.Glyph == 2) then
		local shockGlyphBonus = damageBonus + 0 + 0.08 + HowToBeam.ExpertElem + HowToBeam.MasterArms
		local concussionBonus = damageBonus + 0 + 0.08 + HowToBeam.ExpertElem + HowToBeam.Thaumaturge
		local shockGlyphDamage1
		if sV.infusedGlyph then
			shockGlyphDamage1 = 3294 * 0.5 * (1 + shockGlyphBonus)
		else
			shockGlyphDamage1 = 2534 * 0.5 * (1 + shockGlyphBonus)
		end
		local shockGlyphDamage2 = (maxMagicka/10.5 + spellDamage) * 0.08743955967 * 0.5 * 0.4 * (1 + concussionBonus)
		total = total + shockGlyphDamage1 + shockGlyphDamage2
	elseif (sV.Glyph == 3) then
		local absorbGlyphBonus = damageBonus + 0.08 + HowToBeam.ExpertElem + HowToBeam.MasterArms
		local absorbGlyphDamage
		if sV.infusedGlyph then
			absorbGlyphDamage = 2470 * 0.5 * (1 + absorbGlyphBonus)
		else
			absorbGlyphDamage = 1900 * 0.5 * (1 + absorbGlyphBonus)
		end
		total = total + absorbGlyphDamage
	end
	return total
end

function HowToBeam.GetDamageBonus()
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

	local EngFlames	= 0		
	for i=1,GetNumBuffs("reticleover") do
		local buffName, timeStarted, timeEnding, buffSlot, stackCount, iconFilename, buffType, effectType, abilityType, statusEffectType, abilityId, canClickOff, castByPlayer = GetUnitBuffInfo("reticleover",i)		
		if(zo_strformat(SI_ABILITY_NAME,GetAbilityName(abilityId)) == zo_strformat(SI_ABILITY_NAME, GetAbilityName(31104))) then
			EngFlames = 0.10
			return (MinBerserk + MajBerserk + MinSlayer + MajSlayer), EngFlames
		end
	end

	return (MinBerserk + MajBerserk + MinSlayer + MajSlayer), EngFlames
end

function HowToBeam.Calcul()
	local currentTargetHP, maxTargetHP, effmaxTargetHP = GetUnitPower("reticleover", POWERTYPE_HEALTH)
	local bossPercentage = currentTargetHP / maxTargetHP
	local alertText

	if bossPercentage < 0.5 and maxTargetHP > sV.maxTargetHPchoose * 1000000 and currentTargetHP > 0 then
		local EE = HowToBeam.ExpertElem
		local MaA = HowToBeam.MasterArms
		local SE = HowToBeam.StaffExpert
		local Thaum = HowToBeam.Thaumaturge
		damageBonus, fireBonus = HowToBeam.GetDamageBonus()
		----------------------
		---- Player Stats ----
		----------------------
		spellDamage = GetPlayerStat(STAT_SPELL_POWER)
		currentMagicka, maxMagicka, effMaxMagicka = GetUnitPower("player", POWERTYPE_MAGICKA)
		local actualMagicka = currentMagicka / maxMagicka

		----------------------------
		---- Skills Calculation ----
		----------------------------
		--The 0.08 or 0.00 bonus is fire / shock staff, will maybe add staff bonus later
		--bonuses
		local lightAttackBonus = damageBonus + fireBonus + 0.08 + EE + MaA + SE
		local lightAttackMABonus = damageBonus + fireBonus + 0.08 + EE + MaA

		local spearBonus1 = damageBonus + 0.00 + EE + MaA --Inital Hit
		local spearBonus2 =	damageBonus + 0.00 + EE + Thaum --DoT
		local burningLightBonus = damageBonus + 0.08 + EE + MaA --Passiv

		local radiantBonus = damageBonus + 0.08 + EE + MaA

		--damages
		--Skills factor are found on uesp : http://esoitem.uesp.net/viewSkills.php
		local lightAttackDamage = (0.0450633 * maxMagicka + 0.471863 * spellDamage - 0.865957) * 1 * (1 + lightAttackBonus)
		local lightAttackMADamage = 1341 * (1 + lightAttackMABonus)

		local burningLightSpear = (0.0599242 * maxMagicka + 0.629985 * spellDamage - 0.178673) * 9 * 0.25 * (1 + burningLightBonus)
		local spearDamage1 = (0.07988 * maxMagicka + 0.83993 * spellDamage + 0.50351) * 1 * (1 + spearBonus1)
		local spearDamage2 = (0.01431 * maxMagicka + 0.14939 * spellDamage - 1.26687) * 8 * (1 + spearBonus2)

		local radiantDamage = (0.11651 * maxMagicka + 1.22302 * spellDamage - 2.76818) * 1 * (1 + radiantBonus) * (1 + 0.2 * actualMagicka)

		--add the lightattack buff and glyphs
		lightAttackTotal = GetLightAttackTotal(lightAttackDamage, lightAttackMADamage)
		local spearTotal = (lightAttackTotal + spearDamage1 + spearDamage2 + burningLightSpear) / 1
		local spearPercentage = HowToBeam.GetThresholdPercentage(spearTotal, radiantDamage)
		--d("Lance Ardente: " .. tostring(string.format("%.3f", spearPercentage))*100 .. "%")

		-------------------------
		---- Boss Percentage ----
		-------------------------
		if targetName ~= GetUnitNameHighlightedByReticle("reticleover") then
			cpt = 0
			targetName = GetUnitNameHighlightedByReticle("reticleover")
		else
			lastHP[cpt] = currentTargetHP
			if cpt > 3*4 then
				currentDPS = lastHP[cpt - 3*4] - currentTargetHP
			end
		end
		cpt = cpt + 1

		if bossPercentage < 0.25 and currentDPS ~= nil then
            bossPercentage = (currentTargetHP - currentDPS) / maxTargetHP
		end

		---------------------------
		---- Skills Comparison ----
		---------------------------
		if bossPercentage > spearPercentage then
			local spammablePercentage		
			if HowToBeam.SpammableUsed ~= "null" then
				local spammableTotal = HowToBeam.UnpackDatas(HowToBeam.SpammableUsed)
				spammablePercentage = HowToBeam.GetThresholdPercentage(spammableTotal, radiantDamage)
				--d(HowToBeam.SpammableUsed .. ": " .. tostring(string.format("%.3f", spammablePercentage))*100 .. "%")
			end

			local dotNumber = #HowToBeam.DotsUsed
			local skillsToDrop = {}
			if HowToBeam.SpammableUsed == "null" or bossPercentage < spammablePercentage then
				for i = 1, #HowToBeam.DotsUsed do
					local dotTotal = HowToBeam.UnpackDatas(HowToBeam.DotsUsed[i])
					local dotPercentage = HowToBeam.GetThresholdPercentage(dotTotal, radiantDamage)
					--d(HowToBeam.DotsUsed[i] .. ": " .. tostring(string.format("%.3f", dotPercentage))*100 .. "%")
					if bossPercentage < dotPercentage then
						dotNumber = dotNumber - 1
						table.insert(skillsToDrop, HowToBeam.DotsUsed[i])
					end
				end
			end

			if (spammablePercentage and bossPercentage < spammablePercentage) or dotNumber < #HowToBeam.DotsUsed then
				alertText = sV.SpammableAlert
				if sV.showWhatToDrop and HowToBeam.SpammableUsed ~= "null" then
					alertText = alertText .. "\nDrop: " .. HowToBeam.SpammableUsed
				end
				if sV.showWhatToDrop and HowToBeam.SpammableUsed == "null" and dotNumber >= #HowToBeam.DotsUsed - 1 then
					alertText = alertText .. "\nDrop: "
					for i = 1, #skillsToDrop do
						if i ~= #skillsToDrop then
							alertText = alertText .. skillsToDrop[i] .. " &\n"
						else
							alertText = alertText .. skillsToDrop[i]
						end
					end
				end
				if bossPercentage < 0.20 or dotNumber <= 0 then
					alertText = sV.DoTAlert
				end
			end
		else
			alertText = sV.FinishAlert
		end
		HTBAlert_Label:SetText(alertText)
		HTBAlert:SetHidden(false)
	else
		HTBAlert:SetHidden(true)
	end
end

--------------
-- TRIGGERS --
--------------
local skills = {
	primaryBar = {},
	secondaryBar = {}
}
function HowToBeam.ChangeSkill(_, actionSlotIndex)
	if actionSlotIndex >= 3 and actionSlotIndex <= 7 then
		local activeHotbarCategory = GetActiveHotbarCategory()
		local skillName = zo_strformat(SI_ABILITY_NAME, GetSlotName(actionSlotIndex))

		if activeHotbarCategory == HOTBAR_CATEGORY_PRIMARY then
			if skills.primaryBar[actionSlotIndex - 2] ~= skillName then
				skills.primaryBar[actionSlotIndex - 2] = skillName
			end
		elseif activeHotbarCategory == HOTBAR_CATEGORY_BACKUP then
			if skills.secondaryBar[actionSlotIndex - 2] ~= skillName then
				skills.secondaryBar[actionSlotIndex - 2] = skillName
			end
		end

		HowToBeam.DotsUsed = {}
		for i = 1, 5 do
			if skills.primaryBar[i] == STRING_SUN_FIRE or skills.primaryBar[i] == STRING_VAMPIRE_BANE or skills.primaryBar[i] == STRING_REFLECTIVE_LIGHT or skills.primaryBar[i] == STRING_SOLAR_BARRAGE or skills.primaryBar[i] == STRING_ENTROPY or 
			skills.primaryBar[i] == STRING_DEGENERATION or skills.primaryBar[i] == STRING_STRUCTURED_ENTROPY or skills.primaryBar[i] == STRING_SOUL_TRAP or skills.primaryBar[i] == STRING_SOUL_SPLIT_TRAP or skills.primaryBar[i] == STRING_CONSUMING_TRAP or
			skills.primaryBar[i] == STRING_FLAME_REACH or skills.primaryBar[i] == STRING_FLAME_TOUCH or skills.primaryBar[i] == STRING_SHOCK_REACH or skills.primaryBar[i] == STRING_SHOCK_TOUCH then
				table.insert(HowToBeam.DotsUsed, skills.primaryBar[i])
			end
			if skills.secondaryBar[i] == STRING_SUN_FIRE or skills.secondaryBar[i] == STRING_VAMPIRE_BANE or skills.secondaryBar[i] == STRING_REFLECTIVE_LIGHT or skills.secondaryBar[i] == STRING_SOLAR_BARRAGE or skills.secondaryBar[i] == STRING_ENTROPY or 
			skills.secondaryBar[i] == STRING_DEGENERATION or skills.secondaryBar[i] == STRING_STRUCTURED_ENTROPY or skills.secondaryBar[i] == STRING_SOUL_TRAP or skills.secondaryBar[i] == STRING_SOUL_SPLIT_TRAP or skills.secondaryBar[i] == STRING_CONSUMING_TRAP or
			skills.secondaryBar[i] == STRING_FLAME_REACH or skills.secondaryBar[i] == STRING_FLAME_TOUCH or skills.secondaryBar[i] == STRING_SHOCK_REACH or skills.secondaryBar[i] == STRING_SHOCK_TOUCH then
				table.insert(HowToBeam.DotsUsed, skills.secondaryBar[i])
			end
		end

	end
end

function HowToBeam.ChangeChampionPoints(_, result)
	if result == CHAMPION_PURCHASE_SUCCESS then
		local EE = GetNumPointsSpentOnChampionSkill(7, 1)
		local MaA = GetNumPointsSpentOnChampionSkill(6, 3)
		local SE = GetNumPointsSpentOnChampionSkill(6, 4)
		local Thaum = GetNumPointsSpentOnChampionSkill(5, 1)

		HowToBeam.ExpertElem  = HowToBeam.CpVariables15[EE]
		HowToBeam.MasterArms  = HowToBeam.CpVariables25[MaA]
		HowToBeam.StaffExpert = HowToBeam.CpVariables35[SE]
		HowToBeam.Thaumaturge = HowToBeam.CpVariables25[Thaum]
	end
end

local function GetSpammableUsed(spammableList)
	for key, value in pairs(spammableList) do
		if value == STRING_DARK_FLARE or value == STRING_FLARE_UNMORPHED then
			return value
		end
	end
	for key, value in pairs(spammableList) do
		if value == STRING_PULSE_UNMORPHED or value == STRING_CRUSHING_SHOCK or value == STRING_FORCE_PULSE then
			return value
		end
	end
	for key, value in pairs(spammableList) do
		if value == STRING_PUNCTURING_SWEEP or value == STRING_SWEEP_UNMORPHED then
			return value
		end
	end
	for key, value in pairs(spammableList) do
		if value == STRING_ELEMENTAL_WEAPON then
			return value
		end
	end
end

function HowToBeam.CombatState(_, inCombat)
	if not sV.Enable then return end
	if inCombat then
		local spammableList = {}
		local spammableCpt = 0
		for i = 1, 5 do
			if skills.primaryBar[i] == STRING_PULSE_UNMORPHED or skills.primaryBar[i] == STRING_CRUSHING_SHOCK or skills.primaryBar[i] == STRING_FORCE_PULSE or	skills.primaryBar[i] == STRING_ELEMENTAL_WEAPON or
			skills.primaryBar[i] == STRING_SWEEP_UNMORPHED or skills.primaryBar[i] == STRING_PUNCTURING_SWEEP or skills.primaryBar[i] == STRING_FLARE_UNMORPHED or skills.primaryBar[i] == STRING_DARK_FLARE then
				spammableCpt = spammableCpt + 1
				table.insert(spammableList, skills.primaryBar[i])
			end
			if skills.secondaryBar[i] == STRING_PULSE_UNMORPHED or skills.secondaryBar[i] == STRING_CRUSHING_SHOCK or skills.secondaryBar[i] == STRING_FORCE_PULSE or skills.secondaryBar[i] == STRING_ELEMENTAL_WEAPON or
			skills.secondaryBar[i] == STRING_SWEEP_UNMORPHED or skills.secondaryBar[i] == STRING_PUNCTURING_SWEEP or skills.secondaryBar[i] == STRING_FLARE_UNMORPHED or skills.secondaryBar[i] == STRING_DARK_FLARE then
				spammableCpt = spammableCpt + 1
				table.insert(spammableList, skills.secondaryBar[i])
			end
		end

		if spammableCpt > 1 then
			HowToBeam.SpammableUsed = GetSpammableUsed(spammableList)
		elseif spammableCpt > 0 then
			HowToBeam.SpammableUsed = spammableList[1]
		else
			HowToBeam.SpammableUsed = "null"
		end

		EVENT_MANAGER:RegisterForUpdate(HowToBeam.name, 333, HowToBeam.Calcul)
		EVENT_MANAGER:RegisterForEvent(HowToBeam.name, EVENT_RETICLE_TARGET_CHANGED, HowToBeam.Calcul)
	else
		EVENT_MANAGER:UnregisterForUpdate(HowToBeam.name)
		EVENT_MANAGER:UnregisterForEvent(HowToBeam.name, EVENT_RETICLE_TARGET_CHANGED)
		HTBAlert:SetHidden(true)
	end
end

----------
-- INIT --
----------
function HowToBeam:Initialize()
	--Saved Variables
	HowToBeam.savedVariables = ZO_SavedVars:New("HowToBeamVariables", 1, nil, HowToBeam.Default)
	sV = HowToBeam.savedVariables

	--Settings
	HowToBeam.CreateSettingsWindow()

	--UI
	HTBAlert:SetHidden(true)
	HTBAlert:ClearAnchors()
	HTBAlert:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, sV.OffsetX, sV.OffsetY)
	HTBAlert_Label:SetColor(unpack(sV.ColorRGB))

	--Events
	if GetUnitClassId("player") == 6 then
		HowToBeam.ChangeChampionPoints(nil, CHAMPION_PURCHASE_SUCCESS)
		local activeHotbarCategory = GetActiveHotbarCategory()
		for i = 1, 5 do
			if activeHotbarCategory == HOTBAR_CATEGORY_PRIMARY then
				skills.primaryBar[i] = zo_strformat(SI_ABILITY_NAME, GetSlotName(i + 2))
			elseif activeHotbarCategory == HOTBAR_CATEGORY_BACKUP then
				skills.secondaryBar[i] = zo_strformat(SI_ABILITY_NAME, GetSlotName(i + 2))
			end
		end
		EVENT_MANAGER:RegisterForEvent(HowToBeam.name, EVENT_ACTION_SLOT_STATE_UPDATED, HowToBeam.ChangeSkill)
		EVENT_MANAGER:RegisterForEvent(HowToBeam.name, EVENT_CHAMPION_PURCHASE_RESULT, HowToBeam.ChangeChampionPoints)
		EVENT_MANAGER:RegisterForEvent(HowToBeam.name, EVENT_PLAYER_COMBAT_STATE, HowToBeam.CombatState)
	end

	EVENT_MANAGER:UnregisterForEvent(HowToBeam.name, EVENT_ADD_ON_LOADED)
end

function HowToBeam.SaveLoc()
	sV.OffsetX = HTBAlert:GetLeft()
	sV.OffsetY = HTBAlert:GetTop()
end

function HowToBeam.OnAddOnLoaded(event, addonName)
	if addonName ~= HowToBeam.name then return end
		HowToBeam:Initialize()
end

EVENT_MANAGER:RegisterForEvent(HowToBeam.name, EVENT_ADD_ON_LOADED, HowToBeam.OnAddOnLoaded)