-----------------------------------
-- Area: LaLoff Amphitheater
-- Name: Ark Angels 5 (Galka)
-----------------------------------
local ID = require("scripts/zones/LaLoff_Amphitheater/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------
local battlefield_object = {}

battlefield_object.onBattlefieldTick = function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end

battlefield_object.onBattlefieldRegister = function(player, battlefield)
end

battlefield_object.onBattlefieldEnter = function(player, battlefield)
end

battlefield_object.onBattlefieldLeave = function(player, battlefield, leavecode)
    if leavecode == xi.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        local arg8 = (player:hasCompletedMission(xi.mission.log_id.ZILART, xi.mission.id.zilart.ARK_ANGELS)) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 180, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == xi.battlefield.leaveCode.LOST then
        player:startEvent(32002, 0, 0, 0, 0, 0, battlefield:getArea(), 180)
    end
end

battlefield_object.onEventUpdate = function(player, csid, option)
end

battlefield_object.onEventFinish = function(player, csid, option)
    if csid == 32001 then
        if player:getCurrentMission(ZILART) == xi.mission.id.zilart.ARK_ANGELS and player:getMissionStatus(xi.mission.log_id.ZILART) == 1 then
            player:addKeyItem(xi.ki.SHARD_OF_RAGE)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.SHARD_OF_RAGE)
            if
                player:hasKeyItem(xi.ki.SHARD_OF_APATHY) and
                player:hasKeyItem(xi.ki.SHARD_OF_ARROGANCE) and
                player:hasKeyItem(xi.ki.SHARD_OF_COWARDICE) and
                player:hasKeyItem(xi.ki.SHARD_OF_ENVY) and
                player:hasKeyItem(xi.ki.SHARD_OF_RAGE)
            then
                player:completeMission(xi.mission.log_id.ZILART, xi.mission.id.zilart.ARK_ANGELS)
                player:addMission(xi.mission.log_id.ZILART, xi.mission.id.zilart.THE_SEALED_SHRINE)
                player:setMissionStatus(xi.mission.log_id.ZILART, 0)
            end
        end
    end
end

return battlefield_object