
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
            printd("Vector2 print X: " .. self.x .. " Y:" .. self.y  .. "--> " .. self.orientation) 
        end 
    }
end

function timer()
    return {
        initTime = 0,
        finishtime = 0,
        getCurrent = function(self)
            return time() - self.initTime
        end,
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


function SpriteMessageBox(_x,_y,_h,_w,_sprite_array)
    -- Funcion que printa por pantalla un message box
    -- Ejemplo:
    -- sc.gui.SpriteMessage:addLine('esto es un mensaje')
    -- sc.gui.SpriteMessage:addLine('este es otro mensaje')
    -- sc.gui.SpriteMessage:setPos(0,7*8)
    -- sc.gui.SpriteMessage:setDimensions(7,14)
    -- sc.gui.SpriteMessage:show()
    return {
        x = _x,
        y = _y,
        h = _h,
        w = _w,
        sprites= {
            tl = _sprite_array[1],
            tm = _sprite_array[2],
            tr = _sprite_array[3],
            ml = _sprite_array[4],
            mm = _sprite_array[5],
            mr = _sprite_array[6],
            bl = _sprite_array[7],
            bm = _sprite_array[8],
            br = _sprite_array[9]
        },
        lineColor=7,
        lines = {},
        lineColors = {},
        linePositions = {},
        _isDisplay = false,
        update = function(self)
            local a = 1
        end,
        draw = function(self)
            if self._isDisplay then
                -- Pintamos la ventana
                -- TOP LEFT CORNER
                local xc = self.x
                local yc = self.y
                spr(self.sprites.tl,xc,yc)
                -- TOP MIDDLE
                for i = 1,self.w
                do 
                    xc += 8
                    spr(self.sprites.tm,xc,yc)
                end
                -- TOP RIGHT
                xc += 8
                spr(self.sprites.tr,xc,yc)
                -- MIDDLE MIDDLE
                yc += 8
                xc = self.x 
                for i = 1,self.h
                do 
                    spr(self.sprites.ml,xc,yc)
                    for j = 1,self.w
                    do 
                        xc += 8
                        spr(self.sprites.mm,xc,yc)
                    end
                    xc += 8
                    spr(self.sprites.mr,xc,yc)
                    xc = self.x 
                    yc += 8
                end
                --  BOTTOM LEFT
                xc = self.x
                spr(self.sprites.bl,xc,yc)
                 --  BOTTOM MIDDLE
                for i = 1,self.w
                do 
                    xc += 8
                    spr(self.sprites.bm,xc,yc)
                end
                --  BOTTOM RIGHT
                xc += 8
                spr(self.sprites.br,xc,yc)
                -- Pintamos el texto
                local mxc = self.x + 5
                local myc = self.y + 5
                local ccount = 1
                for line in all(self.lines) do
                    local ddx = mxc + self.linePositions[ccount].x
                    local ddy = myc + self.linePositions[ccount].y
                    print(line,ddx,ddy,self.lineColors[ccount])
                    myc += 8
                    mxc = self.x + 5
                    ccount+=1
                end
            end 
        end,
        setPos = function(self,_x,_y)
            self.x = _x
            self.y = _y
        end,
        setDimensions = function(self,_h,_w)
            self.h = _h
            self.w = _w
        end,
        show = function(self)
            self._isDisplay = true
        end,
        hide = function(self)
            self._isDisplay = false
            self.lines = {}
            self.lineColors = {}
            self.linePositions = {}
        end,
        addLine = function(self,messagel,mcolor,lx,ly)
            -- Sets the color
            if mcolor != nil then 
                add(self.lineColors, mcolor)
            else
                add(self.lineColors, self.lineColor)
            end
            -- Sets the position
            if lx and ly then
                add(self.linePositions, Vector2(lx,ly))
            else
                add(self.linePositions,Vector2(0,0))
            end 
            -- We add the message
            add(self.lines, messagel)
        end
    }
end 


IS_PRINTD_STATS_STARTED=false
debugTimer = timer()
function debugStats()
    if not DEBUG_STATS then return 0 end 
    debugTimer:sleep(3)
    if not debugTimer:isFinished() then return 0 end
    local curdate = stat(93) .. ':' .. stat(94)
    local message = curdate .. ' -> MEM:' .. stat(0) .. ' CPU: ' .. stat(1) .. ' CPU SYS: ' .. stat(2)
    message = message .. ' FRATE: ' .. stat(7)

    if not IS_PRINTD_STATS_STARTED then 
        printh( "****   "..GAME_ID.."   ****" , "stats.p8l",true)
        IS_PRINTD_STATS_STARTED = true
    end
    printh(message,"stats.p8l",false)
end 