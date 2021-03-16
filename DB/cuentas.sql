-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-01-2021 a las 05:16:31
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
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `ID` int(11) NOT NULL,
  `IP` varchar(16) NOT NULL,
  `Nombre` varchar(24) NOT NULL,
  `Contra` varchar(129) NOT NULL,
  `Ropa` int(3) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `Genero` int(11) NOT NULL,
  `Vida` float NOT NULL,
  `Chaleco` float NOT NULL,
  `Muertes` int(11) NOT NULL,
  `Asesinatos` int(11) NOT NULL,
  `Admin` int(20) NOT NULL,
  `Policia` int(11) NOT NULL,
  `Dinero` int(11) NOT NULL,
  `Nivel` int(11) NOT NULL,
  `Fedex` int(11) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Botiquines` int(5) NOT NULL,
  `Acento` int(22) NOT NULL,
  `Fecha` varchar(30) NOT NULL,
  `GPS` int(10) NOT NULL,
  `Interior` int(3) NOT NULL,
  `Lugar` varchar(30) NOT NULL,
  `DNI` int(10) NOT NULL,
  `VehicleID` int(5) NOT NULL,
  `VIP` int(11) NOT NULL,
  `LatinCoins` int(20) NOT NULL,
  `Medicamentos` int(30) NOT NULL,
  `Marihuana` int(11) NOT NULL,
  `Banco` int(30) NOT NULL,
  `ChangesName` int(2) NOT NULL DEFAULT 3,
  `Abatido` int(2) NOT NULL,
  `Jaileado` int(2) NOT NULL,
  `TimeJail` int(5) NOT NULL,
  `Carcel` int(2) NOT NULL,
  `TimeCarcel` int(5) NOT NULL,
  `Banda` int(3) NOT NULL,
  `Baneado` int(2) NOT NULL,
  `ult_con` varchar(24) NOT NULL,
  `Cargos` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
  `fecha_creacion` varchar(24) NOT NULL DEFAULT current_timestamp()
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuentas`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
