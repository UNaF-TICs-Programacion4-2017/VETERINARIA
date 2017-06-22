-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-06-2017 a las 23:49:06
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `veterinaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email`
--

CREATE TABLE `email` (
  `id_email` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `rela_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `email`
--

INSERT INTO `email` (`id_email`, `email`, `rela_persona`) VALUES
(1, 'fedeiza7098@gmail.com', 1),
(2, 'kjshdkhjgdkhj@mnadjln.com', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `id_mascota` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `nro_paciente` int(11) NOT NULL,
  `rela_tipomascota` int(11) NOT NULL,
  `rela_sexo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `mascota`
--

INSERT INTO `mascota` (`id_mascota`, `nombre`, `nro_paciente`, `rela_tipomascota`, `rela_sexo`) VALUES
(1, 'rocko', 13, 1, 1),
(2, 'piturro', 16, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota_persona`
--

CREATE TABLE `mascota_persona` (
  `id_mascotapersona` int(11) NOT NULL,
  `rela_persona` int(11) NOT NULL,
  `rela_mascota` int(11) NOT NULL,
  `rela_medicamento` int(11) NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `descripcion_enfermedades` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `mascota_persona`
--

INSERT INTO `mascota_persona` (`id_mascotapersona`, `rela_persona`, `rela_mascota`, `rela_medicamento`, `fecha_ingreso`, `descripcion_enfermedades`, `precio`) VALUES
(1, 1, 1, 5, '2017-06-08 20:34:31', 'una pata rota', 250),
(2, 2, 2, 14, '2017-06-21 00:00:00', 'masndjlnlda;lkcl;akdkljW', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id_medicamentos` int(11) NOT NULL,
  `nombre_medicamento` varchar(255) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id_medicamentos`, `nombre_medicamento`) VALUES
(1, 'BIO LIBERATOR AVES'),
(2, 'TABERNIL POMADA'),
(3, 'BIO LIBERATOR ROEDORES'),
(4, 'CANITENOL-BT'),
(5, 'DRONCIT'),
(6, 'CORTEXONAVET'),
(7, 'CREMA CICATRIZANTE CALOX'),
(8, 'PREVICOX'),
(9, 'HYONATE Solución Inyectable'),
(10, 'AZITROMICINA CALOX  (Azitromicina)'),
(11, 'EMESTRYN®'),
(12, 'DOXICICLINA'),
(13, 'SYVAQUINOL 10% ORAL'),
(14, 'GASTROGARD'),
(15, 'GLUCOSAL REHIDRATANTE'),
(16, 'MALTA PARA GATOS EN PASTA TRIXIE'),
(17, 'Sucralfato'),
(18, 'TABERNIL canto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `dni` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre`, `apellido`, `dni`) VALUES
(1, 'federico', 'iza', 40084200),
(2, 'alexi', 'pit(hermano de brad)', 35463666);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `probar`
--

CREATE TABLE `probar` (
  `id` int(11) NOT NULL,
  `passvc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `passch` char(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `probar`
--

INSERT INTO `probar` (`id`, `passvc`, `passch`) VALUES
(1, 'ññññññññvarchar', 'ññññññññchar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `id_sexo` int(11) NOT NULL,
  `tipo_sexo` varchar(255) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`id_sexo`, `tipo_sexo`) VALUES
(1, 'masculino'),
(2, 'femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE `telefonos` (
  `id_telefono` int(11) NOT NULL,
  `numero_telefono` double NOT NULL,
  `rela_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`id_telefono`, `numero_telefono`, `rela_persona`) VALUES
(1, 3704545094, 1),
(2, 3704010102, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_mascota`
--

CREATE TABLE `tipo_de_mascota` (
  `id_tipo` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tipo_de_mascota`
--

INSERT INTO `tipo_de_mascota` (`id_tipo`, `descripcion`) VALUES
(1, 'canino'),
(2, 'felino'),
(3, 'ave');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipousuario` int(11) NOT NULL,
  `tipo_usuario` varchar(150) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tipousuario`, `tipo_usuario`) VALUES
(1, 'estandar'),
(2, 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `rela_persona` int(11) NOT NULL,
  `rela_tipousuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `pass`, `rela_persona`, `rela_tipousuario`) VALUES
(1, 'viking', 'abc123', 1, 1),
(2, 'mralexi', 'contraseña', 2, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id_email`),
  ADD KEY `rela_persona` (`rela_persona`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`id_mascota`),
  ADD KEY `rela_tipomascota` (`rela_tipomascota`),
  ADD KEY `rela_sexo` (`rela_sexo`);

--
-- Indices de la tabla `mascota_persona`
--
ALTER TABLE `mascota_persona`
  ADD PRIMARY KEY (`id_mascotapersona`),
  ADD KEY `rela_persona` (`rela_persona`),
  ADD KEY `rela_mascota` (`rela_mascota`),
  ADD KEY `rela_medicamento` (`rela_medicamento`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id_medicamentos`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `probar`
--
ALTER TABLE `probar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`id_sexo`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD PRIMARY KEY (`id_telefono`),
  ADD KEY `rela_persona` (`rela_persona`);

--
-- Indices de la tabla `tipo_de_mascota`
--
ALTER TABLE `tipo_de_mascota`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipousuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `rela_persona` (`rela_persona`),
  ADD KEY `rela_tipousuario` (`rela_tipousuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `email`
--
ALTER TABLE `email`
  MODIFY `id_email` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `id_mascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `mascota_persona`
--
ALTER TABLE `mascota_persona`
  MODIFY `id_mascotapersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id_medicamentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `probar`
--
ALTER TABLE `probar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `id_sexo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  MODIFY `id_telefono` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_de_mascota`
--
ALTER TABLE `tipo_de_mascota`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id_tipousuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `email`
--
ALTER TABLE `email`
  ADD CONSTRAINT `email_ibfk_1` FOREIGN KEY (`rela_persona`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`rela_sexo`) REFERENCES `sexo` (`id_sexo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mascota_ibfk_2` FOREIGN KEY (`rela_tipomascota`) REFERENCES `tipo_de_mascota` (`id_tipo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `mascota_persona`
--
ALTER TABLE `mascota_persona`
  ADD CONSTRAINT `mascota_persona_ibfk_1` FOREIGN KEY (`rela_persona`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mascota_persona_ibfk_2` FOREIGN KEY (`rela_mascota`) REFERENCES `mascota` (`id_mascota`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mascota_persona_ibfk_3` FOREIGN KEY (`rela_medicamento`) REFERENCES `medicamentos` (`id_medicamentos`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD CONSTRAINT `telefonos_ibfk_1` FOREIGN KEY (`rela_persona`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rela_persona`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`rela_tipousuario`) REFERENCES `tipo_usuario` (`id_tipousuario`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
