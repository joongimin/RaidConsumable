SLASH_RAIDCONSUMABLE1 = "/raidconsumable"
SLASH_RAIDCONSUMABLE2 = "/rc"

local FULL_ITEMS = {
  ["junsa raid"] = {
    ["Elixir of the Mongoose"] = 10,
    ["Elixir of Superior Defense"] = 10,
    ["Gift of Arthas"] = 10,
    ["Flask of the Titans"] = 5,
    ["Dirge's Kickin' Chimaerok Chops"] = 20,
    ["Smoked Desert Dumplings"] = 20,
    ["Monster Omelet"] = 20,
    ["Rumsey Rum Black Label"] = 10,
    ["Elemental Sharpening Stone"] = 20,
    ["Living Action Potion"] = 5,
    ["Greater Stoneshield Potion"] = 15,
    ["Major Healing Potion"] = 10,
    ["Mighty Rage Potion"] = 10,
    ["Free Action Potion"] = 5,
    ["Dense Dynamite"] = 20,
    ["Goblin Sapper Charge"] = 10,
  },
  ["junsa mc"] = {
    ["Greater Fire Protection Potion"] = 5,
    ["Greater Arcane Protection Potion"] = 5
  },
  ["junsa bwl"] = {
    ["Greater Fire Protection Potion"] = 5
  },
  ["junsa aq40"] = {
    ["Greater Nature Protection Potion"] = 15,
    ["Greater Arcane Protection Potion"] = 5,
    ["Greater Shadow Protection Potion"] = 5,
    ["Greater Frost Protection Potion"] = 5,
    ["Limited Invulnerability Potion"] = 5
  },
  ["dojuk raid"] = {
    ["Elixir of the Mongoose"] = 10,
    ["Major Healing Potion"] = 15,
    ["Elixir of Fortitude"] = 10,
    ["Winterfall Firewater"] = 10,
    ["Limited Invulnerability Potion"] = 10,
    ["Grilled Squid"] = 20,
  },
  ["dojuk bwl"] = {
    ["Greater Fire Protection Potion"] = 10
  },
  ["piri raid"] = {
    ["Greater Arcane Elixir"] = 10,
    ["Elixir of Frost Power"] = 10,
    ["Mageblood Potion"] = 10,
    ["Elixir of Fortitude"] = 10,
    ["Brilliant Wizard Oil"] = 2,
    ["Limited Invulnerability Potion"] = 10,
    ["Major Healing Potion"] = 10,
    ["Major Mana Potion"] = 15,
    ["Runn Tum Tuber Surprise"] = 20,
    ["Flask of Supreme Power"] = 5,
  },
  ["piri mc"] = {
    ["Greater Fire Protection Potion"] = 10,
    ["Greater Arcane Protection Potion"] = 5
  },
  ["kkari raid"] = {
    ["Mageblood Potion"] = 10,
    ["Brilliant Mana Oil"] = 2,
    ["Major Healing Potion"] = 5,
    ["Major Mana Potion"] = 20,
    ["Nightfin Soup"] = 20,
    ["Flask of Distilled Wisdom"] = 5,
  },
  ["kkari mc"] = {
    ["Greater Fire Protection Potion"] = 10,
    ["Greater Arcane Protection Potion"] = 5
  },
  ["kkari bwl"] = {
    ["Greater Fire Protection Potion"] = 10
  },
  ["kkari aq40"] = {
    ["Greater Arcane Protection Potion"] = 5,
    ["Greater Nature Protection Potion"] = 10,
    ["Greater Shadow Protection Potion"] = 5,
    ["Greater Frost Protection Potion"] = 5,
    ["Nature Protection Potion"] = 5
  }
}

local function ReadItems(inSubject)
  local items = {}

  for mailIdx = 1,50 do
    local _, _, _, subject, _, _, _, _, _, _, _, _, _ = GetInboxHeaderInfo(mailIdx);
    if not subject then break end

    if subject == inSubject then
      for itemIdx = 1,12 do
        itemName, _, _, count, _, _ = GetInboxItem(mailIdx, itemIdx)
        if not itemName then break end

        items[itemName] = (items[itemName] or 0) + count
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

local function FillItems(needItems)
  local fillItems = {}
  local usedSlot = {}

  for b = 0,4 do
    for s = 1, GetContainerNumSlots(b) do
      local _, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(b, s)
      if itemLink then
        k, _, _, _, _, _, _, stackCount, _, _, _ = GetItemInfo(itemLink)
        if needItems[k] then
          needCount = needItems[k] - (fillItems[k] or 0)
          if itemCount == needCount or (itemCount == stackCount and stackCount < needCount) then
            UseContainerItem(b, s)
            fillItems[k] = (fillItems[k] or 0) + itemCount
            usedSlot[""..b..s] = true
          end
        end
      end
    end
  end

  for b = 0,4 do
    for s = 1, GetContainerNumSlots(b) do
      if not usedSlot[""..b..s] then
        local _, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(b, s)
        if itemLink then
          k, _, _, _, _, _, _, _, _, _, _ = GetItemInfo(itemLink)
          if needItems[k] then
            needCount = needItems[k] - (fillItems[k] or 0)
            if itemCount < needCount then
              UseContainerItem(b, s)
              fillItems[k] = (fillItems[k] or 0) + itemCount
              usedSlot[""..b..s] = true
            end
          end
        end
      end
    end
  end

  for b = 0,4 do
    for s = 1, GetContainerNumSlots(b) do
      if not usedSlot[""..b..s] then
        local _, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(b, s)
        if itemLink then
          k, _, _, _, _, _, _, _, _, _, _ = GetItemInfo(itemLink)
          if needItems[k] then
            needCount = needItems[k] - (fillItems[k] or 0)
            if 0 < needCount and itemCount > needCount then
              SplitItem(b, s, itemCount - needCount)
              return nil
            end
          end
        end
      end
    end
  end

  return fillItems
end

local function FillMail(inSubject, haveItems, fullItems, fillItems)
  local recipient = string.sub(inSubject, 0, string.find(inSubject, " ") - 1)
  SendMailNameEditBox:SetText(recipient)
  SendMailSubjectEditBox:SetText(inSubject)

  local mailContent = ""
  for itemName, fullCount in pairs(fullItems) do
    local haveCount = haveItems[itemName] or 0
    local fillCount = fillItems[itemName] or 0
    local shortIndicator = ""
    if haveCount + fillCount < fullCount then shortIndicator = "*" end
    mailContent = mailContent..itemName..shortIndicator.."\n("..haveCount.."+"..fillCount..")/"..fullCount.."\n\n"
  end
  SendMailBodyEditBox:SetText(mailContent)
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

local function RaidConsumableHandler(inSubject)
  ClearSendMail()

  local haveItems = ReadItems(inSubject)
  local fullItems = FULL_ITEMS[inSubject]
  local needItems = NeedItems(fullItems, haveItems)
  local fillItems = FillItems(needItems)
  if fillItems then
    FillMail(inSubject, haveItems, fullItems, fillItems)
  end
end

SlashCmdList["RAIDCONSUMABLE"] = RaidConsumableHandler;
