-- Quest - Counterattack! 4021

-- Warlord Krom'zar (`guid` 35973)
DELETE FROM `creature` WHERE `id` = 9456;
-- Kolkar Stormseer (`guid` 36006,36007,36178,36289)
DELETE FROM `creature` WHERE `id` = 9523;
-- Kolkar Invader (32239,32247,32488,32538,32631,32682,32716,32852,32882,33070,33208,33289,33326,33408,33700,34285,35941,35998,36032,36090,36210,36241,36242,36435,36635,36637,36739,36762,36843,36918,37027,37146,37183,37259,37515,37521);
DELETE FROM `creature` WHERE `id` = 9524;
-- Horde Defender (35989,36146,36214);
DELETE FROM `creature` WHERE `id` = 9457; 
-- Horde Axe Thrower (`guid` 35994,36010,36149)
DELETE FROM `creature` WHERE `id` = 9458;

DELETE FROM `gossip_menu` WHERE `entry` IN (23615,23616);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(23615,2533),
(23616,2534);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=23615 AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(23615, 0, 0, 'Where is Warlord Krom''zar?', 1, 1, 23616, 0, 0, 0, NULL);

DELETE FROM `creature_text` WHERE `entry`=3389;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(3389, 0, 0, 'Beware, $N! Look to the west!', 0, 0, 100, 1, 0, 0, 'Regthar Deathgate: quest start'),
(3389, 1, 0, 'A defender has fallen!', 0, 0, 100, 1, 0, 0, 'Regthar Deathgate: Horde Defender death');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=23615;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 23615, 0, 0, 9, 4021, 0, 0, 0, '', 'Regthar Deathgate: Counterattack!: gossip: has quest'),
(15, 23615, 0, 0, 26, 11227, 0, 0, 0, '', 'Regthar Deathgate: Counterattack!: gossip: does not have item Piece Banner');

UPDATE `creature_template` SET `AIName`='SmartAI', `gossip_menu_id`=23615 WHERE `entry`=3389;