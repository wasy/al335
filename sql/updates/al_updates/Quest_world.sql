-- Q12504 - Argent Crusade, We Are Leaving!
-- Argent Soldier
SET @ENTRY := 28041;
SET @GOSSIP := 9640;
DELETE FROM `creature_ai_scripts` WHERE (`id`=2804101);
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 9, 0, 100, 0, 0, 5, 5000, 9000, 11, 50370, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'YTDB: Cast Sunder Armor on Close'),
(@ENTRY, 0, 1, 1, 62, 0, 100, 1, @GOSSIP, 0, 0, 0, 33, @ENTRY, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'YTDB: Argent Soldier - On gossip option select - killcredit'),
(@ENTRY, 0, 2, 3, 61, 0, 100, 1, 0, 0, 0, 0, 33, @ENTRY, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'YTDB: Argent Soldier - Quest Credit'),
(@ENTRY, 0, 3, 0, 61, 0, 100, 1, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'YTDB: Argent Soldier - On gossip option select - close gossip');
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
