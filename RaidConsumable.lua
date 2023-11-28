local AceGUI = LibStub("AceGUI-3.0")

SLASH_RAIDCONSUMABLE1 = "/raidconsumable"
SLASH_RAIDCONSUMABLE2 = "/rc"

local SHORT_NAMES = {
  ["Chronoboon Displacer"] = "Chronoboon",
  ["Elixir of the Mongoose"] = "Mongoose",
  ["Elixir of Superior Defense"] = "Superior Defense",
  ["Gift of Arthas"] = "Arthas",
  ["Great Rage Potion"] = "GRP",
  ["Flask of the Titans"] = "Titans",
  ["Flask of Distilled Wisdom"] = "Flask of DW",
  ["Flask of Supreme Power"] = "Flask of SP",
  ["Dirge's Kickin' Chimaerok Chops"] = "Chimaerok Chops",
  ["Smoked Desert Dumplings"] = "Dumplings",
  ["Monster Omelet"] = "Omelet",
  ["Rumsey Rum Black Label"] = "Rumsey Rum",
  ["Elemental Sharpening Stone"] = "Ele Sharpening Stone",
  ["Living Action Potion"] = "LAP",
  ["Greater Stoneshield Potion"] = "Stoneshield",
  ["Grilled Squid"] = "Squid",
  ["Major Healing Potion"] = "Major Healing",
  ["Mighty Rage Potion"] = "MRP",
  ["Free Action Potion"] = "FAP",
  ["Dense Dynamite"] = "Dynamite",
  ["Goblin Sapper Charge"] = "Sapper",
  ["Limited Invulnerability Potion"] = "LIP",
  ["Greater Fire Protection Potion"] = "GFPP",
  ["Greater Nature Protection Potion"] = "GNPP",
  ["Greater Arcane Protection Potion"] = "GAPP",
  ["Greater Shadow Protection Potion"] = "GSPP",
  ["Greater Frost Protection Potion"] = "GFrPP",
}

local ITEM_ID = {
  ["Blasted Boar Lung"] = 8392,
  ["Brilliant Mana Oil"] = 20748,
  ["Brilliant Wizard Oil"] = 20749,
  ["Chillwind E'ko"] = 12434,
  ["Chronoboon Displacer"] = 184937,
  ["Dense Dynamite"] = 18641,
  ["Dense Sharpening Stone"] = 12404,
  ["Dense Weightstone"] = 12643,
  ["Dirge's Kickin' Chimaerok Chops"] = 21023,
  ["Elemental Sharpening Stone"] = 18262,
  ["Elixir of Fortitude"] = 3825,
  ["Elixir of Frost Power"] = 17708,
  ["Elixir of Greater Firepower"] = 21546,
  ["Elixir of Shadow Power"] = 9264,
  ["Elixir of Superior Defense"] = 13445,
  ["Elixir of the Mongoose"] = 13452,
  ["Flask of Distilled Wisdom"] = 13511,
  ["Flask of Petrification"] = 13506,
  ["Flask of Supreme Power"] = 13512,
  ["Flask of the Titans"] = 13510,
  ["Free Action Potion"] = 5634,
  ["Frost Oil"] = 3829,
  ["Frost Protection Potion"] = 6050,
  ["Frostmaul E'ko"] = 12436,
  ["Frozen Rune"] = 22682,
  ["Gift of Arthas"] = 9088,
  ["Goblin Sapper Charge"] = 10646,
  ["Great Rage Potion"] = 5633,
  ["Greater Arcane Elixir"] = 13454,
  ["Greater Arcane Protection Potion"] = 13461,
  ["Greater Fire Protection Potion"] = 13457,
  ["Greater Frost Protection Potion"] = 13456,
  ["Greater Nature Protection Potion"] = 13458,
  ["Greater Shadow Protection Potion"] = 13459,
  ["Greater Stoneshield Potion"] = 13455,
  ["Grilled Squid"] = 13928,
  ["Hourglass Sand"] = 19183,
  ["Ice Thistle E'ko"] = 12435,
  ["Limited Invulnerability Potion"] = 3387,
  ["Living Action Potion"] = 20008,
  ["Mageblood Potion"] = 20007,
  ["Major Healing Potion"] = 13446,
  ["Major Mana Potion"] = 13444,
  ["Major Rejuvenation Potion"] = 18253,
  ["Major Troll's Blood Potion"] = 20004,
  ["Mighty Rage Potion"] = 13442,
  ["Nature Protection Potion"] = 6052,
  ["Nightfin Soup"] = 13931,
  ["Oil of Immolation"] = 8956,
  ["Powerful Anti-Venom"] = 19440,
  ["Rumsey Rum Black Label"] = 21151,
  ["Runn Tum Tuber Surprise"] = 18254,
  ["Scorpok Pincer"] = 8393,
  ["Shadow Protection Potion"] = 6048,
  ["Shardtooth E'ko"] = 12432,
  ["Smoked Desert Dumplings"] = 20452,
  ["Snickerfang Jowl"] = 8391,
  ["Swiftness Potion"] = 2459,
  ["Winterfall E'ko"] = 12431,
  ["Winterfall Firewater"] = 12820
}

local FULL_ITEMS = {
  -- ["stock"] = {
  --   ["Brilliant Mana Oil"] = 3,
  --   ["Brilliant Wizard Oil"] = 3,
  --   ["Chronoboon Displacer"] = 5,
  --   ["Dense Dynamite"] = 20,
  --   ["Dense Sharpening Stone"] = 20,
  --   ["Dirge's Kickin' Chimaerok Chops"] = 20,
  --   ["Elemental Sharpening Stone"] = 20,
  --   ["Elixir of Fortitude"] = 10,
  --   ["Elixir of Frost Power"] = 10,
  --   ["Elixir of Greater Firepower"] = 5,
  --   ["Elixir of Shadow Power"] = 10,
  --   ["Elixir of Superior Defense"] = 10,
  --   ["Elixir of the Mongoose"] = 10,
  --   ["Flask of Distilled Wisdom"] = 5,
  --   ["Flask of Supreme Power"] = 5,
  --   ["Flask of the Titans"] = 5,
  --   ["Flask of Petrification"] = 5,
  --   ["Free Action Potion"] = 5,
  --   ["Frost Oil"] = 5,
  --   ["Frost Protection Potion"] = 5,
  --   ["Frozen Rune"] = 20,
  --   ["Gift of Arthas"] = 5,
  --   ["Goblin Sapper Charge"] = 10,
  --   ["Greater Arcane Elixir"] = 10,
  --   ["Greater Arcane Protection Potion"] = 5,
  --   ["Greater Fire Protection Potion"] = 10,
  --   ["Greater Frost Protection Potion"] = 10,
  --   ["Greater Nature Protection Potion"] = 5,
  --   ["Greater Shadow Protection Potion"] = 10,
  --   ["Greater Stoneshield Potion"] = 15,
  --   ["Grilled Squid"] = 20,
  --   ["Hourglass Sand"] = 5,
  --   ["Limited Invulnerability Potion"] = 10,
  --   ["Living Action Potion"] = 5,
  --   ["Mageblood Potion"] = 10,
  --   ["Major Healing Potion"] = 10,
  --   ["Major Mana Potion"] = 15,
  --   ["Major Rejuvenation Potion"] = 5,
  --   ["Major Troll's Blood Potion"] = 5,
  --   ["Mighty Rage Potion"] = 10,
  --   ["Nature Protection Potion"] = 10,
  --   ["Nightfin Soup"] = 20,
  --   ["Oil of Immolation"] = 10,
  --   ["Powerful Anti-Venom"] = 10,
  --   ["Rumsey Rum Black Label"] = 10,
  --   ["Runn Tum Tuber Surprise"] = 20,
  --   ["Shadow Protection Potion"] = 5,
  --   ["Smoked Desert Dumplings"] = 20,
  --   ["Swiftness Potion"] = 5,
  --   ["Winterfall Firewater"] = 10,
  -- },
  ["stock"] = {
    ["Blasted Boar Lung"] = 20,
    ["Chillwind E'ko"] = 20,
    ["Chronoboon Displacer"] = 5,
    ["Dense Dynamite"] = 20,
    ["Dense Sharpening Stone"] = 20,
    ["Dense Weightstone"] = 20,
    ["Dirge's Kickin' Chimaerok Chops"] = 20,
    ["Elemental Sharpening Stone"] = 20,
    ["Elixir of Fortitude"] = 5,
    ["Elixir of Superior Defense"] = 5,
    ["Elixir of the Mongoose"] = 10,
    ["Flask of Petrification"] = 1,
    ["Flask of the Titans"] = 2,
    ["Free Action Potion"] = 5,
    ["Frostmaul E'ko"] = 20,
    ["Frozen Rune"] = 20,
    ["Gift of Arthas"] = 5,
    ["Goblin Sapper Charge"] = 20,
    ["Great Rage Potion"] = 10,
    ["Greater Arcane Protection Potion"] = 5,
    ["Greater Fire Protection Potion"] = 5,
    ["Greater Frost Protection Potion"] = 10,
    ["Greater Nature Protection Potion"] = 5,
    ["Greater Shadow Protection Potion"] = 10,
    ["Greater Stoneshield Potion"] = 10,
    ["Ice Thistle E'ko"] = 20,
    ["Limited Invulnerability Potion"] = 5,
    ["Major Healing Potion"] = 10,
    ["Mighty Rage Potion"] = 15,
    ["Oil of Immolation"] = 10,
    ["Rumsey Rum Black Label"] = 10,
    ["Scorpok Pincer"] = 20,
    ["Shardtooth E'ko"] = 20,
    ["Smoked Desert Dumplings"] = 20,
    ["Snickerfang Jowl"] = 20,
    ["Swiftness Potion"] = 5,
    ["Winterfall E'ko"] = 20,
    ["Winterfall Firewater"] = 10,
  },
  ["junsa raid"] = {
    ["Chronoboon Displacer"] = 5,
    ["Elixir of the Mongoose"] = 10,
    ["Elixir of Superior Defense"] = 5,
    ["Gift of Arthas"] = 5,
    ["Flask of the Titans"] = 5,
    ["Dirge's Kickin' Chimaerok Chops"] = 20,
    ["Smoked Desert Dumplings"] = 20,
    ["Rumsey Rum Black Label"] = 10,
    ["Dense Sharpening Stone"] = 20,
    ["Elemental Sharpening Stone"] = 20,
    ["Greater Stoneshield Potion"] = 15,
    ["Major Healing Potion"] = 10,
    ["Mighty Rage Potion"] = 10,
    ["Free Action Potion"] = 5,
    ["Dense Dynamite"] = 20,
    ["Goblin Sapper Charge"] = 10,
    ["Winterfall Firewater"] = 10
  },
  ["junsa raida"] = {
    ["Chronoboon Displacer"] = 5,
    ["Elixir of the Mongoose"] = 10,
    ["Elixir of Superior Defense"] = 5,
    ["Elixir of Fortitude"] = 5,
    ["Flask of the Titans"] = 2,
    ["Dirge's Kickin' Chimaerok Chops"] = 20,
    ["Smoked Desert Dumplings"] = 20,
    ["Rumsey Rum Black Label"] = 10,
    ["Elemental Sharpening Stone"] = 20,
    ["Dense Weightstone"] = 20,
    ["Dense Sharpening Stone"] = 20,
    ["Greater Stoneshield Potion"] = 10,
    ["Major Healing Potion"] = 10,
    ["Mighty Rage Potion"] = 10,
    ["Great Rage Potion"] = 10,
    ["Free Action Potion"] = 5,
    ["Dense Dynamite"] = 20,
    ["Goblin Sapper Charge"] = 10,
    ["Winterfall Firewater"] = 10,
    ["Limited Invulnerability Potion"] = 5,
    ["Gift of Arthas"] = 5
  },
  ["junsa mc"] = {
    ["Living Action Potion"] = 5,
    ["Oil of Immolation"] = 10,
    ["Greater Arcane Protection Potion"] = 5
  },
  ["junsa mca"] = {
    ["Greater Arcane Protection Potion"] = 5,
    ["Greater Fire Protection Potion"] = 5,
    ["Hourglass Sand"] = 5,
  },
  ["junsa bwl"] = {
    ["Greater Fire Protection Potion"] = 5
  },
  ["junsa bwla"] = {
    ["Greater Fire Protection Potion"] = 5,
    ["Hourglass Sand"] = 5,
  },
  ["junsa aq40"] = {
    ["Greater Nature Protection Potion"] = 5,
    ["Nature Protection Potion"] = 5,
    ["Greater Arcane Protection Potion"] = 5,
    ["Greater Shadow Protection Potion"] = 5,
    ["Limited Invulnerability Potion"] = 5,
    ["Frost Oil"] = 5,
    ["Powerful Anti-Venom"] = 10,
  },
  ["junsa aq40a"] = {
    ["Greater Nature Protection Potion"] = 5,
    ["Nature Protection Potion"] = 5,
    ["Greater Arcane Protection Potion"] = 5,
    ["Shadow Protection Potion"] = 5,
    ["Limited Invulnerability Potion"] = 5,
    ["Frost Oil"] = 5
  },
  ["junsa naxx"] = {
    ["Swiftness Potion"] = 5,
    ["Limited Invulnerability Potion"] = 5,
    ["Greater Shadow Protection Potion"] = 10,
    ["Greater Frost Protection Potion"] = 5,
    ["Goblin Sapper Charge"] = 10,
    ["Greater Stoneshield Potion"] = 5,
    ["Flask of Petrification"] = 1,
    ["Frozen Rune"] = 20,
  },
  ["junsa naxxa"] = {
    ["Swiftness Potion"] = 5,
    ["Greater Arcane Protection Potion"] = 5,
    ["Greater Shadow Protection Potion"] = 10,
    ["Greater Frost Protection Potion"] = 10,
    ["Greater Fire Protection Potion"] = 5,
    ["Greater Nature Protection Potion"] = 5,
    ["Goblin Sapper Charge"] = 10,
    ["Flask of Petrification"] = 1,
    ["Mighty Rage Potion"] = 5,
    ["Frozen Rune"] = 20,
  },
  ["junsa naxx2"] = {
    ["Greater Shadow Protection Potion"] = 5,
    ["Greater Frost Protection Potion"] = 10,
  },
  ["dojuk raid"] = {
    ["Chronoboon Displacer"] = 5,
    ["Elixir of the Mongoose"] = 10,
    ["Major Healing Potion"] = 15,
    ["Elixir of Fortitude"] = 10,
    ["Winterfall Firewater"] = 10,
    ["Limited Invulnerability Potion"] = 10,
    ["Grilled Squid"] = 20,
    ["Free Action Potion"] = 5,
    ["Living Action Potion"] = 5,
  },
  ["dojuk bwl"] = {
    ["Greater Fire Protection Potion"] = 10
  },
  ["piri raid"] = {
    ["Chronoboon Displacer"] = 5,
    ["Greater Arcane Elixir"] = 5,
    ["Elixir of Frost Power"] = 10,
    ["Mageblood Potion"] = 5,
    ["Elixir of Fortitude"] = 5,
    ["Brilliant Wizard Oil"] = 2,
    ["Limited Invulnerability Potion"] = 5,
    ["Major Healing Potion"] = 5,
    ["Major Mana Potion"] = 10,
    ["Runn Tum Tuber Surprise"] = 20,
    ["Living Action Potion"] = 5
  },
  ["bubsa mc"] = {
    ["Greater Fire Protection Potion"] = 5,
    ["Greater Arcane Protection Potion"] = 5,
    ["Living Action Potion"] = 5
  },
  ["bubsa bwl"] = {
    ["Hourglass Sand"] = 5,
    ["Greater Fire Protection Potion"] = 10,
    ["Frozen Rune"] = 5,
    ["Dirge's Kickin' Chimaerok Chops"] = 5,
  },
  ["bubsa raid"] = {
    ["Chronoboon Displacer"] = 5,
    ["Greater Arcane Elixir"] = 5,
    ["Elixir of Frost Power"] = 10,
    ["Mageblood Potion"] = 5,
    ["Elixir of Fortitude"] = 5,
    ["Brilliant Wizard Oil"] = 2,
    ["Limited Invulnerability Potion"] = 5,
    ["Major Healing Potion"] = 5,
    ["Major Mana Potion"] = 10,
    ["Runn Tum Tuber Surprise"] = 20
  },
  ["bubsa raida"] = {
    ["Chronoboon Displacer"] = 5,
    ["Greater Arcane Elixir"] = 5,
    ["Elixir of Frost Power"] = 10,
    ["Elixir of Greater Firepower"] = 10,
    ["Mageblood Potion"] = 5,
    ["Elixir of Fortitude"] = 5,
    ["Brilliant Wizard Oil"] = 2,
    ["Limited Invulnerability Potion"] = 5,
    ["Major Healing Potion"] = 5,
    ["Major Mana Potion"] = 10,
    ["Runn Tum Tuber Surprise"] = 20,
    ["Flask of Supreme Power"] = 3,
    ["Flask of Petrification"] = 2
  },
  ["amhuk raid"] = {
    ["Chronoboon Displacer"] = 5,
    ["Mageblood Potion"] = 5,
    ["Brilliant Mana Oil"] = 3,
    ["Major Healing Potion"] = 5,
    ["Major Mana Potion"] = 15,
    ["Nightfin Soup"] = 20,
    ["Limited Invulnerability Potion"] = 5
  },
  -- ["amhuk raid"] = {
  --   ["Chronoboon Displacer"] = 5,
  --   ["Greater Arcane Elixir"] = 5,
  --   ["Elixir of Shadow Power"] = 10,
  --   ["Mageblood Potion"] = 5,
  --   ["Elixir of Fortitude"] = 5,
  --   ["Brilliant Wizard Oil"] = 2,
  --   ["Limited Invulnerability Potion"] = 5,
  --   ["Major Healing Potion"] = 5,
  --   ["Major Mana Potion"] = 10,
  --   ["Runn Tum Tuber Surprise"] = 20
  -- },
  ["hukma raid"] = {
    ["Chronoboon Displacer"] = 5,
    ["Greater Arcane Elixir"] = 5,
    ["Elixir of Greater Firepower"] = 5,
    ["Elixir of Shadow Power"] = 10,
    ["Mageblood Potion"] = 5,
    ["Elixir of Fortitude"] = 5,
    ["Brilliant Wizard Oil"] = 3,
    ["Limited Invulnerability Potion"] = 5,
    ["Major Healing Potion"] = 5,
    ["Major Mana Potion"] = 15,
    ["Runn Tum Tuber Surprise"] = 20,
    ["Dirge's Kickin' Chimaerok Chops"] = 20,
    ["Rumsey Rum Black Label"] = 10,
    ["Flask of Supreme Power"] = 5,
    ["Elixir of Superior Defense"] = 5,
    ["Major Troll's Blood Potion"] = 5
  },
  ["hukma aq40"] = {
    ["Gift of Arthas"] = 5,
    ["Frost Protection Potion"] = 5,
    ["Greater Fire Protection Potion"] = 5
  },
  ["hukma naxx"] = {
    ["Greater Shadow Protection Potion"] = 5,
    ["Greater Frost Protection Potion"] = 10,
    ["Greater Nature Protection Potion"] = 5,
    ["Major Rejuvenation Potion"] = 5,
  },
  ["bubsa naxxa"] = {
    ["Greater Arcane Elixir"] = 5,
    ["Mageblood Potion"] = 5,
    ["Elixir of Fortitude"] = 5,
    ["Limited Invulnerability Potion"] = 5,
    ["Major Mana Potion"] = 5,
    ["Greater Fire Protection Potion"] = 1,
    ["Greater Nature Protection Potion"] = 5,
    ["Greater Shadow Protection Potion"] = 10,
    ["Greater Frost Protection Potion"] = 10,
    ["Major Troll's Blood Potion"] = 5,
    ["Elixir of Superior Defense"] = 10,
    ["Goblin Sapper Charge"] = 10,
    ["Rumsey Rum Black Label"] = 10,
  },
  ["piri mc"] = {
    ["Greater Fire Protection Potion"] = 5,
    ["Greater Arcane Protection Potion"] = 5
  },
  ["piri bwl"] = {
    ["Hourglass Sand"] = 5,
    ["Greater Fire Protection Potion"] = 10
  },
  ["kkari raid"] = {
    ["Chronoboon Displacer"] = 5,
    ["Mageblood Potion"] = 10,
    ["Brilliant Mana Oil"] = 3,
    ["Brilliant Wizard Oil"] = 1,
    ["Major Healing Potion"] = 5,
    ["Major Mana Potion"] = 20,
    ["Nightfin Soup"] = 20,
    ["Runn Tum Tuber Surprise"] = 20,
    ["Limited Invulnerability Potion"] = 5,
    ["Living Action Potion"] = 5,
    ["Elixir of Fortitude"] = 5
  },
  ["kkari mc"] = {
    ["Greater Fire Protection Potion"] = 5,
    ["Greater Arcane Protection Potion"] = 5
  },
  ["kkari bwl"] = {
    ["Greater Fire Protection Potion"] = 5
  },
  ["kkari aq40"] = {
    ["Greater Arcane Protection Potion"] = 5,
    ["Shadow Protection Potion"] = 5,
    ["Frost Protection Potion"] = 5,
    ["Nature Protection Potion"] = 10
  },
  ["kkari naxx"] = {
    ["Flask of Distilled Wisdom"] = 5,
    ["Greater Fire Protection Potion"] = 1,
    ["Greater Arcane Protection Potion"] = 5,
    ["Greater Nature Protection Potion"] = 5,
    ["Greater Shadow Protection Potion"] = 10,
    ["Greater Frost Protection Potion"] = 10,
    ["Major Troll's Blood Potion"] = 5,
    ["Major Rejuvenation Potion"] = 5,
    ["Elixir of Superior Defense"] = 5
  },
  ["kkari naxx2"] = {
    ["Flask of Distilled Wisdom"] = 5,
    ["Elixir of Fortitude"] = 10,
    ["Greater Frost Protection Potion"] = 10,
    ["Major Troll's Blood Potion"] = 10,
    ["Elixir of Superior Defense"] = 5
  },
  ["kkari ele"] = {
    ["Greater Arcane Elixir"] = 10,
    ["Brilliant Wizard Oil"] = 3,
    ["Elixir of Fortitude"] = 5,
    ["Elixir of Superior Defense"] = 5,
    ["Limited Invulnerability Potion"] = 5,
    ["Runn Tum Tuber Surprise"] = 20,
    ["Flask of Supreme Power"] = 5
  },
  ["sulsa raid"] = {
    ["Chronoboon Displacer"] = 5,
    ["Mageblood Potion"] = 10,
    ["Brilliant Mana Oil"] = 3,
    ["Major Healing Potion"] = 5,
    ["Major Mana Potion"] = 15,
    ["Nightfin Soup"] = 20,
    ["Limited Invulnerability Potion"] = 5,
    ["Living Action Potion"] = 5
  },
  ["sulsa mc"] = {
    ["Greater Fire Protection Potion"] = 10,
    ["Greater Arcane Protection Potion"] = 5
  },
  ["sulsa bwl"] = {
    ["Greater Fire Protection Potion"] = 10
  },
  ["sulsa aq40"] = {
    ["Greater Arcane Protection Potion"] = 5,
    ["Shadow Protection Potion"] = 5,
    ["Frost Protection Potion"] = 5,
    ["Nature Protection Potion"] = 10
  },
  ["sulsa naxx"] = {
    ["Flask of Distilled Wisdom"] = 5,
    ["Greater Fire Protection Potion"] = 1,
    ["Greater Arcane Protection Potion"] = 5,
    ["Greater Nature Protection Potion"] = 5,
    ["Greater Shadow Protection Potion"] = 10,
    ["Greater Frost Protection Potion"] = 5,
    ["Major Troll's Blood Potion"] = 5,
    ["Major Rejuvenation Potion"] = 5,
    ["Elixir of Superior Defense"] = 5
  },
  ["sulsa naxx2"] = {
    ["Flask of Distilled Wisdom"] = 5,
    ["Elixir of Fortitude"] = 10,
    ["Greater Frost Protection Potion"] = 10,
    ["Major Troll's Blood Potion"] = 10,
    ["Elixir of Superior Defense"] = 5
  },
  ["wari raid"] = {
    ["Chronoboon Displacer"] = 5,
    ["Elixir of the Mongoose"] = 10,
    ["Smoked Desert Dumplings"] = 20,
    ["Elemental Sharpening Stone"] = 20,
    ["Dense Sharpening Stone"] = 20,
    ["Major Healing Potion"] = 10,
    ["Great Rage Potion"] = 10,
    ["Mighty Rage Potion"] = 10,
    ["Free Action Potion"] = 5,
    ["Living Action Potion"] = 5,
    ["Dense Dynamite"] = 20,
    ["Goblin Sapper Charge"] = 10,
    ["Winterfall Firewater"] = 10,
    ["Elixir of Fortitude"] = 5,
    ["Elixir of Superior Defense"] = 5,
    ["Limited Invulnerability Potion"] = 5,
    ["Dirge's Kickin' Chimaerok Chops"] = 20,
    ["Greater Stoneshield Potion"] = 5,
    ["Flask of the Titans"] = 1,
  },
  ["wari mc"] = {
    ["Living Action Potion"] = 5,
    ["Greater Arcane Protection Potion"] = 5,
    ["Greater Fire Protection Potion"] = 5
  },
  ["wari bwl"] = {
    ["Hourglass Sand"] = 5,
    ["Greater Fire Protection Potion"] = 10
  },
  ["wari aq40"] = {
    ["Greater Nature Protection Potion"] = 5,
    ["Nature Protection Potion"] = 5,
    ["Greater Arcane Protection Potion"] = 5,
    ["Shadow Protection Potion"] = 5,
    ["Limited Invulnerability Potion"] = 5,
    ["Frost Oil"] = 5
  },
  ["wari naxx"] = {
    ["Greater Nature Protection Potion"] = 5,
    ["Greater Shadow Protection Potion"] = 10,
    ["Greater Frost Protection Potion"] = 10,
    ["Greater Arcane Protection Potion"] = 5,
    ["Goblin Sapper Charge"] = 10,
    ["Major Troll's Blood Potion"] = 5,
    ["Greater Fire Protection Potion"] = 5,
    ["Elixir of Fortitude"] = 5,
    ["Elixir of Superior Defense"] = 5,
    ["Mighty Rage Potion"] = 5,
  },
  ["jojun raid"] = {
    ["Chronoboon Displacer"] = 5,
    ["Elixir of the Mongoose"] = 5,
    ["Grilled Squid"] = 20,
    ["Major Healing Potion"] = 10,
    ["Major Mana Potion"] = 10,
    ["Winterfall Firewater"] = 10,
    ["Elixir of Fortitude"] = 5,
    ["Limited Invulnerability Potion"] = 5,
    ["Dense Dynamite"] = 20,
    ["Goblin Sapper Charge"] = 10,
  },
  ["jojun mc"] = {
    ["Living Action Potion"] = 5,
    ["Greater Arcane Protection Potion"] = 5,
    ["Greater Fire Protection Potion"] = 5
  },
  ["jojun bwl"] = {
    ["Hourglass Sand"] = 5,
    ["Greater Fire Protection Potion"] = 10
  },
  ["jojun aq40"] = {
    ["Nature Protection Potion"] = 5,
    ["Greater Nature Protection Potion"] = 5,
    ["Greater Arcane Protection Potion"] = 5,
    ["Shadow Protection Potion"] = 5,
    ["Limited Invulnerability Potion"] = 5,
    ["Frost Oil"] = 5,
    ["Powerful Anti-Venom"] = 10
  },
  ["jojun naxx"] = {
    ["Greater Fire Protection Potion"] = 1,
    ["Greater Arcane Protection Potion"] = 5,
    ["Greater Nature Protection Potion"] = 5,
    ["Greater Shadow Protection Potion"] = 10,
    ["Greater Frost Protection Potion"] = 10,
    ["Major Troll's Blood Potion"] = 5,
    ["Major Rejuvenation Potion"] = 5
  },
}

local function GetItemIdFromName(name)
  return ITEM_ID[name]
end

local function GetItemStackCount(itemId)
  local _, _, _, _, _, _, _, stackCount = GetItemInfo(itemId)
  return stackCount
end

local function GetItemInfoFromName(name)
  local itemId = ITEM_ID[name]
  if not itemId then
    print('ERROR - Item with name \''..name..'\' not found!')
    return nil
  end

  return GetItemInfo(itemId)
end

local function ReadItems(inSubject)
  local items = {}
  local mailsCount = 0

  for mailIdx = 1,100 do
    local _, _, _, subject, _, _, _, _, _, _, _, _, _ = GetInboxHeaderInfo(mailIdx);
    if not subject then break end

    if string.lower(subject) == inSubject then
      mailsCount = mailsCount + 1
      for itemIdx = 1,12 do
        itemName, _, _, count, _, _ = GetInboxItem(mailIdx, itemIdx)
        if itemName then
          items[itemName] = (items[itemName] or 0) + count
        end
      end
    end
  end

  print("Found "..mailsCount.." mails with subject '"..inSubject.."'")
  return items
end

local function GetFreeSlot()
  for b = 0,4 do
    for s = 1, C_Container.GetContainerNumSlots(b) do
      if not C_Container.GetContainerItemID(b, s) then
        return b, s
      end
    end
  end

  return nil
end

local function GetFreeBankSlot()
  for _, b in ipairs({-1, 5, 6, 7, 8, 9, 10}) do
    for s = 1, C_Container.GetContainerNumSlots(b) do
      if not C_Container.GetContainerItemID(b, s) then
        return b, s
      end
    end
  end

  return nil
end

local function SplitItem(bag, slot, count)
  local freeBag, freeSlot = GetFreeSlot()
  C_Container.SplitContainerItem(bag, slot, count)
  C_Container.PickupContainerItem(freeBag, freeSlot)
end

function dump(o)
  if type(o) == 'table' then
     local s = '{ '
     for k,v in pairs(o) do
        if type(k) ~= 'number' then k = '"'..k..'"' end
        s = s .. '['..k..'] = ' .. dump(v) .. ','
     end
     return s .. '} '
  else
     return tostring(o)
  end
end

local function GetStacks(itemId)
  local fullStacks = {}
  local partialStacks = {}

  if itemId then
    local stackCount = GetItemStackCount(itemId)
    for bag = 0,4 do
      for slot = 1, C_Container.GetContainerNumSlots(bag) do
        local containerInfo = C_Container.GetContainerItemInfo(bag, slot)
        if containerInfo and itemId == containerInfo.itemID then
          if containerInfo.stackCount == stackCount then
            fullStacks[#fullStacks+1] = {['bag']=bag, ['slot']=slot, ['count']=containerInfo.stackCount}
          else
            partialStacks[#partialStacks+1] = {['bag']=bag, ['slot']=slot, ['count']=containerInfo.stackCount}
          end
        end
      end
    end
  end

  return fullStacks, partialStacks
end

local function GetBankStacks(itemId)
  local fullStacks = {}
  local partialStacks = {}

  if itemId then
    local stackCount = GetItemStackCount(itemId)
    for _, bag in ipairs({-1, 5, 6, 7, 8, 9, 10}) do
      for slot = 1, C_Container.GetContainerNumSlots(bag) do
        local containerInfo = C_Container.GetContainerItemInfo(bag, slot)
        if containerInfo and itemId == containerInfo.itemID then
          if containerInfo.stackCount == stackCount then
            fullStacks[#fullStacks+1] = {['bag']=bag, ['slot']=slot, ['count']=count}
          else
            partialStacks[#partialStacks+1] = {['bag']=bag, ['slot']=slot, ['count']=count}
          end
        end
      end
    end
  end

  return fullStacks, partialStacks
end

local function SplitItems(needItems)
  for name, needCount in pairs(needItems) do
    local itemId = GetItemIdFromName(name);
    local stackCount = GetItemStackCount(itemId)
    if stackCount then
      local needFull = math.floor(needCount / stackCount)
      local needPartial = needCount - needFull * stackCount

      local fullStacks, partialStacks = GetStacks(itemId)
      if #partialStacks < 2 then
        local partialStack = partialStacks[1] or {['count']=0}
        if needFull <= #fullStacks and 0 < needPartial and needPartial < partialStack['count'] then
          SplitItem(partialStack['bag'], partialStack['slot'], needPartial)
          return true
        elseif needFull < #fullStacks and needPartial > partialStack['count'] then
          SplitItem(fullStacks[1]['bag'], fullStacks[1]['slot'], needPartial)
          return true
        end
      end
    end
  end

  return false
end

local function FillItems(needItems)
  local fillItems = {}
  local usedSlot = {}
  local mailSlotsSize = 12

  for name, needCount in pairs(needItems) do
    local itemId = GetItemIdFromName(name)
    local stackCount = GetItemStackCount(itemId)
    if itemId then
      local fillCount = 0
      local needFull = math.floor(needCount / stackCount)
      local needPartial = needCount - needFull * stackCount

      local fullStacks, partialStacks = GetStacks(itemId)
      for i, v in ipairs(fullStacks) do
        if needCount - fillCount >= v['count'] and mailSlotsSize > 0 then
          C_Container.UseContainerItem(v['bag'], v['slot'])
          fillCount = fillCount + v['count']
          mailSlotsSize = mailSlotsSize - 1
        end
      end

      for i, v in ipairs(partialStacks) do
        if needCount - fillCount == v['count'] and mailSlotsSize > 0 then
          C_Container.UseContainerItem(v['bag'], v['slot'])
          fillCount = fillCount + v['count']
          mailSlotsSize = mailSlotsSize - 1
        end
      end

      for i, v in ipairs(partialStacks) do
        if needCount - fillCount > v['count'] and mailSlotsSize > 0 then
          C_Container.UseContainerItem(v['bag'], v['slot'])
          fillCount = fillCount + v['count']
          mailSlotsSize = mailSlotsSize - 1
        end
      end

      fillItems[name] = fillCount
    end
  end

  return fillItems
end

local function FillMail(inSubject, haveItems, fullItems, fillItems)
  local recipient = string.lower(string.sub(inSubject, 0, string.find(inSubject, " ") - 1))
  local player = string.lower(UnitName("player"))
  if recipient == player then
    recipient = "junsaraid"
  end

  SendMailNameEditBox:SetText(recipient)
  SendMailSubjectEditBox:SetText(inSubject)

  local mailContent = ""
  local isComplete = true
  for itemName, fullCount in pairs(fullItems) do
    local haveCount = haveItems[itemName] or 0
    local fillCount = fillItems[itemName] or 0
    local shortIndicator = ""
    local shortItemName = SHORT_NAMES[itemName] or itemName
    if haveCount + fillCount > fullCount then
      shortIndicator = "+"
    elseif haveCount + fillCount < fullCount then
      shortIndicator = "-"
    end

    if shortIndicator ~= "" then
      mailContent = mailContent..shortItemName..shortIndicator.." ("..haveCount.."+"..fillCount..")/"..fullCount.."\n"
      isComplete = false
    end
  end

  if isComplete then mailContent = "Complete!" end
  MailEditBox:SetText(mailContent)
end

local function NeedItems(fullItems, haveItems)
  local needItems = {}

  for k, v in pairs(fullItems) do
    local needCount = v - (haveItems[k] or 0)
    if needCount > 0 then
      needItems[k] = needCount
    end
  end

  return needItems
end

local function GetBagItemsCount(itemId)
  local result = 0

  if itemId then
    for bag = 0,4 do
      for slot = 1, C_Container.GetContainerNumSlots(bag) do
        local containerInfo = C_Container.GetContainerItemInfo(bag, slot)
        if containerInfo and itemId == containerInfo.itemID then
          result = result + containerInfo.stackCount
        end
      end
    end
  end

  return result
end

local function GetBankItemsCount(itemId)
  local result = 0

  if itemId then
    for _, bag in ipairs({-1, 5, 6, 7, 8, 9, 10}) do
      for slot = 1, C_Container.GetContainerNumSlots(bag) do
        local containerInfo = C_Container.GetContainerItemInfo(bag, slot)
        if containerInfo and itemId == containerInfo.itemID then
          result = result + containerInfo.stackCount
        end
      end
    end
  end

  return result
end

local function OrganizeStock()
  for itemName, fullCount in pairs(FULL_ITEMS["stock"]) do
    local itemId = GetItemIdFromName(itemName)
    local stackCount = GetItemStackCount(itemId)

    local bagCount = GetBagItemsCount(itemId)
    local bankCount = GetBankItemsCount(itemId)

    if bagCount > fullCount then
      local fullStacksBag, partialStacksBag = GetStacks(itemId)
      local moveCount = bagCount - fullCount

      if #fullStacksBag > 0 and moveCount >= stackCount then
        C_Container.PickupContainerItem(fullStacksBag[1]['bag'], fullStacksBag[1]['slot'])

        local freeBag, freeSlot = GetFreeBankSlot()
        C_Container.PickupContainerItem(freeBag, freeSlot)
        return true
      elseif moveCount >= partialStacksBag[1]['count'] then
        C_Container.PickupContainerItem(partialStacksBag[1]['bag'], partialStacksBag[1]['slot'])

        local freeBag, freeSlot = GetFreeBankSlot()
        C_Container.PickupContainerItem(freeBag, freeSlot)
        return true
      else
        SplitItem(partialStacksBag[1]['bag'], partialStacksBag[1]['slot'], moveCount)
        return true
      end
    elseif bagCount < fullCount and bankCount > 0 then
      local _, partialStacksBag = GetStacks(itemId)
      local fullStacksBank, partialStacksBank = GetBankStacks(itemId)

      if #partialStacksBank > 0 then
        C_Container.PickupContainerItem(partialStacksBank[1]['bag'], partialStacksBank[1]['slot'])
      else
        C_Container.PickupContainerItem(fullStacksBank[1]['bag'], fullStacksBank[1]['slot'])
      end

      if #partialStacksBag > 0 then
        C_Container.PickupContainerItem(partialStacksBag[1]['bag'], partialStacksBag[1]['slot'])
      else
        local freeBag, freeSlot = GetFreeSlot()
        C_Container.PickupContainerItem(freeBag, freeSlot)
      end

      return true
    end
  end

  return false
end

local function PrintStock()
  local messages = {}
  for itemName, fullCount in pairs(FULL_ITEMS["stock"]) do
    local itemId = GetItemIdFromName(itemName)
    local count = GetBagItemsCount(itemId)

    if count < fullCount then
      table.insert(messages, itemName.." ("..count.."/"..fullCount..")")
    end
  end

  local message = ""
  table.sort(messages)
  for i, v in ipairs(messages) do
    message = message..v.."\n"
  end

  local window = AceGUI:Create("Frame")
	window:SetTitle("Raid Consumables")
	window:SetStatusText("")
	window:SetLayout("Flow")
  window:SetWidth(400)

	local text = AceGUI:Create("MultiLineEditBox")
	text:SetLabel(nil)
	text:SetFullWidth(true)
	text:SetFullHeight(true)
  text:SetText(message)
	window:AddChild(text)
end

local function RaidConsumableHandler(inSubject)
  if inSubject == "stock" then
    Stock()
  else
    Start(inSubject)
  end
end

do
  local f = CreateFrame('Frame')
  local process = coroutine.create(function() end)
  local suspended = false

  function Stock()
    process = coroutine.create(function()
      while true do
        suspended = false
        if not OrganizeStock() then
          break
        end

        if not suspended then
          coroutine.yield()
        end
      end

      PrintStock()
    end)
    f:Show()
  end

  function Start(inSubject)
    ClearSendMail()

    local haveItems = ReadItems(inSubject)
    local fullItems = FULL_ITEMS[inSubject]
    local needItems = NeedItems(fullItems, haveItems)
    process = coroutine.create(function()
      while true do
        suspended = false
        if not SplitItems(needItems) then
          break
        end

        if not suspended then
          coroutine.yield()
        end
      end

      local fillItems = FillItems(needItems)
      if fillItems then
        FillMail(inSubject, haveItems, fullItems, fillItems, mailsCount)
      end
    end)
    f:Show()
  end

  f:SetScript('OnUpdate', function()
    if coroutine.status(process) == 'suspended' then
      suspended = true
      coroutine.resume(process)
    end
    if coroutine.status(process) == 'dead' then
      f:Hide()
    end
  end)
end

SlashCmdList["RAIDCONSUMABLE"] = RaidConsumableHandler;
