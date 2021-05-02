-----------------------------------
-- Area: Cape Teriggan
--   NM: Stolas
-- Note: Popped by qm1
-- !pos -151.65 -8.5 191.37 113
-- Involved in Quest: From Saplings Grow
-----------------------------------
require("scripts/globals/wsquest")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.EXP_BONUS, -100)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobDeath = function(mob, player, isKiller)
    xi.wsquest.handleWsnmDeath(xi.wsquest.empyreal_arrow, player)
end

return entity