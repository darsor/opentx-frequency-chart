local current_screen = 1

-- minimum and maximum FPV frequencies
local min_freq = 5645
local max_freq = 5945

-- Uncomment following two lines for EU
--local min_allowed = 5725
--local max_allowed = 5875

-- minimum and maximum screen x-coordinates for position screen
-- 480x272
local min_xpos = 35
local max_xpos = 450

local freq = {
    A = {"5865", "5845", "5825", "5805", "5785", "5765", "5745", "5725"},
    B = {"5733", "5752", "5771", "5790", "5809", "5828", "5847", "5866"},
    E = {"5705", "5685", "5665", "5645", "5885", "5905", "5925", "5945"},
    F = {"5740", "5760", "5780", "5800", "5820", "5840", "5860", "5880"},
    R = {"5658", "5695", "5732", "5769", "5806", "5843", "5880", "5917"}
}

local pos = {
    A = {},
    B = {},
    E = {},
    F = {},
    R = {}
}

-- initialize frequency positions (pos) for screen 2
local function init_func()
    local freq_range = max_freq - min_freq
    local pos_range = max_xpos - min_xpos

    -- populate postion arrays
    for band, freqs in pairs(freq) do
        for i=1,8 do
            pos[band][i] = (tonumber(freqs[i]) - min_freq) / freq_range * pos_range + min_xpos
        end
    end
end

-- returns if a frequency is legal
local function is_legal(freq)
    if max_allowed == nil or min_allowed == nil then
        return true
    else
        return tonumber(freq) > min_allowed and tonumber(freq) < max_allowed
    end
end

-- draw a channel number and border
local function draw_chan(chan, x, y, flags)
    -- clear other pixel(s) inside the border
    if flags ~= INVERS then
        lcd.drawLine(x+1, y+15, x+16, y+15, SOLID, TEXT_BGCOLOR)
    else
        lcd.drawFilledRectangle(x+1, y, 16, 32, TEXT_INVERTED_BGCOLOR)
    end

    -- draw number
    lcd.drawText(x+2, y+2, chan, MIDSIZE + flags)

    -- draw border
    lcd.drawLine(x,   y,   x+17, y,   SOLID, LINE_COLOR)
    lcd.drawLine(x,   y,   x,   y+32, SOLID, LINE_COLOR)
    lcd.drawLine(x+17, y,   x+17, y+32, SOLID, LINE_COLOR)
    lcd.drawLine(x,   y+32, x+17, y+32, SOLID, LINE_COLOR)
end

-- frequency screen
local function draw_freq_screen()
    lcd.clear()

    -- table coordinates
    local xpos = { A = 40, B = 115, E = 190, F = 265, R = 340 }
    local ypos = { 30, 60, 90, 120, 150, 180, 210, 240, 270 }

    -- draw vertical dividers
    for i=30,420,75 do
        lcd.drawLine(i, 1, i, 268, SOLID, LINE_COLOR)
    end

    -- draw channel numbers
    for i=1,8 do
        lcd.drawText(8, ypos[i], i, MIDSIZE + SHADOWED)
    end

    -- draw horizontal dividers
    for i=1,9 do
        lcd.drawLine(1, ypos[i]-2, 405, ypos[i]-2, SOLID, LINE_COLOR)
    end

    -- draw band letters and frequencies
    for band, freqs in pairs(freq) do
        -- draw band letter
        lcd.drawText(xpos[band]+20, 0, band, MIDSIZE + SHADOWED)
        -- draw frequencies
        for i=1,8 do
            if is_legal(freqs[i]) then
                lcd.drawText(xpos[band], ypos[i], freqs[i], MIDSIZE)
            else
                -- fill out box
                lcd.drawFilledRectangle(xpos[band]-9, ypos[i]-1, 74, 29, TEXT_INVERTED_BGCOLOR)
                lcd.drawText(xpos[band], ypos[i], freqs[i], MIDSIZE + INVERS)
            end
        end
    end
end

-- position screen
local function draw_pos_screen()
    lcd.clear()

    -- band coordinates
    local ypos = { A = 20, B = 70, E = 120, F = 170, R = 220 }

    -- draw vertical divider
    lcd.drawLine(30, 1, 30, 268, SOLID, LINE_COLOR)

    -- draw horizontal dividers
    for i=35,272,50 do
        lcd.drawLine(30, i, max_xpos, i, SOLID, LINE_COLOR)
    end

    -- draw band letters and channel boxes
    for band, freqs in pairs(freq) do
        -- draw band letter
        lcd.drawText(8, ypos[band], band, MIDSIZE + SHADOWED)
        -- draw channel boxes
        for i=1,8 do
            local flags = 0
            if not is_legal(freqs[i]) then
                flags = INVERS
            end
            draw_chan(i, pos[band][i], ypos[band], flags)
        end
    end
end

local function run_func(event)
    -- handle keypresses
    if event == EVT_PAGEUP_FIRST or event == EVT_PAGEDN_FIRST then
        if current_screen == 1 then
            current_screen = 2
        else
            current_screen = 1
        end
    end

    -- draw current screen
    if current_screen == 1 then
        draw_freq_screen()
    elseif current_screen == 2 then
        draw_pos_screen()
    end
    return 0
end

return { init=init_func, run=run_func }
