-----------------------------------
-- ID: 15204
-- Mandragora Beret
-- Enchantment: 60Min, Costume - Mandragora (white)
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    if not target:canUseMisc(xi.zoneMisc.COSTUME) then
        return xi.msg.basic.CANT_BE_USED_IN_AREA
    end
    return 0
end

item_object.onItemUse = function(target)
    target:addStatusEffect(xi.effect.COSTUME, 31, 0, 3600)
end

return item_object