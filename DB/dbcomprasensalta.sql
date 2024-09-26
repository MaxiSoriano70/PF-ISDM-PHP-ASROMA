-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2024 a las 07:12:18
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbcomprasensalta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditorias`
--

CREATE TABLE `auditorias` (
  `iIdAuditoria` int(11) NOT NULL,
  `dFecha` datetime DEFAULT current_timestamp(),
  `sDescripcion` varchar(400) DEFAULT NULL,
  `iIdTipoAuditoria` int(11) NOT NULL,
  `iIdUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritoscompras`
--

CREATE TABLE `carritoscompras` (
  `iIdCarritoCompra` int(11) NOT NULL,
  `iIdUsuario` int(11) NOT NULL,
  `dFecha` datetime DEFAULT current_timestamp(),
  `sEstado` varchar(50) DEFAULT NULL COMMENT 'Pendiente, Anulado, Pagado',
  `fTotal` double DEFAULT 0,
  `iIdForma_Pago` int(11) DEFAULT NULL,
  `iIdMetodo_Envio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `carritoscompras`
--

INSERT INTO `carritoscompras` (`iIdCarritoCompra`, `iIdUsuario`, `dFecha`, `sEstado`, `fTotal`, `iIdForma_Pago`, `iIdMetodo_Envio`) VALUES
(22, 2, '2020-11-12 22:02:27', 'Pagado', 32500, 1, 1),
(25, 2, '2020-11-16 21:13:09', 'Pagado', 8000, 2, 2),
(26, 2, '2020-11-16 21:19:26', 'Pagado', 24500, 3, 2),
(28, 1, '2020-11-17 13:10:01', 'Pagado', 16000, 4, 1),
(30, 2, '2020-11-27 21:42:47', 'Pagado', 8500, 5, 1),
(31, 1, '2020-11-27 22:30:53', 'Pendiente', 24000, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `iIdCategoria` int(11) NOT NULL,
  `sNombre` varchar(100) DEFAULT NULL,
  `sDescripcion` varchar(400) DEFAULT NULL,
  `dFechaAlta` datetime DEFAULT current_timestamp(),
  `bEliminado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`iIdCategoria`, `sNombre`, `sDescripcion`, `dFechaAlta`, `bEliminado`) VALUES
(1, 'Kits de Partidos', 'Camisetas, pantalones, medias de local, visitante y tercera equipación para hombre, mujer y niños.', '2020-11-10 22:48:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `iIdComentario` int(11) NOT NULL,
  `sTitulo` varchar(100) DEFAULT NULL,
  `sTexto` varchar(400) DEFAULT NULL,
  `iIdUsuario` int(11) NOT NULL,
  `iIdProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_carrito`
--

CREATE TABLE `det_carrito` (
  `iIdDet_Carrito` int(11) NOT NULL,
  `iIdCarritoCompra` int(11) NOT NULL,
  `iIdProducto` int(11) NOT NULL,
  `iCantidad` int(11) DEFAULT NULL,
  `fPrecio` double DEFAULT NULL,
  `fSubtotal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `det_carrito`
--

INSERT INTO `det_carrito` (`iIdDet_Carrito`, `iIdCarritoCompra`, `iIdProducto`, `iCantidad`, `fPrecio`, `fSubtotal`) VALUES
(16, 22, 1, 1, 8000, 8000),
(17, 22, 2, 3, 8000, 24000),
(18, 22, 3, 1, 8500, 8500),
(24, 25, 2, 3, 8000, 24000),
(28, 28, 1, 1, 8000, 8000),
(29, 28, 2, 3, 8000, 24000),
(30, 26, 1, 1, 8000, 8000),
(32, 26, 3, 1, 8500, 8500),
(34, 30, 3, 1, 8500, 8500),
(35, 31, 2, 3, 8000, 24000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formas_pagos`
--

CREATE TABLE `formas_pagos` (
  `iIdForma_Pago` int(11) NOT NULL,
  `iIdTarjeta` int(11) DEFAULT NULL,
  `iIdTipo_Pago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `formas_pagos`
--

INSERT INTO `formas_pagos` (`iIdForma_Pago`, `iIdTarjeta`, `iIdTipo_Pago`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, NULL, 1),
(4, 3, 2),
(5, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE `imagenes` (
  `iIdImagen` int(11) NOT NULL,
  `sNombreArchivo` varchar(100) DEFAULT NULL,
  `sTipoExtension` varchar(400) DEFAULT NULL,
  `sPath` varchar(400) DEFAULT NULL,
  `bEliminado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`iIdImagen`, `sNombreArchivo`, `sTipoExtension`, `sPath`, `bEliminado`) VALUES
(1, 'ro10001.jpg', 'image/jpeg', 'C:/xampp/htdocs/Instituto/Compra_En_Salta/Imagenes/Productos', 0),
(2, 'ro10001_1.jpg', 'image/jpeg', 'C:/xampp/htdocs/Instituto/Compra_En_Salta/Imagenes/Productos', 0),
(3, 'ro10001_2.jpg', 'image/jpeg', 'C:/xampp/htdocs/Instituto/Compra_En_Salta/Imagenes/Productos', 0),
(4, 'ro10002.jpg', 'image/jpeg', 'C:/xampp/htdocs/Instituto/Compra_En_Salta/Imagenes/Productos', 0),
(5, 'ro10002_1.jpg', 'image/jpeg', 'C:/xampp/htdocs/Instituto/Compra_En_Salta/Imagenes/Productos', 0),
(6, 'ro10002_2.jpg', 'image/jpeg', 'C:/xampp/htdocs/Instituto/Compra_En_Salta/Imagenes/Productos', 0),
(7, 'ro10003.jpg', 'image/jpeg', 'C:/xampp/htdocs/Instituto/Compra_En_Salta/Imagenes/Productos', 0),
(8, 'ro10003_1.jpg', 'image/jpeg', 'C:/xampp/htdocs/Instituto/Compra_En_Salta/Imagenes/Productos', 0),
(9, 'ro10003_2.jpg', 'image/jpeg', 'C:/xampp/htdocs/Instituto/Compra_En_Salta/Imagenes/Productos', 0),
(10, 'it6058_f_model_ecom-n1-1.webp', 'image/webp', 'C:/xampp/htdocs/Instituto/Compra_En_Salta/Imagenes/Productos', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `iIdMarca` int(11) NOT NULL,
  `sNombre` varchar(100) NOT NULL,
  `sDescripcion` varchar(400) DEFAULT NULL,
  `iOrden` varchar(45) DEFAULT NULL,
  `bPublicado` tinyint(1) DEFAULT NULL,
  `bEliminado` tinyint(1) DEFAULT 0,
  `dFecha` datetime DEFAULT current_timestamp(),
  `iIdImagen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos_envios`
--

CREATE TABLE `metodos_envios` (
  `iIdMetodo_Envio` int(11) NOT NULL,
  `sDescripcion` varchar(200) DEFAULT NULL,
  `bEstado` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `metodos_envios`
--

INSERT INTO `metodos_envios` (`iIdMetodo_Envio`, `sDescripcion`, `bEstado`) VALUES
(1, 'Retiro de Local', 0),
(2, 'Entrega a Domicilio', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `iIdProducto` int(11) NOT NULL,
  `sCodigo` varchar(100) NOT NULL,
  `sNombre` varchar(250) NOT NULL,
  `sDescripcion` varchar(250) DEFAULT NULL,
  `sDescr` varchar(500) DEFAULT NULL,
  `fPrecio` decimal(18,2) DEFAULT NULL,
  `iStock` int(11) DEFAULT NULL,
  `iStockMinimo` int(11) DEFAULT NULL,
  `dFecha` datetime DEFAULT current_timestamp(),
  `iIdImagenPrincipal` int(11) DEFAULT NULL,
  `bPublicado` tinyint(1) DEFAULT NULL,
  `bEliminado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`iIdProducto`, `sCodigo`, `sNombre`, `sDescripcion`, `sDescr`, `fPrecio`, `iStock`, `iStockMinimo`, `dFecha`, `iIdImagenPrincipal`, `bPublicado`, `bEliminado`) VALUES
(1, '10101010', 'Camiseta Local', '1ra Camiseta de AS Roma (Local)', 'Nike Breathe 100% poliéster. Maillot de manga corta para el día del partido. La tela Nike Breathe te ayuda a mantenerte seco y fresco. Insignia de Swoosh y AS Roma.', 8000.00, 150, 50, '2020-12-02 02:58:29', NULL, NULL, 0),
(2, '20202020', 'Camiseta Visitante', '2da Camiseta de AS Roma (Visitante)', 'Nike Breathe 100% poliéster. Maillot de manga corta para el día del partido. La tela Nike Breathe te ayuda a mantenerte seco y fresco. Insignia de Swoosh y AS Roma.', 8000.00, 100, 30, '2020-11-12 15:48:13', NULL, NULL, 0),
(3, '30303030', 'Camiseta Tercera', '3ra Camiseta de AS Roma (Tercera)', 'Nike Breathe 100% poliéster. Maillot de manga corta para el día del partido. La tela Nike Breathe te ayuda a mantenerte seco y fresco. Insignia de Swoosh y AS Roma.', 8500.00, 100, 20, '2020-11-12 15:47:56', NULL, NULL, 0),
(4, '12345678', 'Equipacion 2023/24', 'Kit Titular', NULL, 500.00, 50, 5, '2024-09-25 02:41:27', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_categoria`
--

CREATE TABLE `producto_categoria` (
  `iIdProducto_Categoria` int(11) NOT NULL,
  `iIdProducto` int(11) NOT NULL,
  `iIdCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `producto_categoria`
--

INSERT INTO `producto_categoria` (`iIdProducto_Categoria`, `iIdProducto`, `iIdCategoria`) VALUES
(8, 1, 1),
(9, 3, 1),
(10, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_imagen`
--

CREATE TABLE `producto_imagen` (
  `iIdProducto_Imagen` int(11) NOT NULL,
  `iOrden` int(11) DEFAULT NULL,
  `iIdProducto` int(11) NOT NULL,
  `iIdImagen` int(11) NOT NULL,
  `bEliminado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `producto_imagen`
--

INSERT INTO `producto_imagen` (`iIdProducto_Imagen`, `iOrden`, `iIdProducto`, `iIdImagen`, `bEliminado`) VALUES
(1, 1, 1, 1, 0),
(2, 2, 1, 2, 0),
(3, 3, 1, 3, 0),
(4, 1, 2, 4, 0),
(5, 2, 2, 5, 0),
(6, 3, 2, 6, 0),
(7, 1, 3, 7, 0),
(8, 2, 3, 8, 0),
(9, 3, 3, 9, 0),
(10, 1, 4, 10, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_marca`
--

CREATE TABLE `producto_marca` (
  `iIdProducto_Marca` int(11) NOT NULL,
  `iOrden` int(11) DEFAULT NULL,
  `iIdProducto` int(11) NOT NULL,
  `iIdMarca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `iIdProveedor` int(11) NOT NULL,
  `sRazonSocial` varchar(100) DEFAULT NULL,
  `sCUIT` varchar(15) NOT NULL,
  `sDomicilio` varchar(100) DEFAULT NULL,
  `sTelefono` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_compra`
--

CREATE TABLE `proveedor_compra` (
  `iIdProveedor_Compra` int(11) NOT NULL,
  `dFecha` datetime DEFAULT current_timestamp(),
  `iStock` int(11) DEFAULT NULL,
  `fCosto` decimal(18,2) DEFAULT NULL,
  `iIdProducto_Marca` int(11) NOT NULL,
  `iIdProveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas`
--

CREATE TABLE `tarjetas` (
  `iIdTarjeta` int(11) NOT NULL,
  `iCupon` int(11) DEFAULT NULL,
  `iAutorizacion` int(11) DEFAULT NULL,
  `iIdTipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tarjetas`
--

INSERT INTO `tarjetas` (`iIdTarjeta`, `iCupon`, `iAutorizacion`, `iIdTipo`) VALUES
(1, 367899, 137676, 2),
(2, 125697, 128561, 2),
(3, 369509, 166539, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoauditoria`
--

CREATE TABLE `tipoauditoria` (
  `iIdTipoAuditoria` int(11) NOT NULL,
  `sDescripcion` varchar(250) DEFAULT NULL,
  `sAbreviatura` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `iIdTipo` int(11) NOT NULL,
  `sDescripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`iIdTipo`, `sDescripcion`) VALUES
(1, 'Visa'),
(2, 'Mastercard'),
(3, 'Discover'),
(4, 'American Express');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_pagos`
--

CREATE TABLE `tipos_pagos` (
  `iIdTipo_Pago` int(11) NOT NULL,
  `sDescripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tipos_pagos`
--

INSERT INTO `tipos_pagos` (`iIdTipo_Pago`, `sDescripcion`) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta de Credito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `iIdUsuario` int(11) NOT NULL,
  `sLogin` varchar(64) NOT NULL,
  `sClave` varchar(64) NOT NULL,
  `sSalt` varchar(64) DEFAULT NULL,
  `sNombre` varchar(100) NOT NULL,
  `sApellido` varchar(100) NOT NULL,
  `sEmail` varchar(100) NOT NULL,
  `iDNI` int(11) NOT NULL,
  `iContacto` int(11) NOT NULL,
  `iCodigoPostal` int(11) DEFAULT NULL,
  `sDomicilio` varchar(100) DEFAULT NULL,
  `sCiudad` varchar(100) DEFAULT NULL,
  `sUltimoIP` varchar(100) DEFAULT NULL,
  `dFechaAlta` datetime DEFAULT current_timestamp(),
  `dUltimaFechaLogin` datetime DEFAULT NULL,
  `bEliminado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`iIdUsuario`, `sLogin`, `sClave`, `sSalt`, `sNombre`, `sApellido`, `sEmail`, `iDNI`, `iContacto`, `iCodigoPostal`, `sDomicilio`, `sCiudad`, `sUltimoIP`, `dFechaAlta`, `dUltimaFechaLogin`, `bEliminado`) VALUES
(1, 'Muslera_01', 'Leon_01', NULL, 'Fernando', 'Muslera', 'fernando_muslera@gmail.com', 29558663, 15569848, 4400, 'San Martin 2000', 'Salta Capital', NULL, '2020-11-10 11:57:04', '2024-09-25 02:25:42', 0),
(2, 'Gimenez_02', 'Josema_02', NULL, 'José María', 'Giménez', 'josema_gimenez@gmail.com', 38887808, 155899654, 4400, 'San Martin 2600', 'Salta Capital', NULL, '2020-11-10 12:58:26', '2024-09-25 02:43:19', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditorias`
--
ALTER TABLE `auditorias`
  ADD PRIMARY KEY (`iIdAuditoria`),
  ADD KEY `fk_Auditorias_TipoAuditoria_idx` (`iIdTipoAuditoria`),
  ADD KEY `fk_Auditorias_Usuarios1_idx` (`iIdUsuario`);

--
-- Indices de la tabla `carritoscompras`
--
ALTER TABLE `carritoscompras`
  ADD PRIMARY KEY (`iIdCarritoCompra`),
  ADD KEY `fk_CarritosCompras_Usuarios1_idx` (`iIdUsuario`),
  ADD KEY `fk_CarritosCompras_Formas_Pagos1_idx` (`iIdForma_Pago`),
  ADD KEY `fk_CarritosCompras_Metodos_Envios1_idx` (`iIdMetodo_Envio`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`iIdCategoria`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`iIdComentario`),
  ADD KEY `fk_Comentarios_Usuarios1_idx` (`iIdUsuario`),
  ADD KEY `fk_Comentarios_Productos1_idx` (`iIdProducto`);

--
-- Indices de la tabla `det_carrito`
--
ALTER TABLE `det_carrito`
  ADD PRIMARY KEY (`iIdDet_Carrito`),
  ADD KEY `FK_Det_Carrito_Productos_idx` (`iIdProducto`),
  ADD KEY `FK_Det_Carrito_Carrito_Compra_idx` (`iIdCarritoCompra`);

--
-- Indices de la tabla `formas_pagos`
--
ALTER TABLE `formas_pagos`
  ADD PRIMARY KEY (`iIdForma_Pago`),
  ADD KEY `fk_Formas_Pagos_Tarjetas1_idx` (`iIdTarjeta`),
  ADD KEY `fk_Formas_Pagos_Tipos_Pagos1_idx` (`iIdTipo_Pago`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`iIdImagen`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`iIdMarca`),
  ADD KEY `fk_Marcas_Imagenes1_idx` (`iIdImagen`);

--
-- Indices de la tabla `metodos_envios`
--
ALTER TABLE `metodos_envios`
  ADD PRIMARY KEY (`iIdMetodo_Envio`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`iIdProducto`);

--
-- Indices de la tabla `producto_categoria`
--
ALTER TABLE `producto_categoria`
  ADD PRIMARY KEY (`iIdProducto_Categoria`),
  ADD KEY `fk_Producto_Categoria_Productos1_idx` (`iIdProducto`),
  ADD KEY `fk_Producto_Categoria_Categorias1_idx` (`iIdCategoria`);

--
-- Indices de la tabla `producto_imagen`
--
ALTER TABLE `producto_imagen`
  ADD PRIMARY KEY (`iIdProducto_Imagen`),
  ADD KEY `fk_Producto_Imagen_Productos1_idx` (`iIdProducto`),
  ADD KEY `fk_Producto_Imagen_Imagenes1_idx` (`iIdImagen`);

--
-- Indices de la tabla `producto_marca`
--
ALTER TABLE `producto_marca`
  ADD PRIMARY KEY (`iIdProducto_Marca`),
  ADD KEY `fk_Producto_Marca_Productos1_idx` (`iIdProducto`),
  ADD KEY `fk_Producto_Marca_Marcas1_idx` (`iIdMarca`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`iIdProveedor`);

--
-- Indices de la tabla `proveedor_compra`
--
ALTER TABLE `proveedor_compra`
  ADD PRIMARY KEY (`iIdProveedor_Compra`),
  ADD KEY `fk_Proveedor_Compra_Producto_Marca1_idx` (`iIdProducto_Marca`),
  ADD KEY `fk_Proveedor_Compra_Proveedores1_idx` (`iIdProveedor`);

--
-- Indices de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD PRIMARY KEY (`iIdTarjeta`),
  ADD KEY `fk_Tarjetas_Tipos1_idx` (`iIdTipo`);

--
-- Indices de la tabla `tipoauditoria`
--
ALTER TABLE `tipoauditoria`
  ADD PRIMARY KEY (`iIdTipoAuditoria`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`iIdTipo`);

--
-- Indices de la tabla `tipos_pagos`
--
ALTER TABLE `tipos_pagos`
  ADD PRIMARY KEY (`iIdTipo_Pago`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`iIdUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditorias`
--
ALTER TABLE `auditorias`
  MODIFY `iIdAuditoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carritoscompras`
--
ALTER TABLE `carritoscompras`
  MODIFY `iIdCarritoCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `iIdCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `iIdComentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `det_carrito`
--
ALTER TABLE `det_carrito`
  MODIFY `iIdDet_Carrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `formas_pagos`
--
ALTER TABLE `formas_pagos`
  MODIFY `iIdForma_Pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `iIdImagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `iIdMarca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodos_envios`
--
ALTER TABLE `metodos_envios`
  MODIFY `iIdMetodo_Envio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `iIdProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto_categoria`
--
ALTER TABLE `producto_categoria`
  MODIFY `iIdProducto_Categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `producto_imagen`
--
ALTER TABLE `producto_imagen`
  MODIFY `iIdProducto_Imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `producto_marca`
--
ALTER TABLE `producto_marca`
  MODIFY `iIdProducto_Marca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `iIdProveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor_compra`
--
ALTER TABLE `proveedor_compra`
  MODIFY `iIdProveedor_Compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  MODIFY `iIdTarjeta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipoauditoria`
--
ALTER TABLE `tipoauditoria`
  MODIFY `iIdTipoAuditoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `iIdTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipos_pagos`
--
ALTER TABLE `tipos_pagos`
  MODIFY `iIdTipo_Pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `iIdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditorias`
--
ALTER TABLE `auditorias`
  ADD CONSTRAINT `fk_Auditorias_TipoAuditoria` FOREIGN KEY (`iIdTipoAuditoria`) REFERENCES `tipoauditoria` (`iIdTipoAuditoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Auditorias_Usuarios1` FOREIGN KEY (`iIdUsuario`) REFERENCES `usuarios` (`iIdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carritoscompras`
--
ALTER TABLE `carritoscompras`
  ADD CONSTRAINT `fk_CarritosCompras_Formas_Pagos1` FOREIGN KEY (`iIdForma_Pago`) REFERENCES `formas_pagos` (`iIdForma_Pago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_CarritosCompras_Metodos_Envios1` FOREIGN KEY (`iIdMetodo_Envio`) REFERENCES `metodos_envios` (`iIdMetodo_Envio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_CarritosCompras_Usuarios1` FOREIGN KEY (`iIdUsuario`) REFERENCES `usuarios` (`iIdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_Comentarios_Productos1` FOREIGN KEY (`iIdProducto`) REFERENCES `productos` (`iIdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Comentarios_Usuarios1` FOREIGN KEY (`iIdUsuario`) REFERENCES `usuarios` (`iIdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `det_carrito`
--
ALTER TABLE `det_carrito`
  ADD CONSTRAINT `FK_Det_Carrito_Carrito_Compra` FOREIGN KEY (`iIdCarritoCompra`) REFERENCES `carritoscompras` (`iIdCarritoCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Det_Carrito_Productos` FOREIGN KEY (`iIdProducto`) REFERENCES `productos` (`iIdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `formas_pagos`
--
ALTER TABLE `formas_pagos`
  ADD CONSTRAINT `fk_Formas_Pagos_Tarjetas1` FOREIGN KEY (`iIdTarjeta`) REFERENCES `tarjetas` (`iIdTarjeta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Formas_Pagos_Tipos_Pagos1` FOREIGN KEY (`iIdTipo_Pago`) REFERENCES `tipos_pagos` (`iIdTipo_Pago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD CONSTRAINT `fk_Marcas_Imagenes1` FOREIGN KEY (`iIdImagen`) REFERENCES `imagenes` (`iIdImagen`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_categoria`
--
ALTER TABLE `producto_categoria`
  ADD CONSTRAINT `fk_Producto_Categoria_Categorias1` FOREIGN KEY (`iIdCategoria`) REFERENCES `categorias` (`iIdCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_Categoria_Productos1` FOREIGN KEY (`iIdProducto`) REFERENCES `productos` (`iIdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_imagen`
--
ALTER TABLE `producto_imagen`
  ADD CONSTRAINT `fk_Producto_Imagen_Imagenes1` FOREIGN KEY (`iIdImagen`) REFERENCES `imagenes` (`iIdImagen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_Imagen_Productos1` FOREIGN KEY (`iIdProducto`) REFERENCES `productos` (`iIdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_marca`
--
ALTER TABLE `producto_marca`
  ADD CONSTRAINT `fk_Producto_Marca_Marcas1` FOREIGN KEY (`iIdMarca`) REFERENCES `marcas` (`iIdMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_Marca_Productos1` FOREIGN KEY (`iIdProducto`) REFERENCES `productos` (`iIdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor_compra`
--
ALTER TABLE `proveedor_compra`
  ADD CONSTRAINT `fk_Proveedor_Compra_Producto_Marca1` FOREIGN KEY (`iIdProducto_Marca`) REFERENCES `producto_marca` (`iIdProducto_Marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Proveedor_Compra_Proveedores1` FOREIGN KEY (`iIdProveedor`) REFERENCES `proveedores` (`iIdProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD CONSTRAINT `fk_Tarjetas_Tipos1` FOREIGN KEY (`iIdTipo`) REFERENCES `tipos` (`iIdTipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
