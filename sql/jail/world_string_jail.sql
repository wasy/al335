SET NAMES utf8;

DELETE FROM `trinity_string` WHERE `entry` BETWEEN 12100 AND 12199;
INSERT INTO `trinity_string` (`entry`,`content_default`,`content_loc3`) VALUES
(12100, 'You are jailed by %s for %u hour(s)!', 'Du wurdest von %s fur %u Stunde(n) eingebuchtet!'),
(12101, '%s wrote this as reason: %s', '%s gab dies als Grund an: %s'),
(12102, '%s was jailed by you for %u hour(s).', '%s wurde von dir fur %u Stunde(n) eingebuchtet.'),
(12103, 'You was released out of the jail by %s.', '%s hat dich aus dem Knast entlassen.'),
(12104, 'You have released %s out of the jail.', 'Du hast %s aus dem Knast geholt.'),
(12105, 'No reason given or reason is < %u chars!', 'Du hast keinen Grund angegeben, oder der Grund ist < %u Zeichen!'),
(12106, 'No name given!', 'Du hast keinen Namen angegeben!'),
(12107, 'No time given!', 'Du hast keine Zeit angegeben!'),
(12108, 'The jailtime must be between 1 and %u hours!', 'Die Jailzeit muss zwischen 1 und %u Std. liegen!'),
(12109, 'The character %s is not jailed!', 'Der Charakter %s ist uberhaupt nicht im Knast!'),
(12110, 'Command forbidden for jailed characters!', 'Sorry, aber das durfen Gefangene nicht!'),
(12111, 'You have %u hour(s) and %u minute(s) left in the jail.', 'Du musst noch %u Stunde(n) und %u Minute(n) absitzen.'),
(12112, 'You have %u minute(s) left in the jail.', 'Du musst noch %u Minute(n) absitzen.'),
(12113, 'You are free like a bird! ;-)', 'Du bist frei, wie ein Vogel! ;-)'),
(12114, '%s was %u times jailed and has %u minute(s) left.\nLast time jailed by: %s.\nThe last jail was on: %s\nThe last reason was: %s', '%s war bis jetzt %u mal im Knast, und hat noch %u Minute(n) abzusitzen.\nZuletzt eingebuchtet von: %s\nZuletzt eingebuchtet am: %s\nDer letzte Grund war: %s'),
(12115, '%s was never jailed.', '%s hat eine weisse Weste.'),
(12116, 'You can not jail yourself!', 'Du kannst dich nicht selber einbuchten!'),
(12117, 'You can not unjail yourself!', 'So weit kommt es noch, dass Knastbruder sich selber befreien! :('),
(12118, 'Be carefull!\nOnly one more jailtime and your current character will be deleted!', '!!! ACHTUNG - WICHTIG - WARNUNG !!!\nBeim nachsten Knastbesuch wird dieser Charakter geloscht!'),
(12119, 'The character %s was jailed for %u hour(s) by the GM character %s!\nThe reason is: %s', 'Der Charakter %s wurde fur %u Stunde(n) vom GM-Charakter %s eingebuchtet!\nDer Grund ist: %s'),
(12120, 'Jail: The configuration was reloaded.', 'Jail: Die Konfiguration wurde neu geladen.'),
(12121, 'Jail: Configuration loaded.', 'Jail: Konfiguration geladen.'),
(12122, 'Jail: Can not load the configuration! The table is empty or missed! Use the character_jail.sql!', 'Jail: Fehler beim laden der Konfiguration! Die Tabelle ist leer, oder nicht vorhanden! Nutze die character_jail.sql!'),
(12123, 'Jail: Set all config settings to default values.', 'Jail: Setze die Konfiguration auf Standardwerte.'),
(12124, 'The Character %s (GUID %u) is a jail brother and teleported into the jail.', 'Der Charakter %s (GUID %u) ist ein Knastbruder, und wird in den Knast teleportiert.'),
(12125, 'The Character %s (GUID %u) was released out of the jail.', 'Der Charakter %s (GUID %u) wurde aus dem Knast entlassen.'),
(12126, 'A character with this name does not exists!', 'Ein Charakter mit diesem Namen gibt es nicht!'),
(12127, 'Be carefull!\nOnly one more jailtime and your account will be banned!', '!!! ACHTUNG - WICHTIG - WARNUNG !!!\nBeim nachsten Knastbesuch wird dein Account gebannt!'),
(12128, 'Max. jailtimes reached!', 'Maximale Anzahl an Jails erreicht!'),
(12129, 'You are previously convicted but at the moment on preservation free.', 'Du bist vorbestraft, aber im Moment auf Bewahrung frei.'),
(12130, '%s was %u times jailed and has %u hour(s) and %u minute(s) left.\nLast time jailed by: %s.\nThe last jail was on: %s\nThe last reason was: %s', '%s war bis jetzt %u mal im Knast, und hat noch %u Stunde(n) und %u Minuten abzusitzen.\nZuletzt eingebuchtet von: %s\nZuletzt eingebuchtet am: %s\nDer letzte Grund war: %s'),
(12131, '%s was multiple times jailed and has already %u bans!', '%s wurde mehrfach eingebuchtet, und hat bereits %u Bannung(en)!'),
(12132, 'The account of this character has further %u bans!','Der Account von ihm wurde ausserdem bereits %u mal gebannt!'),
(12133, '%s is already in the Jail!','%s ist bereits im Knast!'),
(12134, 'You can not reset a Jail entry with a banned account!','Das Loschen eines Jaileintrags, dessen Account gebannt wurde, ist nicht moglich!'),
(12135, 'Jail: Jail data reloaded.','Jail: Die Knastdaten wurden neu geladen.'),
(12136, 'Jail: Delete of entries with no longer existing characters.','Jail: Losche Eintrage mit nicht mehr existierenden Charakteren.'),
(12137, 'Jail: Checking the jail for outdated arrests...','Jail: Uberprufe das Gefangnis auf abgelaufene Inhaftierungen...'),
(12138, 'Jail: No arrests found.','Jail: Keine Inhaftierungen gefunden.'),
(12139, 'Jail: %u outdated arrests found and within %u ms checked.','Jail: %u abgelaufene Inhaftierung(en) in %u ms bearbeitet.'),
(12140, 'Jail: Initializate the jail...','Jail: Initialisiere das Gefangnis...'),
(12141, 'Jail: The Jail isn''t activ! Terminating the initialization.','Jail: Das Jail ist nicht aktiv! Beende die Initialisierung.'),
(12142, 'Jail: No arrests found.','Jail: Keine Inhaftierungen gefunden.'),
(12143, 'Jail: %u arrests (%u are active) within %u ms loaded.','Jail: Insgesamt %u Inhaftierung(en), davon sind %u aktiv, in %u ms geladen.'),
(12144, 'ERROR! STRING TO LONG!','FEHLER! STRING ZU LANG!'),
(12145, 'Jail: Jail data loaded.','Jail: Die Knastdaten wurden geladen.'),
(12146, 'No faction (horde/ally) given!','Du hast keine Fraktion (horde/ally) angegeben!'),
(12197, 'The Jail is now active.', 'Das Jail ist nun aktiv.'),
(12198, 'The Jail is now inactive.', 'Das Jail ist nun deaktiviert.'),
(12199, 'The Jail is not active!', 'Das Jail ist nicht aktiv!');


UPDATE `trinity_string` SET `content_loc8` = 'Вы были посажены в тюрьму %s на %u час(ов)!' WHERE `entry` =12100;
UPDATE `trinity_string` SET `content_loc8` = '%s написал это как причину: %s' WHERE `entry` =12101;
UPDATE `trinity_string` SET `content_loc8` = '%s посажен вами в тюрьму на %u час(ов).' WHERE `entry` =12102;
UPDATE `trinity_string` SET `content_loc8` = '%s освободил Вас из тюрьмы.' WHERE `entry` =12103;
UPDATE `trinity_string` SET `content_loc8` = 'Вы освободили игрока %s из тюрьмы .' WHERE `entry` =12104;
UPDATE `trinity_string` SET `content_loc8` = 'Не указана причина, или причина менее < %u символов!' WHERE `entry` =12105;
UPDATE `trinity_string` SET `content_loc8` = 'Не выбрано имя игрока!' WHERE `entry` =12106;
UPDATE `trinity_string` SET `content_loc8` = 'Не выбран срок наказания!' WHERE `entry` =12107;
UPDATE `trinity_string` SET `content_loc8` = 'Время наказания должно быть между 1 или %u часами!' WHERE `entry` =12108;
UPDATE `trinity_string` SET `content_loc8` = 'Персонаж %s не посажен в тюрьму!' WHERE `entry` =12109;
UPDATE `trinity_string` SET `content_loc8` = 'Эта команда запрещена для персонажей в тюрьме!' WHERE `entry` =12110;
UPDATE `trinity_string` SET `content_loc8` = 'Вам осталось сидеть в тюрьме %u час(ов) и %u минут.' WHERE `entry` =12111;
UPDATE `trinity_string` SET `content_loc8` = 'Вам осталось сидеть в тюрьме %u минут.' WHERE `entry` =12112;
UPDATE `trinity_string` SET `content_loc8` = 'Вы свободны, как птица.. ;-)' WHERE `entry` =12113;
UPDATE `trinity_string` SET `content_loc8` = '%s был посажен в тюрьму %u раз, провел в тюрьме %u минут.\n Последний раз посажен: %s\n Последнее время наказания: %s\nПоследняя причина наказания: %s' WHERE `entry` =12114;
UPDATE `trinity_string` SET `content_loc8` = '%s никогда не сидел.. ' WHERE `entry` =12115;
UPDATE `trinity_string` SET `content_loc8` = 'Вы не можете сами себя посадить в тюрьму!' WHERE `entry` =12116;
UPDATE `trinity_string` SET `content_loc8` = 'Увы, самого себя освободить из тюрьмы невозможно :(' WHERE `entry` =12117;
UPDATE `trinity_string` SET `content_loc8` = '!!! ВНИМАНИЕ !!!\n Если Вас еще раз посадят в тюрьму, Ваш персонаж будет удален с сервера!' WHERE `entry` =12118;
UPDATE `trinity_string` SET `content_loc8` = 'Персонаж %s был посажен в тюрьму на %u час(ов) гейм-мастером %s \nПричина : %s' WHERE `entry` =12119;
UPDATE `trinity_string` SET `content_loc8` = 'Jail: конфигурация обновилась.' WHERE `entry` =12120;
UPDATE `trinity_string` SET `content_loc8` = 'Jail: Конфигурация загружена.' WHERE `entry` =12121;
UPDATE `trinity_string` SET `content_loc8` = 'Jail: Невозможно загрузить конфигурацию! Таблица пуста или отсутствует! Используйте character_jail.sql!' WHERE `entry` =12122;
UPDATE `trinity_string` SET `content_loc8` = 'Jail: Переменные конфигурации сброшены.' WHERE `entry` =12123;
UPDATE `trinity_string` SET `content_loc8` = 'Персонаж %s (GUID %u) какой-то кореш, телепортировался в тюрьму с кабанчиком.' WHERE `entry` =12124;
UPDATE `trinity_string` SET `content_loc8` = 'Персонаж %s (GUID %u) освобожден из тюряги.' WHERE `entry` =12125;
UPDATE `trinity_string` SET `content_loc8` = 'Персонажа с таким именем здесь не существует!' WHERE `entry` =12126;
UPDATE `trinity_string` SET `content_loc8` = '!!! ВНИМАНИЕ !!!\n Еще один тюремный срок, приведет к бану вашего аккаунта!' WHERE `entry` =12127;
UPDATE `trinity_string` SET `content_loc8` = 'Максимальное время пребывания в тюрьме достигнуто!' WHERE `entry` =12128;
UPDATE `trinity_string` SET `content_loc8` = 'Вы преступник,  однако в данный момент это мера сохранения персонажа.' WHERE `entry` =12129;
UPDATE `trinity_string` SET `content_loc8` = '%s был(а) %u раз в тюрьме, %u час(ов) и %u минут(ы).\nПоследний раз заключен(а) в тюрьму: %s.\nПоследняя тюрьма была: %s\nПоследняя причина была: %s' WHERE `entry` =12130;
UPDATE `trinity_string` SET `content_loc8` = '%s сидел в тюрьме много раз, и уже имеет %u банов! Поставлен штамп в дело - РЕЦЕДИВИСТ.' WHERE `entry` =12131;
UPDATE `trinity_string` SET `content_loc8` = 'Аккаунт этого персонажа блокировался %u!' WHERE `entry` =12132;
UPDATE `trinity_string` SET `content_loc8` = '%s уже сидит..!' WHERE `entry` =12133;
UPDATE `trinity_string` SET `content_loc8` = 'Вы не можете сбросить тюремные записи забаненным аккаунтом!' WHERE `entry` =12134;
UPDATE `trinity_string` SET `content_loc8` = 'Jail: Данные Тюряги перечитаны.' WHERE `entry` =12135;
UPDATE `trinity_string` SET `content_loc8` = 'Jail: Удаление записей о несуществующих более персонажей.' WHERE `entry` =12136;
UPDATE `trinity_string` SET `content_loc8` = 'Jail: Проверка на устаревшие наказания...' WHERE `entry` =12137;
UPDATE `trinity_string` SET `content_loc8` = 'Jail: Не найдено наказания.' WHERE `entry` =12138;
UPDATE `trinity_string` SET `content_loc8` = 'Jail: %u устаревшее наказание найдено и %u ms проверено.' WHERE `entry` =12139;
UPDATE `trinity_string` SET `content_loc8` = 'Jail: Инициализируем Тюрягу...' WHERE `entry` =12140;
UPDATE `trinity_string` SET `content_loc8` = 'Jail: Тюряга не активна! Отмена инициализации.' WHERE `entry` =12141;
UPDATE `trinity_string` SET `content_loc8` = 'Jail: осуждения не найдено.' WHERE `entry` =12142;
UPDATE `trinity_string` SET `content_loc8` = 'Jail: %u арест(ов) (%u активных) в %u ms загружены.' WHERE `entry` =12143;
UPDATE `trinity_string` SET `content_loc8` = 'ОШИБКА, строка слишком длинная!' WHERE `entry` =12144;
UPDATE `trinity_string` SET `content_loc8` = 'Jail: данные загружены.' WHERE `entry` =12145;
UPDATE `trinity_string` SET `content_loc8` = 'Нет данной фракции (horde/ally)! ' WHERE `entry` =12146;
UPDATE `trinity_string` SET `content_loc8` = 'Тюряга активирована.' WHERE `entry` =12197;
UPDATE `trinity_string` SET `content_loc8` = 'Тюряга деактивирована.' WHERE `entry` =12198;
UPDATE `trinity_string` SET `content_loc8` = 'Тюряга не активирована!' WHERE `entry` =12199;
