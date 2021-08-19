-- https://mboffin.itch.io/
-- Clase de controlador de un jugador
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

function SimpleCharacter(_sprite, _x, _y, _collider_flag)
   return {
      x = _x,
      y = _y,
      _nx = 0,
      _ny = 0,
      overlaps = 0,
      w = 7,
      h = 7,
      sprites=_sprite,
      current_sprite = 1,
      draw = function(self)
         -- printa el sprite
         spr(self.sprites[self.current_sprite],self.x,self.y)
      end,
      move_player = function(self)
         -- Se encarga de desplazar al jugador por 
         -- pantalla
         if (btn(⬅️)) then
            self._nx-=1
            self.current_sprite=3
         elseif (btn(➡️)) then
            self.current_sprite=4
            self._nx+=1
         elseif (btn(⬆️)) then
            self._ny-=1
            self.current_sprite=1
         elseif (btn(⬇️)) then
            self._ny+=1
            self.current_sprite=2
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