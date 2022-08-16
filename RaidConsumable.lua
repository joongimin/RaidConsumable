local AceGUI = LibStub("AceGUI-3.0")

SLASH_RAIDCONSUMABLE1 = "/raidconsumable"
SLASH_RAIDCONSUMABLE2 = "/rc"

local SHORT_NAMES = {
  ["Chronoboon Displacer"] = "Chronoboon",
  ["Elixir of the Mongoose"] = "Mongoose",
  ["Elixir of Superior Defense"] = "Superior Defense",
  ["Gift of Arthas"] = "Arthas",
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
  ["Major Healing Potion"] = "Major Healing",
  ["Mighty Rage Potion"] = "Mighty Rage",
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

local FULL_ITEMS = {
  ["stock"] = {
    ["Brilliant Mana Oil"] = 3,
    ["Brilliant Wizard Oil"] = 3,
    ["Chronoboon Displacer"] = 5,
    ["Dense Dynamite"] = 20,
    ["Dirge's Kickin' Chimaerok Chops"] = 20,
    ["Elemental Sharpening Stone"] = 20,
    ["Elixir of Fortitude"] = 10,
    ["Elixir of Frost Power"] = 10,
    ["Elixir of Shadow Power"] = 10,
    ["Elixir of Superior Defense"] = 10,
    ["Elixir of the Mongoose"] = 10,
    ["Flask of Distilled Wisdom"] = 5,
    ["Flask of Supreme Power"] = 5,
    ["Flask of the Titans"] = 5,
    ["Free Action Potion"] = 5,
    ["Frost Oil"] = 5,
    ["Frost Protection Potion"] = 5,
    ["Gift of Arthas"] = 5,
    ["Goblin Sapper Charge"] = 10,
    ["Greater Arcane Elixir"] = 10,
    ["Greater Arcane Protection Potion"] = 5,
    ["Greater Fire Protection Potion"] = 10,
    ["Greater Frost Protection Potion"] = 10,
    ["Greater Nature Protection Potion"] = 5,
    ["Greater Shadow Protection Potion"] = 10,
    ["Nature Protection Potion"] = 5,
    ["Shadow Protection Potion"] = 5,
    ["Greater Stoneshield Potion"] = 15,
    ["Limited Invulnerability Potion"] = 10,
    ["Living Action Potion"] = 5,
    ["Mageblood Potion"] = 10,
    ["Major Healing Potion"] = 10,
    ["Major Mana Potion"] = 15,
    ["Major Troll's Blood Potion"] = 5,
    ["Mighty Rage Potion"] = 10,
    ["Nightfin Soup"] = 20,
    ["Oil of Immolation"] = 10,
    ["Rumsey Rum Black Label"] = 10,
    ["Runn Tum Tuber Surprise"] = 20,
    ["Smoked Desert Dumplings"] = 20,
    ["Swiftness Potion"] = 5,
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
    ["Elemental Sharpening Stone"] = 20,
    ["Greater Stoneshield Potion"] = 15,
    ["Major Healing Potion"] = 10,
    ["Mighty Rage Potion"] = 10,
    ["Free Action Potion"] = 5,
    ["Dense Dynamite"] = 20,
    ["Goblin Sapper Charge"] = 10,
    ["Winterfall Firewater"] = 10,
  },
  ["junsa mc"] = {
    ["Living Action Potion"] = 5,
    ["Oil of Immolation"] = 10,
    ["Greater Arcane Protection Potion"] = 5
  },
  ["junsa bwl"] = {
    ["Greater Fire Protection Potion"] = 5
  },
  ["junsa aq40"] = {
    ["Greater Nature Protection Potion"] = 5,
    ["Nature Protection Potion"] = 5,
    ["Greater Arcane Protection Potion"] = 5,
    ["Greater Shadow Protection Potion"] = 5,
    ["Limited Invulnerability Potion"] = 5,
    ["Frost Oil"] = 5
  },
  ["junsa naxx1"] = {
    ["Swiftness Potion"] = 5,
    ["Limited Invulnerability Potion"] = 5,
    ["Greater Shadow Protection Potion"] = 10,
    ["Greater Frost Protection Potion"] = 5,
    ["Goblin Sapper Charge"] = 10,
    ["Greater Stoneshield Potion"] = 5,
  },
  ["junsa naxx2"] = {
    ["Greater Shadow Protection Potion"] = 5,
    ["Greater Frost Protection Potion"] = 20,
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
    ["Greater Arcane Protection Potion"] = 5
  },
  ["bubsa bwl"] = {
    ["Hourglass Sand"] = 5,
    ["Greater Fire Protection Potion"] = 10,
    ["Frozen Rune"] = 10,
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
    ["Runn Tum Tuber Surprise"] = 20,
    ["Living Action Potion"] = 5
  },
  ["amhuk raid"] = {
    ["Chronoboon Displacer"] = 5,
    ["Greater Arcane Elixir"] = 5,
    ["Elixir of Shadow Power"] = 10,
    ["Mageblood Potion"] = 5,
    ["Elixir of Fortitude"] = 5,
    ["Brilliant Wizard Oil"] = 2,
    ["Limited Invulnerability Potion"] = 5,
    ["Major Healing Potion"] = 5,
    ["Major Mana Potion"] = 10,
    ["Runn Tum Tuber Surprise"] = 20
  },
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
    ["Flask of Supreme Power"] = 1,
  },
  ["hukma aq40"] = {
    ["Gift of Arthas"] = 5,
    ["Dirge's Kickin' Chimaerok Chops"] = 5,
    ["Rumsey Rum Black Label"] = 5,
    ["Shadow Protection Potion"] = 5,
    ["Frost Protection Potion"] = 5,
    ["Major Troll's Blood Potion"] = 5,
    ["Greater Arcane Protection Potion"] = 5,
    ["Nature Protection Potion"] = 5
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
    ["Living Action Potion"] = 5
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
  ["kkari naxx1"] = {
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
  ["wari raid"] = {
    ["Chronoboon Displacer"] = 5,
    ["Elixir of the Mongoose"] = 10,
    ["Elixir of Superior Defense"] = 5,
    ["Smoked Desert Dumplings"] = 20,
    ["Elemental Sharpening Stone"] = 20,
    ["Major Healing Potion"] = 10,
    ["Mighty Rage Potion"] = 10,
    ["Free Action Potion"] = 5,
    ["Dense Dynamite"] = 20,
    ["Goblin Sapper Charge"] = 10,
    ["Winterfall Firewater"] = 10,
    ["Elixir of Fortitude"] = 10,
    ["Oil of Immolation"] = 10,
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
}

local function ReadItems(inSubject)
  local items = {}

  for mailIdx = 1,100 do
    local _, _, _, subject, _, _, _, _, _, _, _, _, _ = GetInboxHeaderInfo(mailIdx);
    if not subject then break end

    if string.lower(subject) == inSubject then
      for itemIdx = 1,12 do
        itemName, _, _, count, _, _ = GetInboxItem(mailIdx, itemIdx)
        if itemName then
          items[itemName] = (items[itemName] or 0) + count
        end
      end
    end
  end

  return items
end

local function GetFreeSlot()
  for b = 0,4 do
    for s = 1, GetContainerNumSlots(b) do
      if not GetContainerItemLink(b, s) then
        return b, s
      end
    end
  end

  return nil
end

local function SplitItem(bag, slot, count)
  local freeBag, freeSlot = GetFreeSlot()
  SplitContainerItem(bag, slot, count)
  PickupContainerItem(freeBag, freeSlot)
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

local function GetStacks(itemLink)
  local fullStacks = {}
  local partialStacks = {}

  if itemLink then
    local _, _, _, _, _, _, _, stackCount, _, _, _ = GetItemInfo(itemLink)
    for bag = 0,4 do
      for slot = 1, GetContainerNumSlots(bag) do
        local _, count, _, _, _, _, link = GetContainerItemInfo(bag, slot)
        if itemLink == link then
          if count == stackCount then
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
    local _, itemLink, _, _, _, _, _, stackCount, _, _, _ = GetItemInfo(name)
    if stackCount then
      local needFull = math.floor(needCount / stackCount)
      local needPartial = needCount - needFull * stackCount

      local fullStacks, partialStacks = GetStacks(itemLink)
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
    local _, itemLink, _, _, _, _, _, stackCount, _, _, _ = GetItemInfo(name)
    if itemLink then
      local fillCount = 0
      local needFull = math.floor(needCount / stackCount)
      local needPartial = needCount - needFull * stackCount

      local fullStacks, partialStacks = GetStacks(itemLink)
      for i, v in ipairs(fullStacks) do
        if needCount - fillCount >= v['count'] and mailSlotsSize > 0 then
          UseContainerItem(v['bag'], v['slot'])
          fillCount = fillCount + v['count']
          mailSlotsSize = mailSlotsSize - 1
        end
      end

      for i, v in ipairs(partialStacks) do
        if needCount - fillCount == v['count'] and mailSlotsSize > 0 then
          UseContainerItem(v['bag'], v['slot'])
          fillCount = fillCount + v['count']
          mailSlotsSize = mailSlotsSize - 1
        end
      end

      for i, v in ipairs(partialStacks) do
        if needCount - fillCount > v['count'] and mailSlotsSize > 0 then
          UseContainerItem(v['bag'], v['slot'])
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
  for itemName, fullCount in pairs(fullItems) do
    local haveCount = haveItems[itemName] or 0
    local fillCount = fillItems[itemName] or 0
    local shortIndicator = ""
    local shortItemName = SHORT_NAMES[itemName] or itemName
    if haveCount + fillCount < fullCount then shortIndicator = "*" end
    mailContent = mailContent..shortItemName..shortIndicator.." ("..haveCount.."+"..fillCount..")/"..fullCount.."\n"
  end
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

local function PrintStock()
  local message = ""
  for itemName, fullCount in pairs(FULL_ITEMS["stock"]) do
    local _, itemLink, _, _, _, _, _, stackCount, _, _, _ = GetItemInfo(itemName)
    local fullStacks, partialStacks = GetStacks(itemLink)
    local count = 0;
    for _, stack in ipairs(fullStacks) do
      count = count + stack['count']
    end
    for _, stack in ipairs(partialStacks) do
      count = count + stack['count']
    end

    if count < fullCount then
      message = message..itemName.." ("..count.."/"..fullCount..")\n"
    end
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
    PrintStock()
  else
    Start(inSubject)
  end
end

do
  local f = CreateFrame('Frame')
  local process = coroutine.create(function() end)
  local suspended = false

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
        FillMail(inSubject, haveItems, fullItems, fillItems)
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
