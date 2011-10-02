-- Требуется расшифровка http://ru.wowhead.com/quest=11991
-- http://ru.wowhead.com/npc=26500
-- spell 47110 нет сумона npc=26500
DELETE FROM `creature` WHERE `guid` = 496331;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(496331, 26500, 571, 1, 1, 0, 0, 3386.19, -1805.22, 115.058, 4.97873, 300, 0, 0, 4050, 0, 0, 0, 0, 0);

DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (33498, 27931);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 10137;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 9485;