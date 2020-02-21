-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-02-2020 a las 14:28:51
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestor`
--
DROP DATABASE IF EXISTS `gestor`;
CREATE DATABASE IF NOT EXISTS `gestor` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gestor`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instancias`
--

DROP TABLE IF EXISTS `instancias`;
CREATE TABLE IF NOT EXISTS `instancias` (
  `inId` int(255) UNSIGNED NOT NULL AUTO_INCREMENT,
  `chNombre` varchar(100) NOT NULL,
  `chDatabase` varchar(100) NOT NULL,
  `dtFecha` date NOT NULL,
  `bActiva` bit(1) NOT NULL,
  PRIMARY KEY (`inId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `instancias`
--

INSERT INTO `instancias` (`inId`, `chNombre`, `chDatabase`, `dtFecha`, `bActiva`) VALUES
(1, 'prueba', '_dtPrueba', '2020-02-17', b'1');
--
-- Base de datos: `_dtprueba`
--
DROP DATABASE IF EXISTS `_dtprueba`;
CREATE DATABASE IF NOT EXISTS `_dtprueba` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `_dtprueba`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdinventario_almacen`
--

DROP TABLE IF EXISTS `mdinventario_almacen`;
CREATE TABLE IF NOT EXISTS `mdinventario_almacen` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `vNombre` varchar(100) NOT NULL,
  `vDireccion` varchar(100) NOT NULL,
  `dtCreado` date NOT NULL,
  `bActivo` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdinventario_inventario`
--

DROP TABLE IF EXISTS `mdinventario_inventario`;
CREATE TABLE IF NOT EXISTS `mdinventario_inventario` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `producto_id` int(10) UNSIGNED NOT NULL,
  `idAlmacen` int(10) UNSIGNED NOT NULL,
  `cantidad` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdinventario_mapamovinventario`
--

DROP TABLE IF EXISTS `mdinventario_mapamovinventario`;
CREATE TABLE IF NOT EXISTS `mdinventario_mapamovinventario` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idMov` int(10) UNSIGNED NOT NULL,
  `idInventario` int(10) UNSIGNED NOT NULL,
  `cantidad` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdinventario_mapaproductounidad`
--

DROP TABLE IF EXISTS `mdinventario_mapaproductounidad`;
CREATE TABLE IF NOT EXISTS `mdinventario_mapaproductounidad` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idUnidad` int(10) UNSIGNED NOT NULL,
  `producto_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdinventario_movsinventario`
--

DROP TABLE IF EXISTS `mdinventario_movsinventario`;
CREATE TABLE IF NOT EXISTS `mdinventario_movsinventario` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idAlmacen` int(10) UNSIGNED NOT NULL,
  `dtFecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpleado` int(10) UNSIGNED NOT NULL,
  `vAccion` varchar(100) NOT NULL,
  `md_accionOrigen` varchar(100) DEFAULT NULL,
  `id_accionOrigen` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdinventario_unidad`
--

DROP TABLE IF EXISTS `mdinventario_unidad`;
CREATE TABLE IF NOT EXISTS `mdinventario_unidad` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `vNombre` varchar(100) NOT NULL,
  `bActivo` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdproductos_caracteristicahoja`
--

DROP TABLE IF EXISTS `mdproductos_caracteristicahoja`;
CREATE TABLE IF NOT EXISTS `mdproductos_caracteristicahoja` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `vNombre` varchar(100) NOT NULL,
  `idRaiz` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdproductos_caracteristicaraiz`
--

DROP TABLE IF EXISTS `mdproductos_caracteristicaraiz`;
CREATE TABLE IF NOT EXISTS `mdproductos_caracteristicaraiz` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `chNombre` varchar(100) NOT NULL,
  `bActivo` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdproductos_mapaproductocaracteristica`
--

DROP TABLE IF EXISTS `mdproductos_mapaproductocaracteristica`;
CREATE TABLE IF NOT EXISTS `mdproductos_mapaproductocaracteristica` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idCaracteristicaHoja` int(10) UNSIGNED NOT NULL,
  `idProducto` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdproductos_producto`
--

DROP TABLE IF EXISTS `mdproductos_producto`;
CREATE TABLE IF NOT EXISTS `mdproductos_producto` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `vNombre` varchar(100) NOT NULL,
  `vDescription` varchar(10) NOT NULL,
  `vImagen` varchar(100) NOT NULL,
  `idPadre` int(10) UNSIGNED DEFAULT NULL,
  `dtCreado` date NOT NULL,
  `dtModificado` date NOT NULL,
  `bActivo` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdtienda_impuestos`
--

DROP TABLE IF EXISTS `mdtienda_impuestos`;
CREATE TABLE IF NOT EXISTS `mdtienda_impuestos` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `vNombre` varchar(100) NOT NULL,
  `iPorcentaje` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdtienda_mapapreciobase`
--

DROP TABLE IF EXISTS `mdtienda_mapapreciobase`;
CREATE TABLE IF NOT EXISTS `mdtienda_mapapreciobase` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `producto_id` int(10) UNSIGNED NOT NULL,
  `dPrecio` decimal(20,0) UNSIGNED NOT NULL,
  `dPrecioVenta` decimal(20,0) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdtienda_mapapreciosucursal`
--

DROP TABLE IF EXISTS `mdtienda_mapapreciosucursal`;
CREATE TABLE IF NOT EXISTS `mdtienda_mapapreciosucursal` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `producto_id` int(10) NOT NULL,
  `idSucursal` int(10) NOT NULL,
  `dPrecio` decimal(20,0) UNSIGNED NOT NULL,
  `dPrecioVenta` decimal(20,0) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdtienda_mapaproductoimpuesto`
--

DROP TABLE IF EXISTS `mdtienda_mapaproductoimpuesto`;
CREATE TABLE IF NOT EXISTS `mdtienda_mapaproductoimpuesto` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `producto_id` int(10) UNSIGNED NOT NULL,
  `idImpuesto` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdtienda_sucursal`
--

DROP TABLE IF EXISTS `mdtienda_sucursal`;
CREATE TABLE IF NOT EXISTS `mdtienda_sucursal` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `chNombre` varchar(100) NOT NULL,
  `chDireccion` varchar(100) NOT NULL,
  `dtCreado` date NOT NULL,
  `bActivo` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
