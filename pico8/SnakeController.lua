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
       velocity=3,
       x = _x,
       y = _y,
       _nx = 0,
       _ny = 0,
       overlaps = 0,
       w = 7,
       h = 7,
       sprites=_sprite,
       sprites_tail=_sprite_tail,
       orientation = Vector2(0,0),
       tail_array = {},
       tail_counter = 0,
       current_sprite = 1,
       draw = function(self)
          -- pintamos el resto del cuerpo
          for tail in all(self.tail_array) do
            tail:draw()
          end 
          -- pintamos la cabeza
          spr(self.sprites[self.current_sprite],self.x,self.y)
       end,
       update_tail = function(self)
        -- Se encarga de actualizar la posición del cuerpo de 
        -- la serpiente
            WIDTH = self.velocity
            local countx = 0
            local np = {}
            for tail in all(self.tail_array) do
                if countx == 0 then 
                    tail.pos = Vector2(self.x + WIDTH * self.orientation.x,self.y + WIDTH * self.orientation.y) 
                    add(np, SnakeTail(self.sprites_tail,self.x,self.y))
                else 
                    nowe = self.tail_array[countx]
                    add(np, SnakeTail(self.sprites_tail,nowe.pos.x,nowe.pos.y)) 
                end 
                countx += 1
            end 
            self.tail_array = np
       end,
       add_chain_to_tail = function(self)
        -- Anade un eslavon a la cadena
        WIDTH = self.velocity
        add(self.tail_array, SnakeTail(self.sprites_tail,self.tail_counter * WIDTH,0))
        self.tail_counter += 1
       end,
       move_player = function(self)
          -- Se encarga de desplazar al jugador por 
          -- pantalla
          if (btn(⬅️)) then
             self._nx-=self.velocity
             self.current_sprite=3
             self:update_tail()
             self.orientation:setPos(1,0)
          elseif (btn(➡️)) then
             self.current_sprite=4
             self._nx+=self.velocity
             self:update_tail()
             self.orientation:setPos(-1,0)
          elseif (btn(⬆️)) then
             self._ny-=self.velocity
             self.current_sprite=1
             self:update_tail()
             self.orientation:setPos(0,1)
          elseif (btn(⬇️)) then
             self._ny+=self.velocity
             self.current_sprite=2
             self:update_tail()
             self.orientation:setPos(0,-1)
          end
          -- validamos las colisiones
          if (can_move(self.x+self._nx,self.y,self.w,self.h,_collider_flag)) then
            self.x+=self._nx
          end
          if (can_move(self.x,self.y+self._ny,self.w,self.h,_collider_flag)) then
            self.y+=self._ny
          end
          self._nx,self._ny=0,0
       end
    }
 end