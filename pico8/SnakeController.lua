function can_move(x,y,w,h,flag)
    if (solid(x,y,flag)) return false
    if (solid(x+w,y,flag)) return false
    if (solid(x,y+h,flag)) return false
    if (solid(x+w,y+h,flag)) return false
      return true
 end
 
 function solid(x,y,mflag)
    local map_x=flr(x/8)
    local map_y=flr(y/8)
    local map_sprite=mget(map_x,map_y)
    local flag=fget(map_sprite)
    return flag==mflag
 end

function SnakeTail(_sprite,_x,_y)
    -- Objeto de la cola de serpiente
    return {
        pos = Vector2(_x,_y),
        sprites=_sprite,
        current_sprite = 1,
        orientation = Vector2(0,0),
       
        draw = function(self)
            spr(self.sprites[self.current_sprite],self.pos.x,self.pos.y)
        end,
        print = function(self)
            print("Orientation x: " .. self.orientation.x .. " y: " .. self.orientation.y) 
            print("Position x: " .. self.pos.x .. " y: " .. self.pos.y) 
        end 
    }
end 


function SnakeCharacter(_sprite,_sprite_tail, _x, _y, _collider_flag)
    return {
       velocity=SNAKE_DEFAULT_VELOCITY,
       x = _x,
       y = _y,
       _nx = 0,
       _ny = 0,
       overlaps = 0,
       w = 7,
       h = 7,
       particles = Particles(),
       sprites=_sprite,
       sprites_tail=_sprite_tail,
       orientation = Vector2(0,0),
       tail_array = {},
       tail_counter = 0,
       current_sprite = 1,
       alive = true,
       -- SnakePower Ups
       crossPower = CrossPowerUp(self),
       bulletPower = BulletPowerUp(self),
       cuttailPower = TailCutPowerUp(self),
       -- functions
       draw = function(self)
          self.particles:draw()
          self.crossPower:draw()
          self.bulletPower:draw()
          self.cuttailPower:draw()
          -- pintamos el resto del cuerpo
          for tail in all(self.tail_array) do
            tail:draw()
          end 
          -- pintamos la cabeza
          spr(self.sprites[self.current_sprite],self.x,self.y)
       end,
       update_tail = function(self)
        -- Se encarga de actualizar la posici??n del cuerpo de 
        -- la serpiente
            WIDTH = self.velocity
            local countx = 0
            local np = {}
            for tail in all(self.tail_array) do
                if countx == 0 then 
                    local nposx = self.x + SNAKE_BLOCK_WIDTH * self.orientation.x
                    local nposy = self.y + SNAKE_BLOCK_HEIGHT * self.orientation.y
                    tail.pos = Vector2(nposx,nposy) 
                    add(np, SnakeTail(self.sprites_tail,self.x,self.y))
                else 
                    nowe = self.tail_array[countx]
                    add(np, SnakeTail(self.sprites_tail,nowe.pos.x,nowe.pos.y))
                    -- validamos si hay colision
                    if self.x == nowe.pos.x and self.y == nowe.pos.y and countx > SNAKE_BLOCK_LENGTH_COLLISION then 
                        -- printd("Colision en x: " .. self.x .. " cola: " .. countx)
                        self.alive = false
                    end  
                end 
                countx += 1
            end 
            self.tail_array = np
       end,
       add_chain_to_tail = function(self)
        -- Anade un eslavon a la cadena
        WIDTH = self.velocity
        add(self.tail_array, SnakeTail(self.sprites_tail,self.tail_counter * WIDTH,-100))
        self.tail_counter += 1
       end,
       move_player = function(self)
          self.crossPower:timeUpdater()
          self.bulletPower:timeUpdater()
          self.bulletPower:update()
          self.cuttailPower:timeUpdater()
          self.cuttailPower:update()
          -- Se encarga de desplazar al jugador por 
          -- pantalla
          trail_width = 0.5
          trail_colors = {12,13,7}
          trail_colors = {12,11,5,1}
          trail_amount = 1

          self.particles:update()
          if (self.orientation.x == 1 and self.orientation.y == 0)     then self._nx-=self.velocity 
          elseif self.orientation.x == -1 and self.orientation.y == 0  then self._nx+=self.velocity
          elseif self.orientation.x == 0  and self.orientation.y == 1  then self._ny-=self.velocity
          elseif self.orientation.x == 0  and self.orientation.y == -1 then self._ny+=self.velocity end
          if (btn(??????) and self.orientation.orientation != "R") then
             self.current_sprite=3
             self:update_tail()
             self.orientation:setPos(1,0)
             self.particles:effect_explode(self.x + 3,self.y + 3 ,trail_width,trail_colors,trail_amount)
          elseif (btn(??????) and self.orientation.orientation != "L") then
             self.current_sprite=4
             self:update_tail()
             self.orientation:setPos(-1,0)
             self.particles:effect_explode(self.x + 3,self.y + 3 ,trail_width,trail_colors,trail_amount)
          elseif (btn(??????) and self.orientation.orientation != "D") then
             self.current_sprite=1
             self:update_tail()
             self.orientation:setPos(0,1)
             self.particles:effect_explode(self.x + 3,self.y + 3 ,trail_width,trail_colors,trail_amount)
          elseif (btn(??????) and self.orientation.orientation != "U") then
             self.current_sprite=2
             self:update_tail()
             self.orientation:setPos(0,-1)
             self.particles:effect_explode(self.x + 3,self.y + 3 ,trail_width,trail_colors,trail_amount)

          end
          -- validamos las colisiones
          if (can_move(self.x+self._nx,self.y,self.w,self.h,_collider_flag)) then
            self.x+=self._nx
          else 
            self.crossPower:update()
          end
          if (can_move(self.x,self.y+self._ny,self.w,self.h,_collider_flag)) then
            self.y+=self._ny
          else 
            self.crossPower:update()
          end
         
          self._nx,self._ny=0,0
          self:update_tail()
       end
    }
 end