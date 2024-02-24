-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-02-2024 a las 02:11:27
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shp1p`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cubicles`
--

CREATE TABLE `cubicles` (
  `id_cubicle` smallint(10) NOT NULL,
  `number` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cubicles`
--

INSERT INTO `cubicles` (`id_cubicle`, `number`) VALUES
(1, 10),
(2, 5),
(3, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE `departments` (
  `id_department` smallint(10) NOT NULL,
  `name_department` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`id_department`, `name_department`) VALUES
(1, 'TI'),
(2, 'Redes'),
(3, 'Entornos'),
(4, 'Desarrollo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `id_employee` smallint(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `id_cubicle` smallint(6) NOT NULL,
  `id_department` smallint(6) NOT NULL,
  `id` smallint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`id_employee`, `name`, `last_name`, `id_cubicle`, `id_department`, `id`) VALUES
(1, 'Pablo', 'Sainz', 3, 3, 1),
(2, 'Ana', 'Gómez', 3, 4, 2),
(3, 'Enrique', 'Román', 2, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees_projects`
--

CREATE TABLE `employees_projects` (
  `id_employee` smallint(10) DEFAULT NULL,
  `id_project` smallint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `employees_projects`
--

INSERT INTO `employees_projects` (`id_employee`, `id_project`) VALUES
(3, 2),
(2, 4),
(1, 4),
(2, NULL),
(2, 1),
(1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

CREATE TABLE `projects` (
  `id_project` smallint(10) NOT NULL,
  `area` varchar(25) NOT NULL,
  `title` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `projects`
--

INSERT INTO `projects` (`id_project`, `area`, `title`) VALUES
(1, 'TI', 'Aplicacion web para resta'),
(2, 'Redes', 'Redes de area local'),
(3, 'Desarrollo de software', 'Aplicacion movil para seg'),
(4, 'Realidad Virtual', 'VR Architect');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` smallint(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `password`) VALUES
(1, 'Pblo', 'Sainz', 'pablo@gmail.com', 'pablo12'),
(2, 'Ana', 'Gómez', 'ana@gmail.com', 'anita.'),
(3, 'Enrique', 'Román', 'eroman@gmail.com', 'eroman12');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cubicles`
--
ALTER TABLE `cubicles`
  ADD PRIMARY KEY (`id_cubicle`);

--
-- Indices de la tabla `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id_department`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id_employee`),
  ADD KEY `id_cubicle` (`id_cubicle`),
  ADD KEY `id_department` (`id_department`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `employees_projects`
--
ALTER TABLE `employees_projects`
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_project` (`id_project`);

--
-- Indices de la tabla `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id_project`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cubicles`
--
ALTER TABLE `cubicles`
  MODIFY `id_cubicle` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `departments`
--
ALTER TABLE `departments`
  MODIFY `id_department` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `id_employee` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `projects`
--
ALTER TABLE `projects`
  MODIFY `id_project` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` smallint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`id_cubicle`) REFERENCES `cubicles` (`id_cubicle`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id_department`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `employees_projects`
--
ALTER TABLE `employees_projects`
  ADD CONSTRAINT `employees_projects_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id_employee`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_projects_ibfk_2` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id_project`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
