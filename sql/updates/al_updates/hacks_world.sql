-- Требуется расшифровка http://ru.wowhead.com/quest=11991
-- http://ru.wowhead.com/npc=26500
-- spell 47110 нет сумона npc=26500
DELETE FROM `creature` WHERE `guid` = 496331;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(496331, 26500, 571, 1, 1, 0, 0, 3386.19, -1805.22, 115.058, 4.97873, 300, 0, 0, 4050, 0, 0, 0, 0, 0);

-- баг с палатаками,
DELETE FROM `gameobject` WHERE `guid` IN (73381, 73886, 80033, 73382);
-- INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
-- (73381, 201868, 631, 15, 128, -532.78, 2228.43, 539.29, 5.61, 0, 0, 0.338458, 0.940982, 604800, 0, 1),
-- (73886, 201886, 631, 15, 64, -532.78, 2228.43, 539.29, 2.48599, 0, 0, 0.946752, 0.321965, 604800, 0, 1),
-- (73382, 201868, 631, 15, 128, -524.565, 2236.97, 539.29, 5.69841, 0, 0, 0.34215, 0.939645, 604800, 0, 1),
-- (80033, 201887, 631, 15, 64, -524.565, 2236.97, 539.29, 2.23466, 0, 0, 0.898934, 0.438085, 604800, 0, 1);









DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (33498, 27931);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 10137;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 9485;

