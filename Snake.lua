local Snake = {}
Snake.__index = Snake

function Snake.new(length,alive)
    locals self = setmettable({}, Snake)

    self.length = length or 2
    self.alive = alive ~= false

    return self 
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