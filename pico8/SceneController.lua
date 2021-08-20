-- Script para la gestion de escenas
--

function SceneController(scenes_array)
    return {
        secenes = scenes_array,
        current_scene_id = 0,
        current_scene ={},
        gui = {
            SpriteMessage = SpriteMessageBox(0,0,1,1,SPRITE_MESSAGE_SPRITES)
        },
        init = function(self)
            for mscene in all(self.secenes) do
                mscene:init()
            end 
        end,
        update = function(self)
           if self.current_scene_id != 0 then
                self.current_scene:update()
                self.gui.SpriteMessage:update()
           end
        end,
        draw = function(self)
            if self.current_scene_id == 0 then
                cls()
                local sct="scene controller"
                print(sct,10,10,24)
                print(sct,11,10,18)
                print("please load a scene ...", 10,20,7)
                print("scene > 0", 10,28,7)
            else 
                self.current_scene:draw()
                self.gui.SpriteMessage:draw()
            end 
        end,
        loadScene = function(self, pscene)
            self.current_scene_id = pscene
            self.current_scene = self.secenes[pscene]
        end 
    }
end