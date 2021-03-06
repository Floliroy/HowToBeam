HowToBeam = HowToBeam or {}
local HowToBeam = HowToBeam

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
local STRING_SCALDING_RUNE = zo_strformat(SI_ABILITY_NAME, GetAbilityName(40465))
local STRING_BACKLASH = zo_strformat(SI_ABILITY_NAME, GetAbilityName(21761))
local STRING_PURIFYING_LIGHT = zo_strformat(SI_ABILITY_NAME, GetAbilityName(21765))
local STRING_RITUAL_RETRIBUTION = zo_strformat(SI_ABILITY_NAME, GetAbilityName(22259))


HowToBeam.Datas = {
    [STRING_PULSE_UNMORPHED] = {
        icon = "|t50:50:esoui/art/icons/ability_destructionstaff_001.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --Fire hit
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --Two other hits
                fire_bonus = false, fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [3] = { --Burning
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = false, staffExpert = false,    thaumaturge = true,     },
            [4] = { --Concussion
                fire_bonus = false, fire_staff = true,  expertElem = true,  masterArms = false, staffExpert = false,    thaumaturge = true,     }
        },
        factor = {
            [1] = { --Fire hit
                magicka = 0.03111,
                spellDamage = 0.32499,
                additional = -2.3457,
                mulitplier = 1,
            },
            [2] = { --Two other hits
                magicka = 0.03111,
                spellDamage = 0.32499,
                additional = -2.3457,
                mulitplier = 2,
            },
            [3] = { --Burning
                magicka = 0.0167947210695167,
                spellDamage = 0.167947210695167,
                additional = 0,
                mulitplier = 0.2 * 1.8,
            },
            [4] = { --Concussion
                magicka = 0.008743955967,
                spellDamage = 0.08743955967,
                additional = 0,
                mulitplier = 0.2,
            }
        }
    },
    [STRING_CRUSHING_SHOCK] = {
        icon = "|t50:50:esoui/art/icons/ability_destructionstaff_001a.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --Fire hit
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --Two other hits
                fire_bonus = false, fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [3] = { --Burning
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = false, staffExpert = false,    thaumaturge = true,     },
            [4] = { --Concussion
                fire_bonus = false, fire_staff = true,  expertElem = true,  masterArms = false, staffExpert = false,    thaumaturge = true,     }
        },
        factor = {
            [1] = { --Fire hit
                magicka = 0.03094,
                spellDamage = 0.32489,
                additional = -0.04795,
                mulitplier = 1,
            },
            [2] = { --Two other hits
                magicka = 0.03094,
                spellDamage = 0.32489,
                additional = -0.04795,
                mulitplier = 2,
            },
            [3] = { --Burning
                magicka = 0.0167947210695167,
                spellDamage = 0.167947210695167,
                additional = 0,
                mulitplier = 0.2 * 1.8,
            },
            [4] = { --Concussion
                magicka = 0.008743955967,
                spellDamage = 0.08743955967,
                additional = 0,
                mulitplier = 0.2,
            }
        }
    },
    [STRING_FORCE_PULSE] = {
        icon = "|t50:50:esoui/art/icons/ability_destructionstaff_001b.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --Fire hit
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --Two other hits
                fire_bonus = false, fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [3] = { --Burning
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = false, staffExpert = false,    thaumaturge = true,     },
            [4] = { --Concussion
                fire_bonus = false, fire_staff = true,  expertElem = true,  masterArms = false, staffExpert = false,    thaumaturge = true,     }
        },
        factor = {
            [1] = { --Fire hit
                magicka = 0.03094,
                spellDamage = 0.32489,
                additional = -0.04795,
                mulitplier = 1,
            },
            [2] = { --Two other hits
                magicka = 0.03094,
                spellDamage = 0.32489,
                additional = -0.04795,
                mulitplier = 2,
            },
            [3] = { --Burning
                magicka = 0.0167947210695167,
                spellDamage = 0.167947210695167,
                additional = 0,
                mulitplier = 0.2 * 1.8,
            },
            [4] = { --Concussion
                magicka = 0.008743955967,
                spellDamage = 0.08743955967,
                additional = 0,
                mulitplier = 0.2,
            }
        }
    },
    [STRING_ELEMENTAL_WEAPON] = {
        icon = "|t50:50:esoui/art/icons/ability_psijic_003_a.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --Initial Hit
                fire_bonus = false,  fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,   thaumaturge = false,    },
            [2] = { --Orb proc
                fire_bonus = false, fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [3] = { --Burning
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = false, staffExpert = false,    thaumaturge = true,     },
            [4] = { --Concussion
                fire_bonus = false, fire_staff = true,  expertElem = true,  masterArms = false, staffExpert = false,    thaumaturge = true,     }
        },
        factor = {
            [1] = { --Initial Hit
                magicka = 0.09614,
                spellDamage = 1.00792,
                additional = -2.04771,
                mulitplier = 1,
            },
            [2] = { --Orb proc
                magicka = 0.05003,
                spellDamage = 0.52446,
                additional = -1.0333,
                mulitplier = 0.2,
            },
            [3] = { --Burning
                magicka = 0.0167947210695167,
                spellDamage = 0.167947210695167,
                additional = 0,
                mulitplier = 1/3 * 1.8,
            },
            [4] = { --Concussion
                magicka = 0.008743955967,
                spellDamage = 0.08743955967,
                additional = 0,
                mulitplier = 1/3,
            }
        }
    },
    [STRING_SWEEP_UNMORPHED] = {
        icon = "|t50:50:esoui/art/icons/ability_templar_recovery.dds|t",
        castTime = 1.4, --find by doing some weaving and checking timers
        bonus = {
            [1] = { --Single target hit
                fire_bonus = false,  fire_staff = false,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --Burning Light
                fire_bonus = false, fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
        },
        factor = {
            [1] = { --Single target hit
                magicka = 0.03755,
                spellDamage = 0.39454,
                additional = -0.58973,
                mulitplier = 4,
            },
            [2] = { --Burning Light
                magicka = 0.05996,
                spellDamage = 0.62989,
                additional = -0.20105,
                mulitplier = 0.75,
            },
        }
    },
    [STRING_PUNCTURING_SWEEP] = {
        icon = "|t50:50:esoui/art/icons/ability_templar_reckless_attacks.dds|t",
        castTime = 1.4, --find by doing some weaving and checking timers
        bonus = {
            [1] = { --Single target hit
                fire_bonus = false,  fire_staff = false,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --Burning Light
                fire_bonus = false, fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
        },
        factor = {
            [1] = { --Single target hit
                magicka = 0.03885,
                spellDamage = 0.40776,
                additional = -1.17602,
                mulitplier = 4,
            },
            [2] = { --Burning Light
                magicka = 0.05996,
                spellDamage = 0.62989,
                additional = -0.20105,
                mulitplier = 0.75,
            },
        }
    },
    [STRING_FLARE_UNMORPHED] = {
        icon = "|t50:50:esoui/art/icons/ability_templar_solar_flare.dds|t",
        castTime = 1.4, --find by doing some weaving and checking timers
        bonus = {
            [1] = { --Initial hit
                fire_bonus = false,  fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --Empower LA
                empower = true  },
        },
        factor = {
            [1] = { --Initial hit
                magicka = 0.13544,
                spellDamage = 1.42059,
                additional = -1.69185,
                mulitplier = 1,
            },
            [2] = { --Empower LA
                magicka = 0.0450994,
                spellDamage = 0.47178,
                additional = -1.08238,
                mulitplier = 0.4,
            },
        }
    },
    [STRING_DARK_FLARE] = {
        icon = "|t50:50:esoui/art/icons/ability_templar_dark_flare.dds|t",
        castTime = 1.4, --find by doing some weaving and checking timers
        bonus = {
            [1] = { --Initial hit
                fire_bonus = false,  fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --Empower LA
                empower = true  },
        },
        factor = {
            [1] = { --Initial hit
                magicka = 0.13989,
                spellDamage = 1.46774,
                additional = -1.60623,
                mulitplier = 1,
            },
            [2] = { --Empower LA
                magicka = 0.0450994,
                spellDamage = 0.47178,
                additional = -1.08238,
                mulitplier = 0.4,
            },
        }
    },
    [STRING_SUN_FIRE] = {
        icon = "|t50:50:esoui/art/icons/ability_templar_sun_fire.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --First hit
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --DoT dmg
                fire_bonus = true, fire_staff = true,  expertElem = true,  masterArms = false,  staffExpert = false,    thaumaturge = true,    },
            [3] = { --Burning
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = false, staffExpert = false,    thaumaturge = true,     },
        },
        factor = {
            [1] = { --First hit
                magicka = 0.05162,
                spellDamage = 0.54179,
                additional = -0.8793,
                mulitplier = 1,
            },
            [2] = { --DoT dmg
                magicka = 0.10335,
                spellDamage = 1.08213,
                additional = -4.66803,
                mulitplier = 12/10,
            },
            [3] = { --Burning
                magicka = 0.0167947210695167,
                spellDamage = 0.167947210695167,
                additional = 0,
                mulitplier = (5 * 0.06 + 0.2) * 1.4,
            },
        }
    },
    [STRING_VAMPIRE_BANE] = {
        icon = "|t50:50:esoui/art/icons/ability_templar_vampire_bane.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --First hit
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --DoT dmg
                fire_bonus = true, fire_staff = true,  expertElem = true,  masterArms = false,  staffExpert = false,    thaumaturge = true,    },
            [3] = { --Burning
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = false, staffExpert = false,    thaumaturge = true,     },
        },
        factor = {
            [1] = { --First hit
                magicka = 0.05165,
                spellDamage = 0.54199,
                additional = -0.39227,
                mulitplier = 1,
            },
            [2] = { --DoT dmg
                magicka = 0.14987,
                spellDamage = 1.56532,
                additional = -10.0149,
                mulitplier = 16/14,
            },
            [3] = { --Burning
                magicka = 0.0167947210695167,
                spellDamage = 0.167947210695167,
                additional = 0,
                mulitplier = (7 * 0.06 + 0.2) * 1.4,
            },
        }
    },
    [STRING_REFLECTIVE_LIGHT] = {
        icon = "|t50:50:esoui/art/icons/ability_templar_reflective_light.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --First hit
                fire_bonus = true,  fire_staff = false,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --DoT dmg
                fire_bonus = true, fire_staff = true,  expertElem = true,  masterArms = false,  staffExpert = false,    thaumaturge = true,    },
            [3] = { --Burning
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = false, staffExpert = false,    thaumaturge = true,     },
        },
        factor = {
            [1] = { --First hit
                magicka = 0.05339,
                spellDamage = 0.55989,
                additional = -1.11299,
                mulitplier = 1,
            },
            [2] = { --DoT dmg
                magicka = 0.10366,
                spellDamage = 1.08260,
                additional = -4.9924,
                mulitplier = 12/10,
            },
            [3] = { --Burning
                magicka = 0.0167947210695167,
                spellDamage = 0.167947210695167,
                additional = 0,
                mulitplier = (5 * 0.06 + 0.2) * 1.4,
            },
        }
    },
    [STRING_SOLAR_BARRAGE] = {
        icon = "|t50:50:esoui/art/icons/ability_templar_solar_power.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --Dot dmg
                fire_bonus = false,  fire_staff = false,  expertElem = true,  masterArms = false,  staffExpert = false,    thaumaturge = true,    },
            [2] = { --Empower LA
                empower = true  },
        },
        factor = {
            [1] = { --Dot dmg
                magicka = 0.02551,
                spellDamage = 0.26857,
                additional = -0.03909,
                mulitplier = 5,
            },
            [2] = { --Empower LA
                magicka = 0.0450994,
                spellDamage = 0.47178,
                additional = -1.08238,
                mulitplier = 0.35 * 9,
            },
        }
    },
    [STRING_ENTROPY] = {
        icon = "|t50:50:esoui/art/icons/ability_mageguild_004.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --Dot dmg
                fire_bonus = false,  fire_staff = true,  expertElem = true,  masterArms = false,  staffExpert = false,    thaumaturge = true,    },
            [2] = { --Empower LA
                empower = true  },
        },
        factor = {
            [1] = { --Dot dmg
                magicka = 0.15505,
                spellDamage = 1.62629,
                additional = -10.3488,
                mulitplier = 1,
            },
            [2] = { --Empower LA
                magicka = 0.0450994,
                spellDamage = 0.47178,
                additional = -1.08238,
                mulitplier = 0.4,
            },
        }
    },
    [STRING_DEGENERATION] = {
        icon = "|t50:50:esoui/art/icons/ability_mageguild_004_a.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --Dot dmg
                fire_bonus = false,  fire_staff = true,  expertElem = true,  masterArms = false,  staffExpert = false,    thaumaturge = true,    },
            [2] = { --Empower LA
                empower = true  },
        },
        factor = {
            [1] = { --Dot dmg
                magicka = 0.15481,
                spellDamage = 1.62508,
                additional = -3.06092,
                mulitplier = 1,
            },
            [2] = { --Empower LA
                magicka = 0.0450994,
                spellDamage = 0.47178,
                additional = -1.08238,
                mulitplier = 0.4,
            },
        }
    },
    [STRING_STRUCTURED_ENTROPY] = {
        icon = "|t50:50:esoui/art/icons/ability_mageguild_004_b.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --Dot dmg
                fire_bonus = false,  fire_staff = true,  expertElem = true,  masterArms = false,  staffExpert = false,    thaumaturge = true,    },
            [2] = { --Empower LA
                empower = true  },
        },
        factor = {
            [1] = { --Dot dmg
                magicka = 0.15481,
                spellDamage = 1.62508,
                additional = -3.06092,
                mulitplier = 1,
            },
            [2] = { --Empower LA
                magicka = 0.0450994,
                spellDamage = 0.47178,
                additional = -1.08238,
                mulitplier = 0.4,
            },
        }
    },
    [STRING_SOUL_TRAP] = {
        icon = "|t50:50:esoui/art/icons/ability_otherclass_001.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --Dot dmg
                fire_bonus = false,  fire_staff = true,  expertElem = true,  masterArms = false,  staffExpert = false,    thaumaturge = true,    },
        },
        factor = {
            [1] = { --Dot dmg
                magicka = 0.15505,
                spellDamage = 1.62629,
                additional = -10.3488,
            },
        }
    },
    [STRING_SOUL_SPLIT_TRAP] = {
        icon = "|t50:50:esoui/art/icons/ability_otherclass_001_a.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --Dot dmg
                fire_bonus = false,  fire_staff = true,  expertElem = true,  masterArms = false,  staffExpert = false,    thaumaturge = true,    },
        },
        factor = {
            [1] = { --Dot dmg
                magicka = 0.10332,
                spellDamage = 1.08127,
                additional = -1.46566,
                mulitplier = 1,
            },
        }
    },
    [STRING_CONSUMING_TRAP] = {
        icon = "|t50:50:esoui/art/icons/ability_otherclass_001_b.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --Dot dmg
                fire_bonus = false,  fire_staff = true,  expertElem = true,  masterArms = false,  staffExpert = false,    thaumaturge = true,    },
        },
        factor = {
            [1] = { --Dot dmg
                magicka = 0.15481,
                spellDamage = 1.62508,
                additional = -3.06092,
                mulitplier = 1,
            },
        }
    },
    [STRING_FLAME_REACH] = {
        icon = "|t50:50:esoui/art/icons/ability_destructionstaff_007_b.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --First hit
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --DoT dmg
                fire_bonus = true, fire_staff = true,  expertElem = true,  masterArms = false,  staffExpert = false,    thaumaturge = true,    },
            [3] = { --Burning
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = false, staffExpert = false,    thaumaturge = true,     },
        },
        factor = {
            [1] = { --First hit
                magicka = 0.05179,
                spellDamage = 0,
                additional = -1.48613,
                mulitplier = 1,
            },
            [2] = { --DoT dmg
                magicka = 0.10366,
                spellDamage = 1.08260,
                additional = -4.9924,
                mulitplier = 1,
            },
            [3] = { --Burning
                magicka = 0.0167947210695167,
                spellDamage = 0.167947210695167,
                additional = 0,
                mulitplier = (5 * 0.06 + 0.2) * 1.4,
            },
        }
    },
    [STRING_FLAME_TOUCH] = {
        icon = "|t50:50:esoui/art/icons/ability_destructionstaff_007.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --First hit
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --DoT dmg
                fire_bonus = true, fire_staff = true,  expertElem = true,  masterArms = false,  staffExpert = false,    thaumaturge = true,    },
            [3] = { --Burning
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = false, staffExpert = false,    thaumaturge = true,     },
        },
        factor = {
            [1] = { --First hit
                magicka = 0.05162,
                spellDamage = 0.54179,
                additional = -0.8793,
                mulitplier = 1,
            },
            [2] = { --DoT dmg
                magicka = 0.10335,
                spellDamage = 1.08213,
                additional = -4.66803,
                mulitplier = 1,
            },
            [3] = { --Burning
                magicka = 0.0167947210695167,
                spellDamage = 0.167947210695167,
                additional = 0,
                mulitplier = (5 * 0.06 + 0.2) * 1.4,
            },
        }
    },
    [STRING_SHOCK_REACH] = {
        icon = "|t50:50:esoui/art/icons/ability_destructionstaff_006_b.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --First hit
                fire_bonus = false,  fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --DoT dmg
                fire_bonus = false, fire_staff = true,  expertElem = true,  masterArms = false,  staffExpert = false,    thaumaturge = true,    },
            [3] = { --Concussion
                fire_bonus = false, fire_staff = true,  expertElem = true,  masterArms = false, staffExpert = false,    thaumaturge = true,     },
        },
        factor = {
            [1] = { --First hit
                magicka = 0.05179,
                spellDamage = 0,
                additional = -1.48613,
                mulitplier = 1,
            },
            [2] = { --DoT dmg
                magicka = 0.10366,
                spellDamage = 1.08260,
                additional = -4.9924,
                mulitplier = 1,
            },
            [3] = { --Concussion
                magicka = 0.008743955967,
                spellDamage = 0.08743955967,
                additional = 0,
                mulitplier = 5 * 0.06 + 0.2,
            }
        }
    },
    [STRING_SHOCK_TOUCH] = {
        icon = "|t50:50:esoui/art/icons/ability_destructionstaff_006.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --First hit
                fire_bonus = false,  fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --DoT dmg
                fire_bonus = false, fire_staff = true,  expertElem = true,  masterArms = false,  staffExpert = false,    thaumaturge = true,    },
            [3] = { --Concussion
                fire_bonus = false, fire_staff = true,  expertElem = true,  masterArms = false, staffExpert = false,    thaumaturge = true,     },
        },
        factor = {
            [1] = { --First hit
                magicka = 0.05162,
                spellDamage = 0.54179,
                additional = -0.8793,
                mulitplier = 1,
            },
            [2] = { --DoT dmg
                magicka = 0.10335,
                spellDamage = 1.08213,
                additional = -4.66803,
                mulitplier = 1,
            },
            [3] = { --Concussion
                magicka = 0.008743955967,
                spellDamage = 0.08743955967,
                additional = 0,
                mulitplier = 5 * 0.06 + 0.2
            }
        }
    },
    [STRING_SCALDING_RUNE] = {
        icon = "|t50:50:esoui/art/icons/ability_mageguild_001_b.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --First hit
                fire_bonus = true,  fire_staff = false,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --DoT dmg
                fire_bonus = true, fire_staff = true,  expertElem = true,  masterArms = false,  staffExpert = false,    thaumaturge = true,    },
            [3] = { --Burning
                fire_bonus = true,  fire_staff = true,  expertElem = true,  masterArms = false, staffExpert = false,    thaumaturge = true,     },
        },
        factor = {
            [1] = { --First hit
                magicka = 0.10332,
                spellDamage = 1.08423,
                additional = -0.72946,
                mulitplier = 1,
            },
            [2] = { --DoT dmg
                magicka = 0.08492,
                spellDamage = 0.89727,
                additional = -4.1417,
                mulitplier = 1,
            },
            [3] = { --Burning
                magicka = 0.0167947210695167,
                spellDamage = 0.167947210695167,
                additional = 0,
                mulitplier = (7 * 0.02 + 0.1) * 1.4,
            }
        }
    },
    [STRING_BACKLASH] = {
        icon = "|t50:50:esoui/art/icons/ability_templar_backlash.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --First hit
                fire_bonus = false,  fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --Proc dmg
                fire_bonus = false, fire_staff = false,  expertElem = false,  masterArms = false,  staffExpert = false,    thaumaturge = false,    },
        },
        factor = {
            [1] = { --First hit
                magicka = 0.05162,
                spellDamage = 0.54179,
                additional = -0.8793,
                mulitplier = 1,
            },
            [2] = { --Proc dmg
                magicka = 0.60002,
                spellDamage = 0.00008,
                additional = -0.77244,
                mulitplier = 1,
            }
        }
    },
    [STRING_PURIFYING_LIGHT] = {
        icon = "|t50:50:esoui/art/icons/ability_templar_purifying_light.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --First hit
                fire_bonus = false,  fire_staff = true,  expertElem = true,  masterArms = true,  staffExpert = false,    thaumaturge = false,    },
            [2] = { --Proc dmg
                fire_bonus = false, fire_staff = false,  expertElem = false,  masterArms = false,  staffExpert = false,    thaumaturge = false,    },
        },
        factor = {
            [1] = { --First hit
                magicka = 0.05165,
                spellDamage = 0.54199,
                additional = -0.39227,
                mulitplier = 1,
            },
            [2] = { --Proc dmg
                magicka = 0.60002,
                spellDamage = 0.00008,
                additional = -0.77244,
                mulitplier = 1,
            }
        }
    },
    [STRING_RITUAL_RETRIBUTION] = {
        icon = "|t50:50:esoui/art/icons/ability_templar_purifying_ritual.dds|t",
        castTime = 1,
        bonus = {
            [1] = { --Dot dmg
                fire_bonus = false,  fire_staff = false,  expertElem = true,  masterArms = false,  staffExpert = false,    thaumaturge = true,    },
        },
        factor = {
            [1] = { --Dot dmg
                magicka = 0.03422,
                spellDamage = 0.35996,
                additional = -0.29661,
                mulitplier = 6,
            }
        }
    },
}

HowToBeam.CpVariables15 = {
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

HowToBeam.CpVariables25 = {
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

HowToBeam.CpVariables35 = {
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