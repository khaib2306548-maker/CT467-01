-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quan_ly_thu_vien
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.16-MariaDB

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
-- Table structure for table `chitietphieumuon`
--

DROP TABLE IF EXISTS `chitietphieumuon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietphieumuon` (
  `MaChiTietPM` varchar(20) NOT NULL,
  `MaPhieuMuon` varchar(20) NOT NULL,
  `MaSach` varchar(20) NOT NULL,
  `SoLuongSachMuon` int(11) NOT NULL CHECK (`SoLuongSachMuon` > 0),
  PRIMARY KEY (`MaChiTietPM`),
  KEY `fk_ctpm_phieumuon` (`MaPhieuMuon`),
  KEY `fk_ctpm_sach` (`MaSach`),
  CONSTRAINT `fk_ctpm_phieumuon` FOREIGN KEY (`MaPhieuMuon`) REFERENCES `phieumuon` (`MaPhieuMuon`) ON DELETE CASCADE,
  CONSTRAINT `fk_ctpm_sach` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietphieumuon`
--

LOCK TABLES `chitietphieumuon` WRITE;
/*!40000 ALTER TABLE `chitietphieumuon` DISABLE KEYS */;
INSERT INTO `chitietphieumuon` VALUES ('CTPM01','PM01','S001',1),('CTPM02','PM01','S006',2),('CTPM03','PM02','S003',1),('CTPM04','PM02','S010',1),('CTPM05','PM03','S002',2),('CTPM06','PM03','S014',1),('CTPM07','PM04','S004',1),('CTPM08','PM05','S007',2);
/*!40000 ALTER TABLE `chitietphieumuon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docgia`
--

DROP TABLE IF EXISTS `docgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docgia` (
  `MaDocGia` varchar(20) NOT NULL,
  `TenDocGia` varchar(100) NOT NULL,
  `NgaySinh` date DEFAULT NULL,
  `SoDienThoai` varchar(15) NOT NULL,
  PRIMARY KEY (`MaDocGia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docgia`
--

LOCK TABLES `docgia` WRITE;
/*!40000 ALTER TABLE `docgia` DISABLE KEYS */;
INSERT INTO `docgia` VALUES ('DG01','Lê Văn Hùng','2004-03-15','0911223344'),('DG02','Phạm Thị Thu Thảo','2004-07-22','0922334455'),('DG03','Nguyễn Hoàng Phúc','2003-11-08','0933445566'),('DG04','Trần Ngọc Hân','2005-01-19','0944556677'),('DG05','Võ Minh Trí','2004-09-30','0955667788'),('DG06','Đặng Thị Mỹ Duyên','2003-05-12','0966778899'),('DG07','Bùi Quốc Khánh','2004-12-02','0977889900'),('DG08','Huỳnh Gia Bảo','2005-04-25','0988990011'),('DG09','Ngô Thanh Trúc','2004-08-14','0901234567'),('DG10','Dương Tấn Phát','2003-02-28','0907654321');
/*!40000 ALTER TABLE `docgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieumuon`
--

DROP TABLE IF EXISTS `phieumuon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieumuon` (
  `MaPhieuMuon` varchar(20) NOT NULL,
  `MaDocGia` varchar(20) NOT NULL,
  `NgayMuon` date NOT NULL,
  `NgayTra` date NOT NULL,
  `TrangThai` enum('Đang mượn','Đã trả') NOT NULL DEFAULT 'Đang mượn',
  PRIMARY KEY (`MaPhieuMuon`),
  KEY `fk_phieumuon_docgia` (`MaDocGia`),
  CONSTRAINT `fk_phieumuon_docgia` FOREIGN KEY (`MaDocGia`) REFERENCES `docgia` (`MaDocGia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieumuon`
--

LOCK TABLES `phieumuon` WRITE;
/*!40000 ALTER TABLE `phieumuon` DISABLE KEYS */;
INSERT INTO `phieumuon` VALUES ('PM01','DG01','2026-11-02','2026-11-09','Đã trả'),('PM02','DG02','2026-11-01','2026-11-08','Đang mượn'),('PM03','DG03','2026-11-10','2026-11-24','Đang mượn'),('PM04','DG04','2026-10-15','2026-10-22','Đã trả'),('PM05','DG05','2026-09-05','2026-09-15','Đã trả');
/*!40000 ALTER TABLE `phieumuon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieutra`
--

DROP TABLE IF EXISTS `phieutra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieutra` (
  `MaPhieuTra` varchar(20) NOT NULL,
  `MaChiTietPM` varchar(20) NOT NULL,
  `NgayTraSach` date NOT NULL,
  `TienPhat` decimal(12,0) NOT NULL DEFAULT 0 CHECK (`TienPhat` >= 0),
  PRIMARY KEY (`MaPhieuTra`),
  UNIQUE KEY `MaChiTietPM` (`MaChiTietPM`),
  CONSTRAINT `fk_phieutra_ctpm` FOREIGN KEY (`MaChiTietPM`) REFERENCES `chitietphieumuon` (`MaChiTietPM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieutra`
--

LOCK TABLES `phieutra` WRITE;
/*!40000 ALTER TABLE `phieutra` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieutra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sach`
--

DROP TABLE IF EXISTS `sach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sach` (
  `MaSach` varchar(20) NOT NULL,
  `MaTacGia` varchar(20) NOT NULL,
  `MaTheLoai` varchar(20) NOT NULL,
  `TenSach` varchar(200) NOT NULL,
  `NamXuatBan` int(11) DEFAULT NULL,
  `NhaXuatBan` varchar(150) DEFAULT NULL,
  `SoLuongHienCo` int(11) NOT NULL DEFAULT 0 CHECK (`SoLuongHienCo` >= 0),
  PRIMARY KEY (`MaSach`),
  KEY `fk_sach_tacgia` (`MaTacGia`),
  KEY `fk_sach_theloai` (`MaTheLoai`),
  CONSTRAINT `fk_sach_tacgia` FOREIGN KEY (`MaTacGia`) REFERENCES `tacgia` (`MaTacGia`),
  CONSTRAINT `fk_sach_theloai` FOREIGN KEY (`MaTheLoai`) REFERENCES `theloai` (`MaTheLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sach`
--

LOCK TABLES `sach` WRITE;
/*!40000 ALTER TABLE `sach` DISABLE KEYS */;
INSERT INTO `sach` VALUES ('S001','TG03','TL01','Fundamentals of Database Systems (Nguyên lý Hệ CSDL)',2021,'NXB Giáo Dục',15),('S002','TG07','TL01','Database System Concepts (Giáo trình Quản trị Dữ liệu)',2022,'NXB Đại Học Quốc Gia',20),('S003','TG01','TL02','Lập trình PHP & MySQL từ cơ bản đến nâng cao',2023,'NXB Khoa Học & Kỹ Thuật',18),('S004','TG04','TL02','Clean Code - Mã sạch và Nghệ thuật lập trình',2020,'NXB Dân Trí',12),('S005','TG04','TL02','Clean Architecture - Kiến trúc phần mềm chuẩn',2021,'NXB Thế Giới',10),('S006','TG02','TL03','Mắt Biếc',2019,'NXB Trẻ',25),('S007','TG02','TL03','Cho Tôi Xin Một Vé Đi Tuổi Thơ',2020,'NXB Trẻ',22),('S008','TG02','TL03','Tôi Thấy Hoa Vàng Trên Cỏ Xanh',2021,'NXB Trẻ',19),('S009','TG06','TL03','Dế Mèn Phiêu Lưu Ký',2018,'NXB Kim Đồng',30),('S010','TG05','TL04','Đắc Nhân Tâm',2022,'NXB Tổng Hợp TP.HCM',28),('S011','TG05','TL04','Quẳng Gánh Lo Đi Và Vui Sống',2021,'NXB Tổng Hợp TP.HCM',16),('S012','TG08','TL04','Tự Học - Một Nhu Cầu Của Thời Đại',2020,'NXB Văn Hóa',14),('S013','TG08','TL05','Tổ Chức Công Việc Theo Khoa Học',2019,'NXB Hồng Đức',11),('S014','TG01','TL02','Thiết Kế Web Chuẩn HTML5, CSS3 & JavaScript',2024,'NXB Thông Tin & Truyền Thông',24),('S015','TG07','TL06','Hệ Điều Hành Hiện Đại (Operating System Concepts)',2023,'NXB Đại Học Cần Thơ',13);
/*!40000 ALTER TABLE `sach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tacgia`
--

DROP TABLE IF EXISTS `tacgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tacgia` (
  `MaTacGia` varchar(20) NOT NULL,
  `TenTacGia` varchar(100) NOT NULL,
  PRIMARY KEY (`MaTacGia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tacgia`
--

LOCK TABLES `tacgia` WRITE;
/*!40000 ALTER TABLE `tacgia` DISABLE KEYS */;
INSERT INTO `tacgia` VALUES ('TG01','Phạm Hữu Khang'),('TG02','Nguyễn Nhật Ánh'),('TG03','Ramez Elmasri'),('TG04','Robert C. Martin'),('TG05','Dale Carnegie'),('TG06','Tô Hoài'),('TG07','Abraham Silberschatz'),('TG08','Nguyễn Hiến Lê');
/*!40000 ALTER TABLE `tacgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taikhoan` (
  `TenDangNhap` varchar(50) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `HoTen` varchar(100) NOT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `SoDienThoai` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`TenDangNhap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taikhoan`
--

LOCK TABLES `taikhoan` WRITE;
/*!40000 ALTER TABLE `taikhoan` DISABLE KEYS */;
INSERT INTO `taikhoan` VALUES ('admin','admin123','Lê Hoàng Nam','Quận Bình Thủy, TP. Cần Thơ','0909112233'),('thuthu01','123456','Nguyễn Minh Anh','Quận Ninh Kiều, TP. Cần Thơ','0912345678'),('thuthu02','123456','Trần Quốc Bảo','Quận Cái Răng, TP. Cần Thơ','0987654321');
/*!40000 ALTER TABLE `taikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theloai`
--

DROP TABLE IF EXISTS `theloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theloai` (
  `MaTheLoai` varchar(20) NOT NULL,
  `TenTheLoai` varchar(100) NOT NULL,
  PRIMARY KEY (`MaTheLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theloai`
--

LOCK TABLES `theloai` WRITE;
/*!40000 ALTER TABLE `theloai` DISABLE KEYS */;
INSERT INTO `theloai` VALUES ('TL01','Cơ sở dữ liệu'),('TL02','Công nghệ thông tin'),('TL03','Văn học Việt Nam'),('TL04','Kỹ năng sống'),('TL05','Kinh tế - Quản trị'),('TL06','Khoa học - Kỹ thuật');
/*!40000 ALTER TABLE `theloai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'quan_ly_thu_vien'
--

--
-- Dumping routines for database 'quan_ly_thu_vien'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-14  1:59:28
