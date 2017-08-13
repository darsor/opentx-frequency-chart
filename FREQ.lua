local current_screen = 1

-- compact screen
local function draw_screen1()
    lcd.clear()

    -- draw channel letters
    lcd.drawText(17, 1, "A", SMLSIZE)
    lcd.drawText(lcd.getLastRightPos() + 19, 1, "B", SMLSIZE)
    lcd.drawText(lcd.getLastRightPos() + 19, 1, "E", SMLSIZE)
    lcd.drawText(lcd.getLastRightPos() + 19, 1, "F", SMLSIZE)
    lcd.drawText(lcd.getLastRightPos() + 19, 1, "R", SMLSIZE)

    -- draw channel numbers + frequencies
    lcd.drawText(1, 8, "1", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 8, "5865", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 8, "5733", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 8, "5705", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 8, "5740", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 8, "5658", SMLSIZE);

    lcd.drawText(1, 15, "2", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 15, "5845", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 15, "5752", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 15, "5685", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 15, "5760", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 15, "5695", SMLSIZE);

    lcd.drawText(1, 22, "3", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 22, "5825", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 22, "5771", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 22, "5665", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 22, "5780", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 22, "5732", SMLSIZE);

    lcd.drawText(1, 29, "4", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 29, "5805", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 29, "5790", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 29, "5645", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 29, "5800", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 29, "5769", SMLSIZE);

    lcd.drawText(1, 36, "5", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 36, "5785", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 36, "5809", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 36, "5885", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 36, "5820", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 36, "5806", SMLSIZE);

    lcd.drawText(1, 43, "6", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 43, "5765", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 43, "5828", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 43, "5905", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 43, "5840", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 43, "5843", SMLSIZE);

    lcd.drawText(1, 50, "7", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 50, "5745", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 50, "5847", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 50, "5925", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 50, "5860", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 50, "5880", SMLSIZE);

    lcd.drawText(1, 57, "8", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 57, "5725", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 57, "5866", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 57, "5945", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 57, "5880", SMLSIZE);
    lcd.drawText(lcd.getLastRightPos() + 4, 57, "5917", SMLSIZE);

    -- draw vertical dividers
    lcd.drawLine(  7, 1,   7, 62, SOLID, FORCE)
    lcd.drawLine( 31, 1,  31, 62, SOLID, FORCE)
    lcd.drawLine( 55, 1,  55, 62, SOLID, FORCE)
    lcd.drawLine( 79, 1,  79, 62, SOLID, FORCE)
    lcd.drawLine(103, 1, 103, 62, SOLID, FORCE)

    -- draw horizontal divider
    lcd.drawLine(  1, 6,  15, 6, SOLID, FORCE)
    lcd.drawLine( 22, 6,  39, 6, SOLID, FORCE)
    lcd.drawLine( 46, 6,  63, 6, SOLID, FORCE)
    lcd.drawLine( 70, 6,  87, 6, SOLID, FORCE)
    lcd.drawLine( 94, 6, 111, 6, SOLID, FORCE)
    lcd.drawLine(118, 6, 124, 6, SOLID, FORCE)
end

-- enlarged screen (left side)
local function draw_screen2()
    lcd.clear()

    -- draw channel numbers
    lcd.drawText(20,2,"1", 0)
    lcd.drawText(lcd.getLastRightPos() + 20,2,"2", 0)
    lcd.drawText(lcd.getLastRightPos() + 20,2,"3", 0)
    lcd.drawText(lcd.getLastRightPos() + 20,2,"4", 0)

    -- draw band letters + frequences
    lcd.drawText(2,12,"A", 0)
    lcd.drawLine(lcd.getLastRightPos() + 2, 1, lcd.getLastRightPos() + 2, 60, SOLID, FORCE)
    lcd.drawText(lcd.getLastRightPos() + 5,12,"5865", 0)
    lcd.drawLine(lcd.getLastRightPos() + 2, 1, lcd.getLastRightPos() + 2, 60, SOLID, FORCE)
    lcd.drawText(lcd.getLastRightPos() + 5,12,"5845", 0)
    lcd.drawLine(lcd.getLastRightPos() + 2, 1, lcd.getLastRightPos() + 2, 60, SOLID, FORCE)
    lcd.drawText(lcd.getLastRightPos() + 5,12,"5825", 0)
    lcd.drawLine(lcd.getLastRightPos() + 2, 1, lcd.getLastRightPos() + 2, 60, SOLID, FORCE)
    lcd.drawText(lcd.getLastRightPos() + 5,12,"5805", 0)
    lcd.drawLine(lcd.getLastRightPos() + 2, 1, lcd.getLastRightPos() + 2, 60, SOLID, FORCE)
    lcd.drawText(lcd.getLastRightPos() + 7, 9,"...", 0)

    lcd.drawText(2,22,"B", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,22,"5733", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,22,"5752", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,22,"5771", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,22,"5790", 0)
    lcd.drawText(lcd.getLastRightPos() + 7,19,"...", 0)

    lcd.drawText(2,32,"E", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,32,"5705", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,32,"5685", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,32,"5665", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,32,"5645", 0)
    lcd.drawText(lcd.getLastRightPos() + 7,29,"...", 0)

    lcd.drawText(2,42,"F", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,42,"5740", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,42,"5760", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,42,"5780", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,42,"5800", 0)
    lcd.drawText(lcd.getLastRightPos() + 7,39,"...", 0)

    lcd.drawText(2,52,"R", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,52,"5658", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,52,"5695", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,52,"5732", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,52,"5769", 0)
    lcd.drawText(lcd.getLastRightPos() + 7,49,"...", 0)

    -- draw horizontal dividers
    lcd.drawLine(1, 10, 124, 10, SOLID, FORCE)
    lcd.drawLine(1, 20, 124, 20, SOLID, FORCE)
    lcd.drawLine(1, 30, 124, 30, SOLID, FORCE)
    lcd.drawLine(1, 40, 124, 40, SOLID, FORCE)
    lcd.drawLine(1, 50, 124, 50, SOLID, FORCE)
    lcd.drawLine(1, 60, 124, 60, SOLID, FORCE)
end

-- enlarged screen (right side)
local function draw_screen3()
    lcd.clear()

    -- draw channel numbers
    lcd.drawText(35,2,"5", 0)
    lcd.drawText(lcd.getLastRightPos() + 20,2,"6", 0)
    lcd.drawText(lcd.getLastRightPos() + 20,2,"7", 0)
    lcd.drawText(lcd.getLastRightPos() + 20,2,"8", 0)

    -- draw band letters + frequences
    lcd.drawText(2,12,"A", 0)
    lcd.drawLine(lcd.getLastRightPos() + 2, 1, lcd.getLastRightPos() + 2, 60, SOLID, FORCE)
    lcd.drawText(lcd.getLastRightPos() + 7, 9, "...", 0)
    lcd.drawLine(lcd.getLastRightPos() + 3, 1, lcd.getLastRightPos() + 3, 60, SOLID, FORCE)
    lcd.drawText(lcd.getLastRightPos() + 6,12,"5785", 0)
    lcd.drawLine(lcd.getLastRightPos() + 2, 1, lcd.getLastRightPos() + 2, 60, SOLID, FORCE)
    lcd.drawText(lcd.getLastRightPos() + 5,12,"5765", 0)
    lcd.drawLine(lcd.getLastRightPos() + 2, 1, lcd.getLastRightPos() + 2, 60, SOLID, FORCE)
    lcd.drawText(lcd.getLastRightPos() + 5,12,"5745", 0)
    lcd.drawLine(lcd.getLastRightPos() + 2, 1, lcd.getLastRightPos() + 2, 60, SOLID, FORCE)
    lcd.drawText(lcd.getLastRightPos() + 5,12,"5725", 0)
    lcd.drawLine(lcd.getLastRightPos() + 2, 1, lcd.getLastRightPos() + 2, 60, SOLID, FORCE)

    lcd.drawText(2,22,"B", 0)
    lcd.drawText(lcd.getLastRightPos() + 7,19, "...", 0)
    lcd.drawText(lcd.getLastRightPos() + 6,22,"5809", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,22,"5828", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,22,"5847", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,22,"5866", 0)

    lcd.drawText(2,32,"E", 0)
    lcd.drawText(lcd.getLastRightPos() + 7,29, "...", 0)
    lcd.drawText(lcd.getLastRightPos() + 6,32,"5885", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,32,"5905", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,32,"5925", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,32,"5945", 0)

    lcd.drawText(2,42,"F", 0)
    lcd.drawText(lcd.getLastRightPos() + 7,39, "...", 0)
    lcd.drawText(lcd.getLastRightPos() + 6,42,"5820", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,42,"5840", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,42,"5860", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,42,"5880", 0)

    lcd.drawText(2,52,"R", 0)
    lcd.drawText(lcd.getLastRightPos() + 7,49, "...", 0)
    lcd.drawText(lcd.getLastRightPos() + 6,52,"5806", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,52,"5843", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,52,"5880", 0)
    lcd.drawText(lcd.getLastRightPos() + 5,52,"5917", 0)

    -- draw horizontal dividers
    lcd.drawLine(1, 10, 124, 10, SOLID, FORCE)
    lcd.drawLine(1, 20, 124, 20, SOLID, FORCE)
    lcd.drawLine(1, 30, 124, 30, SOLID, FORCE)
    lcd.drawLine(1, 40, 124, 40, SOLID, FORCE)
    lcd.drawLine(1, 50, 124, 50, SOLID, FORCE)
    lcd.drawLine(1, 60, 124, 60, SOLID, FORCE)
end

local function run_func(event)

    -- handle keypresses
    if event == EVT_ROT_RIGHT then
        if current_screen == 2 then
            current_screen = 3
        end
    elseif event == EVT_ROT_LEFT then
        if current_screen == 3 then
            current_screen = 2
        end
    elseif event == EVT_MENU_LONG then
        if current_screen == 1 then
            current_screen = 2
        else
            current_screen = 1
        end
    end

    -- draw current screen
    if current_screen == 1 then
        draw_screen1()
    elseif current_screen == 2 then
        draw_screen2()
    elseif current_screen == 3 then
        draw_screen3()
    end
end

return { run=run_func }
