function PlotMessage(message,initPos)
    return {
        initPos = initPos,
        position = Vector2(initPos,15*8 + 2),
        message = message,
        t = timer(),
        velocity = 3,
        flick = 0.05,
        colors = {14,7,12},
        currentColor = 1,
        init = function(self)
            local a = 1
        end, 
        isEnabled = true,
        draw = function(self)
            print(self.message, self.position.x, self.position.y,self.colors[self.currentColor])
        end,   
        mainfun = function(self)
            self.t:sleep(self.flick)
            if self.t:isFinished() then
                if  self.position.x < 8*16 then 
                    self.position.x += self.velocity
                else 
                    self.position.x = self.initPos
                    self.isEnabled = false
                end

                if #self.colors < self.currentColor then 
                    self.currentColor = 1
                else 
                    self.currentColor += 1
                end 
            end 
        end, 
        update = function(self)
            if self.isEnabled then 
                self:mainfun()
            end 
        end     
    }
end 


function CrossPowerUp(maincontroller)
    return {
        c = maincontroller,
        current_sprite = 79,
        activateSprite = 79,
        inactiveSprite = 94,
        shineSprite = 95, 
        message = PICKUP_POWERUP_CROSS_MESSAGE,
        alert_sfx = 2,
        pm = PlotMessage("cross the walls", -8*8),
        effectTimeSeconds = PICKUP_POWERUP_CROSS_POWERDURATION_SECONDS,
        position = Vector2(14*8,0),
        t = timer(),
        animTimer = timer(),
        map = {
            left = Vector2(1*8,0),
            right = Vector2(14*8,0),
            up = Vector2(0,2*8),
            down = Vector2(0,13*8)
        },
        enabled = false,
        isEnabled = function(self)
            return self.enabled
        end,
        draw = function(self)
            spr(self.current_sprite,self.position.x,self.position.y)

            -- Mensaje de ayuda
            if self.enabled then
                self.pm:draw()
                self.pm:update()
            end
        end,
        timeUpdater= function(self)
            if self.enabled then 
                self.current_sprite = self.activateSprite
                self.t:sleep(self.effectTimeSeconds)
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
                if self.t:isFinished() then 
                    self.enabled = false
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

-- *************++++++++********+
-- Bullet Power Ups
-- +*****************************

function Bullet(x,y,orientation,velocity,sprite)
    return {
        x = x,
        y = y,
        w = 8,
        h = 8,
        sprite = sprite,
        velocity = velocity,
        orientation = orientation,
        particles = Particles(),
        particles_trail_width = 4,
        particles_trail_colors = {14,1,0},
        particles_trail_amount = 2,
        initTime = time(),
        enabled = true,
        isEnabled = function(self)
            return self.enabled
        end,
        draw = function(self)
            if self.enabled then
                spr(self.sprite,self.x,self.y)
            end
            self.particles:draw()
        end,
        update = function(self)
            -- self.orientation:print()
            self.x +=  -1 * self.velocity * self.orientation.x 
            self.y +=  -1 * self.velocity * self.orientation.y 
            -- Particulas
            self.particles:update()
            self.particles:effect_bullet(self.x,self.y,
            self.particles_trail_width,self.particles_trail_colors,
            self.particles_trail_amount)
        end
    }
end 

function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

bulletArray = {}
function BulletPowerUp(maincontroller)
    return {
        c = maincontroller,
        current_sprite = 76,
        activateSprite = 76,
        inactiveSprite = 94,
        shineSprite = 95, 
        alert_sfx = 2,
        bullet_sfx = 3,
        position = Vector2(13*8,0),
        pm = PlotMessage("press button 🅾️ to shoot ", -16*8),
        effectTimeSeconds = PICKUP_POWERUP_BULLET_POWERDURATION_SECONDS,
        t = timer(),
        animTimer = timer(),
        canShotTimer = timer(),
        canShotFlag = true,
        bulletDuration = PICKUP_POWERUP_BULLET_BULLET_DURATION_SECONDS,
        enabled = false,
        isEnabled = function(self)
            return self.enabled
        end,
        cbulletArray = bulletArray,
        -- +++++ Functions ++++++
        draw = function(self)
            spr(self.current_sprite,self.position.x,self.position.y)
            for bullet in all(self.cbulletArray) do 
                bullet:draw()
            end 
            -- Mensaje de ayuda
            if self.enabled then
                self.pm:draw()
                self.pm:update()
            end
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
            end
            -- Actializamos la posición de los bullets 
            for bullet in all(self.cbulletArray) do 
                bullet:update()
            end 
        end,
        mainFunction = function(self)
            -- Función de disparo
            if btnp(🅾️) and self.canShotFlag then
                sfx(self.bullet_sfx)
                local tmpc = deepcopy(c)
                add(self.cbulletArray,Bullet(tmpc.x,tmpc.y,tmpc.orientation,PICKUP_POWERUP_BULLET_BULLET_VELOCITY,PICKUP_POWERUP_BULLET_BULLET_SPRITE))
                self.canShotFlag = false
            end 
            if not btn(🅾️) then
                self.canShotFlag = true
            end 
      
           -- Control de borrado
           for bullet in all(self.cbulletArray) do 
                if time() > bullet.initTime +  self.bulletDuration then
                    del(self.cbulletArray, bullet)
                end 
           end 
        end 
    }
end   


function TailCutPowerUp(maincontroller)
    return {
        c = maincontroller,
        current_sprite = 78,
        activateSprite = 78,
        inactiveSprite = 94,
        shineSprite = 95,
        totalCut = 10,
        effectTimeSeconds = 1,
        alert_sfx = 2,
        position = Vector2(12*8,0),
        t = timer(),
        animTimer = timer(),
        enabled = false,
        isEnabled = function(self)
            return self.enabled
        end,
        -- +++++ Functions ++++++
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
            end
        end,
        mainFunction = function(self)
            local deletes=1
            if #c.tail_array >= self.totalCut then 
                for i=1,self.totalCut do 
                    c.tail_array[#c.tail_array] = nil
                end
                self.enabled = false
            end 
        end 
    }
end   