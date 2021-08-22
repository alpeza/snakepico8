-- SnakeScene-INIT
function SnakeScene(scene_controller)
    return {
        color_arr={8,12,7},
        cur_color=8,
        sc = scene_controller,
        total_c = 3,
        count = 0,
        init = function(self)
            c = SnakeCharacter(SNAKE_HEAD_SPRITES,SNAKE_BLOCK_SPRITES,SNAKE_INIT_POS_X,SNAKE_INIT_POS_Y,SNAKE_HEAD_COLLIDER_FLAG)
            tv = TerrainVector(TERRAIN_FLAG,TERRAIN_MAX_X,TERRAIN_MAX_Y) -- green
            -- Pickup factory de manzanas
            pf = PickUpFactory(PICKUP_1_SPRITE,c,tv)
            self.t = timer()
            pf:create(3)
        end,
        update = function(self)
            if c.alive then 
                c:move_player()
                pf:checkStatus(1)
            else
                self:gameOverHandler()
            end
        end,
        draw = function(self)
            cls()
            map(SNAKE_SCENE_MAP_X,SNAKE_SCENE_MAP_Y,0,0,MAP_MAX_X,MAP_MAX_Y)
            pf:draw()
            c:draw()
            print(c.overlaps,10,2,14)
            print(c.overlaps,11,2,8)
        end,
        changeColor = function(self)
            self.t:sleep(0.09)
            if self.t:isFinished() then
                self.count += 1
                if self.count > self.total_c then
                    self.count = 1
                end
                self.cur_color = self.color_arr[self.count]
            end
        end,
        gameOverHandler = function(self)
            self:changeColor()
            sc.gui.SpriteMessage:hide()
            sc.gui.SpriteMessage:addLine('game over',7,16,0)
            sc.gui.SpriteMessage:addLine('press ❎ button',self.cur_color,6,0)
            sc.gui.SpriteMessage:addLine('SCORE: ' .. c.overlaps,7,-1,10)
            sc.gui.SpriteMessage:setPos(8*3,5*8)
            sc.gui.SpriteMessage:setDimensions(3,8)
            sc.gui.SpriteMessage:show()
            if (btn(❎)) then
                -- Hacemos respawn de todos los elementos de la escena
                self:init()
                sc:loadScene(HOME_SCENE_ID)
                sc.gui.SpriteMessage:hide()
            end
        end 
    }
end 