pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
-- JASnake for Pico8
-- by @alpeza
-- 🐱 github: https://github.com/alpeza/snakepico8.git
#include GameConfig.lua
#include SceneController.lua
#include common.lua
#include Particles.lua
-->8
-- SNAKE SCENE
#include SnakeController.lua
#include PickUp.lua
#include SnakeScene.lua
#include HomeScene.lua
#include AboutScene.lua
#include PowerUps.lua
-->8
--- Programa principal
function _init()
    sc = SceneController({
        HomeScene(sc),
        SnakeScene(sc),
        AboutScene(sc)
    })
    sc:init()
    sc:loadScene(HOME_SCENE_ID)
end 

function _update()
    sc:update()
end 

function _draw()
    sc:draw()
end 

__gfx__
0000bb000000bb00555555568e000088880000880000bb00cccccccccccccccccccccccc8888888888888888888888887e28222222222222222282e700000000
000b3300000b3300577777a688e0082888800888000b3300ceeeeeeeeeeeeeeeeeeeeeec821212121212121212121218e2921111111111111111292e00000000
000400000004000057555576808882088088880800040000ce20202020202020202020ec8121212121212121212121282a21555555555555555512a200000000
008eee00008eee00575756768008800880088008008eee00ce02020202020202020202ec821111111111111111111218b2150000000000000000512b00000000
088ef7e0088ef7e0575576768008800880088008088ef7e0ce20000000000000000020ec81211111111111111111112821500000000000000000051200000000
088effe0088effe05756667680888e0880888808088effe0ce02000000000000000002ec82111111111111111111121821500000000000000000051200000000
0888ee800888ee8057777776882008e8888008880888ee80ce20000000000000000020ec81211111111111111111112821500000000000000000051200000000
008888000000000066666666820000888800008800888800ce02000000000000000002ec82111111111111111111121821500000000000000000051200000000
0000000000bbbb0000000000000000000000000000000000ce20000000000000000020ec81211111111111111111121821500000000000000000051200000000
00000000003bb30000000000000000000000000000000000ce02000000000000000002ec8211111111111111111111282150000000000000000005120bbbb7b0
000bb000007bb7000b3bbb3553bbb3b00000000000000000ce20000000000000000020ec8121111111111111111112182150000000000000000005120aaa7a70
003bb300007bb7000b733353353337b00005b00000000000ce02000000000000000002ec82111111111111111111112821500000000000000000051209999790
007bb700003bb3000b73b333333b37b0000bb00000000000ce20000000000000000020ec81211111111111111111121821500000000000000000051207777870
007bb700000bb0000b3333000b3333b00000000000000000ce02000000000000000002ec82111111111111111111112821500000000000000000051207272720
003bb3000000000000bbb00000bbb0000000000000000000ce20000000000000000020ec8121111111111111111112182150000000000000000005120777ccc0
00bbbb000000000000000000000000000000000000000000ce02000000000000000002ec82111111111111111111112821500000000000000000051207cccc00
888888888000000888888888800000080000000000000000ce20000000000000000020ec81211111111111111111121821500000000000000000051200000000
0800008e880000888800008e8800008e0000000000000000ce02000000000000000002ec82111111111111111111112821500000000000000000051200000000
008008e0808008e8808008e8808008e80000000000000000ce20000000000000000020ec81211111111111111111121821500000000000000000051200000000
00088e0080088e0880088e0880088e080000000000000000ce02000000000000000002ec82111111111111111111112821500000000000000000051200000000
000880008008800880088008800880080000000000000000ce20202020202020202020ec812111111111111111111218b2150000000000000000512b00000000
008e0800808e0808808e0808808e08080000000000000000ce02020202020202020202ec8212121212121212212121282a21555555555555555512a200000000
08e0008088e0008880e0008888e000880000000000000000ceeeeeeeeeeeeeeeeeeeeeec812121212121212112121218e2921111111111111111292e00000000
888888888e0000088e0000088e8888880000000000000000cccccccccccccccccccccccc8888888888888888888888887e28222222222222222282e700000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000088888880000000000000000000000000000000000000000bbbbbbbb0001000000000000000011000000000000000000000000000000000000000000
0000000088b7b7b88008000088000088800008800080088888880000aaaaaaaa0001000000000000001133100000000000000000000000000000000000000000
0000002883bbbb7780888000880000888800088008880888888800009999799900010000000100000133bb310001111005666675056666750566667505666675
000000283bb88878808888008800088888800880888008800000000088878788011111000011100013bb1bb310173310551cc7c5559aa7a5553bb7b5558ee7e5
000000288bbb8888808888808800080008800888880008800000000077272722000100000001000013b101b33133331015117115159979951533733515887885
00000028888bbbb88088088888008800088008888000088888800000c7cc7ccc000100000001000013b1001b33b3371001676661016766610167666101676661
000000288b888bbb808800888800880008800888880008800000000077c7c7cc0001000000000000133b1001b33b310000000000000000000000000000000000
000000283bb888bb80880008880888888880088088800880000000007cc7c7c00001000000000000013331001111100000000000000000000000000000000000
0000002883bbbbbb8088000088088800888008800888088888880000000000000000000000000000001b33111333310000000000000000000000000000000000
000000288833333880880000000888008880088000800888888800000000000000000000000000000001b33333bbb31000000000000000000000000000000000
0000002288888888800000000000000000000000000000000000000000000000000000000000000000001bbbbb113b1000000000000000000555555507777777
000000002888888800000000000000000000000000000000000000000000000000000000000000000111111111133b1000000000000000005555555577777777
00000000222222220000000000000000000000000000000000000000000000000000000000000000133333111133b10000000000000000005555555577777777
0000000000000000000000000000000000000000000000000000000000000000000000000000000133bbb333333b100000000000000000000555555507777777
000000000000000000000000000000000000000000000000000000000000000000000000000000133b111bbbbbb1000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000013b10001111110000000000000000000000000000000000000
000000001118888888888888888881110000bb000000000000000000000000000000000000000013b10001100000000000000000000000000000000000000000
00000000010000810800008108000010000b330000000000000000000000000000000000000000133b1113310000000000000000000000000000000000000000
00000000001008100080081000800100000400000000000000000000000000000000000000000001b3333bb31000000000000000000000000000000000000000
00000000000181000008810000081000008eee0000000000000000000000000000000000000000001bbbb11b1000000000000000000000000000000000000000
00000000000180000008800000081000018ef7e00000000000000000000000000000000000000000011110010000000000000000000000000000000000000000
00000000001108000081080000810100018effe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000110008008100080081000100188ee800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000111818181818181818181111001111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99997999000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000001000000000000
88878788000000000000000000000000000000000000000000000000000000000000000000111000000000000000000000000000000000000011100000000000
77272722000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000001000000000000
c7cc7ccc000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000001000000000000
770707cc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70070700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000100000000000000000000000100000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000
00000000000100000000000000000000000100000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000
00000000000100000000000000000000000100000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000
00000000011111000000000000000000011111000000000000000000000000000000000000000000000000000000000001111100000000000000000000000000
00000000000100000000000000000000000100000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000
00000000000100000000000000000000000100000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000
00000000000100000000000000000000000100000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000
00000000000100000000000000000000000100000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000
00000000000000000000000000000000000000000888888800000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000088b7b7b880080000880000888000088000800888888800000000000000000000000000000000000000000000
000000000000000000000000000000000000002883bbbb7780888000880000888800088008880888888800000000000000000000000000000000000000000000
00000000000000000000000000000000000000283bb8887880888800880008888880088088800880000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000288bbb888880888880880008000880088888000880000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000028888bbbb880880888880088000880088880000888888000000000000000000000000000000000000000000000
00000000000000000000000000000000000000288b888bbb80880088880088000880088888000880000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000283bb888bb80880008880888888880088088800880000000000000000000000000000000000000000000000000
000000000000000000000000000000000000002883bbbbbb80880000880888008880088008880888888800000000000000000000000000000000000000000000
00000000000000000000000000000000000000288833333880880000000888008880088000800888888800000000000000000000000000000000000000000000
00010000000000000000000000000000000000228888888880000000000000000000000000000000000000000001000000000000000000000000000000000000
00111000000000000000000000000000000000002888888800000000000000000000000000000000000000000011100000000000000000000000000000000000
00010000000000000000000000000000000000002222222200000000000000000000000000000000000000000001000000000000000000000000000000000000
00010000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000
00000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000
00000000000000000000000000010000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000010000
00000000000000000000000001111100000000000000000000000000000000000011100000000000000000000000000000000000000000000000000001111100
00000000000000000000000000010000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000010000
00000000000000000000000000010000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000010000
00000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000
00000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000001110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000ccc0ccc0ccc00cc00cc00000ccc0c0c0ccc0ccc00cc0cc0000000ccccc00000000000000000000000000000000000000
00000000000000000000000000000000c0c0c0c0c000c000c0000000c0c0c0c00c000c00c0c0c0c00000cc0c0cc0000000000000000000000000000000000000
00000000000000000000000000000000ccc0cc00cc00ccc0ccc00000cc00c0c00c000c00c0c0c0c00000ccc0ccc0000000000000000000000000000000000000
00000000000000000000000000000000c000c0c0c00000c000c00000c0c0c0c00c000c00c0c0c0c00000cc0c0cc0000000000000000000000000000000000000
00000000000000000000000000000000c000c0c0ccc0cc00cc000000ccc00cc00c000c00cc00c0c000000ccccc0000000c000c000c0000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000111888888888888888888888888888888888888888888888888888888888811100000000000000000000000000000000
00000000000000000000000000000000010000810800008108000081080000810800008108000081080000810800001000000000000000000000000000000000
00000000000000000000000000000000001008100080081000800810008008100080081000800810008008100080010000000000000000000000000000000000
00000000000000000000000000000000000181000008810000088100000881000008810000088100000881000008100000000000000000000000000000000000
00000000000000000000000000000000000180000008800000088000000880000008800000088000000880000008100000000000000000000000000000000000
00000000000000000000000000000000001108000081080000810800008108000081080000810800008108000081010000000000000000000000000000000000
00000000000000000000000000000000011000800810008008100080081000800810008008100080081000800810001000000000000000000000000000000000
00000000000000000000000000000000111818181818181818181818181818181818181818181818181818181818111100000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000bb0000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000b330000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000008eee0000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000018ef7e000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000018effe000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000188ee8000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000011110000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000011331000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000133bb3100011110000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000013bb1bb310173310000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000013b101b331333310000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000013b1001b33b33710000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000133b1001b33b3100000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000133310011111000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000001b331113333100000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000001b33333bbb310000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000001bbbbb113b10000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000111111111133b10000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000133333111133b100000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000133bbb333333b1000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000133b111bbbbbb10000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000013b100011111100000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000013b100011000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000133b11133100000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000001b3333bb310000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001bbbb11b10000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000111100100000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000010101000808080000000000000000000000010008080800000000000000010101010000080808000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010100000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
01cf00000000cf0000cf0000cfcfcfcf1f60cfcfcfcfcfcfcf49cfcfcfcf49cf090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
22202020202020202020202020202022cf48cfcf48cfcfcfcfcfcfcf48cfcfcf090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21060707070707070707070707070821cf0000cf404142434445460000cf00cf090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21161717171717171717171717171821490000cf505152535455564900cf00cf090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21161717171717171717171717171821cf000048cfcfcfcf49cfcf0000cf0048090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21161717171717171717171717171821cf49cfcfcfcfcfcfcfcfcfcfcfcf00cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21161717171717171717171717171821cf0000000000000000000000000000cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21163517173517171717171717171821cf00000000cfcfcf00000000cf0000cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21161717171717171717171717171821cfcf00006162626262626263cf0000cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21161717171717171717171717171821cf1d0000cfcf00cf64cfcfcfcf0000cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21161717171717171717171717171821cf1d000000004a4bcf000000000000cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21161717171717171717171717171821cf1d007b00595a5b5c000000000000cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21160000000000000000000000001821cf1d000000696a6b6c000000000000cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21262727272727272727272727272821cf1dc01d0000000000000000000000cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
23202020202020202020202020202023cf1dc01d00000000000000000000cfcf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cfcecfcecececececececececececececfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000041200a1200f12015120181201c1201f1202312026120291202b1202d1202e1202e1202e1202e1202e1202c1202c1202a1202912025120211201c12018120131200f1200c1200a120081200612005120
000300000e0501c05029050260502005018050130500c0500705000050020000a0000c0000e0000f0001000010000110001200013000130001400014000140001400014000000001400014000140001300013000
001000001f42034420074200042026400324003b40002400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400
