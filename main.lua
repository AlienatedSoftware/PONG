--[[
    Window Size of game with virtual low res for retro look
]]
push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

--[[
    Settings that runs once the game is booted up - Filter - Virtual Low Res - Font
]]
function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    smallFont = love.graphics.newFont('font.ttf', 8)
    love.graphics.setFont(smallFont)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

--[[
    Function to allow players to quit the game using the 'esc' key
]]
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

--[[
    Renders push.lua for virtual low res + rest of content commented
]]
function love.draw()
    push:apply('start')

    -- Clears colours and applies the true 1972 PONG colours
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)
    -- Renders text
    love.graphics.printf('Hello World! Welcome to 1972.', 0, 20, VIRTUAL_WIDTH, 'center')

    -- Left side player
    love.graphics.rectangle('fill', 10, 30, 5, 20)
    -- Right side player
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 50, 5, 20)
    -- Ball
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

    push:apply('end')
end