local current_screen = 1

-- minimum and maximum FPV frequencies
local min_freq = 5645
local max_freq = 5945

-- minimum and maximum screen x-coordinates for position screen
local min_xpos = 11
local max_xpos = 201

local bands = {"A", "B", "E", "F", "R"}
local freqs = {
    {5865, 5845, 5825, 5805, 5785, 5765, 5745, 5725},
    {5733, 5752, 5771, 5790, 5809, 5828, 5847, 5866},
    {5705, 5685, 5665, 5645, 5885, 5905, 5925, 5945},
    {5740, 5760, 5780, 5800, 5820, 5840, 5860, 5880},
    {5658, 5695, 5732, 5769, 5806, 5843, 5880, 5917}
}
local pos = { {}, {}, {}, {}, {} }

-- initialize frequency positions (pos) for screen 2
local function init_func()
    local freq_range = max_freq - min_freq
    local pos_range = max_xpos - min_xpos

    -- populate postion arrays
    for band=1,#(bands) do
        for chan=1,8 do
            pos[band][chan] = (freqs[band][chan] - min_freq) / freq_range * pos_range + min_xpos
        end
    end
end

-- draw a channel number and border
local function draw_chan(chan, x, y)
    -- draw number
    lcd.drawText(x+2, y+2, chan, SMLSIZE)

    -- draw border
    lcd.drawLine(x,   y,   x+7, y,   SOLID, FORCE)
    lcd.drawLine(x,   y,   x,   y+9, SOLID, FORCE)
    lcd.drawLine(x+7, y,   x+7, y+9, SOLID, FORCE)
    lcd.drawLine(x,   y+9, x+7, y+9, SOLID, FORCE)

    -- clear other pixel(s) inside the border
    lcd.drawLine(x+1, y+5, x+1, y+5, SOLID, ERASE)
end

-- frequency screen
local function draw_freq_screen()
    lcd.clear()

    -- table coordinates
    local xpos = { 13, 38, 63, 88, 113, 138, 163, 188 }
    local ypos = { 12, 22, 32, 42, 52 }

    -- draw vertical dividers
    for i=9,209,25 do
        lcd.drawLine(i, 1, i, 59, SOLID, FORCE)
    end

    -- draw horizontal dividers
    for i=10,60,10 do
        lcd.drawLine(1, i, 209, i, SOLID, FORCE)
    end

    -- draw channel numbers
    for i=1,8 do
        lcd.drawText(xpos[i]+7, 2, i)
    end

    -- draw band letters and frequencies
    for band=1,#(bands) do
        -- draw band letter
        lcd.drawText(2, ypos[band], bands[band])
        -- draw frequencies
        for chan=1,8 do
            lcd.drawText(xpos[chan], ypos[band], freqs[band][chan])
        end
    end
end

-- position screen
local function draw_pos_screen()
    lcd.clear()

    -- band coordinates
    local ypos = { 3, 15, 27, 39, 51 }

    -- draw vertical divider
    lcd.drawLine(8, 3, 8, 60, SOLID, FORCE)

    -- draw horizontal dividers
    for i=8,56,12 do
        lcd.drawLine(9, i, 210, i, SOLID, FORCE)
    end

    -- draw band letters and channel boxes
    for band=1,#(bands) do
        -- draw band letter
        lcd.drawText(2, ypos[band]+2, bands[band], SMLSIZE)
        -- draw channel boxes
        for chan=1,8 do
            draw_chan(chan, pos[band][chan], ypos[band])
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
end

return { init=init_func, run=run_func }
