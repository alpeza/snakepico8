-- HomeScene-INIT
-- ❎🅾️⬇️⬅️⬆️➡️
function HomeScene(scene_controller)
    return {
        color_arr={8,12,7},
        cur_color=8,
        sc = scene_controller,
        total_c = 3,
        count = 0,
        init = function(self)
            music(1)
            self.t = timer()
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
        update = function(self)
            self:changeColor()
            if btn(❎) then
                sc:loadScene(SNAKE_SCENE_ID)
                sfx(7)
            end
            if btn(🅾️) then
                sc:loadScene(ABOUT_SCENE_ID)
            end 
        end,
        draw = function(self)
            cls()
            map(HOME_SCENE_MAP_X,HOME_SCENE_MAP_Y,0,0,MAP_MAX_X,MAP_MAX_Y)
            print("press button \151 ...", 16*2,16*3,self.cur_color)
            print("PRESS 🅾️ FOR THE ABOUT", 8*3,8*15,1)
        end 
    }
end 