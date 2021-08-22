function CrossPowerUp(maincontroller)
    return {
        c = maincontroller,
        current_sprite = 79,
        activateSprite = 79,
        inactiveSprite = 94,
        shineSprite = 95, 
        alert_sfx = 2,
        effectTimeSeconds = 20,
        position = Vector2(20,0),
        t = timer(),
        animTimer = timer(),
        map = {
            left = Vector2(1*8,0),
            right = Vector2(14*8,0),
            up = Vector2(0,2*8),
            down = Vector2(0,13*8)
        },
        enabled = false,
        draw = function(self)
            spr(self.current_sprite,self.position.x,self.position.y)
        end,
        timeUpdater= function(self)
            if self.enabled then 
                self.current_sprite = self.activateSprite
                self.t:sleep(self.effectTimeSeconds)
                if self.t:isFinished() then 
                    self.enabled = false
                end
                -- Control de parpadeo 
                if ( self.t:getCurrent()  > ( 0.95 * self.effectTimeSeconds ) ) then 
                    self.animTimer:sleep(0.05)
                    if self.animTimer:isFinished() then 
                        self.current_sprite = self.shineSprite
                        sfx(self.alert_sfx)
                    else 
                        self.current_sprite = self.activateSprite
                    end
                end 
            else 
                self.current_sprite = self.inactiveSprite
            end 
        end,
        update = function(self)
            if self.enabled then
                self:mainFunction()
            else
                c.alive = false
            end 
        end,
        mainFunction = function(self)
            if (c.orientation.x == 1 and c.orientation.y == 0) then
                --right
                c.x = self.map.right.x
            elseif c.orientation.x == -1 and c.orientation.y == 0  then 
                -- left
                c.x = self.map.left.x
                
            elseif c.orientation.x == 0  and c.orientation.y == 1  then 
                -- down
                c.y = self.map.down.y
            elseif c.orientation.x == 0  and c.orientation.y == -1 then
                -- up
                c.y = self.map.up.y
            end 
        end 
    }
end     