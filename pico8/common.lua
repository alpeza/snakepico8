
IS_PRINTD_STARTED=false
function printd(data)
    -- Printa logs para debug
    if GAME_LOGS then 
        if not IS_PRINTD_STARTED then 
            printh( "****   "..GAME_ID.."   ****" , "pico8.p8l",true)
            IS_PRINTD_STARTED = true
        end 
        printh(GAME_ID .. ": " .. data,"pico8.p8l",false)
    end 
end 

function Vector2(px,py)
    return {
        x = px,
        y = py,
        orientation = "N",
        setPos = function(self,px,py)
            self.x = px
            self.y = py
            self:calcorientation()
        end,
        calcorientation = function(self)
            if self.x == 1  and self.y == 0  then self.orientation = "L" end
            if self.x == -1 and self.y == 0  then self.orientation = "R" end
            if self.x == 0  and self.y == 1  then self.orientation = "U" end
            if self.x == 0  and self.y == -1 then self.orientation = "D" end
        end,
        getPos = function(self)
            return {self.x, self.y}
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
            printd("X: " .. self.x .. " Y:" .. self.y)
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