function overlap(a,b)
	return not (a.x>b.x+b.w or
	            a.y>b.y+b.h or
	            a.x+a.w<b.x or
	            a.y+a.h<b.y)
end 


function TerrainVector(_flag,_x_max,_y_max)
    return {
        flag = _flag,
        x_max = _x_max,
        y_max = _y_max,
        positions = {},
        total_bitmaps = 0,
        load_terrain_vector = function(self)
            for vary=0,self.y_max do
                for varx=0,self.x_max do
                    tmpflag=fget(mget(varx,vary))
                    if tmpflag == self.flag then
                        -- print("x:" .. varx .. " y:" .. vary .. " f:"  .. tmpflag)
                        self.total_bitmaps += 1
                        add(self.positions,Vector2(varx,vary))
                    end 
                end
            end
        end,
        fetchRandom = function(self)
            self:load_terrain_vector()
            if self.total_bitmaps > 0 then 
                randv = flr(1 + rnd(self.total_bitmaps))
                -- print("Rand: " .. randv .. "/" .. self.total_bitmaps)
                randpos = self.positions[randv]
                -- limpiamos
                self.positions = {}
                self.total_bitmaps = 0
                return randpos
            else 
                return Vector2(0,0)
            end 
        end 
    }
end 

function PickUp(_sprite, _x, _y, overlap_obj,_points,_type)
    -- Gestor de una pickup
    return {
      x = _x,
      y = _y,
      w = 7,
      h = 7,
      t = timer(),
      type = _type,
      particles = Particles(),
      points=_points,
      sprite = _sprite,
      isActive = true,
      draw = function(self)
         self.particles:draw()
         if (self.isActive) then
            spr(self.sprite,self.x,self.y)
         end
      end,
      execParticles = function(self)
        self.particles:update()
        self.particles:effect_explode(self.x + 3,self.y + 3 ,2,{7,8,14,15},0.6)
      end,
      isOverlaping = function(self)
        if (overlap(overlap_obj,self) and self.isActive) then
            -- Food pickup
            if not self.type then 
                sfx(0)
                overlap_obj.overlaps += 1
                overlap_obj:add_chain_to_tail()
            -- Cross pickup
            elseif self.type == PICKUP_POWERUP_CROSS_ID then
                overlap_obj.crossPower.enabled = true
            -- Bullet pickup
            elseif self.type == PICKUP_POWERUP_BULLET_ID then
                overlap_obj.bulletPower.enabled = true
            end 
            -- Desactivamos el pickup
            self.isActive = false
        end 
      end 
    }
end

function PickUpFactory(sprite,_overlap_obj,terrainvector_obj)
    -- Factoria de pickups
    return {
        sprite = _sprite,
        overlap_obj = _overlap_obj,
        pickups={},
        t = timer(),
        tv=terrainvector_obj,
        create = function(self, total)
            -- Anade pickups al array de pickups
            for i=1,total do
                r = self.tv:fetchRandom()
                add(self.pickups,PickUp(self.sprite,r.x * 8,r.y * 8,self.overlap_obj))
            end
        end,
        draw = function(self)
            for pickup in all(self.pickups) do
                pickup:draw()
            end 
        end,
        checkStatus = function(self,total)
            for pickup in all(self.pickups) do
                pickup:isOverlaping()
                if not pickup.isActive then
                    self.t:sleep(0.3)
                    if self.t:isFinished() then
                        del(self.pickups,pickup)
                        self:create(total)
                    else 
                        pickup:execParticles()
                    end
                end 
            end 
        end 
    }
end 



function PowerUpPickUpFactory(_overlap_obj,terrainvector_obj) 
    return {
        overlap_obj = _overlap_obj,
        pickups={},
        t = timer(),
        lastOverlaped = 0,
        cross_powerup_enabled = true,
        tv=terrainvector_obj,
        create = function(self)
            -- CROSS POWER UP
            if self.cross_powerup_enabled and self.overlap_obj.overlaps % 10 == 0 and self.overlap_obj.overlaps > self.lastOverlaped then  
                local r = self.tv:fetchRandom()
                local randval = flr(rnd(PICKUP_POWERUP_CROSS_PROB)) + 1
                printd("Overlap: " .. self.overlap_obj.overlaps .. "  Aparece el valor: " .. randval)
                self.lastOverlaped = self.overlap_obj.overlaps
                if randval == 1 then 
                    self.cross_powerup_enabled = false
                    add(self.pickups,PickUp(PICKUP_POWERUP_CROSS_SPRITE, r.x * 8, r.y * 8, self.overlap_obj,_points,PICKUP_POWERUP_CROSS_ID))
                end
            end
            -- OTHER POWER UPS 
        end,
        draw = function(self)
            for pickup in all(self.pickups) do
                pickup:draw()
            end 
        end,
        checkStatus = function(self)
            -- Creacion de powerups
            self:create()
            -- Control de powerups
            for pickup in all(self.pickups) do
                pickup:isOverlaping()
                if not pickup.isActive then
                    self.t:sleep(0.3)
                    if self.t:isFinished() then
                        del(self.pickups,pickup)
                        if pickup.type == PICKUP_POWERUP_CROSS_ID then
                            self.cross_powerup_enabled = true
                        end 
                    else 
                        pickup:execParticles()
                    end
                end 
            end 
        end 
    }
end 