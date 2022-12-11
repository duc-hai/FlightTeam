-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th10 29, 2017 lúc 11:07 AM
-- Phiên bản máy phục vụ: 5.6.35
-- Phiên bản PHP: 7.1.6
CREATE DATABASE `air_ticket_management`;

CREATE DATABASE IF NOT EXISTS data CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

USE air_ticket_management;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


--
-- Cơ sở dữ liệu: `air_ticket_management`
--

-- --------------------------------------------------------

--
--
CREATE TABLE `khachhang` (
  `sdt` int(10) NOT NULL,
  `matkhau` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `danhxung` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hoten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinh` Date,
  `cccd_passport` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `quoctich` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gioitinh` varchar(50) COLLATE utf8_unicode_ci NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`sdt`);


INSERT INTO `khachhang` (`sdt`, `matkhau`, `danhxung` ,`hoten`, `ngaysinh`,`cccd_passport`, `quoctich`,`email`, `gioitinh`) VALUES
(0378888998, '123456', 'Mr. Đức', 'Hữu Đức', '02022002', '001082546333', 'Việt Nam','khongbiet@gmail.com','Nam'),
(0399999999, '123456', 'Mr. Hải', 'Hải', '02032002', '001082546888', 'Việt Nam','hai@gmail.com','Nam');

CREATE TABLE `vemaybay` (
  `madatcho` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hotenkhachhang` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinhkhachhang` Date,
  `cccd_passport` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `loaikhachhang` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `vitrighe` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `congvao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sohangly_tuixach` int(10) NOT NULL,
  `tonggiave` int(100) NOT NULL,
  `loaive` varchar(50) COLLATE utf8_unicode_ci NOT NULL, 
  `tinhtrang` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngaydat` Date
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `vemaybay`
    ADD PRIMARY KEY (`madatcho`);
INSERT INTO `vemaybay` (`madatcho`, `hotenkhachhang`, `ngaysinhkhachhang`, `cccd_passport` ,`vitrighe`, `loaikhachhang`, `congvao` , `sohangly_tuixach`,`tonggiave`, `loaive`)
VALUES
('VE102', 'Hữu Đức', '02/02/2002', '001082546333', '14A', 'Kim cương', '02',2, 2200000, 'Thương gia'),
('VE103', 'Hải', '02/032/002', '001082546888', '15A', 'Kim cương', '02', 1, 2200000, 'Thương gia');

CREATE TABLE `nhanvien` (
    `sdt` int(10) NOT NULL,
    `matkhau` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `hoten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `ngaysinh` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;   

ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`sdt`);
INSERT INTO `nhanvien`( `sdt`,`matkhau`, `email`,`hoten`,`ngaysinh`)  
VALUES
(0389999999, '123456', 'duc@gmail.com', 'Hữu Đức', '11/02/2002'),
(0389999989, '123456', 'hai@gmail.com', 'Đức Hải', '12/02/2002'),
(0389999977, '123456', 'tram@gmail.com', 'Ngân Trâm','11/03/2002'),
(0389999966, '123456', 'khoi@gmail.com', 'Khôi', '11/05/2002');


CREATE TABLE `banner` (
    `mabanner` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `anhbanner` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

ALTER TABLE `banner`
    ADD PRIMARY KEY (`mabanner`);

INSERT INTO `banner`( `mabanner`,`anhbanner`)  
VALUES
('01', '123456'),
('02', '123456');

CREATE TABLE `baiviet` (
    `mabaiviet` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `chitietbai` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
    `ngaydang` varchar(50) COLLATE utf8_unicode_ci NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;   

ALTER TABLE `baiviet`
    ADD PRIMARY KEY (`mabaiviet`);

INSERT INTO `baiviet`( `mabaiviet`,`chitietbai`,`ngaydang`)  
VALUES
('01', 'GIÁ VÉ MÁY BAY CUỐI TUẦN CHỈ TỪ 699.000 VND/CHIỀU Ưu đãi hấp dẫn duy nhất trong hai ngày cuối tuần, bạn đã sẵn sàng chưa?','11/12/2022'),
('02', 'Chương trình áp dụng cho vé máy bay mua qua website và ứng dụng di động có ngày khởi hành từ nay đến hết 31/03/2023 (không áp dụng cho các giai đoạn cao điểm từ 29/12/2022 đến 05/01/2023 và giai đoạn cao điểm Tết Âm lịch)','11/11/2022');

CREATE TABLE `sanbay` (
  `masanbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tensanbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `thanhpho` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `quocgia` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;   

ALTER TABLE `sanbay`
    ADD PRIMARY KEY (`masanbay`);

INSERT INTO `sanbay`(`masanbay`,`tensanbay`,`thanhpho`,`quocgia`)
VALUES
('01','Tân Sơn Nhất','TP HCM','Việt Nam'),
('02','Nội Bài','TP Hà Nội','Việt Nam'),
('03','Sân Bay Quốc Tế Cam Ranh','TP Cam ranh','Việt Nam'),
('04','Sân Bay Buôn Ma Thuột','TP Buôn Ma Thuột','Việt Nam'),
('05','Sân Bay Quốc Tế Đà Nẵng','TP Đà nẵng','Việt Nam');

CREATE TABLE `chuyenbay` (
    `machuyenbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `tenmaybay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `ngaydi` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
    `ngayden` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;   

ALTER TABLE `chuyenbay`
    ADD PRIMARY KEY (`machuyenbay`);

INSERT INTO `chuyenbay`(`machuyenbay`,`tenmaybay`,`ngaydi`,`ngayden`)
VALUES
('01','Boeing 777','11/11/2022','11/11/2022'),
('02','Airbus A330','12/10/2022','12/10/2022'),
('03','Fokker 70','12/12/2022','12/12/2022'),
('04','ATR 72','12/12/2022','12/12/2022');


CREATE TABLE `chitetchuyenbay` (
    `masanbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `machuyenbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `Nơi đi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `Nơi đến` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;  

CREATE TABLE `thanhtoan` (
    `magiaodich` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `tenkhachhang` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `phuongthucthanhtoan` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
    `ngaygiaodich` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `sotien` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

ALTER TABLE `thanhtoan`
    ADD PRIMARY KEY (`magiaodich`);

INSERT INTO `thanhtoan`(`magiaodich`,`tenkhachhang`,`phuongthucthanhtoan`,`ngaygiaodich`,`sotien`)
VALUES
('01','Hữu Đức','Online','11/11/2022',1200000),
('02','Đức Hải','Offline','12/10/2022',1000000)

