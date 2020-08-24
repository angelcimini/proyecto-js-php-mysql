-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-01-2020 a las 09:24:28
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreria_2`
--
CREATE DATABASE IF NOT EXISTS `libreria_2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `libreria_2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcategoria`, `nombre`, `descripcion`) VALUES
(1, 'Tecnología', 'Libros tecnológicos para construir vainas varias'),
(3, 'Ciencia Ficción', 'Libros para perderse en el espacio'),
(4, 'Novela romántica', 'Los romances más comentados de la prehistoria'),
(5, 'Mundo Antiguo', 'Civilizaciones mesozoicas y paleomesopotámicas'),
(6, 'Medicina', 'Libros de consulta médica para todo uso'),
(7, 'Ciencias', 'Compendio de libros científicos de todos los tiempos'),
(8, 'Zoología', 'Animales vertebrados, invertebrados y semivertebrados'),
(9, 'Botánica', 'Plantas verdes, amarillas, rojas, azules y negras'),
(10, 'Virología', 'Virus humanos y de ordenador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `idlibro` int(11) NOT NULL,
  `titulo` varchar(300) NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `fechaalta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechamodi` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`idlibro`, `titulo`, `precio`, `stock`, `fechaalta`, `fechamodi`) VALUES
(2, 'Cómo construir un condensador de fluzo', '90.00', 10, '2020-01-23 12:51:56', NULL),
(3, 'Aceleradores de partículas para uso doméstico', '60.00', 10, '2020-01-23 12:51:56', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libroscategorias`
--

CREATE TABLE `libroscategorias` (
  `idlibro` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opiniones`
--

CREATE TABLE `opiniones` (
  `idopinion` int(11) NOT NULL,
  `comentario` varchar(1200) NOT NULL,
  `valoracion` decimal(1,0) NOT NULL,
  `fechaalta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idusuario` int(11) NOT NULL,
  `idlibro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `nif` char(9) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellidos` varchar(120) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `cp` char(5) NOT NULL,
  `email` varchar(80) NOT NULL,
  `telefono` char(9) DEFAULT NULL,
  `fechaalta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `nif`, `nombre`, `apellidos`, `direccion`, `cp`, `email`, `telefono`, `fechaalta`) VALUES
(14, '22315678Q', 'Alice', 'Rambo', 'gran via', '08001', 'alice@mail.com', NULL, '2020-01-23 11:19:33'),
(17, '12399678Q', 'Josephine', 'Rambo', 'av. sylvester', '30002', '', NULL, '2020-01-23 11:26:12'),
(22, '79897877O', 'Maurice', 'Delacroix', 'gran via', '90888', 'maurice@mail.com', '111234455', '2020-01-23 12:00:06'),
(23, '79777877O', 'Peter', 'O\'toole', 'gran via 2', '90880', 'peters@mail.com', '33333333', '2020-01-23 12:05:48'),
(24, '33333333L', 'David', 'Alcolea', 'calabuch, 456', '08001', 'david@mail.com', '', '2020-01-24 11:30:05'),
(25, '33338833L', 'John', 'O\'Donnell', 'gran via', '08001', 'david@mail.com', '', '2020-01-24 11:45:39'),
(26, '33300000P', 'Doctor', 'Hell', 'cementerio, 666', '90001', 'maligno@mail.com', '', '2020-01-24 11:46:51'),
(27, '56564558U', 'Johny', 'Mentero', 'rue percebe, 13', '50777', 'johny@mail.com', '43334343', '2020-01-27 09:03:06'),
(29, '12345656K', 'Daisy', 'Rossemary', 'margeritti, 34', '98001', 'daisy@mail.com', '123122121', '2020-01-28 14:30:41');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcategoria`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`idlibro`);

--
-- Indices de la tabla `libroscategorias`
--
ALTER TABLE `libroscategorias`
  ADD PRIMARY KEY (`idlibro`,`idcategoria`),
  ADD KEY `idcategoria` (`idcategoria`);

--
-- Indices de la tabla `opiniones`
--
ALTER TABLE `opiniones`
  ADD PRIMARY KEY (`idopinion`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `idlibro` (`idlibro`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `nif` (`nif`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `idlibro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `opiniones`
--
ALTER TABLE `opiniones`
  MODIFY `idopinion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libroscategorias`
--
ALTER TABLE `libroscategorias`
  ADD CONSTRAINT `libroscategorias_ibfk_1` FOREIGN KEY (`idlibro`) REFERENCES `libros` (`idlibro`) ON DELETE CASCADE,
  ADD CONSTRAINT `libroscategorias_ibfk_2` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`);

--
-- Filtros para la tabla `opiniones`
--
ALTER TABLE `opiniones`
  ADD CONSTRAINT `opiniones_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `opiniones_ibfk_2` FOREIGN KEY (`idlibro`) REFERENCES `libros` (`idlibro`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
