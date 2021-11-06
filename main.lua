--[[
    Window Size of game with virtual low res for retro look
]]
push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

--[[
    Player speed
]]
PADDLE_SPEED = 200

--[[
    Settings that runs once the game is booted up - Filter - Virtual Low Res - Font
]]
function love.load()
    -- Texture filter
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- Font properties
    smallFont = love.graphics.newFont('font.ttf', 8)
    scoreFont = love.graphics.newFont('font.ttf', 32)
    love.graphics.setFont(smallFont)

    -- Screen settings
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    -- Used for rendering player scores
    player1Score = 0
    player2Score = 0

    -- Player positions on Y axis
    player1Y = 30
    player2Y = VIRTUAL_HEIGHT - 50
end

--[[
    Runs every frame, with "dt" passed in, our delta in seconds since the last frame, which LÖVE2D supplies us.
]]
function love.update(dt)
    if love.keyboard.isDown('w') then
        player1Y = player1Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('s') then
        player1Y = player1Y + PADDLE_SPEED * dt
    end

    if love.keyboard.isDown('up') then
        player2Y = player2Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('down') then
        player2Y = player2Y + PADDLE_SPEED * dt
    end
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
    Rendering content
]]
function love.draw()
    -- Renders the push.lua for low res
    push:apply('start')

    -- Clears colours and applies the true 1972 PONG colours
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)
    -- Renders text
    love.graphics.setFont(smallFont)
    love.graphics.printf('Hello World! Welcome to 1972.', 0, 20, VIRTUAL_WIDTH, 'center')

    -- Player scores on left and right of center with it's own font properties
    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 3)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)

    -- Left side player
    love.graphics.rectangle('fill', 10, player1Y, 5, 20)
    -- Right side player
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, player2Y, 5, 20)
    -- Ball
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

    push:apply('end')
end