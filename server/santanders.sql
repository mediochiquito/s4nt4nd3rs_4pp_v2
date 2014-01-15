-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-01-2014 a las 12:45:32
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `santanders`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `categorias_id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `categorias_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`categorias_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categorias_id`, `categorias_nombre`) VALUES
(1, 'Deportes'),
(2, 'Moda'),
(3, 'Música'),
(4, 'Culturales'),
(5, 'Gastronómico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE IF NOT EXISTS `departamentos` (
  `departamentos_id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `departamentos_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`departamentos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`departamentos_id`, `departamentos_nombre`) VALUES
(1, 'Artigas\r'),
(2, 'Canelones\r'),
(3, 'Cerro Largo\r'),
(4, 'Colonia\r'),
(5, 'Durazno\r'),
(6, 'Flores\r'),
(7, 'Florida\r'),
(8, 'Lavalleja\r'),
(9, 'Maldonado\r'),
(10, 'Montevideo\r'),
(11, 'Paysandú\r'),
(12, 'Río Negro\r'),
(13, 'River\r'),
(14, 'Rocha\r'),
(15, 'Salto\r'),
(16, 'San José\r'),
(17, 'Soriano'),
(18, 'Tacuarembó\r'),
(19, 'Treinta y Tres');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE IF NOT EXISTS `eventos` (
  `eventos_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `eventos_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `eventos_fecha_hora` datetime NOT NULL,
  `eventos_lugar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `eventos_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `eventos_lat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `eventos_lon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `eventos_uid` bigint(20) unsigned NOT NULL,
  `eventos_tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `eventos_fecha_hora_creado` datetime NOT NULL,
  `eventos_categoria_id` tinyint(2) unsigned NOT NULL,
  `eventos_sync_value` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `eventos_estado` tinyint(1) NOT NULL COMMENT '-1 eliminado, 0 a moderar, 1 aprobado',
  `eventos_header_img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`eventos_id`),
  KEY `eventos_categoria_id` (`eventos_categoria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=192 ;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`eventos_id`, `eventos_nombre`, `eventos_fecha_hora`, `eventos_lugar`, `eventos_desc`, `eventos_lat`, `eventos_lon`, `eventos_uid`, `eventos_tags`, `eventos_fecha_hora_creado`, `eventos_categoria_id`, `eventos_sync_value`, `eventos_estado`, `eventos_header_img`) VALUES
(1, 'Mateo1 Mateo1', '2013-12-13 12:00:00', 'Lugar 1111', 'Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs asdsf', '-34.966647', '-54.95191', 0, 'pepe', '2013-12-13 00:59:42', 1, '2014-01-02 16:18:47', -1, ''),
(2, 'Evento ole', '2013-12-13 12:00:00', '2232323232323', 'Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs asdsf', '-34.969812', '-54.950537', 0, 'tags', '2013-12-03 00:00:00', 1, '2013-12-28 02:35:17', -1, ''),
(3, '33 3 3 33 ', '2013-12-13 12:00:00', '333 333 ', 'Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs asdsf', '-34.953282', '-54.937405', 0, 'tags', '2013-12-25 10:00:00', 3, '2014-01-02 16:18:47', -1, ''),
(4, 'Evento 4', '2013-12-13 12:00:00', 'Lugar4', 'Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs asdsf', '-34.962005', '-54.945473', 0, 'cerveza', '0000-00-00 00:00:00', 2, '2014-01-02 16:18:47', -1, ''),
(5, 'Evento 555555', '2013-12-13 12:00:00', 'Lugar5555555', 'Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs asdsf', '-34.963693', '-54.941095', 0, 'tags', '0000-00-00 00:00:00', 5, '2014-01-02 16:18:47', -1, ''),
(6, 'Even6', '2013-12-13 12:00:00', 'Lugar6', 'Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs asdsf', '-34.95293', '-54.931912', 0, 'tags', '0000-00-00 00:00:00', 1, '2014-01-02 16:18:47', -1, ''),
(8, 'Even7', '2013-12-13 12:00:00', 'Lugar7', 'Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs asdsf', '-34.947654', '-54.939722', 0, 'tags', '0000-00-00 00:00:00', 3, '2014-01-02 16:18:47', -1, ''),
(9, 'Even real 9', '2013-12-13 12:00:00', 'Luga8', 'Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs asdsf', '-34.945614', '-54.932255', 0, 'tags', '0000-00-00 00:00:00', 4, '2014-01-02 16:18:47', -1, ''),
(10, 'Even9', '2013-12-13 12:00:00', 'Luga9', 'Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs asdsf', '-34.940267', '-54.930538', 0, 'tags', '0000-00-00 00:00:00', 4, '2014-01-02 16:18:47', -1, ''),
(11, '000000', '2013-12-13 12:00:00', 'Luga1000000', 'Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs asdsf', '-34.946036', '-54.934916', 0, 'tags', '0000-00-00 00:00:00', 3, '2014-01-02 16:18:47', -1, ''),
(12, 'Luciano 1111', '2013-12-13 12:00:00', 'Luga1111111', 'Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs Descs asdsf', '-34.959402', '-54.941095', 0, 'tags', '0000-00-00 00:00:00', 3, '2014-01-02 16:18:47', -1, ''),
(13, 'Nuevo Eventote', '2013-12-27 16:07:51', 'Casa ', 'Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote Nuevo Eventote ', '-33', '-33', 0, 'gay', '2013-12-27 16:07:51', 2, '2014-01-02 16:18:47', -1, ''),
(14, 'Pepelepu', '2013-12-27 20:54:00', 'laksjdlaskd', 'lasikdjñlas jdaslhj dñlkasjd', '-34.91465167195755', '-55.04613876342768', 0, 'etiqyueta', '2013-12-27 18:55:18', 1, '2014-01-02 16:18:47', -1, ''),
(15, 'Ovo Nightclub', '2014-01-01 00:00:00', 'Punta del Este', 'DJs: Pedro Cazanova y Sandro Horta. Entradas a la venta próximamente por RED UTS', '-34.950371375785814', '-54.93879675865168', 0, 'Música, Djs, Pedro Cazanova, Sandro Horta, Ovo', '2014-01-02 08:43:49', 3, '2014-01-09 01:22:39', 1, ''),
(16, 'Tommy Fest', '2014-01-01 00:00:00', 'RUTA INTERBALNEARIA KM 115.5 - PUNTA DEL ESTE', 'TOMMY FEST es el festival de música que produce Tommy Hotel Party Resort.', '-34.87757505005106', '-55.079441070556584', 0, 'Tommy Fest', '2014-01-02 09:22:06', 3, '2014-01-02 16:22:06', 1, ''),
(17, 'Milo Lockett', '2014-01-02 20:30:00', 'GrilloArte - calle 28 entre gorlero y 20', 'Milo Lockett es un artista plástico chaqueño, autodidacta, que comenzó su carrera luego de trabajar varios años en la industria textil.', '-34.96057735135807', '-54.94263768196106', 0, 'Milo Lockett, Grillo, Arte, Culturales', '2014-01-02 09:25:22', 4, '2014-01-09 01:20:42', 1, ''),
(18, 'Ovo Nightclub', '2014-01-02 00:00:00', 'Ovo Nightclub Punta del Este', 'DJs: Tito y Switch. Entradas a la venta próximamente por RED UTS.', '-34.95027992029341', '-54.93885040283203', 0, 'Ovo Nightclub', '2014-01-02 09:27:46', 3, '2014-01-02 16:27:46', 1, ''),
(19, 'Tommy Fest', '2014-01-02 00:00:00', 'RUTA INTERBALNEARIA KM 115.5 - PUNTA DEL ESTE', 'TOMMY FEST es el festival de música que produce Tommy Hotel Party Resort.', '-34.87752752613944', '-55.079183578491154', 0, 'Tommy Fest', '2014-01-02 09:29:39', 3, '2014-01-02 16:29:39', 1, ''),
(20, 'XXV edición del Seven de Punta del Este', '2014-01-03 17:00:00', 'Campus Municipal de Maldonado - 3 de Febrero y Rincón.', 'El 3 y 4 de enero de 2014 se llevará a cabo la XXV edición del Seven de Punta del Este, evento que se enmarca en los festejos de los 100 años del Old Boys and Old Girls Club.', '-34.91439301558625', '-54.9546861648559', 0, 'XXV edición del Seven de Punta del Este.', '2014-01-02 09:31:39', 1, '2014-01-02 16:32:23', 1, ''),
(21, 'Ovo Nightclub', '2014-01-03 00:00:00', 'Ovo Nightclub', 'DJs: EDX y El Baile. Entradas a la venta próximamente por RED UTS.', '-34.95027992029341', '-54.93880748748779', 0, 'Ovo Nightclub', '2014-01-02 09:33:58', 3, '2014-01-02 16:33:58', 1, ''),
(22, 'Tommy Fest', '2014-01-03 00:00:00', 'RUTA INTERBALNEARIA KM 115.5 - PUNTA DEL ESTE', 'TOMMY FEST es el festival de música que produce Tommy Hotel Party Resort.', '-34.877034630471826', '-55.079612731933594', 0, 'Tommy Fest', '2014-01-02 09:34:48', 3, '2014-01-02 16:34:48', 1, ''),
(23, 'Fiesta en Laguna Escondida', '2014-01-03 00:00:00', 'José Ignacio', 'Laguna Escondida es el barrio privado más exclusivo de José Ignacio.', '-34.81765429636934', '-54.62797164916992', 0, 'José Ignacio, Laguna Escondida,Música, Musica', '2014-01-02 09:38:19', 3, '2014-01-09 01:13:35', 1, ''),
(24, 'David Guetta y Nervo', '2014-01-04 22:00:00', 'El Jaguel', 'La música electrónica de primer nivel vuelve a estar presente en Punta del Este. El próximo 4 de enero estarán David Guetta y NERVO en el Punta del Este Summer Festival.', '-34.92034007175975', '-54.91842269897461', 0, 'David Guetta y Nervo', '2014-01-02 11:29:36', 3, '2014-01-02 18:29:36', 1, ''),
(25, 'XXV edición del Seven de Punta del Este', '2014-01-04 17:00:00', 'Campus Municipal de Maldonado - 3 de Febrero y Rincón.', 'El 3 y 4 de enero de 2014 se llevará a cabo la XXV edición del Seven de Punta del Este, evento que se enmarca en los festejos de los 100 años del Old Boys and Old Girls Club.', '-34.91435782894356', '-54.95455741882324', 0, 'XXV edición del Seven de Punta del Este', '2014-01-02 11:31:11', 1, '2014-01-02 18:31:11', 1, ''),
(26, 'Desfile Antonio Urzi', '2014-01-04 21:30:00', 'Mantra Resort y Casino', 'El Desfile del reconocido diseñador Italiano Antonio Urzi se realizará el 4 de enero en el Mantra Resort y Casino de Punta del Este.', '-34.907695032294136', '-54.85018730163574', 0, 'Desfile Antonio Urzi', '2014-01-02 11:34:14', 2, '2014-01-02 18:34:14', 1, ''),
(27, '5 Millas Lobos Columbia', '2014-01-04 19:30:00', 'La Barra, Punta del Este', 'Aventura Lobos Columbia cumple 9 años y se renueva, la clásica carrera de aventura del verano esta vez es para los amantes del running y el trail run. De La Barra a Punta del Este por la orilla del mar.', '-34.91913222125675', '-54.86853361129761', 0, '5 Millas Lobos Columbia', '2014-01-02 11:36:23', 1, '2014-01-02 18:36:23', 1, ''),
(28, 'Ovo Nightclub', '2014-01-04 00:00:00', 'Ovo Nightclub', 'DJ: AN 21. Entradas a la venta próximamente por RED UTS.', '-34.95028607558317', '-54.93885040283203', 0, 'Ovo Nightclub', '2014-01-02 11:38:14', 3, '2014-01-02 18:38:14', 1, ''),
(29, 'Tommy Fest', '2014-01-04 00:00:00', 'RUTA INTERBALNEARIA KM 115.5 - PUNTA DEL ESTE', 'TOMMY FEST es el festival de música que produce Tommy Hotel Party Resort.', '-34.87757505005106', '-55.07944107055664', 0, 'Tommy Fest', '2014-01-02 11:39:18', 3, '2014-01-02 18:39:18', 1, ''),
(30, 'Partido de las Estrellas', '2014-01-05 20:30:00', 'Campus Municipal de Maldonado - 3 de Febrero y Rincón.', 'Contará con la participación de reconocidos futbolistas uruguayos y extranjeros. Entradas $ 30 y cabeceras $ 70.', '-34.91446340171366', '-54.954729080200195', 0, 'Partido de las Estrellas', '2014-01-02 12:22:34', 1, '2014-01-02 19:22:34', 1, ''),
(31, 'Ovo Nightclub', '2014-01-05 00:00:00', 'Ovo Nightclub', 'DJ: Hands Up. Entradas a la venta próximamente por RED UTS.', '-34.95033883887119', '-54.93891477584839', 0, 'Ovo Nightclub', '2014-01-02 12:23:44', 3, '2014-01-02 19:23:44', 1, ''),
(32, 'Tommy Fest', '2014-01-05 00:00:00', 'RUTA INTERBALNEARIA KM 115.5 - PUNTA DEL ESTE', 'TOMMY FEST es el festival de música que produce Tommy Hotel Party Resort.', '-34.877610261048694', '-55.079312324523926', 0, 'Tommy Fest', '2014-01-02 12:24:33', 3, '2014-01-02 19:24:33', 1, ''),
(33, '40º Corrida de San Fernando', '2014-01-06 20:00:00', 'Punta del Este', 'El próximo 6 de enero se realizará la 40 edición de la Corrida San Fernando. El costo de la inscripción es $350 y puede efectuarse en todos los locales Redpagos del país. ', '-34.959677405322815', '-54.94528770446777', 0, '40º Corrida de San Fernando', '2014-01-02 12:32:00', 1, '2014-01-02 19:32:00', 1, ''),
(34, 'Ovo Nightclub', '2014-01-06 00:00:00', 'Ovo Nightclub', 'DJ: Bibba Pacheco. Entradas a la venta próximamente por RED UTS.', '-34.95035642662632', '-54.938786029815674', 0, 'Ovo Nightclub', '2014-01-02 12:33:06', 3, '2014-01-06 01:06:15', 1, ''),
(35, 'Ovo Nightclub', '2014-01-07 00:00:00', 'Ovo Nightclub', 'DJ Bibba Pacheco (Brasil)\nDesde usd 35 mujeres y usd 50 hombres, venta por Red UTS', '-34.95027992029341', '-54.93885040283203', 0, 'Ovo Nightclub', '2014-01-02 12:40:13', 3, '2014-01-07 23:26:44', 1, ''),
(36, 'Ovo Nightclub', '2014-01-08 00:00:00', 'Ovo Nightclub', 'DJs: Leo & Pana y Christian Klein. Desde usd 35 mujeres y usd 50 hombres, venta por Red UTS', '-34.95035027134183', '-54.93880748748779', 0, 'Ovo Nightclub', '2014-01-02 12:41:25', 3, '2014-01-07 23:38:02', 1, ''),
(37, '18º Festival Internacional de Jazz de Punta del Este', '2014-01-09 20:00:00', 'Finca El Sosiego', 'Con profunda satisfacción anunciamos el 18º Festival Internacional de Jazz de Punta del Este, que como en los últimos seis años se realizará en la “Finca El Sosiego” de Punta Ballena, convocando a un importante número de grandes talentos que revistan en la élite del jazz mundial.', '-34.88320793452865', '-55.04270553588867', 0, 'Música, Musica, Jazz, Festival', '2014-01-02 12:52:05', 3, '2014-01-09 00:57:04', 1, ''),
(38, 'Arte Punta 2014', '2014-01-09 19:00:00', 'Conrad Punta del Este Resort & Casino', 'En Arte Punta 2014 se darán cita los principales especialistas y profesionales del sector siendo esta una feria de referencia dentro del sector en Uruguay, y un evento de inexcusable asistencia tanto para los profesionales como para los amantes del mundo del arte.', '-34.95033883887119', '-54.938807487487736', 0, 'Arte Punta 2014, Arte, Culturales', '2014-01-02 12:55:35', 4, '2014-01-09 01:06:36', 1, ''),
(39, 'Ovo Nightclub', '2014-01-09 00:00:00', 'Ovo Nightclub', 'DJ Leo Medina SLS Miami (Argentina)\n· OVO nightclub, 00:00\n· desde usd 35 mujeres y usd 50 hombres, venta por Red UTS', '-34.95028607558317', '-54.93885040283203', 0, 'Ovo Nightclub', '2014-01-02 12:57:37', 3, '2014-01-07 23:59:35', 1, ''),
(40, '18º Festival Internacional de Jazz de Punta del Este', '2014-01-10 20:00:00', 'Finca El Sosiego', 'Con profunda satisfacción anunciamos el 18º Festival Internacional de Jazz de Punta del Este, que como en los últimos seis años se realizará en la “Finca El Sosiego” de Punta Ballena, convocando a un importante número de grandes talentos que revistan en la élite del jazz mundial.', '-34.882878774573236', '-55.04287719726557', 0, 'Música, Musica, Jazz, Festival', '2014-01-02 12:59:09', 3, '2014-01-09 00:57:25', 1, ''),
(41, 'Pilar Sordo: ''''Cómo Ser Feliz en el Siglo XXI''''', '2014-01-10 21:00:00', 'Conrad Punta del Este Resort & Casino - Salón Río de Janeiro', 'La experimentada psicóloga Pilar Sordo llega a nuestro país con su conferencia "Cómo ser feliz en el siglo XXI".  Precios: usd 50 y 60, venta por Red UTS', '-34.95021000823513', '-54.93879675865173', 0, 'Pilar Sordo, Conrad, Culturales', '2014-01-02 13:17:12', 4, '2014-01-09 01:23:16', 1, ''),
(42, 'Ovo Nightclub', '2014-01-10 00:00:00', 'Ovo Nightclub', 'DJs: Fabricio Peçanha y Tati Fontes. Desde usd 35 mujeres y usd 50 hombres, venta por Red UTS', '-34.95012778551535', '-54.939022064208984', 0, 'Ovo Nightclub', '2014-01-02 13:18:11', 3, '2014-01-07 23:38:35', 1, ''),
(43, '18º Festival Internacional de Jazz de Punta del Este', '2014-01-11 20:00:00', 'Finca El Sosiego', 'Con profunda satisfacción anunciamos el 18º Festival Internacional de Jazz de Punta del Este, que como en los últimos seis años se realizará en la “Finca El Sosiego” de Punta Ballena, convocando a un importante número de grandes talentos que revistan en la élite del jazz mundial.', '-34.882385910995154', '-55.042362213134766', 0, 'Música, Musica, Jazz, Festival', '2014-01-02 13:19:13', 3, '2014-01-09 00:57:33', 1, ''),
(44, 'Copa Rip Curl', '2014-01-12 08:00:00', 'Playa Montoya, La Barra', 'Cierre de inscripciones 2 días antes del comienzo de cada etapa.\nEl costo es de 400 pesos. Se abona en la cuenta N° 34719, previa inscripción vía formulario web.', '-34.91576017530356', '-54.8492431640625', 0, 'Surf, Rip Curl, Deportes', '2014-01-02 13:23:43', 1, '2014-01-11 14:32:01', 1, ''),
(45, 'Norma Duek', '2014-01-11 20:00:00', 'Liga de Punta del Este ', 'Muestra Abierta Arte en Liga Punta del Este', '-34.964577968628376', '-54.946231842041016', 0, 'Norma Duek, Muestra, Arte, Culturales', '2014-01-02 13:26:20', 4, '2014-01-09 01:21:46', 1, ''),
(46, 'Fiesta Gente', '2014-01-11 21:30:00', 'Conrad Punta del Este Resort & Casino', 'Fiesta Gente - Jardines del Spa. Evento por invitación.', '-34.94999851549596', '-54.93906497955322', 0, 'Fiesta Gente, Conrad, Culturales', '2014-01-02 13:28:26', 4, '2014-01-09 01:14:20', 1, ''),
(47, 'Ovo Nightclub', '2014-01-11 00:00:00', 'Ovo Nightclub', 'DJs Dolls House – Mina + Aninha + Mary Zander (Argentina)\nDesde usd 35 mujeres y usd 50 hombres, venta por Red UTS', '-34.95002225863367', '-54.93910789489746', 0, 'Ovo Nightclub', '2014-01-02 13:34:04', 3, '2014-01-08 00:25:19', 1, ''),
(48, '18º Festival Internacional de Jazz de Punta del Este', '2014-01-12 20:00:00', 'Finca El Sosiego', 'Con profunda satisfacción anunciamos el 18º Festival Internacional de Jazz de Punta del Este, que como en los últimos seis años se realizará en la “Finca El Sosiego” de Punta Ballena, convocando a un importante número de grandes talentos que revistan en la élite del jazz mundial.', '-34.88182263471526', '-55.042619705200195', 0, 'Música, Musica, Jazz, Festival', '2014-01-02 13:38:57', 3, '2014-01-09 00:57:39', 1, ''),
(49, 'Mario Grillo - Inauguración de muestra.', '2014-01-12 19:00:00', 'GrilloArte', 'GrilloArte es un espacio ubicado en la península de Punta del Este. La Galería alberga a más de 60 artistas de gran prestigio y nivel internacional. Calle 28 entre Gorlero y Calle 20 / Punta del Este\nT. 4244.7590', '-34.960351816292615', '-54.94242310523987', 0, 'Mario Grillo, Culturales, Muestra, Arte, Grillo Arte', '2014-01-02 13:41:37', 4, '2014-01-09 01:18:53', 1, ''),
(50, 'Pilar Sordo: ''''Cómo Ser Feliz en el Siglo XXI''''', '2014-01-12 21:00:00', 'Conrad Punta del Este Resort & Casino - Salón Río de Janeiro', 'La experimentada psicóloga Pilar Sordo llega a nuestro país con su conferencia "Cómo ser feliz en el siglo XXI". Precios: usd 50 y 60, venta por Red UTS', '-34.9497522855058', '-54.93893623352051', 0, 'Pilar Sordo, Conrad, Culturales', '2014-01-02 13:43:10', 4, '2014-01-09 01:23:27', 1, ''),
(51, 'Ovo Nightclub', '2014-01-12 00:00:00', 'Ovo Nightclub', 'DJ: Christian Klein y Diego Harispe. Precios desde usd 35 mujeres y usd 50 hombres, venta por Red UTS', '-34.949963339828365', '-54.9391508102417', 0, 'Ovo Nightclub', '2014-01-02 13:44:10', 3, '2014-01-08 00:31:19', 1, ''),
(52, 'Punta Tech MeetUp 2014', '2014-01-13 17:00:00', 'Fundación Pablo Atchugarry', 'Este año va con muchas novedades. El evento va a ser el más impresionante de la historia de los Punta Tech Meetups.', '-34.884580890554474', '-54.82370853424072', 0, 'Punta Tech MeetUp, tecnología, Culturales.', '2014-01-03 07:27:33', 4, '2014-01-09 01:24:51', 1, ''),
(53, 'Norma Duek', '2014-01-13 20:00:00', 'Liga de Punta del Este', 'Muestra Abierta Arte en Liga Punta del Este', '-34.96268012465473', '-54.94365692138672', 0, 'Norma Duek, Muestra, Culturales, Arte', '2014-01-03 07:30:58', 4, '2014-01-09 01:22:19', 1, ''),
(54, 'Dady Brieva', '2014-01-18 22:00:00', 'Conrad Punta del Este Resort & Casino', 'Dady Brieva con nuevo show. \nUsd 50, 60 y 70, venta por Red UTS', '-34.95011019771117', '-54.9390435218811', 0, 'Dady Brieva, Conrad, Culturales', '2014-01-03 07:32:38', 4, '2014-01-09 01:11:51', 1, ''),
(55, 'Ovo Nightclub', '2014-01-13 00:00:00', 'Ovo Nightclub', 'DJ Fernando Picón. Precios desde usd 35 mujeres y usd 50 hombres, venta por Red UTS', '-34.95020121434234', '-54.93932247161865', 0, 'Ovo Nightclub', '2014-01-03 07:33:39', 3, '2014-01-08 00:32:19', 1, ''),
(56, 'titulo fsss gvvccv', '2014-01-13 07:56:00', 'mi casa', 'descripxion xf xtnkkyfddxc vfgjbv', '-34.8643945', '-56.212609499999985', 1234567890, '', '2014-01-03 20:57:13', 3, '2014-01-04 05:52:25', -1, ''),
(57, 'Moda Mateo ', '2014-01-09 06:53:00', 'Prado', 'Descripción moda', '-34.858646972358024', '-56.20477191146858', 0, '', '2014-01-03 22:53:41', 2, '2014-01-04 06:03:20', -1, ''),
(58, 'deporte mateo android', '2014-03-09 23:30:00', 'yatay', 'desdcdesvv  fg vhbcv vfh  cghbvh  vgfvbbrvffdjdbf ', '-34.86414961317246', '-56.21346970688478', 0, '', '2014-01-03 22:59:57', 1, '2014-01-04 06:03:17', -1, ''),
(59, 'Prueba partido de fútbol ', '2014-01-05 18:33:00', 'Roosvelt', 'Esto es una prueba ', '-34.9281963651374', '-54.95591034186532', 0, '', '2014-01-04 12:34:50', 1, '0000-00-00 00:00:00', 0, ''),
(60, 'Valeria Lynch y los 5 Latinos. ', '2014-01-16 22:00:00', 'Hotel Conrad, Salón Punta del Este', 'Valeria Lynch en “La elegida” con la participación de “Los cinco latinos”\n· usd 42, 57, 72 y 82, venta por Red UTS', '-34.95029223087247', '-54.93968725204468', 0, 'Concierto Conrad, Valeria Lynch, Musica, Música', '2014-01-07 14:22:57', 3, '2014-01-09 01:25:58', 1, ''),
(61, 'Ovo Nightclub', '2014-01-14 00:00:00', 'Ovo Nightclub', 'DJ: Analú. Desde 00.00 horas. Precios desde usd 35 mujeres y usd 50 hombres, venta por Red UTS', '-34.95027464310356', '-54.939515590667725', 0, 'Ovo Nightclub', '2014-01-07 14:28:30', 3, '2014-01-08 00:32:42', 1, ''),
(62, 'Ovo Nightclub', '2014-01-16 00:00:00', 'Ovo Nightclub', 'DJs Sebastián Ayervalo y Leo Janeiro\n· OVO nightclub, 22:00\n· desde usd 35 mujeres y usd 50 hombres, venta por Red UTS', '-34.95036258191032', '-54.93932247161865', 0, 'Ovo Nightclub', '2014-01-07 14:31:59', 3, '2014-01-08 00:51:53', 1, ''),
(63, 'Ovo Nightclub', '2014-01-16 00:00:00', 'Ovo Nightclub', 'DJs: Sebastián Ayervalo y Leo Janeiro. Desde 00.00 horas. Entradas a la venta próximamente por RED UTS', '-34.95022187977423', '-54.939537048339844', 0, 'Ovo Night', '2014-01-07 14:34:21', 3, '2014-01-07 21:34:21', 1, ''),
(64, 'Las Reinas de Marabú', '2014-01-17 22:00:00', 'Hotel Conrad', '“Las reinas del Marabú”, creado y dirigido por Reina Reech\n· OVO nightclub, 22:00\n· venta por Red UTS', '-34.95011635301367', '-54.93910789489746', 0, 'Conrad, Culturales, Espectaculo', '2014-01-07 14:36:58', 4, '2014-01-09 01:18:19', 1, ''),
(65, 'Ovo Nightclub', '2014-01-17 00:00:00', 'Ovo Nightclub', 'Fiesta B- Ibiza con DJs Wally López y Rodrigo Ferrari\n· OVO nightclub, 00:00\n· desde usd 35 mujeres y usd 50 hombres, venta por Red UTS', '-34.950186704202466', '-54.938979148864746', 0, 'Ovo Nightclub.', '2014-01-07 14:42:35', 3, '2014-01-08 00:55:48', 1, ''),
(66, 'Circuito Atlántico Sur Rolex Cup 2014', '2014-01-18 13:00:00', 'La Barra', 'Las regatas de este “Circuito Atlántico Sur Rolex Cup 2014” serán coorganizadas por el Yacht Club \nArgentino, el Yacht Club Olivos, el Yacht Club Punta del Este y el Yacht Club Uruguayo.\n', '-34.91609448289839', '-54.86499309539795', 0, 'Regata Rolex, Deportes, La Barra', '2014-01-07 15:05:11', 1, '2014-01-09 01:11:15', 1, ''),
(67, 'Ovo Nightclub', '2014-01-18 00:00:00', 'Ovo Nightclub', 'DJs: Leo Lanvin y Vacuo. Precios desde usd 35 mujeres y usd 50 hombres, venta por Red UTS', '-34.95053845924085', '-54.938764572143555', 0, 'Ovo Nightclub', '2014-01-07 15:07:25', 3, '2014-01-08 02:41:13', 1, ''),
(68, 'José Ignacio International Film Festival - LOS DUEÑOS', '2014-01-08 20:30:00', 'José Ignacio', 'JIIFF es un festival de cine internacional que proyecta películas de calidad, editadas durante el año, aún no estrenadas en Uruguay, al aire libre y con acceso gratuito. ', '-34.8219391507384', '-54.652841091156006', 0, 'JIIFF, Cine, Culturales, Jose Ignacio, Film Festival, Los dueños', '2014-01-07 15:14:07', 4, '2014-01-09 01:17:09', 1, ''),
(69, 'José Ignacio International Film Festival - PELO MALO y TANTA AGUA', '2014-01-09 19:00:00', 'José Ignacio', 'Se proyectarán dos películas en la Bajada de los pescadores:\nPelo Malo de Mariana Rondon\nTanta Agua, Ana Guevara, Leticia Jorge\nComenzará más temprano que los otro días.', '-34.844873843408344', '-54.64204788208008', 0, 'JIIFF, Cine, Culturales, Film Festival, Pelo Malo, Jose Ignacio', '2014-01-07 15:21:40', 4, '2014-01-09 01:17:34', 1, ''),
(70, 'Castells & Castells', '2014-01-07 18:19:00', 'Hotel Conrad', 'Exhibición de arte de Castells & Castells en el salón Río de Janeiro, 11:00 a 15:00 y 18:00 a 02:00\nentrada libre y gratuita', '-34.94975545039073', '-54.93893623352051', 0, 'Castells, Conrad, Culturales, gratis', '2014-01-07 16:21:15', 4, '2014-01-09 01:08:15', 1, ''),
(71, 'Amigos de Universidad de Tel Aviv en Argentina', '2014-01-07 19:30:00', 'Hotel Conrad', 'Reflexiones sobre nuestro tiempo en un mundo en transformación con los panelistas dr. Luis Alberto Lacalle de Herrera, dr. Marcos Aguinis, dr. Manuel Trajtenberg y dr. Carlos Alberto Montaner\n· salón Punta del Este\n· entrada libre y gratuita', '-34.95024579916514', '-54.939279556274414', 0, 'Tel Aviv, Culturales', '2014-01-07 16:22:42', 4, '2014-01-09 01:05:06', 1, ''),
(72, 'Salón Inmobiliario SIPE 2014', '2014-01-07 18:23:00', 'Hotel Conrad', 'Acceso libre y gratuito en salón Montecarlo. De 20hs a 1.00hs', '-34.950392131346355', '-54.93910789489746', 0, 'SIPE', '2014-01-07 16:24:45', 4, '2014-01-07 23:24:45', 1, ''),
(73, 'Castells & Castells', '2014-01-08 18:00:00', 'Hotel Conrad', 'Exhibición de arte de Castells & Castells:salón Río de Janeiro, 11:00 a 15:00 y 18:00 a 02:00\n· entrada libre y gratuita', '-34.950069923085316', '-54.93919372558594', 0, 'Castells, Conrad, Culturales, gratis', '2014-01-07 16:28:33', 4, '2014-01-09 01:08:22', 1, ''),
(74, 'Reinoso / Bergalli / Otero / Giunta ', '2014-01-08 22:30:00', 'Medio y Medio', 'Festival de Jazz: $ 500 + service charge\nLocalidades a la venta da través de RED UTS', '-34.888332464186334', '-55.04186868667597', 0, 'Jazz, Medio y Medio', '2014-01-07 16:34:30', 3, '2014-01-08 00:38:33', 1, ''),
(75, 'Castells & Castells', '2014-01-09 11:00:00', 'Hotel Conrad', 'Exhibición de arte de Castells & Castells\n· salón Río de Janeiro, 11:00 a 15:00 y 18:00 a 02:00\n· entrada libre y gratuita', '-34.95028800944329', '-54.939537048339844', 0, 'Castells, Conrad, Culturales, gratis, Arte', '2014-01-07 16:55:17', 4, '2014-01-09 01:08:36', 1, ''),
(76, 'Ciclo de charlas literarias: Estanislao Bachrach en “Ágilmente”', '2014-01-09 21:00:00', 'El Conrad', 'Ciclo de charlas literarias: Estanislao Bachrach en “Ágilmente”\n· salón Río de Janeiro\n· entrada libre y gratuita', '-34.95031614890101', '-54.93962287902832', 0, 'Charlas literarias, Conrad, gratis, Culturales', '2014-01-07 16:58:30', 4, '2014-01-09 01:10:08', 1, ''),
(77, 'José Ignacio International Film Festival', '2014-01-10 20:30:00', 'José Ignacio, Pueblo Garzón', 'Only Lovers Left Alive, Jim Jarmusch (en Pueblo Garzón)', '-34.59867217299791', '-54.543514251708984', 0, 'JIIFF, Cine, Jose Ignacio, Film Festival', '2014-01-07 17:04:37', 4, '2014-01-09 01:16:25', 1, ''),
(78, 'Ruben Rada', '2014-01-10 22:30:00', 'Medio y Medio', '$ 800 a $1300 + service charge\nLocalidades a la venta da través de RED UTS', '-34.88830518357533', '-55.041911602020264', 0, 'Ruben Rada, Musica, Música, Medio y Medio', '2014-01-07 17:09:00', 3, '2014-01-09 01:25:11', 1, ''),
(79, 'Sunset Fashion Art', '2014-01-11 20:30:00', 'Imperiale Luxury Condominiums', 'Se realizará la décima edición del ciclo de moda, arte y música más destacado del verano en Punta del Este a partir de las 8.30 pm en los jardines de Imperiale Luxury Condominiums. Acceso Libre, Capacidad Limitada, Vestimenta Elegant Casual.', '-34.95787853899704', '-54.938995242118835', 0, 'Fashion, Desfile, Moda', '2014-01-07 17:16:28', 2, '2014-01-08 22:08:13', 1, ''),
(80, 'Kevin Johansen + The Nada', '2014-01-11 22:30:00', 'Medio y Medio', '$ 800 a $1300 + service charge\nLocalidades a la venta da través de RED UTS', '-34.88842574894485', '-55.04193305969238', 0, 'Medio y Medio Jazz , Musica, Música, Kevin Johansen', '2014-01-07 17:19:01', 3, '2014-01-09 01:17:57', 1, ''),
(81, 'José Ignacio International Film Festival - LA MARY', '2014-01-12 20:30:00', 'Bajada de los pescadores, José Ignacio', 'La Mary, Daniel Tinayre.', '-34.84478508433912', '-54.641618728637695', 0, 'JIIFF, Cine, Jose Ignacio, Film Festival, La Mary, Culturales', '2014-01-07 17:28:47', 4, '2014-01-09 01:16:47', 1, ''),
(82, 'Skay Beilinson', '2014-01-12 22:30:00', 'Medio y Medio', '$ 750 + service charge\nLocalidades a la venta da través de RED UTS', '-34.88832647801368', '-55.041847229003906', 0, 'Jazz', '2014-01-07 17:30:27', 3, '2014-01-08 00:40:37', 1, ''),
(83, 'Ciclo de charlas literarias', '2014-01-15 21:00:00', 'Hotel Conrad', 'Ciclo de charlas literarias: Gloria Casañas presenta “La canción del mar”, conduce María Inés Machiñena\n· salón Río de Janeiro,\n· entrada libre y gratuita', '-34.9501262021408', '-54.9397087097168', 0, 'Charlas literarias, Conrad, gratis, Culturales', '2014-01-07 17:37:48', 4, '2014-01-09 01:09:39', 1, ''),
(84, 'Carlos Aguirre Trio', '2014-01-15 22:30:00', 'Medio y Medio', '$ 450 + service charge\nLocalidades a la venta da través de RED UTS', '-34.88833950369278', '-55.04193305969238', 0, 'Jazz, Carlos Aguirre Trio, Música, Musica', '2014-01-07 17:39:51', 3, '2014-01-09 01:07:02', 1, ''),
(85, 'Carlos Aguirre Trio', '2014-01-15 22:30:00', 'Medio y Medio', '$ 450 + service charge\nLocalidades a la venta da través de RED UTS', '-34.88828670140406', '-55.04178285598755', 0, 'Jazz, Carlos Aguirre Trio, Música, Musica', '2014-01-07 17:48:39', 3, '2014-01-09 01:07:10', 1, ''),
(86, 'Adriana Varela', '2014-01-17 22:30:00', 'Medio y Medio', '$ 900 + service charge\nLocalidades a la venta da través de RED UTS', '-34.8883395044985', '-55.04193305969238', 0, 'Jazz, Música, Musica, Adriana Varela', '2014-01-07 17:54:52', 3, '2014-01-09 00:58:07', 1, ''),
(87, 'Punta Del Este Food & Wine Festival', '2014-01-18 19:00:00', 'Bahíá Vik', 'Sunset & Chillout - Food & Dance (Bahía Vik). Playa La Juanita\nTicket: US$ 100\n', '-34.84243195705698', '-54.640663862228394', 0, 'Food Wine Festival, Gastronomía, Conrad, Gastronómico', '2014-01-07 19:32:09', 5, '2014-01-09 01:24:16', 1, ''),
(88, 'Punta Classic - Pasion Latina', '2014-01-18 21:30:00', 'Fundación Atchugarry', 'Plácido por primera vez en Sudamérica. Entrada gratuita.\nRuta 104 - Km. 4.5\nEl Chorro, Maldonado, Uruguay.', '-34.840934669337855', '-54.825382232666016', 0, 'Pasión Latina, Musica, Música, Punta Classic', '2014-01-07 19:38:17', 3, '2014-01-09 01:23:47', 1, ''),
(89, 'Adriana Varela', '2014-01-18 22:30:00', 'Medio y Medio', 'Sábado, 18 de Enero\n$ 900 + service charge\nLocalidades a la venta da través de RED UTS', '-34.88831398141693', '-55.04182577133179', 0, 'Jazz, Música, Musica, Adriana Varela', '2014-01-07 19:40:37', 3, '2014-01-09 00:58:15', 1, ''),
(90, 'Adriana Varela', '2014-01-19 22:30:00', 'Medio y Medio', '$ 900 + service charge\nLocalidades a la venta da través de RED UTS', '-34.888293916761185', '-55.04178285598755', 0, 'Jazz, Música, Musica, Adriana Varela', '2014-01-07 19:42:08', 3, '2014-01-09 00:58:20', 1, ''),
(91, 'Ovo Nightclub', '2014-01-19 00:00:00', 'Ovo Nightclub', 'DJ Alana\n· OVO nightclub, 00:00\n· desde usd 35 mujeres y usd 50 hombres, venta por Red UTS', '-34.95019303769581', '-54.939537048339844', 0, 'boliches', '2014-01-07 19:43:59', 3, '2014-01-08 02:43:59', 1, ''),
(92, 'Expo Punta babies & kids', '2014-01-20 15:00:00', 'Hotel Conrad', 'Expo Punta babies & kids\n· salón Monte Carlo, 15:00 a 22:00', '-34.950419917596555', '-54.939494132995605', 0, 'Expo, Conrad, Babies, Culturales', '2014-01-07 19:45:29', 4, '2014-01-09 01:13:03', 1, ''),
(93, 'Fernando Oliveri, Nico Sara y Santiago García', '2014-01-20 19:00:00', 'Grillo Arte', 'Inauguración de muestra.\nCalle 28 entre Gorlero y Calle 20 / Punta del Este\nT. 4244.7590', '-34.96056020559614', '-54.942503571510315', 0, 'Arte, Grillo Arte, Culturales, Muestra', '2014-01-07 19:47:44', 4, '2014-01-09 01:14:08', 1, ''),
(94, 'Martín Bossi en “Bing Bang show”', '2014-01-20 22:00:00', 'Hotel Conrad', 'Martín Bossi en “Bing Bang show”\n· salón Punta del Este, 22:00\n· usd 50, 60, 70 y 80, venta por Red UTS', '-34.95025283443665', '-54.939537048339844', 0, 'Martín Bossi, Conrad, Culturales', '2014-01-07 19:49:43', 4, '2014-01-09 01:19:08', 1, ''),
(95, 'Expo Punta babies & kids', '2014-01-21 15:00:00', 'Hotel Conrad', 'Expo Punta babies & kids\n· salón Monte Carlo, 15:00 a 22:00', '-34.9503653976252', '-54.939537048339844', 0, 'Expo, Conrad, Babies, Culturales', '2014-01-07 19:50:48', 4, '2014-01-09 01:13:17', 1, ''),
(96, 'Martín Bossi en “Bing Bang show”', '2014-01-21 22:00:00', 'Hotel Conrad', 'Martín Bossi en “Bing Bang show”\n· salón Punta del Este, 22:00\n· usd 50, 60, 70 y 80, venta por Red UTS', '-34.95053072060331', '-54.939537048339844', 0, 'Martín Bossi, Conrad, Culturales', '2014-01-07 19:51:47', 4, '2014-01-09 01:19:26', 1, ''),
(97, 'Expo Punta babies & kids', '2014-01-22 15:00:00', 'Hotel Conrad', 'Expo Punta babies & kids\n· salón Monte Carlo, 15:00 a 22:00', '-34.950630618639636', '-54.93945121765137', 0, 'Expo, Conrad, Babies, Culturales', '2014-01-07 19:52:50', 4, '2014-01-09 01:13:09', 1, ''),
(98, 'Punta del Este Food & Wine Festival', '2014-01-23 22:00:00', 'La Susana', 'Best of the Best Dinner series (La Susana).', '-34.837415696637926', '-54.654836654663086', 0, 'Food Wine Festival, Gastronomía, Conrad, Gastronómico', '2014-01-07 19:57:01', 5, '2014-01-09 01:24:22', 1, ''),
(99, 'Gustavo Cordera', '2014-01-23 22:30:00', 'Medio y Medio', '$ 800 + service charge\nLocalidades a la venta da través de RED UTS', '-34.88834601680013', '-55.0419545173645', 0, 'Gustavo Cordera, Música, Musica, Medio y Medio, Show', '2014-01-07 19:58:27', 3, '2014-01-09 01:14:53', 1, ''),
(100, 'Punta del Este Food & Wine Festival', '2014-01-24 22:00:00', 'La Susana, José Ignacio', ' Best of the Best Dinner series (La Susana).\nTicket US$ 150', '-34.83742221539167', '-54.654622077941894', 0, 'Food Wine Festival, Gastronomía, Conrad, Gastronómico', '2014-01-07 20:00:07', 5, '2014-01-09 01:24:28', 1, ''),
(101, 'XII Salón Conrad internacional del vino', '2014-01-24 21:00:00', 'Hotel Conrad', 'XII Salón Conrad internacional del vino\n· salón Punta del Este, 21:00 a 01:00\n· venta por Red UTS', '-34.95040901543009', '-54.93936538696289', 0, 'Salón Vino, Conrad, Gastronómico', '2014-01-07 20:01:26', 5, '2014-01-09 01:26:26', 1, ''),
(102, 'Gustavo Cordera', '2014-01-24 22:30:00', 'Medio y Medio', '$ 800 + service charge\nLocalidades a la venta da través de RED UTS', '-34.88826434804739', '-55.04176139831543', 0, 'Gustavo Cordera, Música, Musica, Medio y Medio, Show', '2014-01-07 20:02:34', 3, '2014-01-09 01:15:08', 1, ''),
(103, 'Ovo Nightclub', '2014-01-24 00:00:00', 'Ovo Nightclub', 'DJs Thomas Gold (Alemania) y Antonio Eudi (Brasil)\n· OVO nightclub, 00:00\n· desde usd 35 mujeres y usd 50 hombres, venta por Red UTS', '-34.95014378994155', '-54.9397087097168', 0, 'Ovo Nightclub', '2014-01-07 20:03:29', 3, '2014-01-08 03:03:29', 1, ''),
(104, 'Punta del Este Food & Wine Festival', '2014-01-25 20:00:00', 'Bahíá Vik', 'Sunset & Chillout - Food & Dance (Bahía Vik).', '-34.84215793033195', '-54.64072823524475', 0, 'Food Wine Festival, Gastronomía, Conrad, Gastronómico', '2014-01-07 20:05:55', 5, '2014-01-09 01:24:33', 1, ''),
(105, 'XII Salón Conrad internacional del vino', '2014-01-25 21:00:00', 'Hotel Conrad', 'XII Salón Conrad internacional del vino\n· salón Punta del Este, 21:00 a 01:00\n· venta por Red UTS', '-34.950089619202586', '-54.93936538696289', 0, 'Salón Vino, Conrad, Gastronómico', '2014-01-07 20:08:01', 5, '2014-01-09 01:26:31', 1, ''),
(106, 'David Lebón', '2014-01-25 22:30:00', 'Medio y Medio', '$ 800 + service charge\nLocalidades a la venta da través de RED UTS', '-34.88841800466664', '-55.041911602020264', 0, 'Jazz, David Lebón, Medio y Medio, Musica, Música', '2014-01-07 20:08:56', 3, '2014-01-09 01:12:19', 1, ''),
(107, 'David Lebón', '2014-01-26 22:30:00', 'Medio y Medio', '$ 800 + service charge\nLocalidades a la venta da través de RED UTS', '-34.88846077400895', '-55.041911602020264', 0, 'Jazz, David Lebón, Medio y Medio, Musica, Música', '2014-01-07 20:10:47', 3, '2014-01-09 01:12:27', 1, ''),
(108, 'Ciclo de charlas literarias: Sergio Sinay', '2014-01-28 21:00:00', 'Hotel Conrad', 'Ciclo de charlas literarias: Sergio Sinay\n· salón Río de Janeiro, 21:00\n· entrada libre y gratuita', '-34.95042167862478', '-54.9397087097168', 0, 'Charlas literarias, Conrad, gratis, Culturales', '2014-01-07 20:12:01', 4, '2014-01-09 01:10:27', 1, ''),
(109, 'Diego el Cigala', '2014-01-29 22:00:00', 'Hotel Conrad', 'Diego el Cigala\n· salón Punta del Este, 22:00\n· venta por Red UTS', '-34.95066227626877', '-54.93910789489746', 0, 'Diego el Cigala', '2014-01-07 20:13:18', 3, '2014-01-08 03:13:18', 1, ''),
(110, 'Itibiere Zwarg & Grupo', '2014-01-31 22:30:00', 'Medio y Medio', 'Entrada Red UTS', '-34.8882780751092', '-55.04204034805298', 0, 'Jazz, Itibiere Zwarg & Grupo, Musica, Música, Medio y Medio', '2014-01-07 20:16:36', 3, '2014-01-09 01:16:04', 1, ''),
(111, 'Semana Internacional del Caballo Árabe', '2014-01-08 22:30:00', 'Haras Los Palmares en Camino Eguzquiza', 'Breeder’s Premium Cup y el remate', '-34.87000632428526', '-54.86306190490723', 0, 'Caballos', '2014-01-07 20:38:17', 4, '2014-01-08 03:38:17', 1, ''),
(112, 'New Balance Adventure Race', '2014-01-19 09:00:00', 'Punta Ballena, Maldonado', 'Llega la 7ma edición de la tradicional New Balance Adventure Race Punta Ballena, un clásico del Trail run del verano que te invita a participar de una carrera a  pleno contacto con la naturaleza y en el corazón mismo del balneario.', '-34.88363319922445', '-55.054078102111816', 0, 'Adventure Race, Deportes, Carrera, Punta Ballena', '2014-01-07 20:45:57', 1, '2014-01-09 01:21:22', 1, ''),
(113, 'Hercules Musical Infantil', '2014-01-08 20:00:00', 'Teatro Cantegril', 'El musical infantil Hércules, llevado a escena por niños y jóvenes del elenco Gardeleando, es una divertida leyenda de la mitología griega, que a través de la danza, el canto y el teatro, cobra vida una la maravillosa historia de fe y esperanza, que nos hará descubrir el héroe que todos llevamos dentro. entradas en Red UTS (300 y 350 pesos uruguayos)\nFoto: HOY HERCULES – MUSICAL INFANTIL - Elenco Gardeleando - Cine Teatro Cantegril - 8 pm \n\nEl musical infantil Hércules, llevado a escena por niños y jóvenes del elenco Gardeleando, es una divertida leyenda de la mitología griega, que a través de la danza, el canto y el teatro, cobra vida una la maravillosa historia de fe y esperanza, que nos hará descubrir el héroe que todos llevamos dentro.\nDirige: Mariana Mastrángelo\nEntradas en Red UTS (300 y 350 pesos uruguayos)', '-34.924310983649356', '-54.945995807647705', 0, 'Teatro, infantil, Culturales, Hércules, Hercules', '2014-01-08 13:35:45', 4, '2014-01-09 01:15:23', 1, ''),
(114, 'Mala Tuya', '2014-01-08 00:00:00', 'Ocean Club', 'Este miércoles a la noche, en la discoteca Ocean Club, en la parada 12 de la playa Brava, tocará la banda uruguaya Mala Tuya. Entrada en Boletería $300', '-34.942905035931034', '-54.91438865661621', 0, 'Musica, Música, Mala Tuya, Concierto, Fiesta, Ocean', '2014-01-08 13:38:16', 3, '2014-01-09 01:18:29', 1, ''),
(115, 'Charla Contra el Viento y Marea', '2014-01-08 20:00:00', 'Museo Ralli', 'Ciclo de Charlas en el Museo Ralli. "Contra el Viento y Marea" por Ana Laura Lissardy', '-34.92944807790421', '-54.92713451385498', 0, 'Charlas, Museo Ralli, Culturales, Museo Ralli', '2014-01-08 13:43:02', 4, '2014-01-09 01:09:07', 1, ''),
(116, 'Muestra Fotográfica "Con Los Ojos Del Alma"', '2014-01-08 18:00:00', 'Espacio Cultural Ancap Gorlero', 'Muestra fotográfica organizada de la Embajada de Israel . 6pm a 9pm', '-34.96011441023348', '-54.94120001792908', 0, 'Muestra, Fotografía, Culturales', '2014-01-08 13:46:23', 4, '2014-01-08 20:46:23', 1, ''),
(117, 'Muestra Fotográfica " Con Los Ojos del Alma"', '2014-01-09 18:00:00', 'Espacio Cultural Ancap Gorlero', 'Muestra fotográfica organizada de la Embajada de Israel. 6pm a 9pm | hasta el 11 d enero ', '-34.960246302573466', '-54.94121074676514', 0, 'Muestra, Fotografía, Culturales', '2014-01-08 13:48:26', 4, '2014-01-08 20:48:26', 1, ''),
(118, 'Muestra Fotográfica "Con los Ojos Del Alma"', '2014-01-10 18:00:00', 'Espacio Cultural Ancap Gorlero', 'Muestra fotográfica organizada de la Embajada de Israel. \n6pm a 9pm | hasta el 11 d enero', '-34.960422158696566', '-54.94118928909296', 0, 'Muestra, Fotografía, Culturales', '2014-01-08 13:49:53', 4, '2014-01-08 20:49:53', 1, ''),
(119, 'Muestra Fotográfica "Con los Ojos del Alma"', '2014-01-11 18:00:00', 'Espacio Cultural Ancap Gorlero', 'Muestra fotográfica organizada de la Embajada de Israel \n6pm a 9pm | hasta el 11 d enero', '-34.96027268101599', '-54.94117856025696', 0, 'Muestra, Fotografía, Culturales', '2014-01-08 13:51:47', 4, '2014-01-08 20:51:47', 1, ''),
(120, 'No tengo envidia a los Hombres Dr. Freud', '2014-01-08 22:00:00', 'Nogaro by Mantra', 'Obra políticamente incorrecta que se atreve a decirlo todo sobre la mujer. incluso lo que algunas no quieren escuchar. ¡Basta de ser machistas sin darnos cuenta!.\nCon la actuación estelar de Graciela Rodríguez / Dirección y adaptación: Jorge Denevi / Música y producción: Alfredo Leirós.\nEntradas en Red UTS (USD 25 y USD 30)', '-34.9588218540681', '-54.939472675323486', 0, 'Teatro, Culturales, Nogaro, Mantra', '2014-01-08 13:54:14', 4, '2014-01-08 20:54:14', 1, ''),
(121, 'Acuerdo Fashion TV / Mantra Resort', '2014-01-08 21:00:00', 'Mantra Resort, La Barra', 'La internacionalmente exitosa señal del mundo de la moda y Mantra Punta del Este, realizaron un acuerdo de difusión conjunta para esta temporada 2014. Producciones, cobertura de eventos, notas con celebrities y todos los contenidos de moda de la temporada, tendrán su punto de partida en nuestro complejo hotelero. El acuerdo será coronado con un exclusivo coctel en la piscina de nuestro resort. \n', '-34.90768359387805', '-54.85018730163574', 0, 'Fashion TV, Moda, Mantra', '2014-01-08 13:56:13', 2, '2014-01-08 20:56:13', 1, ''),
(122, 'Paseo de Vinos, Oliva y Quesos', '2014-01-08 20:30:00', 'Salón principal del complejo Ancap Gorlero ', 'Muestra turístico productiva permanecerá abierta hasta el 15 de febrero y ofrecerá distintas actividades culturales, con entrada libre y gratuita.', '-34.96017596001856', '-54.94118928909302', 0, 'Vinos, Quesos, Gastronomía, Eventos, Comida', '2014-01-08 14:08:10', 5, '2014-01-08 21:08:10', 1, ''),
(123, 'Muestra de Artes Itinerantes ', '2014-01-08 20:30:00', 'Patagonia Flooring & Decks', 'Gratuito- Av. Italia Parada 5 Punta del Este', '-34.94488821135653', '-54.93269205093378', 0, 'Arte, Culturales, Muestra', '2014-01-08 14:11:24', 4, '2014-01-08 21:11:24', 1, ''),
(124, 'Obras de Figari', '2014-01-08 22:00:00', 'Galería Sur', 'Galería Sur festeja sus 30 años de actividad con una importante muestra retrospectiva de 40 obras de Pedro Figari, que abarca las distintas etapas del artista.  En la Ruta 10 Parada 46, La Barra. Abierto todos los días, de 10:00 a 24:00 horas. Gratuito', '-34.91467806506832', '-54.86105561256409', 0, 'Arte, Galería, Figari, Culturales', '2014-01-08 14:22:02', 4, '2014-01-08 21:22:02', 1, ''),
(125, 'Aperol Spritz Sunset en Sipan', '2014-01-08 20:00:00', 'Sipan', 'Atardecer en Sipan. DJ: Soledad Rodriguez Zubieta. Bartender: Mona Gallosi. PR: Marcelo Meca', '-34.94968545066494', '-54.92533206939697', 0, 'Sunset, Atardecer, Moda, Música', '2014-01-08 14:36:08', 3, '2014-01-08 21:36:08', 1, ''),
(126, 'Fiesta Vitaminwater', '2014-01-15 22:00:00', 'La Caracola, José Ignacio', 'Paris Hilton, la reconocida celebridad y heredera del imperio hotelero que lleva su apellido, visitará por primera vez a Uruguay para oficiar de DJ en la exclusiva fiesta de la marca de agua energizante Vitaminwater en el Parador La Caracola de José Ignacio. ', '-34.804095778510494', '-54.57282543182373', 0, 'Fiesta, Musica, Música, Vitaminwater, Paris Hilton', '2014-01-08 14:54:43', 3, '2014-01-08 21:54:43', 1, ''),
(127, 'Torneo Abierto de Tenis', '2014-01-09 10:00:00', 'Cantegril Country Club', 'Tel 42223211 / int. 140', '-34.92401189633658', '-54.94584560394287', 0, 'Deportes, Tenis, Torneo', '2014-01-08 15:15:42', 1, '2014-01-08 22:15:42', 1, ''),
(128, 'Desfile Roberto Giordano', '2014-01-19 20:00:00', 'Puerto de Punta del Este', 'Desfile Roberto Giordano.', '-34.96418538927893', '-54.94732618331909', 0, 'Desfile, Moda, Roberto Giordano', '2014-01-08 18:36:36', 2, '2014-01-09 01:36:36', 1, ''),
(129, 'Concierto en Catedral', '2014-01-21 21:00:00', 'Catedral de Maldonado', 'La soprano lírica Vivian Jordan, brindará un Concierto Despedida en la Catedral de Maldonado. EL concierto, ya tradicional, será a beneficio de la  catedral. ', '-34.90890656956305', '-54.958956241607666', 0, 'Concierto, Opera, Catedra, Musica, Música', '2014-01-08 18:41:33', 3, '2014-01-09 01:41:33', 1, ''),
(130, 'Cena de Famosos', '2014-01-13 22:00:00', 'Mantra Beach Club', 'Una gala sin precedentes con destacados shows e importantes sorpresas, culminando con una gran fiesta para todos los invitados. Más de 70 famosas personalidades del Río de la Plata estarán a cargo de servir en las mesas durante esa noche. Por consultas, reserva de mesa y tickets: 27100438', '-34.91177037300272', '-54.84343349933624', 0, 'Famosos, Cena, Gastronómico,Mantra', '2014-01-08 18:50:01', 5, '2014-01-09 01:50:01', 1, ''),
(131, 'Miss Atlántico 2014 ', '2014-02-08 22:00:00', 'Mantra Resort', 'El evento celebrará su Gala Final el sábado 8 de febrero de 2014 a partir de las 22:00 horas en Mantra Resort Spa & Casino de Punta del Este.', '-34.90785956272446', '-54.85018730163574', 0, 'Desfile, Miss Atlántico, Moda', '2014-01-08 18:51:33', 2, '2014-01-09 01:51:33', 1, ''),
(132, 'Conociéndonos de Punta a Punta', '2014-01-12 21:30:00', 'El Poseidón', 'Las escuelas Oholey Jinuj de Jabad Lubavitch Argentina llevarán a cabo un evento benéfico de reflexión y humor “Conociéndonos de Punta a Punta”, en “El Poseidón”, el cual contará con la participación de los rabinos Eliezer Shemtov, Dir. del Beit Jabad de Uruguay, y Tzvi Grünblatt, Dir. Gral. de Jabad Lubavitch Argentina, junto con el humorista Roberto Moldavsky. Informes & Reservas: 097 944 840', '-34.908633821168415', '-55.00584125518799', 0, 'Evento Benefico, El poseidón, Culturales.', '2014-01-08 18:57:48', 4, '2014-01-09 01:57:48', 1, ''),
(133, '"Pasa la vida…queda el candombe"', '2014-01-10 22:30:00', 'Teatro Municipal Cantegril', 'Llega el espectáculo de candombe del verano 2014. La Generación Lubola, Mejor Comparsa del Interior con la Mejor Vedette del Carnaval 2013, presenta “Pasa la vida…queda el candombe”. Entradas anticipadas por Red UTS', '-34.924777205815744', '-54.9456524848938', 0, 'Candombre, Cantegril, Musica, Música, Espectáculo', '2014-01-08 19:05:37', 3, '2014-01-09 02:05:37', 1, ''),
(134, '“Pasa la vida…queda el candombe”', '2014-01-11 22:30:00', 'Teatro Municipal Cantegril', 'Llega el espectáculo de candombe del verano 2014. La Generación Lubola, Mejor Comparsa del Interior con la Mejor Vedette del Carnaval 2013, presenta “Pasa la vida…queda el candombe”. ', '-34.92479479905317', '-54.94562029838562', 0, 'Candombre, Cantegril, Musica, Música, Espectáculo', '2014-01-08 19:06:46', 3, '2014-01-09 02:06:46', 1, ''),
(135, 'Charla Batista Viajes', '2014-01-09 19:30:00', 'Hotel Conrad', 'Francia en Profundo en el Salón Bariloche de Conrad. Entrada gratuita', '-34.95039775740662', '-54.938764572143555', 0, 'Charla, Culturales, Gratis, Conrad, Batista Viajes', '2014-01-08 19:14:12', 4, '2014-01-09 02:14:12', 1, ''),
(136, 'Esculturas Juan Bautista', '2014-01-09 18:00:00', 'La Posta del Cangrejo, La Barra', 'Inauguración exposición de nuevas esculturas de Juan Bautista Firpo. T 42770021', '-34.915812960803784', '-54.858598709106445', 0, 'Escultura, Exposición, Firpo, Culturales', '2014-01-08 19:16:38', 4, '2014-01-09 02:16:38', 1, ''),
(137, 'La Fiesta del Verano de: Destino Termas', '2014-01-09 21:00:00', 'Club de Golf del Cantegril Country Club', 'Por invitación', '-34.924873968574936', '-54.911534786224365', 0, 'Fiesta, Club de Golf', '2014-01-08 19:20:43', 4, '2014-01-09 02:20:43', 1, ''),
(138, '"Trío Luminar" de Argentina', '2014-01-09 21:30:00', 'Hotel L''Auberge', 'Concierto de Verano. T 4248 8888', '-34.93199891272813', '-54.906063079833984', 0, 'Concierto, Música, Musica', '2014-01-08 19:22:28', 3, '2014-01-09 02:22:28', 1, ''),
(139, 'Sushi Nights', '2014-01-09 21:30:00', 'Hotel L''Auberge', 'Tel. 4248 8888', '-34.93187577080008', '-54.90599870681757', 0, 'Sushi, Hotel L''Auberge, Gastronómico', '2014-01-08 19:24:17', 5, '2014-01-09 02:24:17', 1, ''),
(140, 'Asuntos de Pareja', '2014-01-09 22:00:00', 'Teatro Nogaró by Mantra', 'T. 4244 9000', '-34.95883064703606', '-54.939537048339844', 0, 'Teatro, Nogaró, Mantra, Culturales, Asuntos de Pareja', '2014-01-08 19:26:32', 4, '2014-01-09 02:26:32', 1, ''),
(141, 'Un verano de risa', '2014-01-09 00:00:00', 'Teatro Nogaró by Mantra', 'T 4244 9000', '-34.9588262505522', '-54.93945121765137', 0, 'Teatro, Culturales, Nogaró, Mantra, Un verano de risa', '2014-01-08 19:28:51', 4, '2014-01-09 02:28:51', 1, ''),
(142, 'Ciclo De Cenas', '2014-01-11 21:00:00', 'Mutate Tienda y Café, José Ignacio', 'Encuentro Culinario. Chefs Martín Baquero y Matías Kyriazis. Reservas telefónicas al 095699860. Precio: 5 pasos + vino +cerveza + Café $1.500', '-34.8446515123898', '-54.6372789144516', 0, 'Ciclo de Cenas, Jose Ignacio, Mutate, Gastronómico', '2014-01-08 19:57:16', 5, '2014-01-09 02:57:16', 1, ''),
(143, 'Ciclo de Cenas', '2014-01-18 21:00:00', 'Mutate Tienda y Café, José Ignacio', 'Encuentro culinario. Chefs : Próspero Velazco / Yago Márquez. Reservas al 095 699 860.', '-34.84455685642733', '-54.63730573654175', 0, 'Ciclo de Cenas, Jose Ignacio, Mutate, Gastronómico', '2014-01-08 19:59:37', 1, '2014-01-09 02:59:37', 1, ''),
(144, 'Ciclo de Cenas', '2014-01-25 21:00:00', 'Mutate Tienda y Café, José Ignacio', 'Encuentro culinario. Chef: Macarena de Castro. Por reservas: 095 699 860', '-34.844600882469926', '-54.63733792304993', 0, 'Ciclo de Cenas, Jose Ignacio, Mutate, Gastronómico', '2014-01-08 20:01:10', 5, '2014-01-09 03:01:10', 1, ''),
(145, 'Hippie Party', '2014-01-10 23:55:00', 'Parador Mantra Beach', 'Dj Negrix Bonaventura, Vestimenta: Hippie.', '-34.911713185893085', '-54.843369126319885', 0, 'Fiesta, Musica, Música, Mantra, Parador', '2014-01-09 13:15:17', 3, '2014-01-09 20:15:17', 1, ''),
(146, 'Asuntos de Pareja', '2014-01-16 22:00:00', 'Teatro Nogaró by Mantra', 'Una comedia absurda sobre las relaciones sentimentales de estos tiempos. T. 4244 9000', '-34.958843836486224', '-54.939478039741516', 0, 'Teatro, Nogaró, Mantra, Culturales, Asuntos de Pareja', '2014-01-09 17:26:43', 4, '2014-01-10 00:27:18', 1, '');
INSERT INTO `eventos` (`eventos_id`, `eventos_nombre`, `eventos_fecha_hora`, `eventos_lugar`, `eventos_desc`, `eventos_lat`, `eventos_lon`, `eventos_uid`, `eventos_tags`, `eventos_fecha_hora_creado`, `eventos_categoria_id`, `eventos_sync_value`, `eventos_estado`, `eventos_header_img`) VALUES
(147, 'Asuntos de Pareja', '2014-01-23 22:00:00', 'Teatro Nogaró by Mantra', 'Una comedia absurda sobre las relaciones sentimentales de estos tiempos. T. 4244 9000', '-34.9588262505522', '-54.939472675323486', 0, 'Teatro, Culturales, Nogaró, Mantra', '2014-01-09 17:28:17', 4, '2014-01-10 00:28:33', 1, ''),
(148, 'Asuntos de Pareja', '2014-01-30 22:00:00', 'Teatro Nogaró by Mantra', 'Una comedia absurda sobre las relaciones sentimentales de estos tiempos. T. 4244 9000', '-34.958839440003075', '-54.93946731090546', 0, 'Teatro, Culturales, Nogaró, Mantra', '2014-01-09 17:29:30', 4, '2014-01-10 00:29:30', 1, ''),
(149, 'Noche Árabe', '2014-01-09 22:00:00', 'Liga de Punta del Este', 'Info: 099611679. Con la orquesta de Mario Kirlis', '-34.95788979411468', '-54.93784189224243', 0, 'Baile Arabe, Culturales, Musica', '2014-01-09 17:39:34', 3, '2014-01-10 00:39:34', 1, ''),
(150, 'La Sopa de Piedras', '2014-01-12 19:00:00', 'Teatro Nogaró by Mantra', 'Una comedia musical con admirable colorido, dinamismo y picardía para el público infantil y toda la familia T. 4244 9000', '-34.958835043519684', '-54.93946731090546', 0, 'Teatro, Infantil, Nogaro, Culturales, Mantra', '2014-01-09 17:46:01', 4, '2014-01-10 00:46:01', 1, ''),
(151, 'La Sopa de Piedras', '2014-01-19 19:00:00', 'Teatro Nogaró by Mantra', 'Una comedia musical con admirable colorido, dinamismo y picardía para el público infantil y toda la familia T. 4244 9000', '-34.95881745758377', '-54.939478039741516', 0, 'Teatro infantil, Nogaro, Culturales, Mantra', '2014-01-09 17:47:32', 4, '2014-01-10 00:47:32', 1, ''),
(152, 'La Sopa de Piedras', '2014-01-26 19:00:00', 'Teatro Nogaro by Mantra', 'Una comedia musical con admirable colorido, dinamismo y picardía para el público infantil y toda la familia T. 4244 9000', '-34.958839440003075', '-54.93946194648743', 0, 'Culturales, Teatro, Infantil, Nogaro', '2014-01-09 17:49:40', 4, '2014-01-10 00:49:40', 1, ''),
(153, 'Por siempre Joven', '2014-01-13 22:00:00', 'Teatro Nogaro by Mantra', 'Diversión asegurada con un gran elenco encabezado por Carlos Perciavalle, Gladys Florimonte y Floppy Tesouro. T. 4244 9000', '-34.9588262505522', '-54.93946731090546', 0, 'Teatro, Culturales, Nogaro, Por siempre Joven', '2014-01-09 17:58:18', 4, '2014-01-10 00:58:18', 1, ''),
(154, 'Por siempre Joven', '2014-01-20 22:00:00', 'Teatro Nogaró by Mantra', 'Diversión asegurada con un gran elenco encabezado por Carlos Perciavalle, Gladys Florimonte y Floppy Tesouro. T. 4244 9000', '-34.958857025934265', '-54.9394565820694', 0, 'Culturales, Teatro, Nogaro, Por siempre joven', '2014-01-09 17:59:21', 4, '2014-01-10 00:59:21', 1, ''),
(155, 'Por siempre joven', '2014-01-27 22:00:00', 'Teatro Nogaró by Mantra', 'Diversión asegurada con un gran elenco encabezado por Carlos Perciavalle, Gladys Florimonte y Floppy Tesouro. T. 4244 9000', '-34.95888340482397', '-54.939488768577576', 0, 'Culturales, Teatro, Nogaro, Por siempre Joven', '2014-01-09 18:00:23', 4, '2014-01-10 01:00:23', 1, ''),
(156, 'Un verano de risa', '2014-01-09 00:00:00', 'Teatro Nogaro by Mantra', 'Un espectáculo con 7 artistas en escena combinando la magia y el glamour del music hall, baile, canto, humor, sketches e imitaciones.T. 4244 9000', '-34.95883064703606', '-54.93946194648743', 0, 'Culturales, Teatro, un verano de risa, nogaro', '2014-01-09 18:01:58', 4, '2014-01-10 01:01:58', 1, ''),
(157, 'Un verano de risa', '2014-01-16 00:00:00', 'Teatro Nogaró by Mantra', 'Un espectáculo con 7 artistas en escena combinando la magia y el glamour del music hall, baile, canto, humor, sketches e imitaciones.T. 4244 9000', '-34.958843836486224', '-54.939472675323486', 0, 'Teatro, Culturales, Nogaro, un verano de risa', '2014-01-09 18:02:49', 4, '2014-01-10 01:02:49', 1, ''),
(158, 'Un verano de risa', '2014-01-23 00:00:00', 'Teatro Nogaró by Mantra', 'Un espectáculo con 7 artistas en escena combinando la magia y el glamour del music hall, baile, canto, humor, sketches e imitaciones.T. 4244 9000', '-34.9588218540681', '-54.939472675323486', 0, 'Culturales, Teatro, Nogaro, un verano de risa', '2014-01-09 18:03:53', 4, '2014-01-10 01:03:53', 1, ''),
(159, 'Un verano de risa', '2014-01-30 00:00:00', 'Teatro Nogaró by Mantra', 'Un espectáculo con 7 artistas en escena combinando la magia y el glamour del music hall, baile, canto, humor, sketches e imitaciones.T. 4244 9000', '-34.9588262505522', '-54.93946194648743', 0, 'Culturales, Teatro, Nogaro, un verano de risa', '2014-01-09 18:05:35', 4, '2014-01-10 01:05:35', 1, ''),
(160, 'Trio Ibarburu "Huella Digital"', '2014-01-09 22:30:00', 'Calderón de la Barca esq Br. Artigas', 'Anticipadas $280. 42253866', '-34.91941109237876', '-54.94259476661682', 0, 'Musica, Huella digital', '2014-01-09 18:17:21', 3, '2014-01-10 01:17:21', 1, ''),
(161, 'No tengo envidia a los hombres Dr. Freud', '2014-01-15 22:00:00', 'Teatro Nogaró by Mantra', 'Una obra políticamente incorrecta que se atreve a decirlo todo sobre la mujer.', '-34.958832845277904', '-54.9394565820694', 0, 'Teatro, Culturales, Nogaro, No tengo envidia', '2014-01-09 18:23:44', 4, '2014-01-10 01:23:44', 1, ''),
(162, 'No tengo envidia a los hombres Dr. Freud', '2014-01-22 22:00:00', 'Teatro Nogaró by Mantra', 'Una obra políticamente incorrecta que se atreve a decirlo todo sobre la mujer.', '-34.958835043519684', '-54.93946194648743', 0, 'Culturales, teatro, nogaro, no tengo envidia', '2014-01-09 18:31:13', 4, '2014-01-10 01:31:13', 1, ''),
(163, 'No tengo envidia a los hombres Dr. Freud', '2014-01-29 22:00:00', 'Teatro Nogaró by Mantra', 'Una obra políticamente incorrecta que se atreve a decirlo todo sobre la mujer.', '-34.958839440003075', '-54.93946194648743', 0, 'Culturales, teatro, nogaro, no tengo envidia', '2014-01-09 18:32:21', 4, '2014-01-10 01:32:21', 1, ''),
(164, 'Sunset Session', '2014-01-10 18:00:00', 'Selenza Club del Mar', 'Wine & Cocktails. Ruta 10, Km164. Solo por invitación', '-34.90970721284266', '-54.840660095214844', 0, 'Atardecer, Fiesta, Musica, Selenza, ', '2014-01-09 18:44:53', 3, '2014-01-10 01:44:53', 1, ''),
(165, 'La Barra Open Art', '2014-01-10 21:00:00', 'La Barra', 'El evento se llevara a cabo todos los viernes de enero y febrero en las distintas galerías, ateliers, talleres y casas de decoración de la barra entre las 21 hs. Y la 01 hs. Donde los visitantes serán recibidos con una copa. Gratuito', '-34.914933198034994', '-54.86031532287598', 0, 'Gratis, Arte, Culturales, Galería', '2014-01-10 14:17:47', 4, '2014-01-10 21:17:47', 1, ''),
(166, 'DJ NISAN LARIDO', '2014-01-10 00:00:00', ' OCEAN CLUB Punta del Este', 'Parada 12 de la Brava', '-34.94281708912522', '-54.91436719894409', 0, 'Musica, Parador, Ocean', '2014-01-10 14:19:22', 3, '2014-01-10 21:19:22', 1, ''),
(167, 'Laura Keoroglian', '2014-01-10 20:30:00', 'Hotel Sisai', 'LAURA KEOROGLIAN presenta la 2° Edición de su libro “Corazón de Café” en hotel SISAI\n8:30 pm - 10:00 pm | Gratuito', '-34.94179689928455', '-54.93058919906616', 0, 'Laura, borra del cafe, libro, gratis, culturales', '2014-01-10 14:24:34', 4, '2014-01-10 21:24:34', 1, ''),
(168, 'Exposición Holística Terapias Naturales', '2014-01-11 10:00:00', 'Boutique Hotel Awa ', 'Entrada libre y gratuita - Sorteos y Premios. De 10 hs a 22.30', '-34.94053043906654', '-54.92959141731262', 0, 'Terapias, Salud, Gratis, Hotel Awa, Exposicion, Culturales', '2014-01-11 07:27:07', 4, '2014-01-11 14:27:07', 1, ''),
(169, 'Circuito Nacional de Beach Volley', '2014-01-11 07:00:00', 'Parada 31 de la Mansa', 'A las 13 habrá un descanso de dos horas y a las 15 se retomará la actividad hasta la caída del sol. Se jugará simultáneamente en cuatro canchas. Habrá premios en efectivo en juego para los ganadores: US$ 250 para los campeones masculinos y US$ 150 para las damas.', '-34.914475717668836', '-54.9829888343811', 0, 'Deportes, Volley, Playa', '2014-01-11 07:29:54', 1, '2014-01-11 14:29:54', 1, ''),
(170, 'Copa Rip Curl', '2014-01-13 08:00:00', 'Playa Montoya', 'Circuito Uruguayo de Surf', '-34.915390675851505', '-54.84928607940674', 0, 'Deportes, Surf, Montoya', '2014-01-11 07:33:49', 1, '2014-01-11 14:33:49', 1, ''),
(171, 'Saturday Tea Time', '2014-01-11 16:00:00', 'Mantra', 'Clásico servicio de te y repostería artesanal, jugos, licuados, smoothies de 16hs a 19:30hs. T4377 1000', '-34.90789475644849', '-54.850101470947266', 0, 'Mantra, te, Gastronomicos, tea', '2014-01-11 07:43:34', 5, '2014-01-11 14:43:34', 1, ''),
(172, 'Cocktail Breitling', '2014-01-11 21:00:00', 'Casa Sensations Du Temps', 'La marca de relojes vinculada al mundo de la aviación realizará un cocktail para promover las novedades de la marca. Ruta 10 km180. Por invitación.', '-34.95046810835392', '-54.93889331817627', 0, 'Cocktail, Rejoles, Gastronomico', '2014-01-11 07:49:18', 5, '2014-01-11 14:49:18', 1, ''),
(173, 'Espectáculo Villaba - Monetti - Alonso Trio', '2014-01-11 21:00:00', 'Deck del Puerto Punta del Este', 'Gratuito', '-34.96458983835473', '-54.94809865951538', 0, 'Gratis, Culturales, Puerto', '2014-01-11 07:57:11', 4, '2014-01-11 14:57:11', 1, ''),
(174, 'La Catedra del Macho 2', '2014-01-11 22:00:00', 'Teatro Nogaró by Mantra', 'Teatro', '-34.958857025934265', '-54.93945121765137', 0, 'Teatro, Nogaró, La catedra del macho', '2014-01-11 07:59:20', 4, '2014-01-11 14:59:20', 1, ''),
(175, 'Robot and Laser Show', '2014-01-11 00:00:00', 'Ocean Club', 'Parada 12 de la Brava', '-34.94286985722003', '-54.91434574127197', 0, 'Musica, Fiesta, Laser, Ocean', '2014-01-11 08:01:41', 3, '2014-01-11 15:01:41', 1, ''),
(176, 'Musical Infantil "Hercules"', '2014-01-12 20:00:00', 'Sala Teatro Cantegril', 'Divertida leyenda para niños', '-34.92401189633658', '-54.94631767272949', 0, 'Teatro infantil, Cantegril', '2014-01-11 08:05:28', 4, '2014-01-11 15:05:28', 1, ''),
(177, 'Tarde de Circo', '2014-01-12 20:00:00', 'Plaza Oh! La Barra', 'Gratuito y con reserva contacto@ohlabarra.com', '-34.91513114548007', '-54.85652267932892', 0, 'Gratis, Circo, Plaza Oh, Culturales', '2014-01-11 08:10:25', 4, '2014-01-11 15:10:25', 1, ''),
(178, 'Elección de Miss Verano', '2014-01-12 20:00:00', 'Mambo, Deck del Puerto', 'Miss Verano', '-34.965183319797426', '-54.95044827461243', 0, 'Elección Miss Verano, Mambo', '2014-01-11 08:15:11', 2, '2014-01-11 15:15:11', 1, ''),
(179, 'Copa Stella Artois Golf', '2014-01-11 10:00:00', 'Club del Lago', 'En el Club del Lago a 18 hoyos Stableford (simultáneo 18 hoyos en la modalidad Medal Play)', '-34.87392579725875', '-55.06776809692383', 0, 'Golf, Club del Lago, Deportes', '2014-01-11 08:18:38', 1, '2014-01-11 15:18:38', 1, ''),
(180, 'Citi Rugby Senior 5ta Edición ', '2014-01-11 17:30:00', 'Montoya, La Barra', 'De 17:30 a 19:00, Mujeres invitadas', '-34.91542586634718', '-54.84915733337402', 0, 'Playa Montoya, Rugby, Deportes', '2014-01-11 08:21:36', 1, '2014-01-11 15:21:36', 1, ''),
(181, 'Sounds of House 3 - Soho', '2014-01-11 00:00:00', 'Soho', 'Dee Jason', '-34.96543389956027', '-54.94958996772766', 0, 'Música, Musica, Soho', '2014-01-11 08:25:26', 3, '2014-01-11 15:25:26', 1, ''),
(182, 'Inauguración Rubi Rubi', '2014-01-13 20:00:00', 'Calle 20 esquina 30', 'Cóctel de inauguración de su boutique.', '-34.958839440003075', '-54.94121074676514', 0, 'Cóctel, coctel, moda, inauguración, rubi rubi', '2014-01-13 13:04:33', 2, '2014-01-13 20:04:33', 1, ''),
(183, 'Fiesta B.for Ibiza', '2014-01-13 23:00:00', 'El Camino, Manantiales', 'Sushi, Music & Drinks. Special Dj Set Fernando Picón. Reservas: 42775887.', '-34.90525518528574', '-54.8287296295166', 0, 'Fiesta, Musica, El camino, Manantiales', '2014-01-13 13:10:10', 3, '2014-01-13 20:10:10', 1, ''),
(184, 'Drinks & Music Sunset en La Susana', '2014-01-14 19:00:00', 'La Susana', 'De 7 a 10 pm en La Susana para disfrutar un atardecer con buenos tragos y mejor musica a cargo de Solana Gasiebayle y Sylvita Pereyra Iraola', '-34.901348464247704', '-54.81012582778931', 0, 'Sunset, Atardecer, La susana', '2014-01-13 13:14:04', 3, '2014-01-13 20:14:04', 1, ''),
(185, 'Conferencia "Grandes Islas del Mediterraneo: Corcega, Cardeña, Sicilia y Malta"', '2014-01-13 20:30:00', 'Yacht Club Punta del Este', 'Ciclo de conferencias.  Arq. Lorenzo Ristorto. De 8:30 pm a 10:00 pm. Entrada Gratuita.', '-34.96460742305187', '-54.950222969055176', 0, 'Conferencias, Yacht, Gratis, Culturales', '2014-01-13 13:21:01', 4, '2014-01-13 20:21:01', 1, ''),
(186, 'Luis Miguel Sellanes y Aqualactica', '2014-01-13 22:00:00', 'Plaza de los Artesanos', 'Ciclo Música de Verano. Gratuito', '-34.963358900176715', '-54.943732023239136', 0, 'Gratis, Musica, Música, Ciclo de música, plaza de los artesanos.', '2014-01-13 13:24:06', 3, '2014-01-13 20:24:06', 1, ''),
(187, 'Charla Batista Viajes', '2014-01-14 19:30:00', 'Hotel Conrad', 'India Mística e India del Sur. Salón Bariloche. Gratuito.', '-34.950046001764505', '-54.939279556274414', 0, 'Charla, India, Conrad,Batista VIajes, Culturales', '2014-01-13 13:29:12', 4, '2014-01-13 20:29:12', 1, ''),
(188, 'Un año de película', '2014-01-14 21:30:00', 'Apart Hotel Punta Sol', 'Los festivales de cine del Uruguay. Presentación audiovisual por Fernando Goldsman. T 094314683', '-34.92369521446426', '-54.966230392456055', 0, 'Cine, Culturales, un año de pelicula, Hotel punta sol', '2014-01-13 13:32:42', 4, '2014-01-13 20:35:44', 1, ''),
(189, 'El Show de Waldo', '2014-01-14 22:00:00', 'Teatro Nogaró by Mantra', 'Teatro', '-34.95883064703606', '-54.939504861831665', 0, 'Teatro El Show de Waldo, Culturales', '2014-01-13 13:35:18', 4, '2014-01-13 20:35:18', 1, ''),
(190, 'Carlos Perciavalle', '2014-01-14 00:00:00', 'Teatro Nogaró by Mantra', 'Teatro', '-34.95883064703606', '-54.93945121765137', 0, 'Teatro, Mantra, Carlos Perciavalle, Culturales', '2014-01-13 13:37:56', 4, '2014-01-13 20:37:56', 1, ''),
(191, 'Mambo', '2014-01-14 21:00:00', 'Mambo Club', 'Noche de prensa, agasajo a los periodistas acreditados en Punta del Este.', '-34.965187715940225', '-54.9504536390304', 0, 'Noche de prensa, mambo, música', '2014-01-13 13:41:36', 3, '2014-01-13 20:41:36', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locales`
--

CREATE TABLE IF NOT EXISTS `locales` (
  `locales_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `locales_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locales_ofertas_id` smallint(5) unsigned NOT NULL,
  `locales_estado` tinyint(1) NOT NULL,
  `locales_sync_value` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `locales_tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locales_dir` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locales_descuento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locales_cutoas` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locales_dias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locales_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `locales_lat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locales_lon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locales_departamentos_id` tinyint(2) NOT NULL,
  PRIMARY KEY (`locales_id`),
  KEY `locales_ofertas_id` (`locales_ofertas_id`),
  KEY `locales_ofertas_id_2` (`locales_ofertas_id`),
  KEY `locales_departamentos_id` (`locales_departamentos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `locales`
--

INSERT INTO `locales` (`locales_id`, `locales_nombre`, `locales_ofertas_id`, `locales_estado`, `locales_sync_value`, `locales_tel`, `locales_dir`, `locales_descuento`, `locales_cutoas`, `locales_dias`, `locales_desc`, `locales_lat`, `locales_lon`, `locales_departamentos_id`) VALUES
(1, 'Estela Jinchuk', 1, 1, '2014-01-15 01:04:25', '4244 9741', 'Calle 20 entre 27 y 28', '20%', '6 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal. El beneficio no aplica para la compra de líquidos para lentes de contacto, ni para los productos de la marca Ray Ban.', '-34.961319390107235', '-54.94433396403201', 9),
(2, 'AVIS', 2, 1, '2014-01-15 00:59:20', '4244 2020', 'Calle 31 (entre Gorlero y Rambla) ', '10%', '', 'Todos los días', 'Para aplicar el descuento se debe pagar el alquiler del vehículo en las oficinas de AVIS de Uruguay. Promoción válida en los países donde se acepta voucher prepago.', '-34.95894532659741', '-54.939033919018584', 0),
(3, 'AVIS', 2, 1, '2014-01-15 00:59:20', '4255 9858', 'Punta Del Este Airport (Airport) Laguna Del Sauce', '10%', '', 'Todos los días', 'Para aplicar el descuento se debe pagar el alquiler del vehículo en las oficinas de AVIS de Uruguay. Promoción válida en los países donde se acepta voucher prepago.', '-34.86052642170021', '-55.09839618652347', 0),
(4, 'Cymaco', 4, 1, '2014-01-15 00:59:20', '4225 0997', 'M. Chiossi casi 3 de Febrero', '15%', '12 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.91274646537331', '-54.95332034365538', 0),
(5, 'Doite', 5, 1, '2014-01-15 00:59:20', '4224 6206', 'Roman Guerra Esq. Ventura Alegre', '15%', '12 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.9064514', '-54.95659460000002', 0),
(6, 'S&F', 6, 1, '2014-01-15 00:59:20', '4248 9015', 'Punta Shopping (Av. Roosevelt Esq. Los Alpes) Local 260', '15%', '6 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.93957041724333', '-54.93419760947876', 0),
(7, 'Farmashop', 7, 1, '2014-01-15 00:59:20', '4248 6927', 'Av. Roosevelt y Parada 10', '10%', '6 cuotas sin interés', 'Todos los días', 'El beneficio es acumulable a otros descuentos en cualquiera de los locales Farmashop.', '-34.93381078855851', '-54.940298824667366', 0),
(8, 'Farmashop', 7, 1, '2014-01-15 00:59:20', '4224 8358', 'Av. Roosevelt y Zelmar Michelini', '10%', '6 cuotas sin interés', 'Todos los días', 'El beneficio es acumulable a otros descuentos en cualquiera de los locales Farmashop.', '-34.9141594439079', '-54.96124133809815', 0),
(9, 'Farmashop', 7, 1, '2014-01-15 00:59:20', '4244 1202', 'Av. Gorlero esq. 31', '10%', '8 cuotas sin interés', 'Todos los días', 'El beneficio es acumulable a otros descuentos en cualquiera de los locales Farmashop.', '-34.95848285439487', '-54.939435785813885', 0),
(10, 'Farmashop', 7, 1, '2014-01-15 00:59:20', '4244 4826', 'Av. Gorlero 780, Ed. Libertador, Loc. 002', '10%', '9 cuotas sin interés', 'Todos los días', 'El beneficio es acumulable a otros descuentos en cualquiera de los locales Farmashop.', '-34.96179335383436', '-54.94308895449217', 0),
(11, 'Freccero', 11, 1, '2014-01-15 00:59:20', '4244 1219', 'Av. Gorlero 545', '10%', '6 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal. El descuento no aplica para los casos de servicios, arreglos y composturas.', '-34.96554333307415', '-54.94720882753904', 0),
(12, 'BookShop', 12, 1, '2014-01-15 00:59:20', '4224 4502', 'Sarandí y Ventura Alegre', '15%', '3 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal. El beneficio aplica únicamente para la compra de libros. Promoción no válida para textos de estudio.', '-34.906556982937545', '-54.95768894127809', 0),
(13, 'Don Peperone', 13, 1, '2014-01-15 00:59:20', '4244 8870', 'Av.  Gorlero y Calle 27', '20%', '', 'Todos los días', 'El descuento se realizará directamente en el Estado de Cuenta del Cliente e incluye 9 puntos de IVA por disposición legal.', '-34.961595518979735', '-54.942917293115215', 0),
(14, 'Don Peperone', 13, 1, '2014-01-15 00:59:20', '4249 6924', 'Punta Shopping (Av. Roosevelt Esq. Los Alpes)', '20%', '', 'Todos los días', 'El descuento se realizará directamente en el Estado de Cuenta del Cliente e incluye 9 puntos de IVA por disposición legal.', '-34.9395704172433', '-54.93419760947876', 0),
(15, 'Don Peperone', 13, 1, '2014-01-15 00:59:20', '', 'Ruta 10 y Calle 10', '20%', '', 'Todos los días', 'El descuento se realizará directamente en el Estado de Cuenta del Cliente e incluye 9 puntos de IVA por disposición legal.', '-34.899289417011964', '-54.80245471669929', 0),
(16, 'Maui Club', 16, 1, '2014-01-15 00:59:20', '4249 8413', 'Punta Shopping (Av. Roosevelt Esq. Los Alpes) Local 393', '15%', '12 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.93957041724333', '-54.93419760947876', 0),
(17, 'Petit baby', 17, 1, '2014-01-15 00:59:20', '4224 5492', 'Román Guerra 866', '15%', '6 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.90798047009191', '-54.95641219444275', 0),
(18, 'Carmen Steffens', 18, 1, '2014-01-15 00:59:20', '4244 8350', 'Calle 20 y Calle 31. Edificio Torre Gattás Local 003', '15%', '6 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.95771219360022', '-54.940453052362045', 0),
(19, 'Daniel Cassin', 19, 1, '2014-01-15 00:59:20', '4249 4248', 'Punta Shopping (Av. Roosevelt Esq. Los Alpes) Local 314', '15%', '6 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.93957041724333', '-54.93419760947876', 0),
(20, 'Espacio b.a.', 20, 1, '2014-01-15 00:59:20', '', 'Sarandí y Ventura Alegre', '15%', '6 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.906504191485745', '-54.95771039895021', 0),
(21, 'Espacio b.a.', 20, 1, '2014-01-15 00:59:20', '4248 8086', 'Punta Shopping ( (Av. Roosevelt Esq. Los Alpes) Local 206', '15%', '6 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.93957041724333', '-54.93419760947876', 0),
(22, 'Legacy', 22, 1, '2014-01-15 00:59:20', '4225 8598', 'Ituzaingó y Sarandí ', '15%', '6 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.907366447614976', ' -54.957624568261735', 0),
(23, 'Levi''s', 23, 1, '2014-01-15 00:59:20', '4277 3251', 'Victor Haedo entre Ensueños y Duende Azul - Local 001', '15%', '3 cuotas sin interés con Visa. 6 cuotas sin interés con Master.', 'Todos los días', 'El beneficio aplica en todos los locales de Levi''s en Uruguay, incluyendo los dos Outlet de la marca. Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.91455047126162', '-54.862267921951286', 0),
(24, 'Levi''s', 23, 1, '2014-01-15 00:59:20', '4249 2355', 'Punta Shopping (Av. Roosevelt Esq. Los Alpes) Local 301', '15%', '3 cuotas sin interés con Visa. 6 cuotas sin interés con Master.', 'Todos los días', 'El beneficio aplica en todos los locales de Levi''s en Uruguay, incluyendo los dos Outlet de la marca. Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.93957041724333', '-54.93419760947876', 0),
(25, 'Manos del Uruguay', 25, 1, '2014-01-15 00:59:20', '4244 1953', 'Av. Gorlero entre 30 y 31', '15%', '6 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.95890491753841', '-54.9398703036743', 0),
(26, 'MVD Leather', 26, 1, '2014-01-15 00:59:20', '4248 1423', 'Punta Shopping (Av. Roosevelt Esq. Los Alpes) Nivel 3', '15%', '6 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.93957041724333', ' -54.93419760947876', 0),
(27, 'Sagali', 27, 1, '2014-01-15 00:59:20', '4249 1958', 'Punta Shopping  Local 361', '15%', '6 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.93957041724333', ' -54.93419760947876', 0),
(28, 'Sara Pérez', 28, 1, '2014-01-15 00:59:20', '', 'Av. Gorlero y 31', '15%', '6 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.95850044040259', ' -54.939462607904034', 0),
(29, 'Sisi', 29, 1, '2014-01-15 00:59:20', '2902 48 79 (int.226)', 'Punta Shopping (Av. Roosevelt Esq. Los Alpes) Local 208', '15%', '6 cuotas sin interés', 'Todos los días', 'Para hacer uso de las 6 cuotas sin recargo, la compra debe ser mayor a $ 1.200. Descuento no acumulable a otras promociones o liquidaciones.', '-34.93957041724333', ' -54.93419760947876', 0),
(30, 'Sisi', 29, 1, '2014-01-15 00:59:20', '2902 48 79 (int.243)', 'Punta Shopping (Av. Roosevelt Esq. Los Alpes) Local 217', '15%', '6 cuotas sin interés', 'Todos los días', 'Para hacer uso de las 6 cuotas sin recargo, la compra debe ser mayor a $ 1.200. Descuento no acumulable a otras promociones o liquidaciones.', '-34.93957041724333', '-54.93419760947876', 0),
(31, 'Sisi', 29, 1, '2014-01-15 00:59:20', '2 902 48 79 (int.217)', 'Sarandí 922 entre Ituzaingó y Ventura Alegre', '15%', '6 cuotas sin interés', 'Todos los días', 'Para hacer uso de las 6 cuotas sin recargo, la compra debe ser mayor a $ 1.200. Descuento no acumulable a otras promociones o liquidaciones.', '-34.906954012073605', '-54.95761431163942', 0),
(32, 'Sport&Casual Company', 32, 1, '2014-01-15 00:59:20', '4248 0378', 'Av. Roosevelt casi Av. Brasil', '15%', '6 cuotas sin interés', 'Todos los días', 'El descuento aplica a productos Reebok y a otras marcas solamente a colecciones anteriores.', '-34.93432793885717', '-54.939792480920346', 0),
(33, 'Uniform', 33, 1, '2014-01-15 01:01:01', '4247 7705', 'Punta Shopping (Av. Roosevelt Esq. Los Alpes) Local 370', '15%', '6 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.93957041724333', '-54.93419760947876 ', 0),
(34, 'Victoria M. Ortíz', 34, 1, '2014-01-15 00:59:20', '4244 6909', 'Calle 20 entre 27 y 28', '15%', '6 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.96047307625922', '-54.94336518332818', 0),
(35, 'Victoria M. Ortíz', 34, 1, '2014-01-15 00:59:20', '4249 2301', 'Punta Shopping (Av. Roosevelt Esq. Los Alpes) Local 359', '15%', '6 cuotas sin interés', 'Todos los días', 'Descuento no acumulable a otras promociones del comercio. El cliente podrá hacer uso de los planes de cuota de acuerdo al mínimo de compra establecido por cada sucursal.', '-34.93957041724333', '-54.93419760947876', 0),
(36, 'Buquebus', 36, 1, '2014-01-15 00:59:20', '', 'Terminal Punta del Este (Gorlero y 32) Local 09', '10%', '12 cuotas sin interés.10% en paquetes a Ar y Uy. 15% con tarjeta Santander Buquebus', 'Todos los días', 'Descuento válido exclusivamente en paquetes turísticos que incluyan estadía de 2 noches de hotel como mínimo, pasaje y los traslados del puerto al hotel y del hotel al puerto. El descuento no aplica para tramos aéreos y no es acumulable a otras promociones y se realizará únicamente en los locales Buquebus de Uruguay. No válido para compras realizadas telefónicamente o en Agencias de Viaje. Descuento válido únicamente para el titular de la tarjeta y/o familiares directos (padres, hijos, esposo/a). El descuento aplica para compras de hasta 4 paquetes por transacción.', '-34.957782437964504', '-54.938794699166806', 0),
(37, 'Buquebus', 36, 1, '2014-01-15 00:59:20', '', 'Punta Shopping (Av. Roosevelt Esq. Los Alpes) Local 104', '10%', '12 cuotas sin interés.10% en paquetes a Ar y Uy. 15% con tarjeta Santander Buquebus', 'Todos los días', 'Descuento válido exclusivamente en paquetes turísticos que incluyan estadía de 2 noches de hotel como mínimo, pasaje y los traslados del puerto al hotel y del hotel al puerto. El descuento no aplica para tramos aéreos y no es acumulable a otras promociones y se realizará únicamente en los locales Buquebus de Uruguay. No válido para compras realizadas telefónicamente o en Agencias de Viaje. Descuento válido únicamente para el titular de la tarjeta y/o familiares directos (padres, hijos, esposo/a). El descuento aplica para compras de hasta 4 paquetes por transacción.', '-34.93957041724333', '-54.93419760947876', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas`
--

CREATE TABLE IF NOT EXISTS `ofertas` (
  `ofertas_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ofertas_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ofertas_tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ofertas_tipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ofertas_header_img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ofertas_sync_value` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ofertas_id`),
  KEY `eventos_categoria_id` (`ofertas_tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `ofertas`
--

INSERT INTO `ofertas` (`ofertas_id`, `ofertas_nombre`, `ofertas_tags`, `ofertas_tipo`, `ofertas_header_img`, `ofertas_sync_value`) VALUES
(1, 'Estela Jinchuk', 'Punta del Este', 'Óptica\r', 'optica.jpg', '0000-00-00 00:00:00'),
(2, 'AVIS', 'Punta del Este', 'Alquiler de autos\r', 'auto.jpg', '0000-00-00 00:00:00'),
(4, 'Cymaco', 'Maldonado', 'Repuestos para autos\r', 'auto.jpg', '0000-00-00 00:00:00'),
(5, 'Doite', 'Maldonado', 'Repuestos para autos', 'auto.jpg', '0000-00-00 00:00:00'),
(6, 'S&F', 'Punta del Este', 'Repuestos para autos\r', 'auto.jpg', '0000-00-00 00:00:00'),
(7, 'Farmashop', 'Punta del Este', 'Farmacia\r', 'farmacia.jpg', '0000-00-00 00:00:00'),
(11, 'Freccero', 'Punta del Este', 'Joyería\r', 'joyeria.jpg', '0000-00-00 00:00:00'),
(12, 'BookShop', 'Maldonado', 'Librería\r', 'libros.jpg', '0000-00-00 00:00:00'),
(13, 'Don Peperone', 'Punta del Este', 'Restaurantes\r', 'restaurant.jpg', '0000-00-00 00:00:00'),
(16, 'Maui Club', 'Punta del Este', 'Restaurantes\r', 'restaurant.jpg', '0000-00-00 00:00:00'),
(17, 'Petit baby', 'Maldonado', 'Vestimenta infantil y juguetería\r', 'jugueteria.jpg', '0000-00-00 00:00:00'),
(18, 'Carmen Steffens', 'Punta del Este', 'Vestimenta y calzado\r', 'vestimenta_y_calzado.jpg', '0000-00-00 00:00:00'),
(19, 'Daniel Cassin', 'Punta del Este', 'Vestimenta y calzado\r', 'vestimenta_y_calzado.jpg', '0000-00-00 00:00:00'),
(20, 'Espacio b.a.', 'Maldonado', 'Vestimenta y calzado\r', 'vestimenta_y_calzado.jpg', '0000-00-00 00:00:00'),
(22, 'Legacy', 'Maldonado', 'Vestimenta y calzado\r', 'vestimenta_y_calzado.jpg', '0000-00-00 00:00:00'),
(23, 'Levi''s', 'Punta del Este', 'Vestimenta y calzado\r', 'vestimenta_y_calzado.jpg', '0000-00-00 00:00:00'),
(25, 'Manos del Uruguay', 'Punta del Este', 'Vestimenta y calzado\r', 'vestimenta_y_calzado.jpg', '0000-00-00 00:00:00'),
(26, 'MVD Leather', 'Punta del Este', 'Vestimenta y calzado\r', 'vestimenta_y_calzado.jpg', '0000-00-00 00:00:00'),
(27, 'Sagali', 'Punta del Este', 'Vestimenta y calzado\r', 'vestimenta_y_calzado.jpg', '0000-00-00 00:00:00'),
(28, 'Sara Pérez', 'Punta del Este', 'Vestimenta y calzado\r', 'vestimenta_y_calzado.jpg', '0000-00-00 00:00:00'),
(29, 'Sisi', 'Punta del Este', 'Vestimenta y calzado\r', 'vestimenta_y_calzado.jpg', '0000-00-00 00:00:00'),
(32, 'Sport&Casual Company', 'Punta del Este', 'Vestimenta y calzado\r', 'vestimenta_y_calzado.jpg', '0000-00-00 00:00:00'),
(33, 'Uniform', 'Punta del Este', 'Vestimenta y calzado\r', 'vestimenta_y_calzado.jpg', '0000-00-00 00:00:00'),
(34, 'Victoria M. Ortíz', 'Punta del Este', 'Vestimenta y calzado\r', 'vestimenta_y_calzado.jpg', '0000-00-00 00:00:00'),
(36, 'Buquebus', 'Punta del Este', 'Turismo', 'viaje_y_turismo.jpg', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participaciones`
--

CREATE TABLE IF NOT EXISTS `participaciones` (
  `participaciones_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `participaciones_eventos_id` smallint(5) unsigned NOT NULL,
  `participaciones_uid` bigint(20) unsigned NOT NULL,
  `participaciones_fecha_hora` datetime NOT NULL,
  PRIMARY KEY (`participaciones_id`),
  UNIQUE KEY `participaciones_eventos_id` (`participaciones_eventos_id`,`participaciones_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `push`
--

CREATE TABLE IF NOT EXISTS `push` (
  `push_id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `push_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `push_platform` enum('ios','android') COLLATE utf8_unicode_ci NOT NULL,
  `push_fecha_hora_creado` datetime NOT NULL,
  `push_activa` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`push_id`),
  UNIQUE KEY `push_token` (`push_token`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `push`
--

INSERT INTO `push` (`push_id`, `push_token`, `push_platform`, `push_fecha_hora_creado`, `push_activa`) VALUES
(3, 'APA91bGJxK63txVOJ41n1dylXim2BIu2O3NBuzBuZcsNYB87B-5BYl2-EcA5MXYnd5SMUawwR6IILloNM-T4Kq_jpaNJurO6TSicH0mP4MCYY-4Eftf52SiapbPCDH7PvwQ7RLLRcZN98cPIFF0MoaiIXZvPc5UJrA', 'android', '2013-12-31 16:30:46', 1),
(4, '2842f7860c6d8b8e1229c2a7a462e6a70cf1dc314c264887c40b5addd29df11c', 'ios', '2013-12-31 16:44:30', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`eventos_categoria_id`) REFERENCES `categorias` (`categorias_id`);

--
-- Filtros para la tabla `locales`
--
ALTER TABLE `locales`
  ADD CONSTRAINT `locales_ibfk_1` FOREIGN KEY (`locales_ofertas_id`) REFERENCES `ofertas` (`ofertas_id`);

--
-- Filtros para la tabla `participaciones`
--
ALTER TABLE `participaciones`
  ADD CONSTRAINT `participaciones_ibfk_1` FOREIGN KEY (`participaciones_eventos_id`) REFERENCES `eventos` (`eventos_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
