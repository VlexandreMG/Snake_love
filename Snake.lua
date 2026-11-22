local Snake = {}

Snake.length = 2
Snake.state = true

function Snake.new(length,state)
    locals self = setmettable({},Snake)

    self.length = length
    self.state = state

    return self 
end

-- ===== public int getA() { return this.a; } (getter) =====
function Snake:getLength()
    return self.length
end

-- ===== public void setA(int a) { this.a = a; } (setter) =====
function Snake:setLength(length)
    self.length = length
end