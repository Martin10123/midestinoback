-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: midestinobd
-- ------------------------------------------------------
-- Server version	8.0.44

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritos_compra_planes`
--

LOCK TABLES `carritos_compra_planes` WRITE;
/*!40000 ALTER TABLE `carritos_compra_planes` DISABLE KEYS */;
INSERT INTO `carritos_compra_planes` VALUES (1,1,_binary '\0',_binary '\0',320000.00,1,NULL,1);
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
  UNIQUE KEY `UK1c96wv36rk2hwui7qhjks3mvg` (`email`),
  UNIQUE KEY `UKqog5uums44mn8w95nqwdrr7gx` (`nombre_usuario`),
  UNIQUE KEY `UK2viccgf178bd74vfbq8ctsv8t` (`numero_documento`),
  UNIQUE KEY `UK9702p1ihfv5nh7gsywc0k75og` (`numero_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'cliente123','laura.gonzalez@gmail.com',NULL,'Laura Gonz√°lez','lauragonzalez','1020304051','3001112233',2500000.00,'CC','Cliente'),(2,'cliente123','sebastian.lopez@gmail.com',NULL,'Sebasti√°n L√≥pez','sebastianlo','1020304052','3002223344',1800000.00,'CC','Cliente'),(3,'cliente123','valeria.castillo@gmail.com',NULL,'Valeria Castillo','valeriac','1020304053','3003334455',3200000.00,'CC','Cliente'),(4,'cliente123','andres.martinez@gmail.com',NULL,'Andr√©s Mart√≠nez','andresm','1020304054','3004445566',2100000.00,'CC','Cliente'),(5,'cliente123','camila.ortiz@gmail.com',NULL,'Camila Ortiz','camilaortiz','1020304055','3005556677',2700000.00,'CC','Cliente'),(6,'admin123','admin@midestino.com',NULL,'Administrador General','admin_midestino','9000000000','3009998888',0.00,'CC','Administrador');
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
-- Table structure for table `compra_plan_ciudades`
--

DROP TABLE IF EXISTS `compra_plan_ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_plan_ciudades` (
  `compra_plan_id` bigint NOT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  KEY `FKgua4f4l017sl7cv0knsd9jlmw` (`compra_plan_id`),
  CONSTRAINT `FKgua4f4l017sl7cv0knsd9jlmw` FOREIGN KEY (`compra_plan_id`) REFERENCES `compra_planes` (`id_plan_guardado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_plan_ciudades`
--

LOCK TABLES `compra_plan_ciudades` WRITE;
/*!40000 ALTER TABLE `compra_plan_ciudades` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_plan_ciudades` ENABLE KEYS */;
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
  `personas_disponibles` int DEFAULT NULL,
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
  `confirmaci√≥n` bit(1) NOT NULL,
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
  UNIQUE KEY `UK5rb03vgxkosi2p5kcvb3tb2y2` (`correo`),
  UNIQUE KEY `UKtdtlvgv5tt6003wnalmdd5p4b` (`nombre`),
  UNIQUE KEY `UK3rf8qweo0almrxcyrl4mlgq2l` (`telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,NULL,NULL,NULL,'Cartagena',_binary '\0','caribe123','contacto@caribeaventuras.co','Cra 2 #5-45, Centro Hist√≥rico',_binary '',_binary '',_binary '','C√°mara de Comercio de Cartagena',NULL,NULL,'2010-05-12','2024-01-15',NULL,NULL,NULL,'901234567-1','Caribe Aventuras SAS','Valentina Herrera','Valentina Herrera',NULL,'1020304050','123456789',NULL,'Caribe Aventuras SAS','Turismo','3001234567','SAS','Empresa','https://caribeaventuras.co'),(2,NULL,NULL,NULL,'Medell√≠n',_binary '\0','andes321','hola@andestrekking.co','Calle 10 #43B-30',_binary '',_binary '',_binary '','C√°mara de Comercio de Medell√≠n',NULL,NULL,'2013-08-19','2024-02-10',NULL,NULL,NULL,'901987654-2','Andes Trekking Co','Juan Esteban R√≠os','Juan Esteban R√≠os',NULL,'1030507090','234567891',NULL,'Andes Trekking Co SAS','Turismo de aventura','3009876543','SAS','Empresa','https://andestrekking.co'),(3,NULL,NULL,NULL,'Bogot√°',_binary '\0','sabores2024','info@saboresurbanos.co','Carrera 7 #60-45',_binary '',_binary '',_binary '','C√°mara de Comercio de Bogot√°',NULL,NULL,'2015-03-22','2024-03-05',NULL,NULL,NULL,'900654321-7','Sabores Urbanos LTDA','Mariana Torres','Mariana Torres',NULL,'1012345678','345678912',NULL,'Sabores Urbanos LTDA','Gastronom√≠a y cultura','3115556677','LTDA','Empresa','https://saboresurbanos.co'),(4,NULL,NULL,NULL,'Buenaventura',_binary '\0','pacifico456','reservas@pacificodive.co','Malec√≥n Bah√≠a de M√°laga',_binary '',_binary '',_binary '','C√°mara de Comercio de Buenaventura',NULL,NULL,'2012-11-02','2024-02-28',NULL,NULL,NULL,'900112233-4','Pac√≠fico Dive Tours','Carlos Mina','Carlos Mina',NULL,'1045678901','456789123',NULL,'Pac√≠fico Dive Tours SAS','Turismo ecol√≥gico','3127788990','SAS','Empresa','https://pacificodive.co'),(5,NULL,NULL,NULL,'Villavicencio',_binary '\0','llanos789','experiencias@llanoseco.co','Km 5 V√≠a Restrepo',_binary '',_binary '',_binary '','C√°mara de Comercio de Villavicencio',NULL,NULL,'2016-06-30','2024-01-25',NULL,NULL,NULL,'901556677-8','Llanos Eco Travel','Jos√© David Barreto','Jos√© David Barreto',NULL,'1056789012','567891234',NULL,'Llanos Eco Travel SAS','Turismo natural','3108899001','SAS','Empresa','https://llanoseco.co'),(6,NULL,'','','Cartagena de indias',_binary '','1234567890','contacto@ejemplo.com','Torices',_binary '',_binary '',_binary '','cdsfdsfdsfds','','2025-11-04','2025-10-26','2025-10-26','ddasdffffg',NULL,0.00,'4535353','sdffdsfdsfdsdsf','','','','','3455435','','sdfdsfdfs','fsdfdsfdsfds','1234567890','dfsfdsfdsfds','Empresa','fsdsfdsfd');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
INSERT INTO `imagenes` VALUES (1,_binary 'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\Ã\0\0\0¿\0\0\0>|ª\0\0\0EPLTEc£Ú\rN£j¨˚Z¨\0BôQé\ﬁfßˆ\0Gû<w\«Iü/gπK†?{\ÃC\œ`†\ÔTí\·Zô\ËSß\'bµLà\ÿ5q\¬\0?ò2lΩ\…!$\0\0nIDATxúÌúânÑ ÜATDºP\Î˚?jq\€\›é\€7\Î\–¸_\“+iæ\Ãpå\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0<\ \Œ\∆Cîmım\€NE?t	eN£ı\«\'mÆ∑ü._•Sc=∑\”Pfgè˜.ôí`≠5^i\\öB0ˆyL\Ê¶\‰c\‘\◊|ëπ\nç=SùPôãêV<ubdºN>gèú NFJ£€é]pbe§Ù¡\·f/#çõ\Œ˝/\»¯©\”JµC2\“V¨lé\…HYug|„®åmü\ÿïë¶=[\·R\∆\Í\∆˛õ˛láîåùõ+’º(g/\'≤\›\–(6”Üí\…˚\Ï¢o\Áv}Ú˘lâ+§LÒ˚∑|Q6-ª:y\œd\r†eà¡ïe?+≥ìh©\…xQ\‘tp\ﬁ\Ë?x92^g®\»\–X&°	íÒ¡©\»L3<B&\„gŒ¨©–å)\ xGÖ∆±(<ÉeD˜F\Ÿ4B.ìUD¢Ò»≥p\—À≥U6\ŒAÖ\∆Mâ\ ÙTûUâ\ tjõh¶~—Ä\Ô%C\Ï5ñ\√S¡1\Â[+@îLøM3\Îúh¢dÜ\Ì§±í¡r\'3\«\Õ6Uôz+ch¢d∫y+cl4Oì\—\È\ l7öteà\”Y\¬iˆØdà\’,Ÿ•y˘O2ƒ¶…°†y\⁄q&’≥Y\ŸYñÏ©ô*R≠g»ï9\—J≥$\À\ÊôA\ÎV\‘çmñ±®\0¢d®-ì\√¸èëà\ ÃéØ\Z=\"\œïôîNf1oj∆∏\Õk\–3ó°^Z\«!0¡2\ŸH…òñ¡\¬.Cúó\◊»∞L†uˆ_ˇ†bò¿W\Á\‘Û2Û\ÍQ\Ô\“\‘\–8∫©!\Á∞˚Ø<\⁄n\“ï\⁄\Èp2ÍåÅS\Ï4ï7≤¨ÏÜ©™ù\ﬁk≤N2(≥^3˘§©ñzT\Œ\Ó˜ù\È\ÊládÛú˚˛ùı\"w:\ËÙ¬¶\›\Ïp[£VåZµ\ X\«f¬à\√}\Õû\…|qH\∆(V.ád\Ã\»)\«\ƒ´FsˇB¥åv\Ãn5àhµ\ÂO¢dlÆ&>[\Â12πcxEk%X∆ºπâ\—≈åÑ\…mñÅGUIÒ†\Ã\«\Õ5¨o7g\Œ\‹gµpN©∫Z\Ôi3ÕØO •æÀ≤\ÃM;É»òã\\(ˇ \À¯G\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ﬁm¸-6‹∑\È\0\0\0\0IENDÆB`Ç','download.png');
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
  `ciudad` varchar(50) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `disponible` bit(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha_registro` varchar(255) DEFAULT NULL,
  `horario` varchar(50) NOT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `informacion_general` varchar(1000) DEFAULT NULL,
  `metodo_pago` varchar(255) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `personas_disponibles` int NOT NULL,
  `precio` decimal(38,2) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `tipo_sitio` varchar(50) NOT NULL,
  `valoracion_promedio` double DEFAULT NULL,
  `id_empresa` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf7w955yse94phjqvsv47t9k8s` (`id_empresa`),
  CONSTRAINT `FKf7w955yse94phjqvsv47t9k8s` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes_empresas`
--

LOCK TABLES `planes_empresas` WRITE;
/*!40000 ALTER TABLE `planes_empresas` DISABLE KEYS */;
INSERT INTO `planes_empresas` VALUES (1,25,'Cartagena','Centro Hist√≥rico, Baluarte San Ignacio',_binary '','contacto@caribeaventuras.co','2025-01-10','08:00-12:00','https://images.unsplash.com/photo-1548783307-f63adc82c6c8?auto=format&fit=crop&w=800&q=80','Recorrido guiado por las murallas y fortalezas coloniales con degustaci√≥n de dulces t√≠picos.','Tarjeta, Efectivo, Transferencia','Exploraci√≥n Murallas de Cartagena',20,320000.00,'3101122233','Cultural',5,1),(2,40,'Cartagena','Salida desde la Torre del Reloj',_binary '','contacto@caribeaventuras.co','2025-01-15','17:00-21:00','https://images.unsplash.com/photo-1518459031867-a89b944bffe4?auto=format&fit=crop&w=800&q=80','Tour en chiva rumbera con m√∫sica en vivo, bebidas y parada en miradores al atardecer.','Efectivo, Tarjeta','Chiva Rumbera Sunset',35,280000.00,'3101122244','Aventura',4,1),(3,30,'Cartagena','Muelle La Bodeguita',_binary '','reservas@caribeaventuras.co','2025-01-20','07:00-16:00','https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=800&q=80','Excursi√≥n en lancha r√°pida con equipo de snorkel, gu√≠a biling√ºe y almuerzo t√≠pico.','Tarjeta, Transferencia','Snorkel en Islas del Rosario',20,450000.00,'3101122255','Aventura',0,1),(4,20,'Cartagena','Barrio Getseman√≠, Calle de la Sierpe',_binary '','sabores@caribeaventuras.co','2025-01-25','18:00-22:00','https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?auto=format&fit=crop&w=800&q=80','Degustaci√≥n de platos caribe√±os en restaurantes boutique con chef invitado.','Tarjeta, Efectivo','Tour Gastron√≥mico Caribe Fusi√≥n',16,360000.00,'3101122266','Gastron√≥mico',0,1),(5,18,'Cartagena','Reserva Natural Ci√©naga de la Virgen',_binary '','aventura@caribeaventuras.co','2025-01-30','19:00-22:00','https://images.unsplash.com/photo-1476610182048-b716b8518aae?auto=format&fit=crop&w=800&q=80','Remada nocturna para observar plancton bioluminiscente con gu√≠a experto.','Tarjeta, Transferencia','Kayak Nocturno en la Ci√©naga',12,310000.00,'3101122277','Aventura',0,1),(6,50,'Cartagena','Playa Blanca, Isla Bar√∫',_binary '','daypass@caribeaventuras.co','2025-02-02','08:00-18:00','https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80','Acceso a club de playa con men√∫ premium, camas balinesas y transporte exclusivo.','Tarjeta, Transferencia','Isla Bar√∫ Day Pass Deluxe',40,520000.00,'3101122288','Relax',0,1),(7,25,'Medell√≠n','Guatap√©, vereda El Pe√±ol',_binary '','hola@andestrekking.co','2025-02-05','06:00-17:00','https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=800&q=80','Ascenso guiado a la Piedra del Pe√±ol con navegaci√≥n en lago y almuerzo t√≠pico.','Tarjeta, Transferencia','Caminata Piedra del Pe√±ol 360¬∞',20,340000.00,'3202211334','Aventura',0,2),(8,20,'Medell√≠n','Finca El Aroma, Fredonia',_binary '','contacto@andestrekking.co','2025-02-08','07:00-18:00','https://images.unsplash.com/photo-1470770841072-f978cf4d019e?auto=format&fit=crop&w=800&q=80','Experiencia cafetera con tosti√≥n artesanal, canopy y degustaci√≥n gourmet.','Tarjeta, Efectivo','Ruta Caf√© y Aventura',16,390000.00,'3202211445','Cultural',0,2),(9,18,'Medell√≠n','Mirador San F√©lix',_binary '','vuelos@andestrekking.co','2025-02-12','09:00-15:00','https://images.unsplash.com/photo-1441974231531-c6227db76b6e?auto=format&fit=crop&w=800&q=80','Vuelo en t√°ndem con instructores certificados y cobertura fotogr√°fica.','Tarjeta, Efectivo','Parapente San F√©lix Pro',18,280000.00,'3202211556','Aventura',0,2),(10,15,'Medell√≠n','San Rafael, Antioquia',_binary '','aventura@andestrekking.co','2025-02-15','07:00-17:00','https://images.unsplash.com/photo-1526481280695-3c4691bc66f0?auto=format&fit=crop&w=800&q=80','Descenso por cascadas con cuerdas, equipo profesional y refrigerios.','Tarjeta, Transferencia','Ca√±oning Cascada Cristal',12,410000.00,'3202211667','Aventura',0,2),(11,30,'Medell√≠n','Santa Fe de Antioquia y Jard√≠n',_binary '','patrimonio@andestrekking.co','2025-02-20','06:00-20:00','https://images.unsplash.com/photo-1523419409543-0c1df022bdd1?auto=format&fit=crop&w=800&q=80','Visita guiada a pueblos coloniales con cata de dulces y fotograf√≠a profesional.','Tarjeta, Efectivo','Tour Pueblos Patrimonio',25,360000.00,'3202211778','Cultural',0,2),(12,20,'Medell√≠n','Parque Arv√≠, entrada Palos Verdes',_binary '','nocturno@andestrekking.co','2025-02-24','18:00-23:00','https://images.unsplash.com/photo-1476041800956-2c5c97736a02?auto=format&fit=crop&w=800&q=80','Recorrido interpretativo nocturno con observaci√≥n de luci√©rnagas y fogata.','Tarjeta, Transferencia','Senderismo Nocturno Arv√≠',18,260000.00,'3202211889','Aventura',0,2),(13,20,'Bogot√°','Plaza del Chorro de Quevedo',_binary '','info@saboresurbanos.co','2025-03-01','16:00-20:00','https://images.unsplash.com/photo-1514996937319-344454492b37?auto=format&fit=crop&w=800&q=80','Ruta por puestos tradicionales con historias locales y bebidas artesanales.','Tarjeta, Efectivo','Street Food La Candelaria',18,220000.00,'3136677881','Gastron√≥mico',0,3),(14,16,'Bogot√°','Zona Chapinero, Calle 64',_binary '','cerveza@saboresurbanos.co','2025-03-04','18:00-22:00','https://images.unsplash.com/photo-1523475472560-d2df97ec485c?auto=format&fit=crop&w=800&q=80','Degustaci√≥n guiada en microcervecer√≠as con maridaje de tapas bogotanas.','Tarjeta, Transferencia','Experiencia Cervecera Artesanal',14,240000.00,'3136677992','Gastron√≥mico',0,3),(15,18,'Bogot√°','Carrera 13 con Calle 53',_binary '','arte@saboresurbanos.co','2025-03-07','10:00-14:00','https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?auto=format&fit=crop&w=800&q=80','Tour guiado por murales y colectivos art√≠sticos con taller de stencil.','Tarjeta, Efectivo','Arte Urbano Chapinero',15,180000.00,'3136677003','Cultural',0,3),(16,22,'Bogot√°','Parque Sim√≥n Bol√≠var, zona lago',_binary '','picnic@saboresurbanos.co','2025-03-10','11:00-15:00','https://images.unsplash.com/photo-1499636136210-6f4ee915583e?auto=format&fit=crop&w=800&q=80','Montaje de picnic con chef personal, actividades recreativas y m√∫sica en vivo.','Tarjeta, Transferencia','Picnic Gourmet Sim√≥n Bol√≠var',20,260000.00,'3136677114','Relax',0,3),(17,14,'Bogot√°','Estudio Gastron√≥mico Zona G',_binary '','talleres@saboresurbanos.co','2025-03-14','15:00-18:00','https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=800&q=80','Clase pr√°ctica con chef invitado y recetario digital incluido.','Tarjeta, Transferencia','Taller Ceviche Nikkei',12,280000.00,'3136677225','Gastron√≥mico',0,3),(18,24,'Bogot√°','Restaurante Rooftop Centro',_binary '','reservas@saboresurbanos.co','2025-03-17','10:00-13:00','https://images.unsplash.com/photo-1540181940-32422a8dba0d?auto=format&fit=crop&w=800&q=80','Brunch tem√°tico con estaci√≥n de mimosas, m√∫sica en vivo y mercado artesanal.','Tarjeta, Efectivo','Brunch Fusi√≥n Dominguero',20,240000.00,'3136677336','Gastron√≥mico',0,3),(19,18,'Buenaventura','Bah√≠a de M√°laga, plataforma principal',_binary '','reservas@pacificodive.co','2025-03-20','07:00-15:00','https://images.unsplash.com/photo-1518834107812-67b0b7c58434?auto=format&fit=crop&w=800&q=80','Salida en bote con instructores PADI, equipos incluidos y registro fotogr√°fico.','Tarjeta, Transferencia','Buceo Avistamiento de Ballenas',12,620000.00,'3128899002','Aventura',0,4),(20,20,'Buenaventura','Comunidad La Barra, muelle principal',_binary '','info@pacificodive.co','2025-03-23','08:00-16:00','https://images.unsplash.com/photo-1526481280695-3c4691bc66f0?auto=format&fit=crop&w=800&q=80','Exploraci√≥n de manglares con gu√≠a comunitario y almuerzo afrodis√≠aco.','Tarjeta, Efectivo','Snorkel Manglares La Barra',16,380000.00,'3128899113','Aventura',0,4),(21,16,'Buenaventura','Centro de visitantes Bah√≠a de M√°laga',_binary '','aventura@pacificodive.co','2025-03-26','09:00-13:00','https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80','Recorrido en kayak por esteros y cuevas con interpretaci√≥n ambiental.','Tarjeta, Transferencia','Kayak Bah√≠a de M√°laga',12,290000.00,'3128899224','Aventura',0,4),(22,22,'Neiva','Reserva San Cipriano',_binary '','expediciones@pacificodive.co','2025-03-29','07:00-18:00','https://images.unsplash.com/photo-1470777630575-5fd2743d11d7?auto=format&fit=crop&w=800&q=80','Traves√≠a en brujitas, caminata ecol√≥gica y descenso en cascadas cristalinas.','Tarjeta, Transferencia','Expedici√≥n Cascadas Agua Clara',18,410000.00,'3128899335','Aventura',0,4),(23,15,'Neiva','Isla Juanchaco',_binary '','comunidad@pacificodive.co','2025-04-01','05:00-12:00','https://images.unsplash.com/photo-1526481280695-3c4691bc66f0?auto=format&fit=crop&w=800&q=80','Jornada de pesca tradicional con cocci√≥n del pescado y relatos locales.','Tarjeta, Efectivo','Pesca Artesanal Comunitaria',12,260000.00,'3128899446','Cultural',0,4),(24,24,'Cali','Malec√≥n de Buenaventura',_binary '','sabores@pacificodive.co','2025-04-04','12:00-16:00','https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?auto=format&fit=crop&w=800&q=80','Recorrido por cocinas tradicionales con m√∫sica del Pac√≠fico en vivo.','Tarjeta, Efectivo','Tour Gastron√≥mico Pac√≠fico',20,240000.00,'3128899557','Gastron√≥mico',0,4),(25,20,'Cali','Hato La Aurora',_binary '','experiencias@llanoseco.co','2025-04-07','05:00-13:00','https://images.unsplash.com/photo-1437957146754-f6377debe171?auto=format&fit=crop&w=800&q=80','Recorrido en camioneta 4x4 con avistamiento de fauna y desayuno t√≠pico.','Tarjeta, Transferencia','Safari Llanero Sunrise',16,450000.00,'3109900112','Aventura',0,5),(26,18,'Cali','Vereda Puerto L√≥pez',_binary '','cabalgatas@llanoseco.co','2025-04-10','08:00-17:00','https://images.unsplash.com/photo-1512302940121-5dda7724fd87?auto=format&fit=crop&w=800&q=80','Cabalgata guiada con almuerzo criollo y ba√±o en el r√≠o Meta.','Tarjeta, Efectivo','Cabalgata R√≠o Meta',15,320000.00,'3109900223','Aventura',0,5),(27,16,'Santa marta','Finca Altamira, Restrepo',_binary '','cacao@llanoseco.co','2025-04-13','09:00-16:00','https://images.unsplash.com/photo-1542528180-0d5174dac283?auto=format&fit=crop&w=800&q=80','Visita a cultivo de cacao fino, cata sensorial y elaboraci√≥n de bombones.','Tarjeta, Transferencia','Ruta del Cacao Experiencial',14,280000.00,'3109900334','Cultural',0,5),(28,12,'Santa marta','Mirador Piedra del Amor',_binary '','glamping@llanoseco.co','2025-04-17','15:00-11:00','https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=800&q=80','Alojamiento en domos geod√©sicos con cena gourmet y observaci√≥n astron√≥mica.','Tarjeta, Transferencia','Glamping Estrellas del Llano',10,580000.00,'3109900445','Relax',0,5),(29,20,'Barranquilla','Reserva Humedal Coroncoro',_binary '','aves@llanoseco.co','2025-04-20','06:00-12:00','https://images.unsplash.com/photo-1526662092594-e98c1e356d6b?auto=format&fit=crop&w=800&q=80','Caminata interpretativa con bi√≥logo y pr√©stamo de binoculares profesionales.','Tarjeta, Transferencia','Avistamiento Aves Humedales',16,260000.00,'3109900556','Aventura',0,5),(30,35,'Barranquilla','Hacienda El Ceibo',_binary '','parrando@llanoseco.co','2025-04-24','17:00-23:00','https://images.unsplash.com/photo-1471295253337-3ceaaedca402?auto=format&fit=crop&w=800&q=80','Jornada festiva con coleo demostrativo, baile joropo y buffet llanero.','Tarjeta, Efectivo','Parrando Llanero Tradicional',30,300000.00,'3109900667','Cultural',0,5),(31,24,'Tunja','Casa',_binary '\0','isaac@falso.com','2025-11-1','9:00 AM - 10:00 PM','http://localhost:9999/api/planes/1/imagen','ffsdfds','cualquier forma','aaaaaaaaa',44,566675.00,'1234567890','Fiesta',NULL,6);
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
  `comentario` text,
  `fecha` datetime(6) DEFAULT NULL,
  `puntuacion` int NOT NULL,
  `cliente_id` bigint NOT NULL,
  `plan_empresa_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrj0dfs2a17kjp9yuju483nwvu` (`cliente_id`),
  KEY `FKcp332490q4txgxyw4g1dexr96` (`plan_empresa_id`),
  CONSTRAINT `FKcp332490q4txgxyw4g1dexr96` FOREIGN KEY (`plan_empresa_id`) REFERENCES `planes_empresas` (`id`),
  CONSTRAINT `FKrj0dfs2a17kjp9yuju483nwvu` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoraciones`
--

LOCK TABLES `valoraciones` WRITE;
/*!40000 ALTER TABLE `valoraciones` DISABLE KEYS */;
INSERT INTO `valoraciones` VALUES (1,'dsffdsfdsfds','2025-11-01 09:22:17.480237',5,1,1),(2,'sdffdsfdssdf','2025-11-01 09:22:42.942606',4,1,2);
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

-- Dump completed on 2025-11-01  9:59:27
