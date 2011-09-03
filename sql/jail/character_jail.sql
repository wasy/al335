SET NAMES utf8;

DROP TABLE IF EXISTS `jail`;
CREATE TABLE IF NOT EXISTS `jail` (
  `guid` int(11) unsigned NOT NULL COMMENT 'GUID Персонажа',
  `char` varchar(13) NOT NULL COMMENT 'Имя Персонажа',
  `release` int(11) unsigned NOT NULL COMMENT 'Дата ареста',
  `reason` varchar(255) NOT NULL COMMENT 'Причина ареста',
  `times` int(11) unsigned NOT NULL COMMENT 'Кол-во задержаний',
  `gmacc` int(11) unsigned NOT NULL COMMENT 'Ответственный GM-Account',
  `gmchar` varchar(13) NOT NULL COMMENT 'Ответственный GM-Char',
  `lasttime` int(11) unsigned NOT NULL COMMENT 'Дата последнего ареста',
  `duration` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Срок содержания под стражей',
  `btimes` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Anzahl der Bannungen durch das Jail.',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Jail Tabelle fur UWoM-Server von WarHead.';

DROP TABLE IF EXISTS `jail_conf`;
CREATE TABLE IF NOT EXISTS `jail_conf` (
  `max_jails` int(11) unsigned NOT NULL DEFAULT '3' COMMENT 'Кол-во арестов после чего персонаж удаляется, и/или блокируется учетная запись.',
  `max_duration` int(11) unsigned NOT NULL DEFAULT '720' COMMENT 'Макс. срок лишения свободы в часах. (По умолчанию = 30 дней)',
  `min_reason` int(11) unsigned NOT NULL DEFAULT '40' COMMENT 'Мин. кол-во символов в причине ареста.',
  `warn_player` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Предупреждать при входе в мир игрока, при приближении макс. кол-ва задержаний? (Max_jails).',
  `ally_x` float NOT NULL DEFAULT '-8673.43' COMMENT 'Тюрьма Альянса - X координата',
  `ally_y` float NOT NULL DEFAULT '631.795' COMMENT 'Тюрьма Альянса - Y координата',
  `ally_z` float NOT NULL DEFAULT '96.9406' COMMENT 'Тюрьма Альянса - Z координата',
  `ally_o` float NOT NULL DEFAULT '2.1785' COMMENT 'Тюрьма Альянса - ориентация',
  `ally_m` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Тюрьма Альянса - карта',
  `horde_x` float NOT NULL DEFAULT '2179.85' COMMENT 'Тюрьма Орды - X координата',
  `horde_y` float NOT NULL DEFAULT '-4763.96' COMMENT 'Тюрьма Орды - Y координата',
  `horde_z` float NOT NULL DEFAULT '54.911' COMMENT 'Тюрьма Орды - Z координата',
  `horde_o` float NOT NULL DEFAULT '4.44216' COMMENT 'Тюрьма Орды - ориентация',
  `horde_m` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'Тюрьма Орды - карта',
  `del_char` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Удалять Персонажа при достижении макс. кол-ва задержаний?',
  `ban_acc` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Блокировать Аккаунт при достижении макс. кол-ва задержаний?',
  `ban_duration` int(11) unsigned NOT NULL DEFAULT '168' COMMENT 'Banndauer in Stunden, nachdem der Account wieder freigeschaltet wird (Standard = 7 Tage).',
  `radius` int(11) unsigned NOT NULL DEFAULT '10' COMMENT 'Радиус в ярдах (3D), по которым может перемещаться рецидивист (0 = движения невозможно).',
  `enabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Вкл./Выкл. тюрьмы. По умолчанию выключена.',
  `gm_acc` int(11) unsigned NOT NULL DEFAULT '2019794' COMMENT 'Аккаунт - который используются для наложения банов.',
  `gm_char` varchar(13) NOT NULL DEFAULT 'Robotron' COMMENT 'Персонаж - который используются для наложения банов.',
  `amnesty` int(11) unsigned NOT NULL DEFAULT '3' COMMENT 'Время (мес.), после которого удаляется задержание.',
  PRIMARY KEY (`max_jails`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Jail Konfigurations-Tabelle fur UWoM-Server von WarHead.';

INSERT INTO `jail_conf` (`max_jails`, `max_duration`, `min_reason`, `warn_player`, `ally_x`, `ally_y`, `ally_z`, `ally_o`, `ally_m`, `horde_x`, `horde_y`, `horde_z`, `horde_o`, `horde_m`, `del_char`, `ban_acc`, `ban_duration`, `radius`, `enabled`, `gm_acc`, `gm_char`, `amnesty`) VALUES
(5, 168, 25, 1, -8673.43, 631.795, 96.9406, 2.1785, 0, 2179.85, -4763.96, 54.911, 4.44216, 1, 0, 1, 168, 10, 1, 2143, 'Alivelegends', 2);
