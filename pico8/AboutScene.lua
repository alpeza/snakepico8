-- HomeScene-INIT
-- βπΎοΈβ¬οΈβ¬οΈβ¬οΈβ‘οΈ
function AboutScene(scene_controller)
    return {
        color_arr={8,12,7},
        cur_color=8,
        sc = scene_controller,
        total_c = 3,
        count = 0,
        gui =  SpriteMessageBox(0,0,14,14,{12,13,14,28,29,30,44,45,46}),
        init = function(self)
            self.t = timer()
        end,
        update = function(self)
            self.gui:update()
            if btn(β¬οΈ) then
                sc:loadScene(HOME_SCENE_ID)
            end 
        end,
        draw = function(self)
            cls(1)
            self.gui:hide()
            self.gui:addLine(' β classical nft β ',2,3*8-5,0)
            self.gui:show()
            self.gui:addLine(" π collection id: #0",7,5,5)
            self.gui:addLine(" π± developer:     @ALPEZA",7,5,5)
            self.gui:addLine("β§β§β§β§β§β§β§β§β§β§β§β§β§β§",2,5,10)
            self.gui:addLine(" β ethereum author β ",2,14,15)
                      

            self.gui:addLine("β¬οΈ Back to home",12,4*8-5,8*8)
            self.gui:draw()
        end 
    }
end 