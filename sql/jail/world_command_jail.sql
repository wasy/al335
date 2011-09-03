SET NAMES utf8;

DELETE FROM `command` WHERE `name` LIKE '%jail%';
INSERT INTO `command` (name, security, help) VALUES
('jail info',       0, 'Syntax: .jail info \nJail: Показывает, ваш статус в тюрьме.'),
('jail goto',       0, 'Syntax: .jail goto Фракция (horde/ally) \nJail: Телепортирует вас в тюрьму указанной фракции.'),
('jail pinfo',      1, 'Syntax: .jail pinfo [персонаж]\nJail: показывает информацию по указанному персонажу.'),
('jail arrest',     2, 'Syntax: .jail arrest [персонаж]\nJail: отправить персонажа под арест.'),
('jail release',    2, 'Syntax: .jail release [персонаж]\nEntlasst den Charakter aus dem Knast.'),
('jail reset',      2, 'Syntax: .jail reset [персонаж]\nGibt dem selektiertem, oder angegebenen Charakter, wieder eine weisse Weste.\nAls ware nie etwas geschehen. ;-)\nAmnasty International lasst grussen! :D'),
('jail reload',     2, 'Syntax: .jail reload \nLadt die Jail-Konfiguration und die Inhaftierungen neu aus der Datenbank.'),
('jail enable',     2, 'Syntax: .jail enable \nSchaltet das Jail ein.'),
('jail disable',    2, 'Syntax: .jail disable \nSchaltet das Jail aus.'),
('jail delete',     3, 'Syntax: .jail delete \nWie reset, aber loscht auch Jails mit Bannungen!\nDie Bannung wird dadurch auch geloscht!');
