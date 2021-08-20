-- SnakeScene-INIT
function SnakeScene(scene_controller)
    return {
        sc = scene_controller,
        init = function(self)
            -- c = SnakeCharacterDebug(SNAKE_HEAD_SPRITES,SNAKE_BLOCK_SPRITES,SNAKE_INIT_POS_X,SNAKE_INIT_POS_Y,SNAKE_HEAD_COLLIDER_FLAG)
            c = SnakeCharacter(SNAKE_HEAD_SPRITES,SNAKE_BLOCK_SPRITES,SNAKE_INIT_POS_X,SNAKE_INIT_POS_Y,SNAKE_HEAD_COLLIDER_FLAG)
            tv = TerrainVector(TERRAIN_FLAG,TERRAIN_MAX_X,TERRAIN_MAX_Y) -- green
            pf = PickUpFactory(PICKUP_1_SPRITE,c,tv)
            pf:create(3)
        end,
        update = function(self)
            if c.alive then 
                c:move_player()
                pf:checkStatus(1)
            else
                sc.gui.SpriteMessage:hide()
                sc.gui.SpriteMessage:addLine('   game over')
                sc.gui.SpriteMessage:addLine('press button ❎')
                sc.gui.SpriteMessage:addLine('SCORE: ' .. c.overlaps )
                sc.gui.SpriteMessage:setPos(8*4,4*8)
                sc.gui.SpriteMessage:setDimensions(3,7)
                sc.gui.SpriteMessage:show()               
            end
        end,
        draw = function(self)
            cls()
            map(SNAKE_SCENE_MAP_X,SNAKE_SCENE_MAP_Y,0,0,MAP_MAX_X,MAP_MAX_Y)
            pf:draw()
            c:draw()
            print(c.overlaps,10,2,14)
            print(c.overlaps,11,2,8)
        end 
    }
end 