local current_screen = 1

-- minimum and maximum FPV frequencies
local min_freq = 5645
local max_freq = 5945

local min_allowed = 0
local max_allowed = 10000

-- Uncomment following two lines for EU
min_allowed = 5725
max_allowed = 5875

-- minimum and maximum screen x-coordinates for position screen
local min_xpos = 9
local max_xpos = 118

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
   return tonumber(freq) > min_allowed and tonumber(freq) < max_allowed
end


-- draw a channel number and border
local function draw_chan(chan, x, y, flags)
    -- draw number    
    lcd.drawText(x+2, y+2, chan, SMLSIZE + flags)

    -- draw border
    lcd.drawLine(x,   y,   x+7, y,   SOLID, FORCE)
    lcd.drawLine(x,   y,   x,   y+9, SOLID, FORCE)
    lcd.drawLine(x+7, y,   x+7, y+9, SOLID, FORCE)
    lcd.drawLine(x,   y+9, x+7, y+9, SOLID, FORCE)

    -- clear other pixel(s) inside the border
    if not flags == INVERS then
        lcd.drawLine(x+1, y+5, x+1, y+5, SOLID, ERASE)
     end               
end

-- frequency screen
local function draw_freq_screen()
    lcd.clear()

    -- table coordinates
    local xpos = { A = 10, B = 34, E = 58, F = 82, R = 106 }
    local ypos = { 8, 15, 22, 29, 36, 43, 50, 57}

    -- draw vertical dividers
    for i=7,103,24 do
        lcd.drawLine(i, 1, i, 63, SOLID, FORCE)
    end

    -- draw horizontal divider
    lcd.drawLine(  1, 6,  15, 6, SOLID, FORCE)
    lcd.drawLine( 22, 6,  39, 6, SOLID, FORCE)
    lcd.drawLine( 46, 6,  63, 6, SOLID, FORCE)
    lcd.drawLine( 70, 6,  87, 6, SOLID, FORCE)
    lcd.drawLine( 94, 6, 111, 6, SOLID, FORCE)
    lcd.drawLine(118, 6, 124, 6, SOLID, FORCE)

    -- draw channel numbers
    for i=1,8 do
        lcd.drawText(1, ypos[i], i, SMLSIZE)
    end

    -- draw band letters and frequencies
    for band, freqs in pairs(freq) do
        -- draw band letter
        lcd.drawText(xpos[band]+7, 1, band, SMLSIZE)
        -- draw frequencies
        for i=1,8 do
            if is_legal(freqs[i]) then
                lcd.drawText(xpos[band], ypos[i], freqs[i], SMLSIZE)
            else
                -- fill out box
                lcd.drawFilledRectangle(xpos[band]-3, ypos[i]-1, 25, 7, SOLID)
                lcd.drawText(xpos[band], ypos[i], freqs[i], SMLSIZE + INVERS)
            end
        end
    end
end

-- position screen
local function draw_pos_screen()
    lcd.clear()

    -- band coordinates
    local ypos = { A = 3, B = 15, E = 27, F = 39, R = 51 }

    -- draw vertical divider
    lcd.drawLine(7, 3, 7, 60, SOLID, FORCE)

    -- draw horizontal dividers
    for i=8,56,12 do
        lcd.drawLine(8, i, 126, i, SOLID, FORCE)
    end

    -- draw band letters and channel boxes
    for band, freqs in pairs(freq) do
        -- draw band letter
        lcd.drawText(1, ypos[band]+2, band, SMLSIZE)
        -- draw channel boxes
        for i=1,8 do
             local flags=0
             if not is_legal(freqs[i]) then
               flags= INVERS
             end
            draw_chan(i, pos[band][i], ypos[band], flags)
        end
    end
end

local function run_func(event)
    -- handle keypresses
    if event == EVT_MENU_BREAK then
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
