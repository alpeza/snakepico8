pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
-- SuperGame
-- by alpeza
#include Particles.lua

function _init()
    bps = Particles()
end

function _update()
    bps:update()
    bps:effect_fire(20,20,5,{8,9,6,5},1)
end

function _draw()
    bps:draw()
end

