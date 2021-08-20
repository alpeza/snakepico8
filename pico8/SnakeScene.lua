
-- SnakeScene-INIT
function SnakeScene()
    return {
        init = function(self)
            -- c = SnakeCharacterDebug(SNAKE_HEAD_SPRITES,SNAKE_BLOCK_SPRITES,SNAKE_INIT_POS_X,SNAKE_INIT_POS_Y,SNAKE_HEAD_COLLIDER_FLAG)
            c = SnakeCharacter(SNAKE_HEAD_SPRITES,SNAKE_BLOCK_SPRITES,SNAKE_INIT_POS_X,SNAKE_INIT_POS_Y,SNAKE_HEAD_COLLIDER_FLAG)
            tv = TerrainVector(TERRAIN_FLAG,TERRAIN_MAX_X,TERRAIN_MAX_Y) -- green
            pf = PickUpFactory(PICKUP_1_SPRITE,c,tv)
            pf:create(3)
        end,
        update = function(self)
            c:move_player()
            pf:checkStatus(1)
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