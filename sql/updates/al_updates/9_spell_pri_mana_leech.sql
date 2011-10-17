DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_pri_mana_leech';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(34433,'spell_pri_mana_leech');

UPDATE `creature_template_addon` SET `auras` = '34429 ' WHERE `entry` = 19668;
