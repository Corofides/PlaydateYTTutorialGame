---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jameslendrem.
--- DateTime: 09/11/2023 17:57
---

local pd <const> = playdate;
local gfx <const> = pd.graphics;

class('Player').extends(gfx.sprite)

--- I'm assuming this is just a table with the function being added but...
--- not certain.
function Player:init(x, y)
    local playerImage = gfx.image.new("images/player")
    self:setImage(playerImage)
    self:moveTo(x, y)

    --- add player to draw list
    self:add()
end