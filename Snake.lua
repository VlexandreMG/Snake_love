local Snake = {}
Snake.__index = Snake

function Snake.new(x,y,size,length,alive)
    local self = setmettable({}, Snake)

    self.x = x or 100
    self.y = y or 100
    self.size = size or 20
    self.length = length or 2
    self.alive = alive ~= false

    return self 
end

function Snake:draw()
    love.graphics.setColor(0, 1, 0)   -- vert (r, g, b entre 0 et 1)
    love.graphics.rectangle("fill", self.x, self.y, self.size, self.size)
    love.graphics.setColor(1, 1, 1)   -- remet la couleur par défaut (blanc)
end


function Snake:getLength()
    return self.length
end


function Snake:setLength(length)
    self.length = length
end


function Snake:getAlive()
    return self.alive
end


function Snake:setAlive(alive)
    self.alive = alive
end

return Snake 