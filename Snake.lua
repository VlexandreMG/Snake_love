local Snake = {}

Snake.length = 2
Snake.state = true

function Snake.new(length,state)
    locals self = setmettable({},Snake)

    self.length = length
    self.state = state

    return self 
end


function Snake:getLength()
    return self.length
end


function Snake:setLength(length)
    self.length = length
end


function Snake:getState()
    return self.state
end


function Snake:setState(state)
    self.state = state
end