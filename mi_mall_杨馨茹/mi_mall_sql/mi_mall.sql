-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: mi_mall
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(45) DEFAULT NULL,
  `path` text,
  `price` varchar(45) DEFAULT NULL,
  `num` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_main`
--

DROP TABLE IF EXISTS `page_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idx` varchar(45) DEFAULT NULL,
  `section` varchar(45) DEFAULT NULL,
  `path` text,
  `title` text,
  `desc` text,
  `disc_price` varchar(45) DEFAULT NULL,
  `origi_price` varchar(45) DEFAULT NULL,
  `flag` varchar(45) DEFAULT NULL,
  `isSale` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `width` varchar(45) DEFAULT NULL,
  `height` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_main`
--

LOCK TABLES `page_main` WRITE;
/*!40000 ALTER TABLE `page_main` DISABLE KEYS */;
INSERT INTO `page_main` VALUES (1,'0','手机','2c16238f786e4f93bdb175d7bf21aa47.webp','Redmi K30','120Hz流速屏，全速热爱','','1599','',NULL,'product',NULL,NULL),(2,'0','手机','53641901fbc28cbcdb495b17fdf69e46.webp',' Redmi K30 5G','双模5G，120Hz流速屏','','1999',NULL,NULL,'product',NULL,NULL),(3,'0','手机','07270cc09689eb9b13b29aa9f6bc41eb.webp','小米CC9 Pro','1亿像素 五摄四闪','','2799',NULL,NULL,'product',NULL,NULL),(4,'0','手机','ca9b4f81af709935556bef9aa21a90e8.webp','小米9 Pro 5G','5G双卡全网通，骁龙855Plus','','3699',NULL,NULL,'product',NULL,NULL),(5,'0','手机','d295c4fb500d163a7045dc715b47f808.webp','Redmi 8','5000mAh超长续航','699','799',NULL,'true','product',NULL,NULL),(6,'0','手机','c924c3f3436b6934495fd98f159ee3f7.webp','Redmi 8A','5000mAh超长续航','','699',NULL,NULL,'product',NULL,NULL),(7,'0','手机','6f2493e6c6fe8e2485c407e5d75e3651.webp','Redmi Note 8 Pro','6400万全场景四摄','1299','1399',NULL,'true','product',NULL,NULL),(8,'0','手机','4c87947d104ee5833913e4c520108f16.webp','Redmi Note 8','千元4800万四摄','','999',NULL,NULL,'product',NULL,NULL),(9,'0','手机','6ef3215af052c970f5c9fe0ac4c2fe26.jpg','小米MIX 3 全网通版 8GB+128GB 黑色','DxO百分拍照手机','2399','3599',NULL,'true','product',NULL,NULL),(10,'0','手机','pms_1574763047.24037885.jpg','Redmi 8A 4GB+64GB 珊瑚橙 64GB','5000mAh超长续航','699','799',NULL,'true','product',NULL,NULL),(11,'0','手机','pms_1569557730.79449791.jpg','Redmi K20 Pro 尊享版 8GB+128GB 冰川蓝','骁龙855 Plus， 弹出全面屏','2399','2699',NULL,'true','product',NULL,NULL),(12,'1','热门','8ce424d6fe93dfb74733b5838140b7ee.webp','米家互联网空调C1（一级能效）','变频节能省电，自清洁','2199','2799',NULL,'true','product',NULL,NULL),(13,'1','热门','2b911be4c2f156bb6e4cf367c6080045.jpg','米家空调','出众静音，快速制冷热','1599','1799',NULL,'true','product',NULL,NULL),(14,'1','热门','ec20453216dcd42f982cffe5fdbc3115.webp','  米家互联网洗烘一体机 Pro 10kg','智能洗烘，省心省力',NULL,'2999',NULL,NULL,'product',NULL,NULL),(15,'1','热门','ef617fac-7489-436d-b74e-c43582f09633!200x200.jpg','小米电视4A 32英寸','人工智能系统，高清液晶屏','599','799',NULL,'true','product',NULL,NULL),(16,'1','热门','b8c63a2024528fe5410ebe669b7d2407.webp','Redmi全自动波轮洗衣机1A 8kg','一键操作，父母都爱用','699','799',NULL,'true','product',NULL,NULL),(17,'1','热门','ef6b4e9b9151849b3b1fb1dbf069c6ed.webp','小米全面屏电视E55A','全面屏设计，人工智能语音','1799','2099',NULL,'true','product',NULL,NULL),(18,'1','热门','cd2aa2dcad6440b469c22e27db9b6236.webp','15.6\" 四核i7 16G 独显 512G','全面均衡的国民轻薄本','4699','4899',NULL,'true','product',NULL,NULL),(19,'1','热门','74e573c4c0d89048392d14831cc507d5.webp','Air 13.3\" 2019款 ',NULL,NULL,'4799',NULL,NULL,'product',NULL,NULL),(20,'2','电视影音','ef617fac-7489-436d-b74e-c43582f09633!200x200.jpg','小米电视4A 32英寸','人工智能系统，高清液晶屏','599','799',NULL,'true','product',NULL,NULL),(21,'2','电视影音','ef6b4e9b9151849b3b1fb1dbf069c6ed.webp','小米全面屏电视E55A','全面屏设计，人工智能语音','1799','2099',NULL,'true','product',NULL,NULL),(22,'2','电视影音','b3317a291b112aa4712059ad93263668.webp','小米全面屏电视E65A','全面屏设计，人工智能语音','2699','3999',NULL,'true','product',NULL,NULL),(23,'2','电视影音','ede227c1f0e3472fb8dcfae980d1e43f!200x200.jpg','小米电视4X 43英寸','FHD全高清屏，人工智能语音','999','1499',NULL,'true','product',NULL,NULL),(24,'2','电视影音','cef8a9c0-2386-5b66-9ed2-6b1d4e4490bf!200x200.jpg','小米电视4C 55英寸','4K HDR，人工智能系统','1699','1999',NULL,'true','product',NULL,NULL),(25,'2','电视影音','91b59cc6474e0cd777445b15adb13980!200x200.jpg','小米电视4A 65英寸','4K HDR，人工智能语音系统','2499','2999',NULL,'true','product',NULL,NULL),(26,'2','电视影音','0e7eee530e4a103f2f5a0937a14bed53.webp','小米壁画电视 65英寸','壁画外观，全面屏，远场语音',NULL,'6999',NULL,NULL,'product',NULL,NULL),(27,'2','电视影音','aa8a6ce3b2b1201d74d0197482f3403b!100x100.jpg','小米盒子4',NULL,NULL,'299',NULL,NULL,'product',NULL,NULL),(28,'3','热门','011dd8493ad62f3793dbb63d9fbd3bc0.webp','小米「小爱老师」','口袋里的英语外教','499','429',NULL,'true','product',NULL,NULL),(29,'3','热门','0baacf6e54cbf89cab2c543cc02344e9.webp','小米米家智能门锁 推拉式','一步推拉，高端智能门锁','1549','1699',NULL,'true','product',NULL,NULL),(30,'3','热门','e7c6e79433c883e1a022ec21402c1679.webp','小米小爱音箱 Play','听音乐、语音遥控家电','79','169','5折','true','product',NULL,NULL),(31,'3','热门','44a30f0da2aacb66a0f896293ebc703f.webp','小爱音箱万能遥控版','传统家电秒变智能','129','199',NULL,'true','product',NULL,NULL),(32,'3','热门','b42e49c6c0208f2de5a2f7a491a3af46.webp','米家电饭煲4L','890W 立体加热','248','299',NULL,'true','product',NULL,NULL),(33,'3','热门','e850fa029579ba886e3d5c81f00ae534.webp','小米手环4','大屏彩显，20天超长续航','','169',NULL,NULL,'product',NULL,NULL),(34,'3','热门','0c65d472682f0679e192dc7b4cd6e64c.webp','米家九号平衡轮','能花式酷玩的“风火轮”','799','999',NULL,'true','product',NULL,NULL),(35,'3','热门','550177d2e54387521bce9e78cb2949dd.webp','小米体脂秤2',NULL,NULL,'99',NULL,NULL,'product',NULL,NULL),(36,'4','安防','2f33baec53cc73e2942277640ba6e710.webp','米家智能门锁 标准锁体 碳素黑','一体化活体指纹识别，多种开锁方式','1099','1299',NULL,'true','product',NULL,NULL),(37,'4','安防','1840f64ea310ca8013385885baaf16a8.webp','米家智能门锁 标准锁体 磨砂金','全新磨砂金配色，精湛工艺升级','1099','1499',NULL,'true','product',NULL,NULL),(38,'4','安防','0baacf6e54cbf89cab2c543cc02344e9.webp','米家智能门锁 推拉式 通用版','一步推拉，高端智能门锁','1549','1699',NULL,'true','product',NULL,NULL),(39,'4','安防','0245498a0e08b87ba8c323871c5d48bc.webp','米家智能门锁 青春版','隐形指纹识别设计 简单一步快进家门','899','999',NULL,'true','product',NULL,NULL),(40,'4','安防','e83e1ab5947337d7b631e056b3e0f23d.webp','米家智能门锁 霸王锁体 碳素黑','一体化活体指纹识别，多种开锁方式','1499','1599',NULL,'true','product',NULL,NULL),(41,'4','安防','fa7cdb455f106da904e8c3f6156abc06.webp','米家智能门锁 霸王锁体 磨砂金','适配霸王锁体，多种开锁方式','1499','1799',NULL,'true','product',NULL,NULL),(42,'4','安防','98c51f977ac5b590dbaf7b8445b30fa6!200x200.jpg','小米米家小白智能摄像机增强版','智能看护， AI你所爱','299','399',NULL,'true','product',NULL,NULL),(43,'4','安防','5a94a17f3e893d9804ede3b06e894460!100x100.jpg','小米米家智能摄像机云台版',NULL,NULL,'169',NULL,NULL,'product',NULL,NULL),(44,'5','出行','768992ca-4136-92f1-244a-0194a81a6360!200x200.jpg','小米米家电动滑板车','便携折叠，自由穿行','1849','1999',NULL,'true','product',NULL,NULL),(45,'5','出行','18a82e7cda6ecbc22ecee7ac927d6ff9!200x200.jpg','米兔折叠婴儿推车','出发去向往的地方','629','699',NULL,'true','product',NULL,NULL),(46,'5','出行','553b5c01820c844565abe64e50bba323!200x200.jpg','米兔遥控小飞机','迷你酷玩具，溜到飞起','199','399','5折','true','product',NULL,NULL),(47,'5','出行','877d3ce8-68ab-7506-2a78-55a8c0fba946!200x200.png','九号平衡车 Plus','一个形影不离的新伙伴','2999','3499',NULL,'true','product',NULL,NULL),(48,'5','出行','61472c3fcd181959055551e5c73aafec!200x200.jpg','米家车载逆变器','双USB充电口，国际组合插孔','189','199',NULL,'true','product',NULL,NULL),(49,'5','出行','0294e2f3997bf0cffb7bf48361d03588.webp','米家充气宝','便携电动打气筒',NULL,'199',NULL,NULL,'product',NULL,NULL),(50,'6','热门','50649d7b5706f4cd9f658e93db6b6564.webp','小米真无线蓝牙耳机 Air 2','智能真无线，轻松舒适戴','369','399',NULL,'true','product',NULL,NULL),(51,'6','热门','9eb0178e3bfeb7d170edd641fb4be4bc.webp','高速无线充套装','快速无线闪充，Qi充电标准','129','149',NULL,'true','product',NULL,NULL),(52,'6','热门','9eb0178e3bfeb7d170edd641fb4be4bc.webp','高速无线充套装','快速无线闪充，Qi充电标准','129','149',NULL,'true','product',NULL,NULL),(53,'6','热门','ea8e42faebf7d76a4cb42b8930cf9e46.webp','Redmi充电宝 10000mAh 标准版 白色','10000mAh大电量',NULL,'59',NULL,NULL,'product',NULL,NULL),(54,'6','热门','eaf70e0e9905de6452f07b1f48fcc386.webp','Redmi充电宝 20000mAh 快充版','大容量，可上飞机',NULL,'99',NULL,NULL,'product',NULL,NULL),(55,'6','热门','5dd69c0a-8f4a-b42f-d840-6c5a47f2cd03!200x200.jpg','小米插线板 5孔位','多重安全保护',NULL,'39',NULL,NULL,'product',NULL,NULL),(56,'6','热门','92af1f21293fabfbf2a112892b864925!200x200.jpg','小米蓝牙耳机AirDots青春版','雅致简约，收纳充电盒',NULL,'199',NULL,NULL,'product',NULL,NULL),(57,'6','热门','321610e787393c42e5cb2e5730a7681d.jpg','小米小爱蓝牙音箱 随身版','小巧便携，一键唤醒小爱',NULL,'49',NULL,NULL,'product',NULL,NULL),(58,'6','热门','9946e252a7c49662376c056ced004a20.webp','小米小爱触屏音箱',NULL,NULL,'199',NULL,NULL,'product',NULL,NULL),(59,'7','耳机音箱','50649d7b5706f4cd9f658e93db6b6564.webp','小米真无线蓝牙耳机 Air 2','智能真无线，轻松舒适戴','369','399',NULL,'true','product',NULL,NULL),(60,'7','耳机音箱','faf8668acb2fd80c0afad4d4c4e837ad.webp','小米降噪项圈蓝牙耳机','无线降噪，静无止境','469','499',NULL,'true','product',NULL,NULL),(61,'7','耳机音箱','92af1f21293fabfbf2a112892b864925!200x200.jpg','小米蓝牙耳机AirDots青春版','雅致简约，收纳充电盒',NULL,'199',NULL,NULL,'product',NULL,NULL),(62,'7','耳机音箱','df90d51fce8449db25c9a71c715dec1b.webp','Redmi AirDots 真无线蓝牙耳机','自动秒连，拿起就能用',NULL,'99.9',NULL,NULL,'product',NULL,NULL),(63,'7','耳机音箱','8b619d27877bbc497468c673a317a847.webp','小米小爱音箱 Pro','语音遥控5000+品牌主流家电',NULL,'299',NULL,NULL,'product',NULL,NULL),(64,'7','耳机音箱','e4c0f21c-3bd4-323e-673b-a9c1c1c6e294!200x200.jpg','小米蓝牙耳机青春版','6.5 克轻巧，高清通话音质',NULL,'59',NULL,NULL,'product',NULL,NULL),(65,'7','耳机音箱','e6a35e4dfff70f4195b29e8008716d82.webp','小米运动蓝牙耳机青春版','音随你动',NULL,'99',NULL,NULL,'product',NULL,NULL),(66,'7','耳机音箱','838ba427ef55317d8c4911b02c95bb79!100x100.jpg','小米蓝牙项圈耳机',NULL,NULL,'299',NULL,NULL,'product',NULL,NULL),(67,'8','热门','1fba6c4f1a19200778ac3b1671b087cd.webp',' 小米USB充电器30W快充版（1A1C）','多一种接口，多一种选择','54','59',NULL,'true','product',NULL,NULL),(68,'8','热门','4132366589e457f407b918fe48c89cb1!200x200.jpg','小米USB-C数据线 编织线版','高强度纤维编制线体',NULL,'18.9',NULL,NULL,'product',NULL,NULL),(69,'8','热门','1cd09b0dfd8c6d68bce1b5f946ee6476.webp','ZMI USB Type-C 转 Lightning 数据线','MFi官方认证，3A大流量，12个月质保','54','59',NULL,'true','product',NULL,NULL),(70,'8','热门','1f32af53d1ad60f4980146f6a2b81019.webp','小米无线充电宝青春版10000mAh','能量满满，无线有线都能充','119','129',NULL,'true','product',NULL,NULL),(71,'8','热门','b0ded71f-b235-8f99-ba1c-20f80c3a4231!200x200.jpg','米家LED随身灯','小巧轻便 5级亮度调节','14.9','19.9',NULL,'true','product',NULL,NULL),(72,'8','热门','a09b7cc24428a3f3b9acb0e65dc99ede.webp','小米9 Pro 5G 极简摩纹保护壳','裸机般顺滑手感，轻薄无负担',NULL,'49',NULL,NULL,'product',NULL,NULL),(73,'8','热门','9eb0178e3bfeb7d170edd641fb4be4bc.webp','高速无线充套装','快速无线闪充，Qi充电标准','129','149',NULL,NULL,'product',NULL,NULL),(74,'9','保护套','5c200476bc9336d171931cb7ee2e4549.webp',' 小米CC9&小米CC9美图定制版 标准高透贴膜','高清透亮，耐磨性强',NULL,'19',NULL,NULL,'product',NULL,NULL),(75,'9','保护套','24f8b0547a798b69be1b868872ddd80f.webp','小米CC9e 标准高透贴膜','高清透亮，耐磨性强',NULL,'19',NULL,NULL,'product',NULL,NULL),(76,'9','保护套','958e872fe9930838e90de8acc9fffc28.webp','Redmi 7A标准高透贴膜','高清高透，精彩清晰可见',NULL,'19',NULL,NULL,'product',NULL,NULL),(77,'9','保护套','e5599ccd40bab44fb0f1722d150fe43f.webp','小仙女心愿手链保护壳','手链绕于指尖，仙气满满',NULL,'199',NULL,NULL,'product',NULL,NULL),(78,'9','保护套','0d8a74ade6b1b5fbd0c88b9679c63832.webp','小米CC9 荧光色高透果冻保护壳','玩转多彩青春色',NULL,'49',NULL,NULL,'product',NULL,NULL),(79,'9','保护套','8fb7f3be403cfcbe98576bee28c7cc25.webp','Redmi K20 / K20 Pro 怪力魔王保护壳','怪力魔王专属定制',NULL,'39',NULL,NULL,'product',NULL,NULL),(80,'9','保护套','39a5445afe8c48d9b92b2bf9d6d88a26.webp','小米9 ARE U OK保护壳','一个与众不同的保护壳','39','49','','true','product',NULL,NULL),(81,'10','充电器','13ef5c2433660b1ca58e80491b848ea7!200x200.jpg','小米无线充电器（通用快充版）','铝合金外观，金属质感好','66','69','','true','product',NULL,NULL),(82,'10','充电器','1fba6c4f1a19200778ac3b1671b087cd.webp',' 小米USB充电器30W快充版（1A1C）','多一种接口，多一种选择','54','59','','true','product',NULL,NULL),(83,'10','充电器','b169b069-6cc5-b052-9f60-98a94b68fdb1!200x200.jpg','小米USB充电器快充版（18W）','安卓、苹果设备均可使用','27','29.9','','true','product',NULL,NULL),(84,'10','充电器','a6ccfda056fc159a43c7b991218004b5!200x200.jpg','小米USB充电器60W快充版（6口）','6口输出，USB-C输出接口',NULL,'129',NULL,NULL,'product',NULL,NULL),(85,'10','充电器','fb04f3efd5fd147093d939071e2d1827!200x200.jpg','小米USB充电器36W快充版（2口）','多重安全保护，小巧便携',NULL,'59',NULL,NULL,'product',NULL,NULL),(86,'10','充电器','e6d588af-1265-3bc9-f4a1-8d9da2cff89b.jpg','小米车载充电器快充版','让爱车成为移动充电站',NULL,'69',NULL,NULL,'product',NULL,NULL),(87,'10','充电器','02ff76ac8d5fa829aed1d777e46d4b39.jpg','小米二合一移动电源（充电器）','一个设备多种用途',NULL,'99',NULL,NULL,'product',NULL,NULL),(88,'11','热门','cccac948e1b8ffb47f1fecde67692e60.webp','米家飞行员太阳镜 Pro','尼龙偏光，轻巧佩戴','179','199',NULL,'true','product',NULL,NULL),(89,'11','热门','57433a4b991b2a2ddc889f2d8d434655.webp','小米巨能写中性笔10支装','一支顶4支，超长顺滑书写','','9.99',NULL,NULL,'product',NULL,NULL),(90,'11','热门','c149537ebb0c2cdb977ddd93200074f4.webp','小米旅行箱 20英寸 布朗熊限量版','“国际巨星” LINE FRIENDS布朗熊','349','399',NULL,'true','product',NULL,NULL),(91,'11','热门','03d94ee6059481a6adcb6c4c5c572fb4.webp','米家迷你保温杯','可以随身携带的温度',NULL,'49',NULL,NULL,'product',NULL,NULL),(92,'11','热门','41e6890f9d6b7fdb4275c986dc3644e8.webp','米家驱蚊器基础版 3个装','3个装 长效驱蚊','99','129',NULL,'true','product',NULL,NULL),(93,'11','热门','38748fefeef78183ac01356a23dbc5c5.webp','3卷装抽绳式垃圾袋','让清洁更简单','9.9','14.9',NULL,'true','product',NULL,NULL),(94,'11','热门','413f5e2f-53e7-0879-119c-8b4466feea53!200x200.jpg','贝医生巴氏牙刷 四色装','进口刷毛，好品质','38','39.9',NULL,'true','product',NULL,NULL),(95,'11','热门','eaa7c8e5-2a8c-0d2c-6de7-a6db2068b192!100x100.jpg','8H 乳胶弹簧静音床垫 M3','',NULL,'1349',NULL,NULL,'product',NULL,NULL),(96,'12','出行','d26d3a80dd1ab0c6a657f13cb234dade.webp','90分框体旅行箱','专利轻量合金中框，轻盈坚固','399','599',NULL,'true','product',NULL,NULL),(97,'12','出行','47ecc65d37065fde1e71b1b34326e741.webp','小米商旅多功能双肩包 2','商务旅行多场景，切换无压力','169','199',NULL,'true','product',NULL,NULL),(98,'12','出行','cccac948e1b8ffb47f1fecde67692e60.webp','米家飞行员太阳镜 Pro','尼龙偏光，轻巧佩戴','179','199',NULL,'true','product',NULL,NULL),(99,'12','出行','f5f4677730c6be3ecab615795fb0e9c7.webp','小米小背包','小身材大容量， 更精彩！',NULL,'29',NULL,NULL,'product',NULL,NULL),(100,'12','出行','e2775107-da04-6611-3580-82227ffec369!200x200.png','Free Tie 真皮板鞋 米家定制','做一双简单的板鞋','99.5','199','5折','true','product',NULL,NULL),(101,'12','出行','43549b8e-c8cd-0464-17ba-6be26f395ef0!200x200.jpg','自动折叠伞','防泼水伞布，轻盈拒水','79','99',NULL,'true','product',NULL,NULL),(102,'12','出行','1f4c867b5ccb878b43054f640636c872!200x200.jpg','最生活毛巾•青春系列','3秒吸水，杀菌无刺激',NULL,'19.9',NULL,NULL,'product',NULL,NULL),(103,'12','出行','T1r_x_BgLT1RXrhCrK!100x100.jpg','九号平衡车',NULL,NULL,'1849',NULL,NULL,'product',NULL,NULL),(104,NULL,'flashsale','f6de48c7-bf5b-8063-77d7-2b0b0b6ea3d5.jpg','小米WiFi放大器 2 白色','轻松扩展WiFi信号','49','24.5',' 5折','true','product',NULL,NULL),(105,NULL,'flashsale','075f0a1e2bf1a54cf9a13d6980049920.jpg','米兔指尖积木 白色','玩转你的自由时光','1','9.9',' 1元','true','product',NULL,NULL),(106,NULL,'flashsale','pms_1567752264.62688686.jpg','小米米家视频门铃 单品','是门铃也是门前的护卫','179','269',NULL,'true','product',NULL,NULL),(107,'0','手机','574c6643ab91c6618bfb2d0e2c761d0b.webp',NULL,NULL,NULL,NULL,NULL,'','ad',NULL,NULL),(108,'1','家电','b56fd90a60e3d9e5d87dae9fbd427ea8.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad',NULL,NULL),(109,'1','家电','b67de5a8ce9025fb5d8bac66e019d1c3.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad',NULL,NULL),(110,'2','智能','45c23f5b9a927b2dc49c25277e07727c.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad',NULL,NULL),(111,'2','智能','a660ce095e8f553a9ed1515265f4e9fc.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad',NULL,NULL),(112,'3','搭配','6874615b3c50e837ffe532eb6ea4ef1a.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad',NULL,NULL),(113,'3','搭配','07038b3e5197bc127e621e92b726583c.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad',NULL,NULL),(114,'4','安防','739ebd8abfc2b1be8866a2c1ad87e709.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad',NULL,NULL),(115,'4','安防','ffe4182f1d9a5befdf2380ec90ae1620.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad',NULL,NULL),(116,'5','出行','37dc0898c2624b4130da4631f2d9a675.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad','1226','120'),(117,'5','出行','e0b8cffcbdaa88e2a314f0a372ca75dd.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad','1226','120'),(118,NULL,'banner','b8bdd93c2aad57ede093b09d40000a48.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad','1226','120'),(119,NULL,'banner','3e63ab43e7c32296f18f34c8efb41534.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad','1226','120'),(120,NULL,'banner','59e8fc8ba9718c266882719fb4bbcedd.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad','1226','120'),(121,NULL,'banner','4ee613ea2f1786d24173e84c85939838.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad','1226','120'),(122,NULL,'banner','89c2a209b742fce9b10d9d196149d634.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad','1226','120'),(123,NULL,'banner','10fb0086cb21120c53248a3d8cc56dc5.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad','1226','120'),(124,NULL,'banner','88e35cffc82cd98cd53172460067af17.webp',NULL,NULL,NULL,NULL,NULL,NULL,'ad','1226','120'),(125,'8','热门','6c19fad90ad73f91e13c97cce2b15d82.webp','小米9 SE 街头风保护壳','','','49',NULL,NULL,'product',NULL,NULL);
/*!40000 ALTER TABLE `page_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `path` text,
  `width` varchar(45) DEFAULT NULL,
  `height` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `idx` varchar(45) DEFAULT NULL,
  `site` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'小米CC9 Pro','小米CC9 Pro.webp','160','110','2799元起','0','head'),(2,'小米9 Pro 5G','小米9 Pro 5G.webp','160','110','3699元起','0','head'),(3,'小米CC9','小米CC9.png','160','110','1699元','0','head'),(4,'小米CC9e','小米CC9e.png','160','110','1099元起','0','head'),(5,'小米CC9 美图定制版','小米CC9 美图定制版.png','160','110','1999元','0','head'),(6,'小米MIX 3','小米MIX 3.png','160','110','2399元','0','head'),(7,'Redmi 8A','Redmi 8A.webp','160','110','699元起','1','head'),(8,'Redmi 8','Redmi 8.webp','160','110','699元起','1','head'),(9,'Redmi K20 Pro 尊享版','Redmi K20 Pro 尊享版.webp','160','110','2399元起','1','head'),(10,'Redmi Note 8 Pro','Redmi Note 8 Pro.webp','160','110','1299元起','1','head'),(11,'Redmi Note 8','Redmi Note 8.webp','160','110','999元起','1','head'),(12,'Redmi 7A','Redmi 7A.jpg','160','110','549元起','1','head'),(13,'Redmi 红米电视 70英寸 R70A','Redmi 红米电视 70英寸 R70A.webp','160','110','3799元','2','head'),(14,'小米壁画电视 65英寸','小米壁画电视 65英寸.jpg','160','110','6999元','2','head'),(15,'小米全面屏电视E55A','小米全面屏电视E55A.jpg','160','110','2099元','2','head'),(16,'小米电视4A 32英寸','小米电视4A 32英寸.png','160','110','799元','2','head'),(17,'小米电视4A 55英寸','小米电视4A 55英寸.jpg','160','110','1999元','2','head'),(18,'小米电视4A 65英寸','小米电视4A 65英寸.jpg','160','110','2999元','2','head'),(19,'小米笔记本Pro 15.6\"','d712f71b3c4a3b562601c2b956a660ad.png','160','110','5599元','3','head'),(20,'RedmiBook 14','6a25f895ad6019c3fae32fd1f48a2c7c.webp','160','110','3999元起','3','head'),(21,'游戏本2019款','33c6a31aaee90164ce963801bec48e64.webp','160','110','7499元起','3','head'),(22,'小米笔记本 15.6\"','bb159dbe860ee434b52d8eed9e9fd424.png','160','110','3899元起','3','head'),(23,'小米笔记本Air 12.5\"','95c4329ce2c454e2a5fa1e0931528a46.png','160','110','3599元起','3','head'),(24,'小米笔记本 Air 13.3\"','96108a8feee8e790389b09b8b949fa7d.png','160','110','2999元','3','head'),(25,'米家互联网空调C1（一级能效）','03dc85cd792904ddc8027b2d781beed8.webp','160','110','2599元','4','head'),(26,'米家互联网空调（一级能效）','e06b219c5bced9256467b17738a943c6.png','160','110','2399元','4','head'),(27,'Redmi全自动波轮洗衣机1A','c5d772b7c2a159c3ed7d4e31bd293f18.jpg','160','110','799元','4','head'),(28,'米家互联网洗烘一体机10kg','11b8bca444aba2994fe852993eac9203.png','160','110','1999元','4','head'),(29,'小米净水器','486a2a7359b6bda95b3dbd4e45b9c50a.jpg','160','110','1999元','4','head'),(30,'米家扫地机器人','4ae019eebf10a55f8df2fee8d19b4e1f.jpg','160','110','1499元','4','head'),(31,'小米路由器AC2100','5dd23c09b7eb6471968537fdce629194.webp','160','110','229元','5','head'),(32,'小米路由器 Mesh','ec5be5f93ac0118aeec27b8df4337fc9.jpg','160','110','999元','5','head'),(33,'小米路由器4A 千兆版','026a28fc18eff2cfa4d26a799a2da9cc.jpg','160','110','129元','5','head'),(34,'小米路由器 4C','28efac56ef4c4942077dac7e30e8c624.jpg','160','110','59元','5','head'),(35,'小米路由器 4A','3c3e9f61cc72ccd2a37fc90fed215b66.jpg','160','110','99元','5','head'),(36,'小米路由器 Pro','5fc5ee374e5306aa5513be4f3b560531.png','160','110','399元','5','head'),(37,'小米米家智能摄像机云台版','2a500be4264c692899b25d86c16403f7.jpg','160','110','169元','6','head'),(38,'小米小爱老师','e3fb0886fdb13e5ae784b9713b9a0038.jpg','160','110','499元起','6','head'),(39,'小米米家智能门锁','5630aa997c82409ee33b2814c7eb2244.jpg','160','110','1299元起','6','head'),(40,'小米小爱触屏音箱','f6e585a4bf5c0f744ca60f19ecd6fadf.jpg','160','110','229元起','6','head'),(41,'小爱万能遥控版','df136199221a23299bc5348f37230a86.jpg','160','110','149元','6','head'),(42,'查看全部','ff1254137246a22ad9eba80bd1c454c5.webp','160','110','智能硬件','6','head'),(43,'Redmi K30 4G','b2b8b609aab05d9ad184bbe5c8e8be28.webp','40','40',NULL,'0','home'),(44,'Redmi K30 5G','7a98170e97ca5df8f5ad2470a8a2d01e.webp','40','40',NULL,'0','home'),(45,'小米CC9 Pro','74bb2ad7cb8b3707d8fd9d596e1866e2.webp','40','40',NULL,'0','home'),(46,'Redmi 8A','77bfd346ad97807237beca297cfe2fba.webp','40','40',NULL,'0','home'),(47,'Redmi 8','47057d897ee2c05c9215e059e1308dc6.webp','40','40',NULL,'0','home'),(48,'小米MIX Alpha','1e8be88112405471cee2c18ae0f1f62d.webp','40','40',NULL,'0','home'),(49,'小米9 Pro 5G','3ee5503ee5b2be373525e36309d922f8.webp','40','40',NULL,'0','home'),(50,'Redmi Note 8 Pro','cba27e53367b74271a38a4515a692816.webp','40','40',NULL,'0','home'),(51,'Redmi Note 8','b4534b9fd22f478314f3cbbf286b7338.webp','40','40',NULL,'0','home'),(52,'小米CC9','2b0d7d2c85734b80a1b8d1a4100c9c1f.png','40','40',NULL,'0','home'),(53,'小米CC美图定制版','20e23b306f50384ab85b6658f5c963ff.png','40','40',NULL,'0','home'),(54,'小米CC9e','3d3ee15816d2ccbe922172033c3c3941.png','40','40',NULL,'0','home'),(55,'小米MIX 3','9e83fabc3efeb8dd9f880ce26220c294.png','40','40',NULL,'0','home'),(56,'黑鲨手机2 Pro','eea579b45e6d01f214423c19ef76a459.webp','40','40',NULL,'0','home'),(57,'Redmi 7A','85d746207b997873ddfcdca0da025f78.jpg','40','40',NULL,'0','home'),(58,'Redmi 7','265c87b03067bc11097db369e71bf976.png','40','40',NULL,'0','home'),(59,'Redmi Note 7 Pro','26d1de72e958da75048be5c6cc0b73f6.jpg','40','40',NULL,'0','home'),(60,'移动4G+专区','5c483e65040470208823a8bfb5d73c27.jpg','40','40',NULL,'0','home'),(61,'小米移动 电话卡','dafced4abb82c502c087a2aca7078f48.jpg','40','40',NULL,'0','home'),(62,'手机上门维修','84e19ece0125992449a6276e2ba333e9.png','40','40',NULL,'0','home'),(63,'云服务空间月卡','8ade0163e9fdbd92a4b7d7ee3aeab905.jpg','40','40',NULL,'0','home'),(64,'米粉卡 日租卡','1a2ed8c7ac2ab7ebfd1554a7a1ac25a6.jpg','40','40',NULL,'0','home'),(65,'小米电视5 55英寸','23316088a9182a08c624958319924d8d.webp','40','40',NULL,'1','home'),(66,'小米电视5 65英寸','d8264eb9b900ead63eea69f6fc1e413a.webp','40','40',NULL,'1','home'),(67,'小米电视5 75英寸','d707cdac2a19703b57e65212f32fd25b.webp','40','40',NULL,'1','home'),(68,'小米电视5 Pro 55英寸','942d4f28d406f3946f0ce551c125c641.webp','40','40',NULL,'1','home'),(69,'小米电视5 Pro 65英寸','d096389e19ba6b79b324b7d0acfab7ca.webp','40','40',NULL,'1','home'),(70,'小米电视5 Pro 75英寸','da1680fb62238cb5b01998d80fc34e25.webp','40','40',NULL,'1','home'),(71,'Redmi 红米电视 70英寸','4c6f98e59f3e78eb5d959bbcff081562.webp','40','40',NULL,'1','home'),(72,'全面屏电视Pro 65英寸','18c9d79b3d6c6635c55ba1bb371182af.webp','40','40',NULL,'1','home'),(73,'全面屏电视Pro 55英寸','9a3aff2c5e8207dafd8fc3bfad5a2e21.webp','40','40',NULL,'1','home'),(74,'小米壁画电视 65英寸','5732e8f317eb86bfcb174fbb49d00c4a.jpg','40','40',NULL,'1','home'),(75,'小米全面屏电视','8aeae36f5d088f22c84b8953bd0d08b4.jpg','40','40',NULL,'1','home'),(76,'小米电视4A 32英寸','820cba6c44f7263c5fe773a7ffaf85b9.png','40','40',NULL,'1','home'),(77,'小米电视4A 43英寸青春版','ea8be80c82c273e167d5b282b17e9b2b.png','40','40',NULL,'1','home'),(78,'小米电视4A 49英寸','a9710af2fff5548ea05950473898ef0e.jpg','40','40',NULL,'1','home'),(79,'小米电视4A 50英寸','2f15dd9779865b48bfa8c8e915ac75ac.png','40','40',NULL,'1','home'),(80,'小米电视4A 55英寸','37ce1615e1e8fcbbda2b3f37c09ec676.png','40','40',NULL,'1','home'),(81,'小米电视4A 58英寸','11e4d06f29877044ddce0f9fdd2e26d5.png','40','40',NULL,'1','home'),(82,'小米电视4A 65英寸','ca8058c9c776447265b99420ff04e544.png','40','40',NULL,'1','home'),(83,'小米电视4C 32英寸','cb83515483547404cd26a962bada5d5b.png','40','40',NULL,'1','home'),(84,'小米电视4C 40英寸','af572c503ed2a81ab71e2810617860c5.jpg','40','40',NULL,'1','home'),(85,'小米电视4C 43英寸','7bef124bc015669bdacf76d5d4b02a7e.png','40','40',NULL,'1','home'),(86,'小米电视4C 50英寸','24ee18218b3b98161e17abe23c6fd539.png','40','40',NULL,'1','home'),(87,'小米电视4C 55英寸','fe603cc3b9c19903be14aac4e9b571d6.jpg','40','40',NULL,'1','home'),(88,'小米电视4X 43英寸','53f3593ab87d90c4cc5201e10a5c42f7.png','40','40',NULL,'1','home'),(89,'RedmiBook 13','aee86bcd8bf491eb78ae234d2e188a66.webp','40','40',NULL,'2','home'),(90,'小米笔记本 15.6\"','4f45cdc4f94f1f1651095dedb154c2e4.webp','40','40',NULL,'2','home'),(91,'小米笔记本 13.3\"','1f95bb7c9206951e3d870cb5581b8329.png','40','40',NULL,'2','home'),(92,'小米笔记本 12.5\"','eaab0db21859e0e58cae1fb807907905.jpg','40','40',NULL,'2','home'),(93,'RedmiBook 14','a3c149225946312f2b4bbe1263f65450.png','40','40',NULL,'2','home'),(94,'小米游戏本','a66c24ee8ae2efea3ae92ec455a27352.jpg','40','40',NULL,'2','home'),(95,'冰箱','abeb200aaaee68d4635c6235d3ffb3f3.webp','40','40','','3','home'),(96,'冰箱','abeb200aaaee68d4635c6235d3ffb3f3.webp','40','40',NULL,'3','home'),(97,'冰箱','abeb200aaaee68d4635c6235d3ffb3f3.webp','40','40',NULL,'3','home'),(98,'冰箱','abeb200aaaee68d4635c6235d3ffb3f3.webp','40','40',NULL,'3','home'),(99,'冰箱','abeb200aaaee68d4635c6235d3ffb3f3.webp','40','40',NULL,'3','home'),(100,'冰箱','abeb200aaaee68d4635c6235d3ffb3f3.webp','40','40',NULL,'3','home'),(101,'立式空调','96de94415b860f3de95b2d6294f0d0fd.png','40','40',NULL,'3','home'),(102,'立式空调','96de94415b860f3de95b2d6294f0d0fd.png','40','40',NULL,'3','home'),(103,'立式空调','96de94415b860f3de95b2d6294f0d0fd.png','40','40',NULL,'3','home'),(104,'立式空调','96de94415b860f3de95b2d6294f0d0fd.png','40','40',NULL,'3','home'),(105,'立式空调','96de94415b860f3de95b2d6294f0d0fd.png','40','40',NULL,'3','home'),(106,'小米手表','3cc76c2ce836255c1b2e3e1cf477cfef.webp','40','40',NULL,'4','home'),(107,'小米手表','3cc76c2ce836255c1b2e3e1cf477cfef.webp','40','40',NULL,'4','home'),(108,'小米手表','3cc76c2ce836255c1b2e3e1cf477cfef.webp','40','40',NULL,'4','home'),(109,'小米手表','3cc76c2ce836255c1b2e3e1cf477cfef.webp','40','40',NULL,'4','home'),(110,'小米手表','3cc76c2ce836255c1b2e3e1cf477cfef.webp','40','40',NULL,'4','home'),(111,'小米手表','3cc76c2ce836255c1b2e3e1cf477cfef.webp','40','40',NULL,'4','home'),(112,'小米手表','3cc76c2ce836255c1b2e3e1cf477cfef.webp','40','40',NULL,'4','home'),(113,'小米手表','3cc76c2ce836255c1b2e3e1cf477cfef.webp','40','40',NULL,'4','home'),(114,'小米手表','3cc76c2ce836255c1b2e3e1cf477cfef.webp','40','40',NULL,'4','home'),(115,'小米手表','3cc76c2ce836255c1b2e3e1cf477cfef.webp','40','40',NULL,'4','home'),(116,'小米手表','3cc76c2ce836255c1b2e3e1cf477cfef.webp','40','40',NULL,'4','home'),(117,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40','','5','home'),(118,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40','','5','home'),(119,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40','','5','home'),(120,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40','','5','home'),(121,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40','','5','home'),(123,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40','','5','home'),(124,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40','','5','home'),(125,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40','','5','home'),(126,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40','','5','home'),(127,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40','','5','home'),(128,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40','','5','home'),(129,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40','','5','home'),(130,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40',NULL,'5','home'),(131,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40',NULL,'5','home'),(132,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40',NULL,'5','home'),(133,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40',NULL,'5','home'),(134,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40',NULL,'5','home'),(135,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40',NULL,'5','home'),(136,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40',NULL,'5','home'),(137,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40',NULL,'5','home'),(138,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40',NULL,'5','home'),(139,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40',NULL,'5','home'),(140,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40',NULL,'5','home'),(141,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40',NULL,'5','home'),(142,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40',NULL,'5','home'),(143,'打印机','5ef6c2d63df78e140afab6ac3c088fac.jpg','40','40',NULL,'5','home');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `tel` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('undefined','undefined','undefined','undefined'),('白敬亭','123456q','123@qq.com','18215604487'),('脆皮羊驼怪_1996','12345678ss','123@qq.com','13795595123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` longtext,
  `title` longtext,
  `poster` longtext,
  `video` longtext,
  `desc` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'video01.webp','小米MIX Alpha 开箱视频','poster01.jpg','video_01.mp4',NULL),(2,'video02.webp','小米5G新品手机发布会','poster02.jpg','video_02.mp4',NULL),(3,'video03.webp','Redmi Note 8 系列发布会','poster03.jpg','video_03.mp4',NULL),(4,'video04.webp','小米电视5 创新背后的故事','poster04.jpg','video_04.mp4',NULL);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-16  6:03:08
