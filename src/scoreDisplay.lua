---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jameslendrem.
--- DateTime: 09/11/2023 19:43
---

local pd <const> = playdate;
local gfx <const> = pd.graphics

local scoreSprite
local score

--- Not object orientated version of adding a sprite

function createScoreDisplay()
    scoreSprite = gfx.sprite.new()
    score = 0;
    updateDisplay();
    --- A ha, how to change the center point. Nice.
    scoreSprite:setCenter(0, 0);
    scoreSprite:moveTo(320, 4)
    scoreSprite:add()
end

function updateDisplay()
    --- Great, PHP but worse...
    local scoreText = "Score: " .. score
    local textWidth, textHeight = gfx.getTextSize(scoreText)
    local scoreImage = gfx.image.new(textWidth, textHeight)
    gfx.pushContext(scoreImage)
        gfx.drawText(scoreText, 0, 0)
    gfx.popContext()
    scoreSprite:setImage(scoreImage)
end

function incrementScore()
    score += 1 --- no ++ for me :(
    updateDisplay()
end

function resetScore()
    score = 0;
    updateDisplay()
end