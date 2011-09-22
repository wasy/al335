-- DELETE FROM `script_texts` WHERE `entry` ='-xxx';
-- INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
-- (30022,-xxx,'xxx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'');

UPDATE `creature_template` SET `ScriptName` = 'npc_vladof_butcher' WHERE `entry`=30022;