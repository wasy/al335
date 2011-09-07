-- Q4021 - Counterattack!
-- чистим, спавн скриптом после взятия квеста
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

-- чистим с tdb, берем id ytdb
DELETE FROM `gossip_menu` WHERE `text_id` IN (2533,2534); 
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(1882,2533);
-- чистим с tdb, берем id ytdb
-- первый старт после взятия, повторно запустить можно через опред. время, контр. smartai
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (1882, 21253);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(1882, 0, 0, 'Where is Warlord Krom''zar?', 1, 1, 0, 0, 0, 0, NULL);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=1882;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 1882, 0, 0, 9, 4021, 0, 0, 0, '', 'Regthar Deathgate: Counterattack!: gossip: has quest'),
(15, 1882, 0, 0, 26, 11227, 0, 0, 0, '', 'Regthar Deathgate: Counterattack!: gossip: does not have item Piece Banner');
UPDATE `smart_scripts` SET `event_param1` = '1882' WHERE `entryorguid` =3389 AND `source_type` =0 AND `id` =4;
UPDATE `smart_scripts` SET `event_param1` = '1882' WHERE `entryorguid` =3389 AND `source_type` =0 AND `id` =5;
UPDATE `creature_template` SET `AIName`='SmartAI', `gossip_menu_id`=1882 WHERE `entry`=3389;


-- Q11989 - Truce?
SET @ENTRY := 26423;
SET @GOSSIP := 9615;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=@ENTRY AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 1, 62, 0, 100, 0, @GOSSIP, 1, 0, 0, 33, 27921, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Drakuru - On gossip option select - killcredit'),
(@ENTRY, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Drakuru - On gossip option select - close gossip');
UPDATE `creature_template` SET `AIName`= 'SmartAI', `gossip_menu_id`=@GOSSIP WHERE `entry`=@ENTRY;
UPDATE `gossip_menu_option` SET `action_menu_id` = '0' WHERE `menu_id` = @GOSSIP AND `id` =1;
-- loc8
UPDATE `locales_gossip_menu_option` SET `option_text_loc8` = 'Пожать протянутую руку Дракуру.',`box_text_loc8` = NULL WHERE `menu_id` = @GOSSIP AND `id` = 1;
UPDATE `locales_gossip_menu_option` SET `option_text_loc8` = 'Дракуру, мне нужны ваши эликсиры.',`box_text_loc8` = NULL WHERE `menu_id` = @GOSSIP AND `id` = 2;


-- Q12204 - In the Name of Loken
SET @ENTRY := 26484;
SET @GOSSIP := 9484;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=@ENTRY AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 1, 62, 0, 100, 0, @GOSSIP, 2, 0, 0, 33, 26484, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Hugh Glass <Merchant> - On gossip option select - killcredit'),
(@ENTRY, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Hugh Glass <Merchant> - On gossip option select - close gossip');
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
SET @ENTRY := 26420;
SET @GOSSIP := 9485;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=@ENTRY AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 1, 62, 0, 100, 0, @GOSSIP, 1, 0, 0, 33, 26420, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Gavrock - On gossip option select - killcredit'),
(@ENTRY, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Gavrock - On gossip option select - close gossip');
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;


