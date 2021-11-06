--[[
    Window Size of game with virtual low res for retro look
]]
push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

--[[
    Settings that runs once the game is booted up - Texture scaling
]]
function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

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
    Renders text on screen using LOVE 2D - Push functions ensures the text is rendered using virtual low res
]]
function love.draw()
    push:apply('start')
    love.graphics.printf('Hello World! Welcome to 1972.', 0, VIRTUAL_HEIGHT / 2 - 6, VIRTUAL_WIDTH, 'center')
    push:apply('end')
end