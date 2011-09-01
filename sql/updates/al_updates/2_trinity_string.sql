UPDATE `trinity_string` SET `content_loc8`='|cffff0000[Анонс БГ]:|r %s -- [%u-%u] Альянс: %u/%u, Орда: %u/%u|r' WHERE `entry`= 712;
UPDATE `trinity_string` SET `content_loc8`='|cffff0000[Анонс БГ]:|r %s -- [%u-%u] Начинается!|r' WHERE `entry`= 717;
UPDATE `trinity_string` SET `content_loc8`='|cffff0000[Анонс Арены]:|r %s -- Присоединились : %ux%u : %u|r' WHERE `entry`= 718;
UPDATE `trinity_string` SET `content_loc8`='|cffff0000[Анонс Арены]:|r %s -- Вышли : %ux%u : %u|r' WHERE `entry`= 719;
UPDATE `trinity_string` SET `content_loc8` = 'Игрок выбрал NPC 
DB GUID: %u. Текущий GUID: %u 
Фракция: %u. 
npcFlags: %u. 
Entry: %u. 
DisplayId: %u (Native: %u).' WHERE `entry` =539;

UPDATE `trinity_string` SET `content_loc8` = '%d (Entry: %d) - |cffffffff|Hgameobject:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r ' WHERE `entry` =517;
UPDATE `trinity_string` SET `content_loc8`='Используемое существом EventAI: %s' WHERE `entry`= 59;
UPDATE `trinity_string` SET `content_loc8`='Предмет ''%u'' (с ценой %u) уже в списке продавца.' WHERE `entry`= 210;
UPDATE `trinity_string` SET `content_loc8`='Расстояние: (3D) %f (2D) %f (Точно 3D) %f (Точно 2D) %f ярд(ов).' WHERE `entry`= 503;

UPDATE `trinity_string` SET `content_loc8` = 'Выбранный объект:
|cffffffff|Hgameobject:%d|h[%s]|h|r GUID: %u ID: %u
X: %f Y: %f Z: %f MapId: %u
Ориентация: %f
Phasemask %u' WHERE `entry` =524;

UPDATE `trinity_string` SET `content_loc8`='Оставшееся время молчанки: %s' WHERE `entry`= 550;
UPDATE `trinity_string` SET `content_loc8` = '-[%16s][%12s][%15s][%3d][%4d][%d][%d]-' WHERE `entry` =1013;

/*
REPLACE INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(282, 'Character %s is kicked with the game world.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Персонаж %s исключен(а) с игрового мира.'),
(301, 'Сharacter %s was disabled chat for %u minutes. Reason: %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Персонажу %s был заблокирован чат на %u минут. Причина: %s.'),
(408, '%s is blocked for %s. Reason: %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s заблокирован(а) на %s. Причина: %s.'),
(409, '%s is blocked permanently. Reason: %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s заблокирован(а) навечно. Причина: %s.');
*/

