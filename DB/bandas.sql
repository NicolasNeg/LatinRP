-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-01-2021 a las 19:49:18
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `latinrp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bandas`
--

CREATE TABLE `bandas` (
  `ID` int(5) NOT NULL,
  `Owner` varchar(24) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Color` int(3) NOT NULL,
  `rango1` varchar(24) NOT NULL,
  `rango2` varchar(24) NOT NULL,
  `rango3` varchar(24) NOT NULL,
  `rango4` varchar(24) NOT NULL,
  `rango5` varchar(24) NOT NULL,
  `rango6` varchar(24) NOT NULL,
  `rango7` varchar(24) NOT NULL,
  `miembros` int(11) NOT NULL,
  `graffs` int(11) NOT NULL,
  `territorios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bandas`
--
ALTER TABLE `bandas`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bandas`
--
ALTER TABLE `bandas`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
