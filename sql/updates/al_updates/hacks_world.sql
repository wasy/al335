-- Требуется расшифровка http://ru.wowhead.com/quest=11991
-- http://ru.wowhead.com/npc=26500
-- spell 47110 нет сумона npc=26500
DELETE FROM `creature` WHERE `guid` = 496331;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(496331, 26500, 571, 1, 1, 0, 0, 3386.19, -1805.22, 115.058, 4.97873, 300, 0, 0, 4050, 0, 0, 0, 0, 0);

-- http://ru.wowhead.com/object=194555 не работают госсипы на сдачу квеста http://ru.wowhead.com/quest=13622
DELETE FROM  `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 10368;
DELETE FROM `gossip_menu` WHERE `entry` = 10368;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10368;
/*
-- mangos
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(10368, 14383);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(10368, 2, 0, 'Watcher Analisis: Freya', 1, 1, 0, 0, 0, 0, NULL),
(10368, 3, 0, 'Watcher Analisis: Hodir', 1, 1, 0, 0, 0, 0, NULL),
(10368, 4, 0, 'Watcher Analisis: Thorim', 1, 1, 0, 0, 0, 0, NULL),
(10368, 5, 0, 'Watcher Analisis: Mimiron', 1, 1, 0, 0, 0, 0, NULL);
*/
