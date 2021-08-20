pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
-- SuperGame
-- by alpeza
#include GameConfig.lua
#include SceneController.lua
#include common.lua
-->8
-- SNAKE SCENE
#include SnakeController.lua
#include PickUp.lua
#include SnakeScene.lua
#include HomeScene.lua
-->8
--- Programa principal
function _init()
    sc = SceneController({
        HomeScene(sc),
        SnakeScene(sc)
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
0000bb000bb333b05555555600cccc00383bbbb3383bbbb1cccccccccccccccccccccccc0077770054444445880000880000bb00888888880005550000000000
000b3300b2bbb77b577777a60c0770c0383333b8383333b1ceeeeeeeeeeeeeeeeeeeeeec000770004f4f4ff488800888000b33000800008e5355350000000000
00040000b222b33b575555760c7887c03b333bb33b333bb1ce20202020202020202020ec000770004f4f4f668088880800040000008008e03553530000000000
008eee00b222b33b5757567600cccc003b8333b33b8333b1ce02020202020202020202ec009999004f4f4f6680088008008eee0000088e003353330000000000
088ef7e0b2bbb77b57557676066996608b3b33338b3b3331ce20000000000000000020ec0bbbbbb04f4f4f6680088008088ef7e0000880003353330000000000
088effe00bb333b05756667600099000333bb8b3333bb8b1ce02000000000000000002ec0aaaaaa04f4f4f6680888808088effe0008e08003353330000000000
0888ee8000bbbb005777777600699600b333bb33b333bb31ce20000000000000000020ec088888804f4f4ff4888008880888ee8008e000803353330000000000
0088880000bbbb006666666600b00b00b8333338b8333331ce02000000000000000002ec00cccc00544444458800008800888800888888880003330000000000
00aaaa0000aaaa0000aaaa0000aaaa000000000000000000ce20000000000000000020ec000000ec00cccc00000400000000bb00800000080000000000000000
0aaaaaa00aaaaaa00aaaaaa00aaaaaa00000000000888800ce02000000000000000002ec000000ec0c7c7c0000a00000000b3300880000885555555500000000
aa1aa1aa9aaaa1aaaa1aaaa9a888888a0888888008eeee80ce20000000000000000020ec000000ecfccccc0f09a0000000040000808008e83535353500000000
aaaaaaaa9aaaaaaaaaaaaaa9aaaaaaaa0aaaaaa008e77e80ce02000000000000000002ec000000ecffffff1f09a00000008eee0080088e085353535300000000
aaaaaaaa9aaaaaaaaaaaaaa9aaaaaaaa0aaaaaa008e77e80ce20000000000000000020ec000000ec00ffff0009aa0000088ef7e0800880083333333300000000
9888888999aa88888888aa999a1aa1a90888888008eeee80ce02000000000000000002ec000000ec0011110009aaa000088effe0808e08083333333300000000
09aaaa90099aaaa00aaaa99009aaaa900000000000888800ce20000000000000000020ec000000ec00100100009aaa000888ee8088e000883333333300000000
009999000099990000999900009999000000000000000000ce02000000000000000002ec000000ec00c00c0000099990008888008e0000080000000000000000
00000000000000000000000000bbbb00111111110000bb00ce20000000000000000020ec000000000000000008800ee054444444888888886666666600000000
000000000000000000000000003bb3001cccccc1000b3300ce02000000000000000002ec0000000070008007208ee0ee08eeeee48800008e6000000000000000
000bb00053bbb3b00b3bbb35007bb7001cccccc100040000ce20000000000000000020ec00000000e000000e278ee7ee00ee0ee4808008e86000000000000000
003bb300353337b00b733353007bb7001cc99cc1008eee00ce02000000000000000002ec0000000000700000288eeeee08eeeeee80088e086000000000000000
007bb700333b37b00b73b333003bb3001cccccc1088ef7e0ce20202020202020202020ec0000000000e007072888eeee08ee8ee4800880086000000000000000
007bb7000b3333b00b333300000bb0001cccccc1088effe0ce02020202020202020202ec0000000000000e0e000000e004444444808e08086000000000000000
003bb30000bbb00000bbb000000000001cccccc10888ee80ceeeeeeeeeeeeeeeeeeeeeec000000008000000002288ee0087777e488e000886000000000000000
00bbbb000000000000000000000000001111111100000000cccccccccccccccccccccccc000000007e07e0e700022000044444448e8888886000000000000000
0003300000000000000000000000000000000000000000000000000000000000000ff000000000007ee000008e00008800000000000000000000000000000000
000bb0000000000000000000000000000000000000000000000000000000000000ff0000000000000000007e88e0082800000000000000000000000000000000
00033000000a7000000bb000000000000000000000000000000000000053b30008fc0a0000000000007e00008088820800000000000000000000000000000000
000bb00000baab000bbbbb33b3b3b3b30005b000000000000005b0000035b300f8fc0a0f00000000000000008008800800000000000000000000000000000000
000330000bbbbbb00b7bbb33b3b3b3b3000bb00000000000000bb000005bb300f8fc0a0f00000000000000008008800800000000000000000000000000000000
000bb00000bbbb000033bb000000000000000000000000000000000000333300f8fc000f0000000007ee00e780888e0800000000000000000000000000000000
0003300000033000000bb0000000000000000000000000000000000000000000fffff0000000000000000000882008e800000000000000000000000000000000
000bb00000000000000000000000000000000000000000000000000000000000ffffffff000000000007e0008200008800000000000000000000000000000000
0002ee77777777770000000000000000000000000000000000000000088888880000000000000000000000000000000000000000000000000000000000000000
000288eeeeeeeeee000000000000000000022200000000000000000088b7b7b88008000088000088800008800080088888880000000000000000000000000000
0002888888eeeeee000000000000000000220800200000000000000883bbbb778088800088000088880008800888088888880000000000000000000000000000
00028888888888ee000000000000000000888808e0000000000000083bb888788088880088000888888008808880088000000000000000000000000000000000
000288000000000000000000000000000008800800000000000000088bbb88888088888088000800088008888800088000000000000000000000000000000000
00028800000000000000000000000020000880880000000000000008888bbbb88088088888008800088008888000088888800000000000000000000000000000
000288eee000000000020000000022200888008000000000000000088b888bbb8088008888008800088008888800088000000000000000000000000000000000
00022828e777000000220000008880888808088000000000000000083bb888bb8088000888088888888008808880088000000000000000000000000000000000
0002222282888888888888800880008000080800222222220000000883bbbbbb8088000088088800888008800888088888880000000000000000000000000000
00000022228288888088808888000080000888008000000800000008883333388088000000088800888008800080088888880000000000000000000000000000
000000000222288800ee000eee0000e000ee0ee08800008800000000888888888000000000000000000000000000000000000000000000000000000000000000
000000000000088800ee000eee0000e000ee00ee0888888000000000088888880000000000000000000000000000000000000000000000000000000000000000
00000000000008880077000777000070070700070700000000000000000000000000000000000000000000000000000000000000000000000000000000000000
eeee7777777ee88800ee000eee0000e00e0e000eee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
28282828282828280088000888880080088800008888800800000000000000000000000000000000000000000000000000000000000000000000000000000000
22222222222222220022000220022222022000000200822200000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0006600000066000000660000006600000066000000660000006600000066000000ee000bbbbbbbb000000000001000000000000000000000000000000000000
000660000006600000066000000660000006600000066000000110000001100000011000aaaaaaaa000000000001000000000000000000000000000000000000
00066000000660000006600000066000000660000002200000022000000220000002200099997999000000000001000000010000000000000000000000000000
00066000000660000006600000066000000bb000000bb000000bb000000bb000000bb00088878788000000000111110000111000000000000000000000000000
00066000000660000006600000099000000990000009900000099000000990000009900077272722000000000001000000010000000000000000000000000000
0006600000066000000aa000000aa000000aa000000aa000000aa000000aa000000aa000c7cc7ccc000000000001000000010000000000000000000000000000
000660000008800000088000000880000008800000088000000880000008800000088000770707cc000000000001000000000000000000000000000000000000
000cc000000cc000000cc000000cc000000cc000000cc000000cc000000cc000000cc00070070700000000000001000000000000000000000000000000000000
88888888888888888888888800000000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000
82121212121212121212121800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
81212121212121212121212800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
82111111111111111111121800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
81211111111111111111112800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
82111111111111111111121800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
81211111111111111111112800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
82111111111111111111121800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
81211111111111111111121800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
82111111111111111111112800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
81211111111111111111121800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
82111111111111111111112800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
81211111111111111111121800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
82111111111111111111112800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
81211111111111111111121800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
82111111111111111111112800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
81211111111111111111121800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
82111111111111111111112800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
81211111111111111111121800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
82111111111111111111112800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
81211111111111111111121800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
82121212121212122121212800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
81212121212121211212121800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888888888888888888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99997999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88878788000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77272722000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c7cc7ccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
770707cc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70070700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000888888800000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000088b7b7b880080000880000888000088000800888888800000000000000000000000000000000000000000000
000000000000000000000000000000000000000883bbbb7780888000880000888800088008880888888800000000000000000000000000000000000000000000
00000000000000000000000000000000000000083bb8887880888800880008888880088088800880000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000088bbb888880888880880008000880088888000880000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000008888bbbb880880888880088000880088880000888888000000000000000000000000000000000000000000000
00000000000000000000000000000000000000088b888bbb80880088880088000880088888000880000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000083bb888bb80880008880888888880088088800880000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000883bbbbbb80880000880888008880088008880888888800000000000000000000000000000000000000000000
00000000000000000000000000000000000000088833333880880000000888008880088000800888888800000000000000000000000000000000000000000000
00000000000000000000000000000000000000008888888880000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000888888800000000000000000000000000000000000000000000000000000000000000000000000000000000
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
00000000000000000000000000000000777077707770077007700000777070707770777007707700000007777700000000000000000000000000000000000000
00000000000000000000000000000000707070707000700070000000707070700700070070707070000077070770000000000000000000000000000000000000
00000000000000000000000000000000777077007700777077700000770070700700070070707070000077707770000000000000000000000000000000000000
00000000000000000000000000000000700070707000007000700000707070700700070070707070000077070770000000000000000000000000000000000000
00000000000000000000000000000000700070707770770077000000777007700700070077007070000007777700000007000700070000000000000000000000
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
00000000888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000008800008e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000808008e80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000080088e080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800880080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000808e08080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000088e000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000008e8888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000880000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000808008e80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000080088e080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800880080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000808e08080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000088e000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000008e0000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000880000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000808008e80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000080088e080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800880080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000808e08080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000088e000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000008e0000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800000080000000088888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000088000088000000008800008e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000808008e800000000808008e8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000080088e080000000080088e08000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800880080000000080088008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000808e080800000000808e0808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000088e000880000000088e00088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000008e000008000000008e888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800000080000000080000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000880000880000000088000088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000808008e800000000808008e8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000080088e080000000080088e08000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800880080000000080088008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000808e080800000000808e0808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000088e000880000000088e00088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000008e000008000000008e000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800000080000000080000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000880000880000000088000088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000808008e800000000808008e8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000080088e080000000080088e08000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800880080000000080088008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000808e080800000000808e0808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000088e000880000000088e00088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000008e000008000000008e000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800000080000000080000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000880000880000000088000088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000808008e800000000808008e8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000080088e080000000080088e08000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800880080000000080088008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000808e080800000000808e0808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000088e000880000000088e00088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000008e000008000000008e000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000010000000808080000010001000000000000000008080808000000010000000000000800080808000000000100000000000001080101000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
25cf0000000000000000000000cfcfcf79cfcfcfcfcfcfcfcf7ccfcfcfcf7ccf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2d0d0d0d0d0d0d0d0d0d0d0d0d0d0d2dcf7bcfcf7bcfcfcfcfcfcfcf7bcfcfcf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d06070707070707070707070707081dcf0000cf464748494a4b4c0000cf00cf7c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d16171717171717171717171717181d7c0000cf565758595a5b5c7c00cf00cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d16171717171717171717171717181dcf00007bcfcfcfcf7ccfcf0000cf007b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d16171717171717171717171717181dcf7ccfcfcfcfcfcfcfcfcfcfcfcf00cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d16171717171717171717171717181dcf00cfcfcfcfcfcfcf00000000cf00cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d1635171735cf17171717171717181dcf0000cf000000000000000000cf00cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d16171717171717171717171717181dcf2d00cfcfcfcfcfcfcfcfcfcfcf00cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d16171717171717171717171717181dcf1d00000000000000000000000000cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d16171717171717171717171717181dcf1d00000000000000000000000000cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d16171717171717171717171717181dcf1d002d0000000000000000000000cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d26272727272727272727272727281dcf1d001d0000000000000000000000cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2d0d0d0d0d0d0d0d0d0d0d0d0d0d0d2dcf1dc01d0000000000000000000000cf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1b1bcfcecececececececececececececf1dc01d00000000000000000000cfcf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cececececececececececececececececfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000041500a1500f15015150181501c1501f1502315026150291502b1502d1502e1502e1502e1502e1502e1502c1502c1502a1502915025150211501c15018150131500f1500c1500a150081500615005150
