---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jameslendrem.
--- DateTime: 09/11/2023 17:57
---

import "bullet"

local pd <const> = playdate;
local gfx <const> = pd.graphics;

--- Add const because I can.
local moveDistance <const> = 2
local playerSize <const> = 32
local coolDown <const> = 0.5
local shootTimer;

class('Player').extends(gfx.sprite)

--- I'm assuming this is just a table with the function being added but...
--- not certain.
function Player:init(x, y)
    local playerImage = gfx.image.new("images/player")
    self:setImage(playerImage)
    self:moveTo(x, y)
    self.allowShoot = true;

    --- add player to draw list
    self:add()
end

--- Remember to use colons, James, this isn't even different
function Player:update()

    --- TODO: Task for self, add collision detection to this.
    if (pd.buttonIsPressed(pd.kButtonUp)) then
        if (self.y > (0 + playerSize / 2)) then
            self:moveBy(0, -moveDistance)
        end
    end

    if (pd.buttonIsPressed(pd.kButtonDown)) then
        if (self.y < (240 - playerSize / 2)) then
            self:moveBy(0, moveDistance)
        end
    end

    if (pd.buttonJustPressed(pd.kButtonA) and self.allowShoot) then
        Bullet(self.x + (self:getSize() / 2), self.y, 5)
        self.allowShoot = false;

        shootTimer = pd.timer.performAfterDelay(coolDown * 1000, function()
            self.allowShoot = true;
        end)

    end
end