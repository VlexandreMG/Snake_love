local Snake = require("Snake")   -- charge Snake.lua

local snake

function love.load()
    snake = Snake.new(200, 150, 20)   -- l'équivalent de : new Snake(200, 150, 20)
end

function love.draw()
    snake:draw()
end