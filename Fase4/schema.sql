CREATE DATABASE globo_tech;
USE globo_tech;

DROP TABLE IF EXISTS interacao;
DROP TABLE IF EXISTS conteudo_plataforma;
DROP TABLE IF EXISTS conteudo;
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS plataforma;
DROP TABLE IF EXISTS tipo_interacao;

CREATE TABLE usuario (
	id_usuario INT PRIMARY KEY
);
CREATE TABLE tipo_interacao (
  id_tipo_interacao INT AUTO_INCREMENT PRIMARY KEY,
  nome_tipo VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE plataforma (
	id_plataforma INT PRIMARY KEY AUTO_INCREMENT,
    nome_plataforma VARCHAR (40) NOT NULL UNIQUE
);
CREATE TABLE conteudo (
	id_conteudo INT PRIMARY KEY,
    nome_conteudo VARCHAR (60) NOT NULL UNIQUE
);
CREATE TABLE conteudo_plataforma (
    id_conteudo INT NOT NULL,
    id_plataforma INT NOT NULL,
    PRIMARY KEY (id_conteudo, id_plataforma),
    FOREIGN KEY (id_conteudo) REFERENCES conteudo(id_conteudo),
    FOREIGN KEY (id_plataforma) REFERENCES plataforma(id_plataforma)
);
CREATE TABLE interacao (
  id_interacao INT AUTO_INCREMENT PRIMARY KEY,
  id_conteudo INT NOT NULL,
  id_usuario INT NOT NULL,
  id_plataforma INT NOT NULL,
  id_tipo_interacao INT NOT NULL,
  timestamp_interacao DATETIME NOT NULL,
  watch_duration_seconds INT,
  comment_text TEXT,
  FOREIGN KEY (id_conteudo) REFERENCES conteudo(id_conteudo),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_plataforma) REFERENCES plataforma(id_plataforma),
  FOREIGN KEY (id_tipo_interacao) REFERENCES tipo_interacao(id_tipo_interacao)
);

INSERT INTO plataforma (nome_plataforma) VALUES
('App Cartola'),      -- id_plataforma = 1
('Canal Brasil'),     -- id_plataforma = 2
('G1'),               -- id_plataforma = 3
('GE Globo'),         -- id_plataforma = 4
('GNT Play'),         -- id_plataforma = 5
('Globoplay'),        -- id_plataforma = 6
('Multishow'),        -- id_plataforma = 7
('Premiere'),         -- id_plataforma = 8
('Receitas Gshow'),   -- id_plataforma = 9
('Sportv Play'),      -- id_plataforma = 10
('Spotify'),          -- id_plataforma = 11
('TV Globo'),         -- id_plataforma = 12
('Viva');             -- id_plataforma = 13

INSERT INTO conteudo (id_conteudo, nome_conteudo) VALUES
(1, 'Jornal Nacional'),
(2, 'Novela Renascer'),
(3, 'Podcast Papo de Segunda'),
(4, 'Jogo do Brasileirão Série A'),
(5, 'Mais Você'),
(6, 'The Voice Brasil'),
(7, 'Podcast GE Tabelando'),
(8, 'Sessão da Tarde Clássicos'),
(9, 'Show da Virada'),
(10, 'Documentário Amazônia Viva'),
(11, 'Receitas da Ana Maria'),
(12, 'Futebol de Sabado'),
(13, 'Desenrola Brasil Podcast'),
(14, 'Globo Repórter Especial'),
(15, 'Domingão com Huck');

INSERT INTO usuario (id_usuario) VALUES
(101),
(102),
(103),
(104),
(105),
(106),
(107),
(108),
(110),
(111),
(113),
(114),
(115),
(116),
(117),
(118),
(119),
(120),
(122),
(123),
(124),
(125),
(126),
(127),
(128),
(129),
(131),
(132),
(133),
(134),
(135),
(136),
(137),
(138),
(139),
(140),
(141),
(142),
(143),
(144),
(145),
(146),
(147),
(148),
(149),
(150),
(151),
(152),
(154),
(155),
(156),
(157),
(159),
(160),
(161),
(162),
(163),
(164),
(165),
(166),
(167),
(168),
(169),
(170),
(171),
(172),
(173),
(174),
(176),
(177),
(179),
(180),
(181),
(182),
(183),
(184),
(185),
(186),
(187),
(188),
(189),
(190),
(191),
(192),
(193),
(194),
(195),
(196),
(198),
(199),
(200),
(201),
(202),
(203),
(204),
(205),
(206),
(207),
(208),
(209),
(210),
(211),
(212),
(213),
(214),
(215),
(216),
(217),
(218),
(219),
(220),
(221),
(223),
(224),
(225),
(226),
(227),
(228),
(229),
(230),
(231),
(232),
(233),
(234),
(235),
(236),
(237),
(238),
(239),
(241),
(242),
(243),
(244),
(245),
(247),
(248),
(249),
(250),
(251),
(252),
(253),
(254),
(255),
(256),
(257),
(258),
(259),
(260),
(261),
(262),
(263),
(264),
(265),
(266),
(267),
(268),
(270),
(271),
(272),
(273),
(274),
(275),
(276),
(277),
(278),
(279),
(280),
(281),
(282),
(283),
(284),
(285),
(287),
(288),
(289),
(290),
(291),
(293),
(294),
(295),
(296),
(297),
(298),
(299),
(300);

INSERT INTO conteudo_plataforma (id_conteudo, id_plataforma) VALUES
(1, 12),      -- Jornal Nacional, TV Globo
(1, 3),       -- Jornal Nacional, G1
(1, 2),       -- Jornal Nacional, Canal Brasil
(2, 6),       -- Novela Renascer, Globoplay
(2, 13),      -- Novela Renascer, Viva
(3, 6),       -- Podcast Papo de Segunda, Globoplay
(3, 3),       -- Podcast Papo de Segunda, G1
(3, 7),       -- Podcast Papo de Segunda, Multishow
(4, 8),       -- Jogo do Brasileirão Série A, Premiere
(4, 4),       -- Jogo do Brasileirão Série A, GE Globo
(4,10),       -- Jogo do Brasileirão Série A, Sportv Play
(4, 5),       -- Jogo do Brasileirão Série A, GNT Play
(5, 12),      -- Mais Você, TV Globo
(6, 6),       -- The Voice Brasil, Globoplay
(6, 12),      -- The Voice Brasil, TV Globo
(7, 4),       -- Podcast GE Tabelando, GE Globo
(7, 11),      -- Podcast GE Tabelando, Spotify
(7, 1),       -- Podcast GE Tabelando, App Cartola
(8, 12),      -- Sessão da Tarde Clássicos, TV Globo
(9, 12),      -- Show da Virada, TV Globo
(9, 6),       -- Show da Virada, Globoplay
(10, 6),      -- Documentário Amazônia Viva, Globoplay
(11, 9),      -- Receitas da Ana Maria, Receitas Gshow
(12, 10),     -- Futebol de Sábado, Sportv Play
(12, 8),      -- Futebol de Sábado, Premiere
(12, 4),      -- Futebol de Sábado, GE Globo
(13, 3),      -- Desenrola Brasil Podcast, G1
(13, 11),     -- Desenrola Brasil Podcast, Spotify
(14, 12),     -- Globo Repórter Especial, TV Globo
(14, 6),      -- Globo Repórter Especial, Globoplay
(15, 12),     -- Domingão com Huck, TV Globo
(15, 6);      -- Domingão com Huck, Globoplay

INSERT INTO tipo_interacao (nome_tipo) VALUES
('comment'),
('like'),
('share'),
('view_start');

INSERT INTO interacao (id_conteudo, id_usuario, id_plataforma, id_tipo_interacao, timestamp_interacao, watch_duration_seconds, comment_text) VALUES
(1, 101, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-20 20:05:12', 1800, NULL),
(2, 102, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-20 21:15:30', 2700, NULL),
(3, 103, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-21 10:00:00', 3600, NULL),
(3, 104, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-21 10:05:00', NULL, 'Muito bom o tema de hoje!'),
(3, 105, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'G1'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'share'), '2024-10-21 10:10:00', NULL, NULL),
(4, 106, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Premiere'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-21 16:00:00', 7200, NULL),
(4, 107, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-21 17:30:00', NULL, 'Que jogaço!'),
(5, 108, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-22 09:30:00', 1200, NULL),
(6, 110, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-22 22:30:00', 3000, NULL),
(6, 111, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-22 22:35:00', NULL, NULL),
(6, 110, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-23 15:00:00', 3200, NULL),
(7, 113, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-23 11:00:00', 2400, NULL),
(7, 114, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-23 11:05:00', NULL, 'Análise perfeita da rodada.'),
(7, 115, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Spotify'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'share'), '2024-10-23 11:15:00', NULL, NULL),
(7, 113, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-23 11:20:00', NULL, NULL),
(8, 116, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-24 15:00:00', 5400, NULL),
(9, 117, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-12-31 23:00:00', 10800, NULL),
(10, 118, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-25 22:00:00', 3300, NULL),
(10, 119, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-25 22:10:00', NULL, NULL),
(11, 120, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Receitas Gshow'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-26 10:00:00', 600, NULL),
(12, 122, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Sportv Play'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-26 16:30:00', 7000, NULL),
(12, 123, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Sportv Play'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-26 17:00:00', NULL, 'Esse narrador é demais!'),
(13, 124, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'G1'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-27 08:00:00', 1800, NULL),
(13, 125, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'G1'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-27 08:15:00', NULL, 'Ótimas dicas financeiras.'),
(14, 126, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-27 23:00:00', 3600, NULL),
(15, 127, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-28 18:00:00', 7200, NULL),
(15, 128, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-28 19:00:00', NULL, NULL),
(6, 129, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-29 22:30:00', 3100, NULL),
(6, 131, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'share'), '2024-10-29 22:50:00', NULL, NULL),
(1, 132, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-21 20:03:00', 1850, NULL),
(2, 133, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-21 21:10:15', 2750, NULL),
(3, 134, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-22 10:02:30', NULL, 'Adorei a discussão! Concordo plenamente.'),
(3, 135, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'G1'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-22 10:08:45', NULL, NULL),
(4, 136, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Premiere'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-22 16:05:50', 7250, NULL),
(4, 137, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-22 17:35:10', NULL, 'VAR polêmico de novo...'),
(5, 138, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-23 09:32:20', 1250, NULL),
(6, 139, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-23 22:33:00', 3500, NULL),
(6, 140, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-23 22:38:40', NULL, NULL),
(6, 141, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-24 15:03:15', 3300, NULL),
(7, 142, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-24 11:02:00', NULL, 'Faltou falar do meu time!'),
(7, 143, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Spotify'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-24 11:07:50', 2450, NULL),
(8, 144, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-25 15:05:30', 5450, NULL),
(9, 145, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2025-01-01 00:01:00', 10850, NULL),
(10, 146, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'share'), '2024-10-26 22:03:20', NULL, NULL),
(11, 147, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Receitas Gshow'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-27 10:02:10', 650, NULL),
(12, 148, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Sportv Play'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-27 16:33:00', NULL, 'Gol anulado injustamente!'),
(13, 149, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'G1'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-28 08:05:40', NULL, NULL),
(14, 150, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-28 23:02:55', 3650, NULL),
(15, 151, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-29 18:05:00', NULL, 'Que história emocionante!'),
(6, 152, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-30 22:31:00', 2900, NULL),
(1, 154, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-22 20:01:00', 1750, NULL),
(2, 155, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-22 21:12:45', NULL, NULL),
(3, 156, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-23 10:07:10', 3620, NULL),
(4, 157, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Premiere'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'share'), '2024-10-23 16:03:30', NULL, NULL),
(6, 159, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-24 22:36:20', 3050, NULL),
(6, 160, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-24 22:40:00', NULL, 'Essa candidata é incrível!'),
(7, 161, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-25 11:04:40', 2350, NULL),
(7, 162, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Spotify'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-25 11:09:30', NULL, 'Melhor podcast de futebol'),
(8, 163, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-26 15:08:10', NULL, NULL),
(10, 164, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-27 22:06:00', 3350, NULL),
(12, 165, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Sportv Play'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-28 16:36:50', 7050, NULL),
(13, 166, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'G1'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-29 08:08:20', 1820, NULL),
(15, 167, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-30 18:03:40', 7220, NULL),
(6, 168, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-31 22:33:50', 3150, NULL),
(6, 169, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-31 22:48:25', NULL, NULL),
(1, 170, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'G1'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-23 20:06:15', 1810, NULL),
(2, 171, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-23 21:18:00', 2710, NULL),
(3, 172, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'share'), '2024-10-24 10:10:05', NULL, NULL),
(4, 173, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-24 16:08:40', NULL, 'Resultado justo.'),
(6, 174, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-25 22:39:30', 3400, NULL),
(7, 176, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-26 11:08:15', NULL, NULL),
(7, 177, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Spotify'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-26 11:12:00', NULL, 'Concordo com a análise do comentarista X.'),
(12, 179, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Premiere'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-29 16:39:30', 7100, NULL),
(14, 180, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'share'), '2024-10-29 23:05:20', NULL, NULL),
(6, 181, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-01 22:30:10', 2950, NULL),
(6, 182, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-01 22:45:50', NULL, 'Torcendo muito!'),
(1, 183, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-24 20:02:50', 1830, NULL),
(2, 184, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-24 21:14:20', NULL, 'Que capítulo emocionante!'),
(3, 185, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'G1'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-25 10:04:30', 3580, NULL),
(4, 186, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Sportv Play'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-25 16:01:00', 7150, NULL),
(5, 187, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-26 09:38:00', 1220, NULL),
(6, 188, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-26 22:32:40', 3250, NULL),
(6, 189, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-26 22:37:15', NULL, NULL),
(7, 190, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-27 11:01:50', NULL, 'Finalmente uma análise imparcial!'),
(8, 191, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-27 15:02:30', 5350, NULL),
(10, 192, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-28 22:08:45', 3280, NULL),
(12, 193, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-30 16:42:10', NULL, 'Esse time precisa melhorar muito.'),
(13, 194, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Spotify'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-30 08:10:00', 1780, NULL),
(15, 195, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'share'), '2024-10-31 18:07:20', NULL, NULL),
(6, 196, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-02 22:35:00', 3020, NULL),
(1, 198, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Canal Brasil'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-25 20:04:00', 1780, NULL),
(2, 199, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Viva'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-25 21:16:50', 2730, NULL),
(3, 200, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Multishow'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-26 10:06:20', NULL, 'Debate necessário.'),
(4, 201, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GNT Play'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-26 16:04:15', 7180, NULL),
(6, 202, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-27 22:31:50', 3320, NULL),
(7, 203, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'App Cartola'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-28 11:03:00', NULL, 'Dicas valiosas pro Cartola!'),
(15, 204, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-11-01 18:01:30', NULL, NULL),
(6, 205, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-03 22:38:10', 3120, NULL),
(6, 206, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'share'), '2024-11-03 22:41:40', NULL, NULL),
(7, 207, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-29 11:06:00', 2420, NULL),
(7, 208, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Spotify'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-29 11:10:30', NULL, 'Amo esse podcast! Não perco um.'),
(3, 209, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-30 10:12:15', NULL, NULL),
(6, 210, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-04 22:30:00', 3550, NULL),
(6, 211, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-04 22:35:00', NULL, 'Melhor apresentação da noite!'),
(4, 212, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Premiere'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-30 16:10:00', NULL, 'Juiz ladrão!'),
(12, 213, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Sportv Play'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-02 16:30:00', 6900, NULL),
(12, 214, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Sportv Play'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-02 17:00:00', NULL, 'Que golaço!!!'),
(6, 215, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-05 22:30:00', 3000, NULL),
(6, 216, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-11-05 22:32:00', NULL, NULL),
(7, 217, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-31 11:00:00', 2500, NULL),
(7, 218, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Spotify'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-31 11:05:00', NULL, 'Análise tática impecável.'),
(3, 219, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'G1'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-01 10:00:00', 3400, NULL),
(3, 220, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-01 10:05:00', NULL, 'Esse tema me fez refletir muito.'),
(6, 221, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-06 22:30:00', 3200, NULL),
(4, 223, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Premiere'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-02 16:00:00', 7200, NULL),
(4, 224, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-02 17:30:00', NULL, 'Meu time ganhou! Uhul!'),
(12, 225, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Sportv Play'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-11-03 16:30:00', NULL, NULL),
(7, 226, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-02 11:00:00', NULL, 'Não concordo com a escalação ideal.'),
(6, 227, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-07 22:30:00', 3100, NULL),
(1, 228, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-26 20:05:12', 1800, NULL),
(2, 229, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-26 21:15:30', 2700, NULL),
(3, 230, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-27 10:00:00', 3600, NULL),
(3, 231, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-27 10:05:00', NULL, 'Excelente ponto de vista.'),
(4, 232, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Premiere'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-27 16:00:00', 7200, NULL),
(5, 233, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-28 09:30:00', 1200, NULL),
(6, 234, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-28 22:30:00', 3000, NULL),
(6, 235, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-28 22:35:00', NULL, NULL),
(7, 236, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-29 11:00:00', 2400, NULL),
(7, 237, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-29 11:05:00', NULL, 'Esse podcast é essencial.'),
(8, 238, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-30 15:00:00', 5400, NULL),
(10, 239, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-31 22:00:00', 3300, NULL),
(12, 241, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Sportv Play'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-01 16:30:00', 7000, NULL),
(13, 242, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'G1'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-02 08:00:00', NULL, 'Aprendi muito!'),
(14, 243, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-02 23:00:00', 3600, NULL),
(15, 244, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-03 18:00:00', 7200, NULL),
(6, 245, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-04 22:30:00', 3100, NULL),
(1, 247, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-27 20:03:00', 1850, NULL),
(2, 248, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'share'), '2024-10-27 21:10:15', NULL, NULL),
(3, 249, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-28 10:02:30', NULL, 'Poderiam trazer o fulano para debater.'),
(4, 250, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Premiere'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-28 16:05:50', NULL, NULL),
(6, 251, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-29 22:33:00', 3500, NULL),
(7, 252, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-30 11:02:00', NULL, 'Informação de qualidade.'),
(6, 253, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-08 22:30:00', 2980, NULL),
(6, 254, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-11-08 22:33:00', NULL, NULL),
(7, 255, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Spotify'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-03 11:00:00', 2480, NULL),
(7, 256, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-03 11:04:00', NULL, 'Os melhores comentaristas estão aqui.'),
(3, 257, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'G1'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'share'), '2024-11-04 10:15:00', NULL, NULL),
(6, 258, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-09 22:30:00', 3600, NULL),
(6, 259, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-09 22:36:00', NULL, 'Arrasou na performance!'),
(4, 260, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Premiere'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-03 16:10:00', NULL, 'Foi pênalti claro!'),
(12, 261, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Sportv Play'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-04 16:30:00', 6950, NULL),
(12, 262, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Sportv Play'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-04 17:05:00', NULL, 'Que defesaça do goleiro!'),
(6, 263, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-10 22:30:00', 3050, NULL),
(7, 264, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-05 11:00:00', 2520, NULL),
(7, 265, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Spotify'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-05 11:06:00', NULL, 'Podcast indispensável para quem ama futebol.'),
(3, 266, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-06 10:00:00', 3450, NULL),
(3, 267, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-06 10:07:00', NULL, 'Assunto super relevante para os dias atuais.'),
(6, 268, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-11 22:30:00', 3250, NULL),
(4, 270, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Premiere'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-05 16:00:00', 7250, NULL),
(4, 271, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-05 17:35:00', NULL, 'Esse técnico precisa ser demitido!'),
(7, 272, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-06 11:00:00', NULL, 'Só verdades foram ditas.'),
(6, 273, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-12 22:30:00', 3150, NULL),
(1, 274, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-28 20:05:12', 1800, NULL),
(2, 275, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-28 21:15:30', 2700, NULL),
(3, 276, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-29 10:00:00', 3600, NULL),
(3, 277, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-29 10:05:00', NULL, 'Convidem mais especialistas no assunto.'),
(4, 278, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Premiere'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-29 16:00:00', 7200, NULL),
(5, 279, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-30 09:30:00', 1200, NULL),
(6, 280, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-30 22:30:00', 3000, NULL),
(6, 281, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-30 22:35:00', NULL, NULL),
(7, 282, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-31 11:00:00', 2400, NULL),
(7, 283, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-31 11:05:00', NULL, 'Acompanho toda semana.'),
(8, 284, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-01 15:00:00', 5400, NULL),
(10, 285, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-02 22:00:00', 3300, NULL),
(12, 287, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Sportv Play'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-03 16:30:00', 7000, NULL),
(13, 288, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'G1'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-04 08:00:00', NULL, 'Muito útil'),
(14, 289, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-04 23:00:00', 3600, NULL),
(15, 290, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-05 18:00:00', 7200, NULL),
(6, 291, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-06 22:30:00', 3100, NULL),
(1, 293, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-29 20:03:00', 1850, NULL),
(2, 294, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'share'), '2024-10-29 21:10:15', NULL, NULL),
(3, 295, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-10-30 10:02:30', NULL, 'Sempre com temas pertinentes.'),
(4, 296, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Premiere'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-10-30 16:05:50', NULL, NULL),
(6, 297, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-10-31 22:33:00', 3500, NULL),
(7, 298, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'GE Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'comment'), '2024-11-01 11:02:00', NULL, 'Melhor análise esportiva da internet.'),
(6, 299, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'TV Globo'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'view_start'), '2024-11-13 22:30:00', 2980, NULL),
(6, 300, (SELECT id_plataforma FROM plataforma WHERE nome_plataforma = 'Globoplay'), (SELECT id_tipo_interacao FROM tipo_interacao WHERE nome_tipo = 'like'), '2024-11-13 22:33:00', NULL, NULL);

-- RELATÓRIOS

-- quais conteúdos estão em quais plataformas?
SELECT c.id_conteudo, c.nome_conteudo, p.id_plataforma, p.nome_plataforma
	FROM conteudo c
	JOIN conteudo_plataforma cp ON cp.id_conteudo = c.id_conteudo
	JOIN plataforma p ON p.id_plataforma = cp.id_plataforma
	ORDER BY c.nome_conteudo, p.nome_plataforma;
		
-- top 10 conteúdos assistidos por tempo de execucação
SELECT c.id_conteudo, c.nome_conteudo, SUM(i.watch_duration_seconds) AS Segundos_Assistidos
	FROM conteudo c 
	JOIN interacao i ON c.id_conteudo = i.id_conteudo
    JOIN tipo_interacao ti ON i.id_tipo_interacao = ti.id_tipo_interacao
	GROUP BY c.id_conteudo, c.nome_conteudo
	ORDER BY Segundos_Assistidos DESC
	LIMIT 10;

-- top 10 total interacoes
SELECT c.id_conteudo, c.nome_conteudo, 
	SUM(CASE WHEN ti.nome_tipo = 'like' THEN 1 ELSE 0 END) AS Total_Likes,
    SUM(CASE WHEN ti.nome_tipo = 'comment' THEN 1 ELSE 0 END) AS Total_Comment,
    SUM(CASE WHEN ti.nome_tipo = 'share' THEN 1 ELSE 0 END) AS Total_Share,
    SUM(CASE WHEN ti.nome_tipo = 'view_start' THEN 1 ELSE 0 END) AS Total_View,
    SUM(CASE WHEN ti.nome_tipo IN ('like', 'comment', 'share', 'view_start') THEN 1 ELSE 0 END) AS Total_Interacao
    FROM conteudo c 
    JOIN interacao i ON c.id_conteudo = i.id_conteudo
    JOIN tipo_interacao ti ON i.id_tipo_interacao = ti.id_tipo_interacao
    GROUP BY c.id_conteudo, c.nome_conteudo
	ORDER BY Total_Interacao DESC
    LIMIT 10;

-- Comentários por plataforma e conteudo
SELECT p.nome_plataforma, c.id_conteudo, c.nome_conteudo, i.id_usuario, i.timestamp_interacao, i.comment_text
	FROM interacao i
	JOIN tipo_interacao ti ON i.id_tipo_interacao = ti.id_tipo_interacao
    JOIN plataforma p ON i.id_plataforma = p.id_plataforma
	JOIN conteudo c ON i.id_conteudo = c.id_conteudo
	WHERE ti.nome_tipo = 'comment'
    GROUP BY p.nome_plataforma, c.nome_conteudo, i.id_usuario, i.timestamp_interacao, i.comment_text;

-- top 10 likes
SELECT c.id_conteudo, c.nome_conteudo, 
	SUM(CASE WHEN ti.nome_tipo = 'like' THEN 1 ELSE 0 END) AS Total_Likes
    FROM conteudo c 
    JOIN interacao i ON c.id_conteudo = i.id_conteudo
    JOIN tipo_interacao ti ON i.id_tipo_interacao = ti.id_tipo_interacao
    GROUP BY c.id_conteudo, c.nome_conteudo
	ORDER BY Total_Likes DESC
    LIMIT 10;
    
-- top plataformas por quantidade de comentário
SELECT c.id_conteudo, c.nome_conteudo, COUNT(i.id_interacao) AS Total_Comentarios
	FROM conteudo c 
    JOIN interacao i ON c.id_conteudo = i.id_conteudo
    JOIN tipo_interacao ti ON i.id_tipo_interacao = ti.id_tipo_interacao
	WHERE ti.nome_tipo = 'comment'
    GROUP BY c.id_conteudo, c.nome_conteudo
    ORDER BY Total_Comentarios DESC;

-- top 10 share
SELECT c.id_conteudo, c.nome_conteudo, 
	SUM(CASE WHEN ti.nome_tipo = 'share' THEN 1 ELSE 0 END) AS Total_Share
	FROM conteudo c 
    JOIN interacao i ON c.id_conteudo = i.id_conteudo
    JOIN tipo_interacao ti ON i.id_tipo_interacao = ti.id_tipo_interacao
    GROUP BY c.id_conteudo, c.nome_conteudo
	ORDER BY Total_Share DESC
    LIMIT 10;
    
-- top 10 View Start
SELECT c.id_conteudo, c.nome_conteudo, 
	SUM(CASE WHEN ti.nome_tipo = 'view_start' THEN 1 ELSE 0 END) AS Total_View
	FROM conteudo c 
    JOIN interacao i ON c.id_conteudo = i.id_conteudo
    JOIN tipo_interacao ti ON i.id_tipo_interacao = ti.id_tipo_interacao
    GROUP BY c.id_conteudo, c.nome_conteudo
	ORDER BY Total_View DESC
    LIMIT 10;
    
-- tipo de interacao maior por plataforma
SELECT p.id_plataforma, p.nome_plataforma, ti.nome_tipo AS Tipo_Interacao, COUNT(i.id_interacao) AS Plataforma_Engajamento
	FROM plataforma p
	LEFT JOIN interacao i ON i.id_plataforma = p.id_plataforma
	LEFT JOIN tipo_interacao ti ON i.id_tipo_interacao = ti.id_tipo_interacao
	GROUP BY p.id_plataforma, p.nome_plataforma, ti.nome_tipo
	ORDER BY Plataforma_Engajamento DESC;

-- plataforma com maior engajamento total
SELECT p.id_plataforma, p.nome_plataforma, COUNT(i.id_interacao) AS Plataforma_Total
	FROM plataforma p
	LEFT JOIN interacao i ON i.id_plataforma = p.id_plataforma	
	LEFT JOIN tipo_interacao ti ON i.id_tipo_interacao = ti.id_tipo_interacao AND ti.nome_tipo IN ('like', 'comment', 'share', 'view_start') 
	GROUP BY p.id_plataforma, p.nome_plataforma
    ORDER BY Plataforma_Total DESC;

-- tempo médio de consumo por plataforma
SELECT p.id_plataforma, p.nome_plataforma, ROUND(AVG(i.watch_duration_seconds),2) AS Tempo_Medio_Plataforma
	FROM interacao i 
    JOIN conteudo_plataforma cp ON cp.id_conteudo = i.id_conteudo
    JOIN plataforma p ON cp.id_plataforma = p.id_plataforma
    WHERE i.watch_duration_seconds IS NOT NULL
    GROUP BY p.id_plataforma, p.nome_plataforma
    ORDER BY Tempo_Medio_Plataforma DESC;

-- tempo médio de consumo por conteúdo
SELECT c.id_conteudo, c.nome_conteudo, ROUND(AVG(i.watch_duration_seconds),2) AS Tempo_Medio_Conteudo
	FROM conteudo c 
    JOIN interacao i ON c.id_conteudo = i.id_conteudo
    WHERE i.watch_duration_seconds IS NOT NULL
    GROUP BY c.id_conteudo, c.nome_conteudo
	ORDER BY Tempo_Medio_Conteudo DESC;

-- relatorio usuario interacoes
SELECT u.id_usuario,
	SUM(CASE WHEN ti.nome_tipo = 'like' THEN 1 ELSE 0 END) AS Total_Likes,
    SUM(CASE WHEN ti.nome_tipo = 'comment' THEN 1 ELSE 0 END) AS Total_Comment,
    SUM(CASE WHEN ti.nome_tipo = 'share' THEN 1 ELSE 0 END) AS Total_Share,
    SUM(CASE WHEN ti.nome_tipo = 'view_start' THEN 1 ELSE 0 END) AS Total_View,
    SUM(CASE WHEN ti.nome_tipo IN ('like', 'comment', 'share', 'view_start') THEN 1 ELSE 0 END) AS Total_Interacao
    FROM usuario u
    JOIN interacao i ON i.id_usuario = u.id_usuario
    JOIN tipo_interacao ti ON ti.id_tipo_interacao = i.id_tipo_interacao
    GROUP BY u.id_usuario
    ORDER BY u.id_usuario;

-- tempo médio e tempo total do usuario
SELECT u.id_usuario,
	ROUND(AVG(i.watch_duration_seconds),2) AS Media_Tempo_Usuario,
    SUM(i.watch_duration_seconds) AS Tempo_Total_Usuario
    FROM usuario u
    JOIN interacao i ON i.id_usuario = u.id_usuario
	WHERE i.watch_duration_seconds IS NOT NULL
    GROUP BY u.id_usuario
    ORDER BY u.id_usuario;
    
