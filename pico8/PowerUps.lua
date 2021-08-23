function CrossPowerUp(maincontroller)
    return {
        c = maincontroller,
        current_sprite = 79,
        activateSprite = 79,
        inactiveSprite = 94,
        shineSprite = 95, 
        alert_sfx = 2,
        effectTimeSeconds = 20000000,
        position = Vector2(14*8,0),
        t = timer(),
        animTimer = timer(),
        map = {
            left = Vector2(1*8,0),
            right = Vector2(14*8,0),
            up = Vector2(0,2*8),
            down = Vector2(0,13*8)
        },
        enabled = true,
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

-- *************++++++++********+
-- Bullet Power Ups
-- +*****************************

function Bullet(x,y,orientation,velocity,sprite)
    return {
        x = x,
        y = y,
        sprite = sprite,
        velocity = velocity,
        orientation = orientation,
        initTime = time(),
        enabled = true,
        draw = function(self)
            if self.enabled then
                spr(self.sprite,self.x,self.y)
            end
        end,
        update = function(self)
            -- self.orientation:print()
            self.x +=  -1 * self.velocity * self.orientation.x 
            self.y +=  -1 * self.velocity * self.orientation.y 
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

function BulletPowerUp(maincontroller)
    return {
        c = maincontroller,
        current_sprite = 76,
        activateSprite = 76,
        inactiveSprite = 94,
        shineSprite = 95, 
        alert_sfx = 2,
        bullet_sfx = 2,
        position = Vector2(13*8,0),
        effectTimeSeconds = PICKUP_POWERUP_BULLET_POWERDURATION_SECONDS,
        t = timer(),
        animTimer = timer(),
        canShotTimer = timer(),
        canShotFlag = true,
        bulletDuration = PICKUP_POWERUP_BULLET_BULLET_DURATION_SECONDS,
        enabled = true,
        bulletArray = {},
        -- +++++ Functions ++++++
        draw = function(self)
            spr(self.current_sprite,self.position.x,self.position.y)
            for bullet in all(self.bulletArray) do 
                bullet:draw()
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
            for bullet in all(self.bulletArray) do 
                bullet:update()
            end 
        end,
        mainFunction = function(self)
            -- Función de disparo
            if btnp(🅾️) and self.canShotFlag then
                local tmpc = deepcopy(c)
                add(self.bulletArray,Bullet(tmpc.x,tmpc.y,tmpc.orientation,PICKUP_POWERUP_BULLET_BULLET_VELOCITY,PICKUP_POWERUP_BULLET_BULLET_SPRITE))
                self.canShotFlag = false
            end 
            if not btn(🅾️) then
                self.canShotFlag = true
            end 
      
           -- Control de borrado
           for bullet in all(self.bulletArray) do 
                if time() > bullet.initTime +  self.bulletDuration then
                    del(self.bulletArray, bullet)
                end 
           end 
        end 
    }
end   