-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2017 at 06:35 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- VER COMO ELIMINAR DATOS EN LLAVES FORANEAS DE UNA PAGINA A OTRA EN PHP XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- -----------------------------------------------------------------------------

-- Table structure for table `sucursales`

CREATE TABLE `sucursales` (
  `id` int(11) NOT NULL,

  `nombre` text COLLATE utf8_spanish_ci,
  `telefono` text COLLATE utf8_spanish_ci,
  `ciudad` text COLLATE utf8_spanish_ci,
  `direccion` text COLLATE utf8_spanish_ci,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sucursales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


-- -----------------------------------------------------------------------------
 -- Table structure for table `empleados`

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `id_sucursal` int COLLATE utf8_spanish_ci,

  `nombre` text COLLATE utf8_spanish_ci,
  `apellidos` text COLLATE utf8_spanish_ci,
  `telefono` text COLLATE utf8_spanish_ci,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `empleados`
   ADD FOREIGN KEY (id_sucursal) REFERENCES sucursales (id) ON DELETE CASCADE ON UPDATE CASCADE;

-- -----------------------------------------------------------------------------

-- Table structure for table `roles`

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

-- -----------------------------------------------------------------------------

-- Table structure for table `usuarios`

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `id_empleado` int COLLATE utf8_spanish_ci,
  `id_rol` int COLLATE utf8_spanish_ci,

  `usuario` text COLLATE utf8_spanish_ci,
  `password` text COLLATE utf8_spanish_ci,
  `foto` text COLLATE utf8_spanish_ci,
  `estado` int(11),
  `ultimo_login` datetime,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `usuarios`
   ADD FOREIGN KEY (id_empleado) REFERENCES empleados (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `usuarios`
  ADD FOREIGN KEY (id_rol) REFERENCES roles (id) ON DELETE CASCADE ON UPDATE CASCADE;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
