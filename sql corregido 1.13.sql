-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fimacor
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `ambientes_aprendizaje`
--

DROP TABLE IF EXISTS `ambientes_aprendizaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ambientes_aprendizaje` (
  `idAmbientes_de_aprendizaje` int(11) NOT NULL,
  `descripcion_ambiente` varchar(45) NOT NULL,
  PRIMARY KEY (`idAmbientes_de_aprendizaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambientes_aprendizaje`
--

LOCK TABLES `ambientes_aprendizaje` WRITE;
/*!40000 ALTER TABLE `ambientes_aprendizaje` DISABLE KEYS */;
INSERT INTO `ambientes_aprendizaje` VALUES (1,'219'),(2,'CMTC'),(3,'218');
/*!40000 ALTER TABLE `ambientes_aprendizaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `idArea` int(11) NOT NULL,
  `nombre_area` varchar(100) NOT NULL,
  PRIMARY KEY (`idArea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'Area principal');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codigo_registro`
--

DROP TABLE IF EXISTS `codigo_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codigo_registro` (
  `idCodigoRegistro` int(11) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `Usuario_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idCodigoRegistro`,`correo`),
  KEY `fk_Codigo_Registro_Usuario1_idx` (`Usuario_idUsuario`),
  CONSTRAINT `fk_Codigo_Registro_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codigo_registro`
--

LOCK TABLES `codigo_registro` WRITE;
/*!40000 ALTER TABLE `codigo_registro` DISABLE KEYS */;
/*!40000 ALTER TABLE `codigo_registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentacion`
--

DROP TABLE IF EXISTS `documentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentacion` (
  `idReporte_mantenimientos` int(11) NOT NULL,
  `fecha_reporte` varchar(45) NOT NULL,
  `archivo_pdf` varchar(500) NOT NULL,
  `firma_digital` varchar(45) NOT NULL,
  `Mantenimiento_idMantenimiento` int(11) NOT NULL,
  PRIMARY KEY (`idReporte_mantenimientos`),
  KEY `fk_Reporte_mantenimientos_Mantenimiento1_idx` (`Mantenimiento_idMantenimiento`),
  CONSTRAINT `fk_Reporte_mantenimientos_Mantenimiento1` FOREIGN KEY (`Mantenimiento_idMantenimiento`) REFERENCES `mantenimiento` (`idMantenimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentacion`
--

LOCK TABLES `documentacion` WRITE;
/*!40000 ALTER TABLE `documentacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento_identidad`
--

DROP TABLE IF EXISTS `documento_identidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento_identidad` (
  `idDocumento_Identidad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_Documento` varchar(45) NOT NULL,
  `numero_documento` varchar(45) NOT NULL,
  PRIMARY KEY (`idDocumento_Identidad`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento_identidad`
--

LOCK TABLES `documento_identidad` WRITE;
/*!40000 ALTER TABLE `documento_identidad` DISABLE KEYS */;
INSERT INTO `documento_identidad` VALUES (1,'CC','1064789839'),(2,'CC','1064789838'),(3,'CC','1064789834'),(4,'CC','1064789837'),(5,'CC','1064789832'),(6,'CC','1064789830'),(7,'CC','1064789830'),(8,'CC','39796698');
/*!40000 ALTER TABLE `documento_identidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_de_maquina`
--

DROP TABLE IF EXISTS `estado_de_maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_de_maquina` (
  `idEstado_de_Maquina` int(11) NOT NULL,
  `nombre_tipo` varchar(45) NOT NULL,
  `descripcion_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idEstado_de_Maquina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_de_maquina`
--

LOCK TABLES `estado_de_maquina` WRITE;
/*!40000 ALTER TABLE `estado_de_maquina` DISABLE KEYS */;
INSERT INTO `estado_de_maquina` VALUES (1,'MANTENIMIENTO',''),(2,'FUNCIONAL','FUNCIONAL'),(3,'FUERA DE SERVICIO','FUERA DE SERVICIO');
/*!40000 ALTER TABLE `estado_de_maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_maquina`
--

DROP TABLE IF EXISTS `ficha_maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_maquina` (
  `idMaquinas` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_sena` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `Modelo_idModelo` int(11) DEFAULT NULL,
  `Estado_de_Maquina_idEstado_de_Maquina` int(11) NOT NULL,
  `Tipo_Maquina_idTipo_Maquina` int(11) NOT NULL,
  `Reubicacion_Maquina_idRehubicacion_Maquina` int(11) DEFAULT NULL,
  `Ubicacion_Maquina_idUbicacion_Maquina` int(11) NOT NULL,
  `Ambientes_Aprendizaje_idAmbientes_de_aprendizaje` int(11) NOT NULL,
  `Sede_idSede` int(11) NOT NULL DEFAULT 1,
  `area` varchar(100) DEFAULT NULL,
  `Marca_idMarca` int(11) NOT NULL,
  PRIMARY KEY (`idMaquinas`),
  UNIQUE KEY `uk_ficha_maquina_codigo_sena` (`codigo_sena`),
  KEY `fk_Ficha_Maquina_Estado_de_Maquina1_idx` (`Estado_de_Maquina_idEstado_de_Maquina`),
  KEY `fk_Ficha_Maquina_Tipo_Maquina1_idx` (`Tipo_Maquina_idTipo_Maquina`),
  KEY `fk_Ficha_Maquina_Reubicacion_Maquina1_idx` (`Reubicacion_Maquina_idRehubicacion_Maquina`),
  KEY `fk_Ficha_Maquina_Ubicacion_Maquina1_idx` (`Ubicacion_Maquina_idUbicacion_Maquina`),
  KEY `fk_Ficha_Maquina_Ambientes_Aprendizaje1_idx` (`Ambientes_Aprendizaje_idAmbientes_de_aprendizaje`),
  KEY `fk_Ficha_Maquina_Marca1_idx` (`Marca_idMarca`),
  KEY `fk_ficha_maquina_modelo_idx` (`Modelo_idModelo`),
  KEY `fk_Ficha_Maquina_Sede1_idx` (`Sede_idSede`),
  CONSTRAINT `fk_Ficha_Maquina_Ambientes_Aprendizaje1` FOREIGN KEY (`Ambientes_Aprendizaje_idAmbientes_de_aprendizaje`) REFERENCES `ambientes_aprendizaje` (`idAmbientes_de_aprendizaje`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Maquina_Estado_de_Maquina1` FOREIGN KEY (`Estado_de_Maquina_idEstado_de_Maquina`) REFERENCES `estado_de_maquina` (`idEstado_de_Maquina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Maquina_Marca1` FOREIGN KEY (`Marca_idMarca`) REFERENCES `marca` (`idMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Maquina_Reubicacion_Maquina1` FOREIGN KEY (`Reubicacion_Maquina_idRehubicacion_Maquina`) REFERENCES `reubicacion_maquina` (`idRehubicacion_Maquina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Maquina_Sede1` FOREIGN KEY (`Sede_idSede`) REFERENCES `sede` (`idSede`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Maquina_Tipo_Maquina1` FOREIGN KEY (`Tipo_Maquina_idTipo_Maquina`) REFERENCES `tipo_maquina` (`idTipo_Maquina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Maquina_Ubicacion_Maquina1` FOREIGN KEY (`Ubicacion_Maquina_idUbicacion_Maquina`) REFERENCES `ubicacion_maquina` (`idUbicacion_Maquina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_maquina`
--

LOCK TABLES `ficha_maquina` WRITE;
/*!40000 ALTER TABLE `ficha_maquina` DISABLE KEYS */;
INSERT INTO `ficha_maquina` VALUES (1,'SENA-0001','MAQUINA',1,2,2,1,1,3,1,NULL,2),(2,'002','maquina',2,2,1,2,2,2,1,NULL,1),(3,'1','maquina',3,2,1,NULL,1,2,1,NULL,1),(4,'00006','maquina',4,2,1,3,3,1,1,NULL,1),(5,'92125475','MOTOR AHORRADOR, 4 AGUAS',5,2,3,NULL,1,2,1,NULL,1),(6,'92124712','FILETEADORA, 5 AGUJAS, MOTOR AHORRADOR',6,2,2,NULL,1,2,1,NULL,1),(7,'92123043','MOTOR AHORRADOR, 2 AGUAS',7,2,8,NULL,1,2,1,NULL,1),(8,'9212684','MOTOR AHORRADOR, 2 AGUAS',8,2,8,NULL,1,2,1,NULL,1),(9,'92122350','MOTOR AHORRADOR, 2 AGUAS',9,2,8,NULL,1,2,1,NULL,1),(10,'92126517','MOTOR AHORRADOR, 2 AGUAS',10,2,8,NULL,1,2,1,NULL,1);
/*!40000 ALTER TABLE `ficha_maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_mantenimiento`
--

DROP TABLE IF EXISTS `historial_mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_mantenimiento` (
  `idHistorial_Mantenimiento` int(11) NOT NULL,
  `tipo_maquina` varchar(45) NOT NULL,
  `fecha_inicio` varchar(45) NOT NULL,
  `fecha_final` varchar(45) NOT NULL,
  `tecnico_encargado` varchar(45) NOT NULL,
  `descripcion_accion` varchar(1200) NOT NULL,
  `Ficha_Maquina_idMaquinas` int(11) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idHistorial_Mantenimiento`),
  KEY `fk_Historial_Mantenimiento_Ficha_Maquina1_idx` (`Ficha_Maquina_idMaquinas`),
  KEY `fk_Historial_Mantenimiento_Usuario1_idx` (`Usuario_idUsuario`),
  CONSTRAINT `fk_Historial_Mantenimiento_Ficha_Maquina1` FOREIGN KEY (`Ficha_Maquina_idMaquinas`) REFERENCES `ficha_maquina` (`idMaquinas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Historial_Mantenimiento_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_mantenimiento`
--

LOCK TABLES `historial_mantenimiento` WRITE;
/*!40000 ALTER TABLE `historial_mantenimiento` DISABLE KEYS */;
INSERT INTO `historial_mantenimiento` VALUES (1,'MAQUINA','2026-06-18','2026-06-18','Yilder Rodriguez','ESTADO: REPARADO',1,4),(2,'MAQUINA','2026-06-23 18:49:33','2026-06-23 20:22:22','Yilder Rodriguez','ESTADO: ASIGNADO | Tipo mantenimiento: CORRECTIVO | Asignado por: Usuario del sistema | Tecnico asignado: Yilder Rodriguez | Fecha asignacion: 2026-06-23 18:49:33 | Fecha programada: 2026-06-23 | Proximo mantenimiento: 2026-07-23 | Frecuencia: mensual | Tareas: ajuste | Confirmacion tecnica: pendiente | ESTADO: REPARADO | Reparado por: Yilder Rodriguez | Fecha reparaciÃ³n: 2026-06-23 20:22:22 | ObservaciÃ³n tÃ©cnica: reparada',1,4);
/*!40000 ALTER TABLE `historial_mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimiento`
--

DROP TABLE IF EXISTS `mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantenimiento` (
  `idMantenimiento` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_mantenimiento` date NOT NULL,
  `fecha_proximo_mantenimiento` date NOT NULL,
  `descripcion_Mantenimiento` varchar(90) NOT NULL,
  `frecuencia` varchar(45) NOT NULL,
  `tareas` varchar(255) NOT NULL,
  `Tipo_Manteniento_idTipo_Manteniento` int(11) NOT NULL,
  `Ficha_Maquina_idMaquinas` int(11) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idMantenimiento`),
  KEY `fk_Mantenimiento_Tipo_Manteniento1_idx` (`Tipo_Manteniento_idTipo_Manteniento`),
  KEY `fk_Mantenimiento_Ficha_Maquina1_idx` (`Ficha_Maquina_idMaquinas`),
  CONSTRAINT `fk_Mantenimiento_Ficha_Maquina1` FOREIGN KEY (`Ficha_Maquina_idMaquinas`) REFERENCES `ficha_maquina` (`idMaquinas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mantenimiento_Tipo_Manteniento1` FOREIGN KEY (`Tipo_Manteniento_idTipo_Manteniento`) REFERENCES `tipo_manteniento` (`idTipo_Manteniento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimiento`
--

LOCK TABLES `mantenimiento` WRITE;
/*!40000 ALTER TABLE `mantenimiento` DISABLE KEYS */;
INSERT INTO `mantenimiento` VALUES (1,'2026-06-18','2026-07-18','Asignado a Yilder Rodriguez','mensual','Revision preventiva general',1,1,4),(2,'2026-06-18','2026-07-18','Asignado a Yilder Rodriguez','mensual','Revision preventiva general',1,1,4),(3,'2026-06-23','2026-07-23','CORRECTIVO | Asignado a Yilder Rodriguez','mensual','ajuste',2,1,4);
/*!40000 ALTER TABLE `mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manuales`
--

DROP TABLE IF EXISTS `manuales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manuales` (
  `idManuales` int(11) NOT NULL,
  `nombre_del_manual` varchar(45) NOT NULL,
  `descripcion_manual` varchar(45) NOT NULL,
  `fecha_subida` date NOT NULL,
  `fuente_manual` varchar(10) NOT NULL DEFAULT 'archivo',
  `ruta_manual` varchar(500) DEFAULT NULL,
  `Tipos_Manuales_idTipos_Manuales` int(11) NOT NULL,
  `Ficha_Maquina_idMaquinas` int(11) NOT NULL,
  PRIMARY KEY (`idManuales`),
  KEY `fk_Manuales_Tipos_Manuales1_idx` (`Tipos_Manuales_idTipos_Manuales`),
  KEY `fk_Manuales_Ficha_Maquina1_idx` (`Ficha_Maquina_idMaquinas`),
  CONSTRAINT `fk_Manuales_Ficha_Maquina1` FOREIGN KEY (`Ficha_Maquina_idMaquinas`) REFERENCES `ficha_maquina` (`idMaquinas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Manuales_Tipos_Manuales1` FOREIGN KEY (`Tipos_Manuales_idTipos_Manuales`) REFERENCES `tipos_manuales` (`idTipos_Manuales`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manuales`
--

LOCK TABLES `manuales` WRITE;
/*!40000 ALTER TABLE `manuales` DISABLE KEYS */;
INSERT INTO `manuales` VALUES (1,'manual_1.pdf','maquina','2026-06-18','archivo','manual_1.pdf',1,1),(2,'manual_2.pdf','tecnico','2026-06-18','archivo','manual_2.pdf',1,1),(3,'https://www.manualslib.es/brand/juki/maquinas','dsadsadas','2026-06-23','link','https://www.manualslib.es/brand/juki/maquinas-de-coser.html',2,2),(4,'manual_4.pdf','asdsa','2026-06-23','archivo','manual_4.pdf',3,4);
/*!40000 ALTER TABLE `manuales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_marca` varchar(45) NOT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'CCV3'),(2,'CCV4'),(3,'CCV3');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `idModelo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_modelo` varchar(45) NOT NULL,
  `Marca_idMarca` int(11) NOT NULL,
  PRIMARY KEY (`idModelo`),
  KEY `fk_Modelo_Marca1_idx` (`Marca_idMarca`),
  CONSTRAINT `fk_Modelo_Marca1` FOREIGN KEY (`Marca_idMarca`) REFERENCES `marca` (`idMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'CCV90',2),(2,'ccv3',1),(3,'ccv4',1),(4,'ccv8',1),(5,'HF 008',1),(6,'SIRUBA SERIE 516M2-35',1),(7,'MODELO:30 KM 250 BL',1),(8,'MODELO:GC6220B',1),(9,'SIRUBA - T 828- 72- 064',1),(10,'MODELO KM 1791 BL',1);
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones_configuracion`
--

DROP TABLE IF EXISTS `notificaciones_configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones_configuracion` (
  `id_notificacion` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(120) NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  `enlace` varchar(180) NOT NULL,
  `tipo` varchar(20) NOT NULL DEFAULT 'admin',
  `icono` varchar(6) NOT NULL DEFAULT 'A',
  `creado_por` varchar(120) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_notificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones_configuracion`
--

LOCK TABLES `notificaciones_configuracion` WRITE;
/*!40000 ALTER TABLE `notificaciones_configuracion` DISABLE KEYS */;
INSERT INTO `notificaciones_configuracion` VALUES (1,'Configuracion actualizada','El administrador Daniel Ospino agrego datos en Mantenimientos.','/FIMACOR/Configuracion.jsp?catalogo=tipo-mantenimiento','admin','A','Daniel Ospino','2026-06-23 22:44:47'),(2,'Configuracion actualizada','El administrador Daniel Ospino actualizo datos en Mantenimientos.','/FIMACOR/Configuracion.jsp?catalogo=tipo-mantenimiento','admin','A','Daniel Ospino','2026-06-23 22:44:47'),(3,'Configuracion actualizada','El administrador Daniel Ospino elimino datos en Mantenimientos.','/FIMACOR/Configuracion.jsp?catalogo=tipo-mantenimiento','admin','A','Daniel Ospino','2026-06-23 22:44:47');
/*!40000 ALTER TABLE `notificaciones_configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `novedades`
--

DROP TABLE IF EXISTS `novedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `novedades` (
  `idnovedades` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_novedad` date NOT NULL,
  `hora_novedad` time NOT NULL,
  `centro_formacion` varchar(100) NOT NULL,
  `aula` varchar(100) NOT NULL,
  `tipo_falla` varchar(45) NOT NULL,
  `descripcion_novedad` varchar(255) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Ficha_Maquina_idMaquinas` int(11) NOT NULL,
  PRIMARY KEY (`idnovedades`),
  KEY `fk_novedades_Usuario1_idx` (`Usuario_idUsuario`),
  KEY `fk_novedades_Ficha_Maquina1_idx` (`Ficha_Maquina_idMaquinas`),
  CONSTRAINT `fk_novedades_Ficha_Maquina1` FOREIGN KEY (`Ficha_Maquina_idMaquinas`) REFERENCES `ficha_maquina` (`idMaquinas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_novedades_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `novedades`
--

LOCK TABLES `novedades` WRITE;
/*!40000 ALTER TABLE `novedades` DISABLE KEYS */;
/*!40000 ALTER TABLE `novedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `idPermiso` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_permiso` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idPermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (1,'usuarios.ver','Ver usuarios'),(2,'usuarios.crear','Crear usuarios'),(3,'usuarios.editar','Editar usuarios'),(4,'usuarios.eliminar','Eliminar usuarios'),(5,'roles.gestionar','Gestionar roles'),(6,'permisos.gestionar','Gestionar permisos'),(7,'maquinas.ver','Ver maquinas'),(8,'maquinas.crear','Crear maquinas'),(9,'maquinas.editar','Editar maquinas'),(10,'maquinas.eliminar','Eliminar maquinas'),(11,'maquinas.reubicar','Reubicar maquinas'),(12,'mantenimiento.ver','Ver mantenimiento'),(13,'mantenimiento.gestionar','Gestionar mantenimiento'),(14,'mantenimiento.programar','Programar mantenimiento'),(15,'mantenimiento.confirmar','Confirmar reparaciones'),(16,'mantenimiento.historial','Ver historial mantenimiento'),(17,'manuales.ver','Ver manuales'),(18,'manuales.subir','Subir manuales'),(19,'manuales.editar','Editar manuales'),(20,'manuales.eliminar','Eliminar manuales'),(21,'novedades.ver','Ver novedades'),(22,'novedades.reportar','Reportar novedades'),(23,'reubicacion.ver','Ver reubicaciones'),(24,'reubicacion.registrar','Registrar reubicaciones'),(25,'reparacion.ver','Ver reparaciones'),(26,'reparacion.reparar','Registrar reparaciones'),(27,'configuracion.ver','Ver configuracion'),(28,'configuracion.gestionar','Gestionar configuracion'),(29,'reportes.ver','Ver reportes'),(30,'perfil.ver','Ver perfil'),(31,'perfil.editar','Editar perfil');
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programacion_mantenimiento`
--

DROP TABLE IF EXISTS `programacion_mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programacion_mantenimiento` (
  `idProgramacion_mantenimiento` int(11) NOT NULL,
  `tipo_maquina` varchar(45) NOT NULL,
  `fecha_programacion` datetime NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `novedades_idnovedades` int(11) NOT NULL,
  `Ambientes_Aprendizaje_idAmbientes_de_aprendizaje` int(11) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idProgramacion_mantenimiento`),
  KEY `fk_Programacion_mantenimiento_novedades1_idx` (`novedades_idnovedades`),
  KEY `fk_Programacion_mantenimiento_Ambientes_Aprendizaje1_idx` (`Ambientes_Aprendizaje_idAmbientes_de_aprendizaje`),
  KEY `fk_Programacion_mantenimiento_Usuario1_idx` (`Usuario_idUsuario`),
  CONSTRAINT `fk_Programacion_mantenimiento_Ambientes_Aprendizaje1` FOREIGN KEY (`Ambientes_Aprendizaje_idAmbientes_de_aprendizaje`) REFERENCES `ambientes_aprendizaje` (`idAmbientes_de_aprendizaje`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Programacion_mantenimiento_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Programacion_mantenimiento_novedades1` FOREIGN KEY (`novedades_idnovedades`) REFERENCES `novedades` (`idnovedades`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programacion_mantenimiento`
--

LOCK TABLES `programacion_mantenimiento` WRITE;
/*!40000 ALTER TABLE `programacion_mantenimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `programacion_mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_asistencia`
--

DROP TABLE IF EXISTS `registro_asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_asistencia` (
  `idRegistro_Asistencia` int(11) NOT NULL,
  `descripcion_registro` varchar(45) NOT NULL,
  `Ambientes_Aprendizaje_idAmbientes de aprendizaje` int(11) NOT NULL,
  PRIMARY KEY (`idRegistro_Asistencia`),
  KEY `fk_Registro_Asistencia_Ambientes_Aprendizaje1_idx` (`Ambientes_Aprendizaje_idAmbientes de aprendizaje`),
  CONSTRAINT `fk_Registro_Asistencia_Ambientes_Aprendizaje1` FOREIGN KEY (`Ambientes_Aprendizaje_idAmbientes de aprendizaje`) REFERENCES `ambientes_aprendizaje` (`idAmbientes_de_aprendizaje`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_asistencia`
--

LOCK TABLES `registro_asistencia` WRITE;
/*!40000 ALTER TABLE `registro_asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reubicacion_maquina`
--

DROP TABLE IF EXISTS `reubicacion_maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reubicacion_maquina` (
  `idRehubicacion_Maquina` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(45) NOT NULL,
  `ambiente` varchar(45) NOT NULL,
  `destino` varchar(45) NOT NULL,
  `autorizado_por` varchar(45) NOT NULL,
  `autorizacion` varchar(45) NOT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  `evidencia` varchar(500) NOT NULL,
  `descripcion_rehubicacion` varchar(45) NOT NULL,
  PRIMARY KEY (`idRehubicacion_Maquina`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reubicacion_maquina`
--

LOCK TABLES `reubicacion_maquina` WRITE;
/*!40000 ALTER TABLE `reubicacion_maquina` DISABLE KEYS */;
INSERT INTO `reubicacion_maquina` VALUES (1,'2026-11-12','206','219','Administrador','Autorizacion inicial','Registro inicial','','MALA '),(2,'2026-06-23','219','209','gukkesa','saaas','asasa','Evidencias/Reubicaciones/reubicacion_1782229221166.pdf','asasa'),(3,'2026-06-23','219','209','sdadsa','adsadas','sadas','Evidencias/Reubicaciones/reubicacion_1782249305751.pdf','dasdas');
/*!40000 ALTER TABLE `reubicacion_maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_rol` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Aprendiz'),(3,'Instructor'),(4,'Logistica'),(5,'Tecnico');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_permiso`
--

DROP TABLE IF EXISTS `rol_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_permiso` (
  `idRol_Permiso` int(11) NOT NULL AUTO_INCREMENT,
  `Permiso_idPermiso` int(11) NOT NULL,
  `Rol_idRol` int(11) NOT NULL,
  PRIMARY KEY (`idRol_Permiso`),
  UNIQUE KEY `uk_rol_permiso` (`Rol_idRol`,`Permiso_idPermiso`),
  KEY `fk_Rol_Permiso_Permiso1_idx` (`Permiso_idPermiso`),
  KEY `fk_Rol_Permiso_Rol1_idx` (`Rol_idRol`),
  CONSTRAINT `fk_Rol_Permiso_Permiso1` FOREIGN KEY (`Permiso_idPermiso`) REFERENCES `permiso` (`idPermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rol_Permiso_Rol1` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_permiso`
--

LOCK TABLES `rol_permiso` WRITE;
/*!40000 ALTER TABLE `rol_permiso` DISABLE KEYS */;
INSERT INTO `rol_permiso` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1),(23,23,1),(24,24,1),(25,25,1),(26,26,1),(27,27,1),(28,28,1),(29,29,1),(30,30,1),(31,31,1),(32,7,2),(33,17,2),(34,22,2),(35,30,2),(39,7,3),(40,12,3),(41,14,3),(42,17,3),(43,21,3),(44,22,3),(45,30,3),(46,7,4),(47,8,4),(48,9,4),(49,11,4),(50,12,4),(51,13,4),(52,14,4),(53,16,4),(54,17,4),(55,18,4),(56,19,4),(57,21,4),(58,23,4),(59,24,4),(60,25,4),(61,27,4),(62,28,4),(63,29,4),(64,30,4),(77,7,5),(78,12,5),(79,13,5),(80,15,5),(81,16,5),(82,17,5),(83,21,5),(84,25,5),(85,26,5),(86,30,5);
/*!40000 ALTER TABLE `rol_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `idSede` int(11) NOT NULL,
  `nombre_sede` varchar(100) NOT NULL,
  PRIMARY KEY (`idSede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,'Sede principal');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_manteniento`
--

DROP TABLE IF EXISTS `tipo_manteniento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_manteniento` (
  `idTipo_Manteniento` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_matenimiento` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipo_Manteniento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_manteniento`
--

LOCK TABLES `tipo_manteniento` WRITE;
/*!40000 ALTER TABLE `tipo_manteniento` DISABLE KEYS */;
INSERT INTO `tipo_manteniento` VALUES (1,'Preventivo'),(2,'CORRECTIVO'),(3,'PREDICTIVO');
/*!40000 ALTER TABLE `tipo_manteniento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_maquina`
--

DROP TABLE IF EXISTS `tipo_maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_maquina` (
  `idTipo_Maquina` int(11) NOT NULL,
  `descripcion_maquina` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipo_Maquina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_maquina`
--

LOCK TABLES `tipo_maquina` WRITE;
/*!40000 ALTER TABLE `tipo_maquina` DISABLE KEYS */;
INSERT INTO `tipo_maquina` VALUES (1,'JUKI'),(2,'FILETEADORA');
/*!40000 ALTER TABLE `tipo_maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_manuales`
--

DROP TABLE IF EXISTS `tipos_manuales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_manuales` (
  `idTipos_Manuales` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_manual` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipos_Manuales`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_manuales`
--

LOCK TABLES `tipos_manuales` WRITE;
/*!40000 ALTER TABLE `tipos_manuales` DISABLE KEYS */;
INSERT INTO `tipos_manuales` VALUES (1,'PREVENTIVO '),(2,'CORRECTIVO'),(3,'GENERAL');
/*!40000 ALTER TABLE `tipos_manuales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion_maquina`
--

DROP TABLE IF EXISTS `ubicacion_maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion_maquina` (
  `idUbicacion_Maquina` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(45) NOT NULL,
  `Ambiente` varchar(45) NOT NULL,
  PRIMARY KEY (`idUbicacion_Maquina`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion_maquina`
--

LOCK TABLES `ubicacion_maquina` WRITE;
/*!40000 ALTER TABLE `ubicacion_maquina` DISABLE KEYS */;
INSERT INTO `ubicacion_maquina` VALUES (1,'2006-11-12','219'),(2,'2026-06-23','209'),(3,'2026-06-23','209');
/*!40000 ALTER TABLE `ubicacion_maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `documento_identidad` varchar(45) NOT NULL,
  `numero_telefono` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contrasena_usuario` varchar(45) NOT NULL,
  `fecha_expiracion` datetime NOT NULL,
  `Rol_idRol` int(11) NOT NULL,
  `Documento_Identidad_idDocumento_Identidad` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `idUsuario_UNIQUE` (`idUsuario`),
  KEY `fk_Usuario_Rol1_idx` (`Rol_idRol`),
  KEY `fk_Usuario_Documento_Identidad1_idx` (`Documento_Identidad_idDocumento_Identidad`),
  CONSTRAINT `fk_Usuario_Documento_Identidad1` FOREIGN KEY (`Documento_Identidad_idDocumento_Identidad`) REFERENCES `documento_identidad` (`idDocumento_Identidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Rol1` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Daniel','Ospino','1064789839','3145877548','felipeospinoacosta@gmail.com','793.Costa','2027-06-18 00:00:00',1,1),(2,'Duvan ','Ospino','1064789838','3145877549','elmagister777@gmail.com','793.Costa','2027-06-18 00:00:00',3,2),(3,'Duvano','Ospino','1064789834','3145877544','manfreospino@gmail.com','793.Costa','2027-06-18 00:00:00',4,3),(4,'Yilder','Rodriguez','1064789837','3145877547','critianfelipematurana404@gmail.com','793.Costa','2027-06-18 00:00:00',5,4),(5,'Cristian','Rodriguez','1064789832','3145877542','sol872498@gmail.com','793.Costa','2027-06-18 00:00:00',5,5),(7,'Yilder','Prueba','1064789830','3145877540','yilderrodriguez08@gmail.com','Sena2025.','2027-06-18 00:00:00',2,7),(8,'Maria','Jimenez','39796698','3143639067','elizabethjimenez18@gmail.com','Mei6698*','2027-06-24 00:00:00',1,8);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-29 15:48:12
