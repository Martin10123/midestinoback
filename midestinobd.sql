-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: midestinobd
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carritos_compra_planes`
--

DROP TABLE IF EXISTS `carritos_compra_planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritos_compra_planes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `fue_aprobado` bit(1) NOT NULL,
  `precio_total` decimal(38,2) NOT NULL,
  `cliente_id` bigint NOT NULL,
  `compra_plan_id` bigint DEFAULT NULL,
  `plan_empresa_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcvugsaodghrg42eo0o0kr0a65` (`cliente_id`),
  KEY `FK8mp3sma1iktsvolknsypykdcd` (`compra_plan_id`),
  KEY `FKi5qy2q44edet3wuah2nmdt75g` (`plan_empresa_id`),
  CONSTRAINT `FK8mp3sma1iktsvolknsypykdcd` FOREIGN KEY (`compra_plan_id`) REFERENCES `compra_planes` (`id_plan_guardado`),
  CONSTRAINT `FKcvugsaodghrg42eo0o0kr0a65` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `FKi5qy2q44edet3wuah2nmdt75g` FOREIGN KEY (`plan_empresa_id`) REFERENCES `planes_empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritos_compra_planes`
--

LOCK TABLES `carritos_compra_planes` WRITE;
/*!40000 ALTER TABLE `carritos_compra_planes` DISABLE KEYS */;
/*!40000 ALTER TABLE `carritos_compra_planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` bigint NOT NULL AUTO_INCREMENT,
  `contrasena` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `foto_perfil` varchar(255) DEFAULT NULL,
  `nombre_completo` varchar(255) DEFAULT NULL,
  `nombre_usuario` varchar(255) DEFAULT NULL,
  `numero_documento` varchar(255) DEFAULT NULL,
  `numero_telefono` varchar(255) DEFAULT NULL,
  `presupuesto` decimal(38,2) DEFAULT NULL,
  `tipo_documento` varchar(255) DEFAULT NULL,
  `tipo_usuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `UK_1c96wv36rk2hwui7qhjks3mvg` (`email`),
  UNIQUE KEY `UK_qog5uums44mn8w95nqwdrr7gx` (`nombre_usuario`),
  UNIQUE KEY `UK_2viccgf178bd74vfbq8ctsv8t` (`numero_documento`),
  UNIQUE KEY `UK_9702p1ihfv5nh7gsywc0k75og` (`numero_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'12345678','admin@admin.com',NULL,'Administrador','admin','1234567890','3008889999',0.00,'Cedula','Administrador');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_plan_cantidades_compradas`
--

DROP TABLE IF EXISTS `compra_plan_cantidades_compradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_plan_cantidades_compradas` (
  `compra_plan_id` bigint NOT NULL,
  `cantidad_comprad` varchar(255) DEFAULT NULL,
  KEY `FK8jt4g39ah67oev2jm1ahk9o2t` (`compra_plan_id`),
  CONSTRAINT `FK8jt4g39ah67oev2jm1ahk9o2t` FOREIGN KEY (`compra_plan_id`) REFERENCES `compra_planes` (`id_plan_guardado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_plan_cantidades_compradas`
--

LOCK TABLES `compra_plan_cantidades_compradas` WRITE;
/*!40000 ALTER TABLE `compra_plan_cantidades_compradas` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_plan_cantidades_compradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_plan_correos`
--

DROP TABLE IF EXISTS `compra_plan_correos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_plan_correos` (
  `compra_plan_id` bigint NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  KEY `FK6excf5t3x41yh51rbsd1qjvnw` (`compra_plan_id`),
  CONSTRAINT `FK6excf5t3x41yh51rbsd1qjvnw` FOREIGN KEY (`compra_plan_id`) REFERENCES `compra_planes` (`id_plan_guardado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_plan_correos`
--

LOCK TABLES `compra_plan_correos` WRITE;
/*!40000 ALTER TABLE `compra_plan_correos` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_plan_correos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_plan_direcciones`
--

DROP TABLE IF EXISTS `compra_plan_direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_plan_direcciones` (
  `compra_plan_id` bigint NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  KEY `FKban79gagdyjn9w1lji5u47arc` (`compra_plan_id`),
  CONSTRAINT `FKban79gagdyjn9w1lji5u47arc` FOREIGN KEY (`compra_plan_id`) REFERENCES `compra_planes` (`id_plan_guardado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_plan_direcciones`
--

LOCK TABLES `compra_plan_direcciones` WRITE;
/*!40000 ALTER TABLE `compra_plan_direcciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_plan_direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_plan_empresas`
--

DROP TABLE IF EXISTS `compra_plan_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_plan_empresas` (
  `compra_plan_id` bigint NOT NULL,
  `empresa_id` bigint DEFAULT NULL,
  KEY `FKr67ajpuu6f0swdl4qe1w2jbuy` (`compra_plan_id`),
  CONSTRAINT `FKr67ajpuu6f0swdl4qe1w2jbuy` FOREIGN KEY (`compra_plan_id`) REFERENCES `compra_planes` (`id_plan_guardado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_plan_empresas`
--

LOCK TABLES `compra_plan_empresas` WRITE;
/*!40000 ALTER TABLE `compra_plan_empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_plan_empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_plan_horarios`
--

DROP TABLE IF EXISTS `compra_plan_horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_plan_horarios` (
  `compra_plan_id` bigint NOT NULL,
  `horario` varchar(255) DEFAULT NULL,
  KEY `FK6xxtdi1c2s98s3vbmttavgwev` (`compra_plan_id`),
  CONSTRAINT `FK6xxtdi1c2s98s3vbmttavgwev` FOREIGN KEY (`compra_plan_id`) REFERENCES `compra_planes` (`id_plan_guardado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_plan_horarios`
--

LOCK TABLES `compra_plan_horarios` WRITE;
/*!40000 ALTER TABLE `compra_plan_horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_plan_horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_plan_imagenes`
--

DROP TABLE IF EXISTS `compra_plan_imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_plan_imagenes` (
  `compra_plan_id` bigint NOT NULL,
  `imagen_url` varchar(500) DEFAULT NULL,
  KEY `FK7obku8pgxtrwev8wbxrmnqaeb` (`compra_plan_id`),
  CONSTRAINT `FK7obku8pgxtrwev8wbxrmnqaeb` FOREIGN KEY (`compra_plan_id`) REFERENCES `compra_planes` (`id_plan_guardado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_plan_imagenes`
--

LOCK TABLES `compra_plan_imagenes` WRITE;
/*!40000 ALTER TABLE `compra_plan_imagenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_plan_imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_plan_informaciones_generales`
--

DROP TABLE IF EXISTS `compra_plan_informaciones_generales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_plan_informaciones_generales` (
  `compra_plan_id` bigint NOT NULL,
  `informacion_general` varchar(255) DEFAULT NULL,
  KEY `FKtp9vr5nn5bnv0orrpic9y93mh` (`compra_plan_id`),
  CONSTRAINT `FKtp9vr5nn5bnv0orrpic9y93mh` FOREIGN KEY (`compra_plan_id`) REFERENCES `compra_planes` (`id_plan_guardado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_plan_informaciones_generales`
--

LOCK TABLES `compra_plan_informaciones_generales` WRITE;
/*!40000 ALTER TABLE `compra_plan_informaciones_generales` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_plan_informaciones_generales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_plan_nombre_planes`
--

DROP TABLE IF EXISTS `compra_plan_nombre_planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_plan_nombre_planes` (
  `compra_plan_id` bigint NOT NULL,
  `nombre_plan` varchar(255) DEFAULT NULL,
  KEY `FKm83gs1i067wuwqyrirdxv7y0d` (`compra_plan_id`),
  CONSTRAINT `FKm83gs1i067wuwqyrirdxv7y0d` FOREIGN KEY (`compra_plan_id`) REFERENCES `compra_planes` (`id_plan_guardado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_plan_nombre_planes`
--

LOCK TABLES `compra_plan_nombre_planes` WRITE;
/*!40000 ALTER TABLE `compra_plan_nombre_planes` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_plan_nombre_planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_plan_paises`
--

DROP TABLE IF EXISTS `compra_plan_paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_plan_paises` (
  `compra_plan_id` bigint NOT NULL,
  `pais` varchar(255) DEFAULT NULL,
  KEY `FK3i1ttl2b39n21h145opoop3rm` (`compra_plan_id`),
  CONSTRAINT `FK3i1ttl2b39n21h145opoop3rm` FOREIGN KEY (`compra_plan_id`) REFERENCES `compra_planes` (`id_plan_guardado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_plan_paises`
--

LOCK TABLES `compra_plan_paises` WRITE;
/*!40000 ALTER TABLE `compra_plan_paises` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_plan_paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_plan_por_empresas`
--

DROP TABLE IF EXISTS `compra_plan_por_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_plan_por_empresas` (
  `compra_plan_id` bigint NOT NULL,
  `plan_empresa_id` bigint DEFAULT NULL,
  KEY `FKnypi56o7rdkae9iksqsq3okhi` (`compra_plan_id`),
  CONSTRAINT `FKnypi56o7rdkae9iksqsq3okhi` FOREIGN KEY (`compra_plan_id`) REFERENCES `compra_planes` (`id_plan_guardado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_plan_por_empresas`
--

LOCK TABLES `compra_plan_por_empresas` WRITE;
/*!40000 ALTER TABLE `compra_plan_por_empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_plan_por_empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_plan_precios`
--

DROP TABLE IF EXISTS `compra_plan_precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_plan_precios` (
  `compra_plan_id` bigint NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  KEY `FKi7120w5h8v89sdi7j2cultpek` (`compra_plan_id`),
  CONSTRAINT `FKi7120w5h8v89sdi7j2cultpek` FOREIGN KEY (`compra_plan_id`) REFERENCES `compra_planes` (`id_plan_guardado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_plan_precios`
--

LOCK TABLES `compra_plan_precios` WRITE;
/*!40000 ALTER TABLE `compra_plan_precios` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_plan_precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_plan_telefonos`
--

DROP TABLE IF EXISTS `compra_plan_telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_plan_telefonos` (
  `compra_plan_id` bigint NOT NULL,
  `telefono` bigint DEFAULT NULL,
  KEY `FKbbkikkokt249pkjql5c7q4i0b` (`compra_plan_id`),
  CONSTRAINT `FKbbkikkokt249pkjql5c7q4i0b` FOREIGN KEY (`compra_plan_id`) REFERENCES `compra_planes` (`id_plan_guardado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_plan_telefonos`
--

LOCK TABLES `compra_plan_telefonos` WRITE;
/*!40000 ALTER TABLE `compra_plan_telefonos` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_plan_telefonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_plan_tipo_sitios`
--

DROP TABLE IF EXISTS `compra_plan_tipo_sitios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_plan_tipo_sitios` (
  `compra_plan_id` bigint NOT NULL,
  `tipo_sitio` varchar(255) DEFAULT NULL,
  KEY `FKstf4ltrt136in98vxn5seyiea` (`compra_plan_id`),
  CONSTRAINT `FKstf4ltrt136in98vxn5seyiea` FOREIGN KEY (`compra_plan_id`) REFERENCES `compra_planes` (`id_plan_guardado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_plan_tipo_sitios`
--

LOCK TABLES `compra_plan_tipo_sitios` WRITE;
/*!40000 ALTER TABLE `compra_plan_tipo_sitios` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_plan_tipo_sitios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_planes`
--

DROP TABLE IF EXISTS `compra_planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_planes` (
  `id_plan_guardado` bigint NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) DEFAULT NULL,
  `fecha_compra` varchar(255) DEFAULT NULL,
  `nombre_plan` varchar(255) DEFAULT NULL,
  `precio_total_compra` decimal(38,2) DEFAULT NULL,
  `id_cliente` bigint DEFAULT NULL,
  PRIMARY KEY (`id_plan_guardado`),
  KEY `FK6u5nfog2dray19rqv3khwapf3` (`id_cliente`),
  CONSTRAINT `FK6u5nfog2dray19rqv3khwapf3` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_planes`
--

LOCK TABLES `compra_planes` WRITE;
/*!40000 ALTER TABLE `compra_planes` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id_empresa` bigint NOT NULL AUTO_INCREMENT,
  `rut` varchar(255) DEFAULT NULL,
  `cargo_propietario` varchar(255) DEFAULT NULL,
  `certificado_existencia` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `confirmación` bit(1) NOT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `empresa_fue_aceptada` bit(1) NOT NULL,
  `empresa_fue_aceptada_por_admin` bit(1) NOT NULL,
  `empresa_tuvo_respuesta` bit(1) NOT NULL,
  `entidad_registro` varchar(255) DEFAULT NULL,
  `estados_financieros` varchar(255) DEFAULT NULL,
  `fecha_firma` varchar(255) DEFAULT NULL,
  `fecha_fundacion` varchar(255) DEFAULT NULL,
  `fecha_registro` varchar(255) DEFAULT NULL,
  `firma_representante_legal` varchar(255) DEFAULT NULL,
  `foto_perfil` varchar(255) DEFAULT NULL,
  `ganancias` decimal(38,2) DEFAULT NULL,
  `nit` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `nombre_propietario_principal` varchar(255) DEFAULT NULL,
  `nombre_representante_legal` varchar(255) DEFAULT NULL,
  `notaria_registro` varchar(255) DEFAULT NULL,
  `numero_documento_representante_legal` varchar(255) DEFAULT NULL,
  `numero_registro_mercantil` varchar(255) DEFAULT NULL,
  `otros_documentos_legales` varchar(255) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `tipo_sociedad` varchar(255) DEFAULT NULL,
  `tipo_usuario` varchar(255) DEFAULT NULL,
  `web` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_empresa`),
  UNIQUE KEY `UK_5rb03vgxkosi2p5kcvb3tb2y2` (`correo`),
  UNIQUE KEY `UK_tdtlvgv5tt6003wnalmdd5p4b` (`nombre`),
  UNIQUE KEY `UK_3rf8qweo0almrxcyrl4mlgq2l` (`telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contenido` mediumblob NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes_empresas`
--

DROP TABLE IF EXISTS `planes_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes_empresas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad_disponible` int NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `disponible` bit(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha_registro` varchar(255) DEFAULT NULL,
  `horario` varchar(50) NOT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `informacion_general` varchar(1000) DEFAULT NULL,
  `metodo_pago` varchar(255) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `precio` decimal(38,2) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `tipo_sitio` varchar(50) NOT NULL,
  `valoracion_promedio` double DEFAULT NULL,
  `id_empresa` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf7w955yse94phjqvsv47t9k8s` (`id_empresa`),
  CONSTRAINT `FKf7w955yse94phjqvsv47t9k8s` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes_empresas`
--

LOCK TABLES `planes_empresas` WRITE;
/*!40000 ALTER TABLE `planes_empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `planes_empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valoraciones`
--

DROP TABLE IF EXISTS `valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valoraciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cliente_id` bigint NOT NULL,
  `puntuacion` int NOT NULL,
  `plan_empresa_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcp332490q4txgxyw4g1dexr96` (`plan_empresa_id`),
  CONSTRAINT `FKcp332490q4txgxyw4g1dexr96` FOREIGN KEY (`plan_empresa_id`) REFERENCES `planes_empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoraciones`
--

LOCK TABLES `valoraciones` WRITE;
/*!40000 ALTER TABLE `valoraciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `valoraciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-11 18:21:13
