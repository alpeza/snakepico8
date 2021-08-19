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
                randv = flr(rnd(self.total_bitmaps))
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

function PickUp(_sprite, _x, _y, overlap_obj,_points)
    -- Gestor de una pickup
    return {
      x = _x,
      y = _y,
      w = 7,
      h = 7,
      t = timer(),
      points=_points,
      sprite = _sprite,
      isActive = true,
      draw = function(self)
         -- printa el sprite
         if (self.isActive) then
            spr(self.sprite,self.x,self.y)
         end
         -- self:printMessage()
      end,
      isOverlaping = function(self)
        if (overlap(overlap_obj,self)) then
            self.isActive = false
            overlap_obj.overlaps += 1
            -- anadimos un bloque a la serpiente
            overlap_obj:add_chain_to_tail()
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
        tv=terrainvector_obj,
        create = function(self, total)
            -- Anade pickups al array de pickups
            for i=1,total do
                r = self.tv:fetchRandom()
                -- r:print()
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
                    del(self.pickups,pickup)
                    self:create(total)
                end 
            end 
        end 
    }
end 