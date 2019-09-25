local m_Output = {}
local m_CharCount = 0
local m_LastTime = 0
local m_Time = 0
local m_FrameCount = 0
local m_Frames = {}
local m_Once = false
local this = nil
local ran = false
local m_Textures = {}

function load(self)
    trace("Loaded TestBar. v1.0")
    this = self
end

function update()
    m_FrameCount = 0
    tDiff = m_Time - m_LastTime
    if tDiff > 30 then
        m_LastTime = m_Time
        getStats()
--        testPrint()
        printBar()
        m_Once = true
    else
        if m_Time > 60000 then
            m_Time = 0
            m_LastTime = 0
        end
        m_Time = m_Time + 1
    end
end

function btn_Event(self)

end

function updateOutput(type, value)
    if value == nil then
        return
    end

    value = "" .. value
    m_Output[m_CharCount] = ";"
    m_CharCount = m_CharCount + 1
    for c = 0, strlen(type) do
        m_Output[m_CharCount] = type.sub(type, c, c)
        m_CharCount = m_CharCount + 1
    end
    m_Output[m_CharCount] = ":"
    m_CharCount = m_CharCount + 1
    for c = 0, strlen(value) do
        m_Output[m_CharCount] = value.sub(value, c, c)
        m_CharCount = m_CharCount + 1
    end
end

function appendOutput(value)
    if value == nil then
        return
    end
    for c = 0, strlen(value) do
        m_Output[m_CharCount] = value.sub(value, c, c)
        m_CharCount = m_CharCount + 1
    end
end

-- TODO : Has an issue with a nil value on a concat
function getStats()
    m_CharCount = 0
    m_Output = {}
    appendOutput("[Player")
    updateOutput("Name", UnitName("player"))
    updateOutput("Level", UnitLevel("player"))
    if IsMounted("player") then
        updateOutput("Mounted", "1")
    else
        updateOutput("Mounted", "0")
    end
    if IsSwimming("player") then
        updateOutput("Swimming", "1")
    else
        updateOutput("Swimming", "0")
    end
    updateOutput("cHealth", UnitHealth("player"))
    updateOutput("mHealth", UnitHealthMax("player"))
    updateOutput("cPower", UnitPower("player"))
    updateOutput("mPower", UnitPowerMax("player"))
    updateOutput("PowerType", UnitPowerType("player"))
    updateOutput("isPlayer", UnitIsPlayer("player"))
    updateOutput("Combat", UnitAffectingCombat("player"))
    appendOutput("]")

    appendOutput("[Buffs")
    local i = 1
    local test = true
    while test do
        name, rank, icon, count, debuffType, duration, expirationTime, isMine, isStealable = UnitBuff("player", i)
        if name ~= nil then
            m_Output[m_CharCount] = "|"
            m_CharCount = m_CharCount + 1
            updateOutput("Name", name)
            updateOutput("Rank", rank)
            updateOutput("Count", count)
            updateOutput("debuffType", debuffType)
            updateOutput("duration", duration)
            updateOutput("expTime", expirationTime)
            if isMine then
                updateOutput("isMine", "1")
            else
                updateOutput("isMine", "0")
            end
            if isStealable then
                updateOutput("isStealable", "1")
            else
                updateOutput("isStealable", "0")
            end
        else
            test = false
        end
        i = i + 1
    end
    appendOutput("]")

if ran then
    ran = false
    appendOutput("[Spells")
    local tabs = GetNumSpellTabs()
    for tab = 1, tabs do
        name, texture, offset, numSpells = GetSpellTabInfo(tab)
        for spell = 1, numSpells do
            spellID = spell + offset
            name, subSpellName = GetSpellName(spellID, "spell")
            name, rank, icon, powerCost, isFunnel, powerType, castingTime, minRange, maxRange = GetSpellInfo(name)
            m_Output[m_CharCount] = "|"
            m_CharCount = m_CharCount + 1
            updateOutput("Name", name)
            updateOutput("Rank", rank)
            updateOutput("powerCost", powerCost)
            if isFunnel then
                updateOutput("isFunnel", "1")
            else
                updateOutput("isFunnel", "0")
            end
            updateOutput("powerType", powerType)
            updateOutput("castingTime", castingTime)
            updateOutput("minRange", minRange)
            updateOutput("maxRange", maxRange)
            if IsAttackSpell(name) then
                updateOutput("isAttackSpell", "1")
            else
                updateOutput("isAttackSpell", "0")
            end
            if IsConsumableSpell(name) then
                updateOutput("isConsumableSpell", "1")
            else
                updateOutput("isConsumableSpell", "0")
            end
            if IsUsableSpell(name) then
                updateOutput("isUsableSpell", "1")
            else
                updateOutput("isUsableSpell", "0")
            end
            if IsPassiveSpell(name) then
                updateOutput("isPassiveSpell", "1")
            else
                updateOutput("isPassiveSpell", "0")
            end
        end
    end
    appendOutput("]")
    m_LastTime = m_Time
end
    
    appendOutput("[Target")
    updateOutput("Name", UnitName("target"))
    updateOutput("Level", UnitLevel("target"))
    if IsMounted("target") then
        updateOutput("Mounted", "1")
    else
        updateOutput("Mounted", "0")
    end
    if IsSwimming("target") then
        updateOutput("Swimming", "1")
    else
        updateOutput("Swimming", "0")
    end    updateOutput("cHealth", UnitHealth("target"))
    updateOutput("mHealth", UnitHealthMax("target"))
    updateOutput("cPower", UnitPower("target"))
    updateOutput("mPower", UnitPowerMax("target"))
    updateOutput("PowerType", UnitPowerType("target"))
    updateOutput("isPlayer", UnitIsPlayer("target"))
    updateOutput("Combat", UnitAffectingCombat("target"))
    appendOutput("]")

    appendOutput("[TargetBuffs")
    i = 1
    test = true
    while test do
        name, rank, icon, count, debuffType, duration, expirationTime, isMine, isStealable = UnitBuff("target", i)
        if name ~= nil then
            m_Output[m_CharCount] = "|"
            m_CharCount = m_CharCount + 1
            updateOutput("Name", name)
            updateOutput("Rank", rank)
            updateOutput("Count", count)
            updateOutput("debuffType", debuffType)
            updateOutput("duration", duration)
            updateOutput("expTime", expirationTime)
            if isMine then
                updateOutput("isMine", "1")
            else
                updateOutput("isMine", "0")
            end
            if isStealable then
                updateOutput("isStealable", "1")
            else
                updateOutput("isStealable", "0")
            end
        else
            test = false
        end
        i = i + 1
    end
    appendOutput("]")
    appendOutput("*")
end

function printBar()
    m_FrameCount = 0
    local wordPos = 0
    local line = 500
    local y = 0
    while wordPos <= #m_Output do
        for fx = 0, 2 do
            drawPixel(255, 255, 255, fx, y)
        end
        for fx = 3, 5 do
            drawPixel(0, 0, 0, fx, y)
        end
        for fx = 6, 8 do
            drawPixel(255, 255, 255, fx, y)
            x = fx + 1
        end
        while wordPos <= line and wordPos <= #m_Output do
            text2Pixels(wordPos, x, y)
            x = x + 1
            wordPos = wordPos + 3
        end
        drawPixel(255, 255, 255, x, y)
        line = line + 500
        y = y + 1
    end
end

function testPrint()
    local x = 0
    local y = 0
    for i = 0, #m_Output, 3 do
        text2Pixels(i, x, y)
        x = x + 1
    end
end

-- Takes 3 chars at a time
function text2Pixels(start, posX, posY)
    local index = start
    local cr = m_Output[index]
    if cr == nil then
        cr = ""
    end
    local r = strbyte(cr)
    if r == nil then
        r = 2
    end
    index = index + 1
    local cg = m_Output[index]
    if cg == nil then
        cg = ""
    end
    local g = strbyte(cg)
    if g == nil then
        g = 2
    end
    index = index + 1
    local cb = m_Output[index]
    if cb == nil then
        cb = ""
    end
    local b = strbyte(cb)
    if b == nil then
        b = 2
    end
    drawPixel(r, g, b, posX, posY)
end    

function drawPixel(r, g, b, posX, posY)
    r = r/255
    g = g/255
    b = b/255
    if m_Frames[m_FrameCount] == nil then
        m_Frames[m_FrameCount] = CreateFrame("Frame", nil, UIParent)
    end
    m_Frames[m_FrameCount]:SetWidth(1) -- Set These to whatever height/width is needed 
    m_Frames[m_FrameCount]:SetHeight(1) -- for your Texture
    if m_Textures[m_FrameCount] == nil then
        m_Textures[m_FrameCount] = m_Frames[m_FrameCount]:CreateTexture(nil)
    end
    m_Textures[m_FrameCount]:SetTexture(r, g, b)
    m_Textures[m_FrameCount]:SetAlpha(1)
    m_Textures[m_FrameCount]:SetBlendMode("DISABLE")
    m_Textures[m_FrameCount]:SetAllPoints(m_Frames[m_FrameCount])
    m_Frames[m_FrameCount].texture = m_Textures[m_FrameCount]
    posY = -1 * posY
    m_Frames[m_FrameCount]:SetPoint("LEFT", 15 + posX, 20 + posY)
    m_Frames[m_FrameCount]:Show()
    m_FrameCount = m_FrameCount + 1
end

function trace(msg)
    if not m_Once then
        DEFAULT_CHAT_FRAME:AddMessage(""..msg)
    end
end

--[[ Events
achievEarned
spiritHealerInRange
spiritHealerOutOfRange
equipBindConf
bagClosed
bagOpen
bagUpdate
bagItemCooldown
bankCloased
bankOpen
bindEnchant
cancelLootRoll
cancelSummon
afkMSG
factionChange
honorGain
xpGain
emoteReceive
guildChat
lootMsg
moneyMsg
skillMsg
whisperMsg

]]