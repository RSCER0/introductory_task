-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: articles
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `authorship`
--

DROP TABLE IF EXISTS `authorship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorship` (
  `idauthor` int NOT NULL,
  `idpublication` int NOT NULL,
  PRIMARY KEY (`idauthor`,`idpublication`),
  KEY `publication` (`idpublication`),
  CONSTRAINT `publication` FOREIGN KEY (`idpublication`) REFERENCES `publication` (`idpublication`),
  CONSTRAINT `user` FOREIGN KEY (`idauthor`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorship`
--

LOCK TABLES `authorship` WRITE;
/*!40000 ALTER TABLE `authorship` DISABLE KEYS */;
INSERT INTO `authorship` VALUES (1,1),(2,1),(3,2),(1,3),(2,3),(2,4),(3,5);
/*!40000 ALTER TABLE `authorship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `idcomment` int NOT NULL,
  `text` varchar(512) DEFAULT NULL,
  `creation_date` varchar(45) DEFAULT NULL,
  `idpublication` int NOT NULL,
  `likes` int DEFAULT NULL,
  `iduser` int NOT NULL,
  PRIMARY KEY (`idcomment`),
  KEY `comment_publication` (`idpublication`),
  KEY `comment_user` (`iduser`),
  CONSTRAINT `comment_publication` FOREIGN KEY (`idpublication`) REFERENCES `publication` (`idpublication`),
  CONSTRAINT `comment_user` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Люблю бокс!!!','2 января',1,1,1),(2,'10 лет боксирую!!!','3 декабря ',1,2,2),(3,'Вчера смотрел биатлон.','1 сентября',2,3,3),(4,'Обожаю французскую кухню)','11 ноября',4,2,3);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication` (
  `idpublication` int NOT NULL,
  `header` varchar(128) DEFAULT NULL,
  `announcement_desc` varchar(250) DEFAULT NULL,
  `detailed_desc` varchar(2048) DEFAULT NULL,
  `publication_date` datetime DEFAULT NULL,
  `views` int DEFAULT NULL,
  `comments_num` int DEFAULT NULL,
  `likes` int DEFAULT NULL,
  `idtag` varchar(32) NOT NULL,
  PRIMARY KEY (`idpublication`),
  KEY `publication_tag` (`idtag`),
  CONSTRAINT `publication_tag` FOREIGN KEY (`idtag`) REFERENCES `tag` (`idtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication`
--

LOCK TABLES `publication` WRITE;
/*!40000 ALTER TABLE `publication` DISABLE KEYS */;
INSERT INTO `publication` VALUES (1,'БОКС КАК ВИД СПОРТА - ЧТО ТАКОЕ БОКС, ИСТОРИЯ И ПРАВИЛА БОКСА','Бокс – олимпийский контактный вид единоборств, где удары разрешены кулаками и исключительно в специальных пер...','Бокс – олимпийский контактный вид единоборств, где удары разрешены кулаками и исключительно в специальных перчатках. Бокс способствует разностороннему физическому развитию спортсмена, а также воспитанию моральных и волевых качеств, силы духа.','1994-05-30 00:00:00',1523,2,244,'box'),(2,'История биатлона','Первые упоминания о состязаниях, в которых можно найти сходством с современным биатлоном, датированы 1767 годом. Однако как вид спорта биатлон начал формироваться значительно по...','Первые упоминания о состязаниях, в которых можно найти сходством с современным биатлоном, датированы 1767 годом. Однако как вид спорта биатлон начал формироваться значительно позже, в начале 20 века. В 1924 году на Олимпийских играх в Шамони состоялись гонки патрулей – в них команды из четырех участников бежали дистанцию 25 км и стреляли по воздушным шарикам. Но эти соревнования по военному патрулированию рассматриваются, как отдельная дисциплина, а не биатлон. Гонки патрулей также были включены в программу Олимпиад как демонстрационный вид в 1928, 1936 и 1948 годах.','1996-04-25 00:00:00',1251,4,256,'biatlon'),(3,'Утонули в эпоху Семака. Рейтинг россиян, пострадавших в «Зените»','С приходом Семака в «Зенит» в мае 2018-го питерский клуб довольно быстро установил свою гегемонию в чемпионате России. Бело-голубые выигрывают РПЛ уже на протяжении пяти лет, и за это время Сергей Бог...','С приходом Семака в «Зенит» в мае 2018-го питерский клуб довольно быстро установил свою гегемонию в чемпионате России. Бело-голубые выигрывают РПЛ уже на протяжении пяти лет, и за это время Сергей Богданович закрепил за собой репутацию одного из лучших тренеров страны. Некоторые отечественные футболисты под его руководством заиграли совершенно по-другому, буквально реанимировав свою карьеру. Однако есть и те, кто при нем стали играть в разы хуже или же просто не сумели раскрыться. Представляем топ-7 россиян, провалившихся в «Зените» при Семаке.','1998-02-15 00:00:00',2341,3,774,'football'),(4,'Особенности и традиции французской кухни','Классическая французская кухня ведет свое начало от Короля Франциска I, правившего в 16 веке. В это время появилась так назы...','Классическая французская кухня ведет свое начало от Короля Франциска I, правившего в 16 веке. В это время появилась так называемая «буржуазная кухня», являющаяся нечто средним между кухней простого народа и «высшей кулинарией».','2002-11-23 00:00:00',276,7,23,'french_kitchen'),(5,'Русская кухня: традиции и история','История русской кухни насчитывает множество веков, в которых она претерпевала изменения под влиянием множества факторов. Сначала была единая славянская кухня, затем она разделилась на отде...','История русской кухни насчитывает множество веков, в которых она претерпевала изменения под влиянием множества факторов. Сначала была единая славянская кухня, затем она разделилась на отдельные региональные кухни, и, наконец, сформировалась как отдельное направление в кулинарии. Главными факторами, влияющими на формирование русской кухни, были географическое положение, климатические условия и доступность различных продуктов.','2003-04-22 00:00:00',462,4,75,'russian_kitchen');
/*!40000 ALTER TABLE `publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_subsection`
--

DROP TABLE IF EXISTS `publication_subsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_subsection` (
  `idsubsection` varchar(32) NOT NULL,
  `idpublication` int NOT NULL,
  PRIMARY KEY (`idsubsection`,`idpublication`),
  KEY `publication_to_subsection` (`idpublication`),
  CONSTRAINT `publication_to_subsection` FOREIGN KEY (`idpublication`) REFERENCES `publication` (`idpublication`),
  CONSTRAINT `subsection` FOREIGN KEY (`idsubsection`) REFERENCES `subsection` (`idsubsection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_subsection`
--

LOCK TABLES `publication_subsection` WRITE;
/*!40000 ALTER TABLE `publication_subsection` DISABLE KEYS */;
INSERT INTO `publication_subsection` VALUES ('sport',1),('sport',2),('sport',3),('cooking',4),('cooking',5);
/*!40000 ALTER TABLE `publication_subsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subsection`
--

DROP TABLE IF EXISTS `subsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subsection` (
  `idsubsection` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idsubsection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subsection`
--

LOCK TABLES `subsection` WRITE;
/*!40000 ALTER TABLE `subsection` DISABLE KEYS */;
INSERT INTO `subsection` VALUES ('cooking','Кулинария'),('sport','Спорт');
/*!40000 ALTER TABLE `subsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `idtag` varchar(32) NOT NULL,
  `tag_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`idtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES ('biatlon','биатлон'),('box','бокс'),('football','футбол'),('french_kitchen','французская кухня'),('russian_kitchen','русская  кухня');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Андрей','124451'),(2,'Виктор','h5h5235'),(3,'Роман','eh454j2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-11  1:10:55
