-- Q12504 - Argent Crusade, We Are Leaving!
-- Argent Soldier
SET @ENTRY := 28041;
SET @GOSSIP := 9640;
DELETE FROM `creature_ai_scripts` WHERE (`id`=2804101);
DELETE FROM `smart_scripts` WHERE`entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 9, 0, 100, 0, 0, 5, 5000, 9000, 11, 50370, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'YTDB: Cast Sunder Armor on Close'),
(@ENTRY, 0, 1, 0, 62, 0, 100, 1, @GOSSIP, 0, 0, 0, 11, 50289, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'YTDB: Q12504 - Argent Crusade, We Are Leaving!: Argent Soldier Quest Credit'),
(@ENTRY, 0, 2, 3, 61, 0, 100, 1, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'YTDB: Q12504 - On gossip option select - close gossip'),
(@ENTRY, 0, 3, 0, 62, 0, 100, 1, @GOSSIP, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'YTDB: Q12504 - say random text');

DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@ENTRY, 0, 0, 'Watch your back. These Drakkari are a nasty lot.', 12, 0, 100, 1, 0, 0, 'YTDB: Q12504 - say random text'),
(@ENTRY, 0, 1, 'See you around.', 12, 0, 100, 1, 0, 0, 'YTDB: Q12504- say random text'),
(@ENTRY, 0, 2, 'Right. I''d better get back to the sergeant then.', 12, 0, 100, 1, 0, 0, 'YTDB: Q12504 - say random text'),
(@ENTRY, 0, 3, 'Are you $N? I heard you were dead.', 12, 0, 100, 1, 0, 0, 'YTDB: Argent Q12504 - say random text');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;

-- http://ru.wowhead.com/object=194555 не работают госсипы на сдачу квеста http://ru.wowhead.com/quest=13622
DELETE FROM  `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 10368;
DELETE FROM `gossip_menu` WHERE `entry` = 10368;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10368;

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 10368, 5, 0, 9, 13611, 0, 0, 0, '', NULL),
(15, 10368, 4, 0, 9, 13610, 0, 0, 0, '', NULL),
(15, 10368, 3, 0, 9, 13609, 0, 0, 0, '', NULL),
(15, 10368, 2, 0, 9, 13606, 0, 0, 0, '', NULL);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(10368, 14383);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(10368, 2, 0, 'Watcher Analisis: Freya', 1, 1, 0, 0, 0, 0, NULL),
(10368, 3, 0, 'Watcher Analisis: Hodir', 1, 1, 0, 0, 0, 0, NULL),
(10368, 4, 0, 'Watcher Analisis: Thorim', 1, 1, 0, 0, 0, 0, NULL),
(10368, 5, 0, 'Watcher Analisis: Mimiron', 1, 1, 0, 0, 0, 0, NULL);
-- Fix Gossips for Archivum Console in Ulduar
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10368 AND `option_id` = 2;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) 
 VALUES (10368, 0, 0, 'GOSSIP_OPTION_QUESTGIVER', 2, 2, 0, 0, 0, 0, NULL);

-- день пирата
DELETE FROM `smart_scripts` WHERE `entryorguid`=20102 AND `source_type`=0;
INSERT INTO `smart_scripts` VALUES 
(20102,0,0,1,62,0,100,0,8064,1,0,0,11,51926,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - cast spell"),
(20102,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - close gossip");

DELETE FROM `smart_scripts` WHERE `entryorguid`=19172 AND `source_type`=0;
INSERT INTO `smart_scripts` VALUES 
(19172,0,0,1,62,0,100,0,50258,1,0,0,11,51926,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - cast spell"),
(19172,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - close gossip");

DELETE FROM `smart_scripts` WHERE `entryorguid`=19148 AND `source_type`=0;
INSERT INTO `smart_scripts` VALUES 
(19148,0,0,1,62,0,100,0,7923,1,0,0,11,51926,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - cast spell"),
(19148,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - close gossip");

DELETE FROM `smart_scripts` WHERE `entryorguid`=19171 AND `source_type`=0;
INSERT INTO `smart_scripts` VALUES 
(19171,0,0,1,62,0,100,0,7922,1,0,0,11,51926,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - cast spell"),
(19171,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - close gossip");

DELETE FROM `smart_scripts` WHERE `entryorguid`=19173 AND `source_type`=0;
INSERT INTO `smart_scripts` VALUES 
(19173,0,0,1,62,0,100,0,10250,1,0,0,11,51926,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - cast spell"),
(19173,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - close gossip");

DELETE FROM `smart_scripts` WHERE `entryorguid`=19175 AND `source_type`=0;
INSERT INTO `smart_scripts` VALUES 
(19175,0,0,1,62,0,100,0,7925,1,0,0,11,51926,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - cast spell"),
(19175,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - close gossip");

DELETE FROM `smart_scripts` WHERE `entryorguid`=19176 AND `source_type`=0;
INSERT INTO `smart_scripts` VALUES 
(19176,0,0,1,62,0,100,0,7926,1,0,0,11,51926,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - cast spell"),
(19176,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - close gossip");

DELETE FROM `smart_scripts` WHERE `entryorguid`=19177 AND `source_type`=0;
INSERT INTO `smart_scripts` VALUES 
(19177,0,0,1,62,0,100,0,7935,1,0,0,11,51926,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - cast spell"),
(19177,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - close gossip");

DELETE FROM `smart_scripts` WHERE `entryorguid`=19178 AND `source_type`=0;
INSERT INTO `smart_scripts` VALUES 
(19178,0,0,1,62,0,100,0,7927,1,0,0,11,51926,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - cast spell"),
(19178,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Commoner - On gossip option select - close gossip");

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (20102, 19172, 19148, 19171, 19173, 19175, 19176, 19177, 19178);

-- Delete non-attackable flag from Army of the Dead Ghoul NPC (24207)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` = '24207';
DELETE FROM `smart_scripts` WHERE `source_type`= '0' AND `entryorguid`= '24207';
INSERT INTO `smart_scripts` VALUES 
(24207,0,1,0,54,0,100,0,0,0,0,0,19,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"YTDB: Set Unselectable and Unattackable Flags");

-- Fix gossips for Dread Captain DeMeza NPC (28048)
DELETE FROM `conditions` WHERE `SourceGroup`=9647;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(14, 9647, 13059, 0, 11, 50517, 0, 0, 0, '', 'Pirates Day: DeMeza gossip'),
(14, 9647, 13065, 0, 1, 50517, 0, 0, 0, '', 'Pirates Day: DeMeza gossip'),
(15, 9647, 0, 0, 11, 50517, 0, 0, 0, '', 'Pirates Day: DeMeza gossip');
