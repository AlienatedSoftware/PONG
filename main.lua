--[[
    Window Size of game
]]

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

--[[
    Settings that runs once the game is booted up
]]

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

--[[
    Renders text on screen using LOVE 2D
]]

function love.draw()
    love.graphics.printf(
        'Hello World! Welcome to 1972.',
        0,
        WINDOW_HEIGHT / 2 - 6,
        WINDOW_WIDTH,
        'center')
end