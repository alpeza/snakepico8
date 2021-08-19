function Vector2(px,py)
    return {
        x = px,
        y = py,
        setPos = function(self,px,py)
            self.x = px
            self.y = py
        end,
        getPos = function(self)
            retur {self.x, self.y}
        end,
        add = function(self,mx,my)
            self.x += mx 
            self.y += my
        end,
        vecmult = function(self,vector)
            self.x *= vector.x 
            self.y *= vector.y
        end,
        mult = function(self,mx,my)
            self.x *= mx 
            self.y *= my
        end,
        print = function(self)
            print("X: " .. self.x .. " Y:" .. self.y)
        end 
    }
end

function timer()
    return {
        initTime = 0,
        finishtime = 0,
        sleep = function(self,seconds)
            if self.initTime == 0 then
                self.initTime = time()
                self.finishtime = self.initTime + seconds
            end
        end,
        isFinished = function(self)
            if time() > self.finishtime then 
                self.finishtime = 0
                self.initTime = 0
                return true 
            else 
                return false
            end 
        end 
    }
end 