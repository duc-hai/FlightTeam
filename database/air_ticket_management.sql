-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th10 29, 2017 lúc 11:07 AM
-- Phiên bản máy phục vụ: 5.6.35
-- Phiên bản PHP: 7.1.6

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

--thêm khóa chính
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`sdt`);

--insert dữ liệu
INSERT INTO `khachhang` (`sdt`, `matkhau`, `danhxung` ,`hoten`, `ngaysinh`,`cccd_passport`, `quoctich`,`email`, `gioitinh`) VALUES
(0378888998, '123456', 'Mr. Đức', 'Hữu Đức', '02022002', '001082546333', 'Việt Nam','khongbiet@gmail.com','Nam'),
(0399999999, '123456', 'Mr. Hải', 'Hải', '02032002', '001082546888', 'Việt Nam','hai@gmail.com','Nam'),

CREATE TABLE `vemaybay` (
  `madatcho` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `thongtin_khachhang` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `congvao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `vitrighe` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sohangly_tuixach` int(10) NOT NULL,
  `tonggiave` int(100) NOT NULL,
  `loaive` varchar(50) COLLATE utf8_unicode_ci NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `vemaybay`
    ADD PRIMARY KEY (`madatcho`);

INSERT INTO `vemaybay` (`madatcho`, `thongtin_khachhang`, `congvao` ,`vitrighe`, `sohangly_tuixach`,`tonggiave`, `loaive`) VALUES
('VE102', 'chưa rõ', '02', '14A', '2', 2200000, 'Thương gia'),
('VE103', 'chưa rõ', '02', '15A', '1', 2200000, 'Thương gia'),

CREATE TABLE `thongtin_khachhang` (
  `hoten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinh` Date,
  `cccd_passport` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `vitrighe` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `loaikhachhang` varchar(50) COLLATE utf8_unicode_ci NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `thongtin_khachhang` (`hoten`, `ngaysinh`, `cccd_passport` ,`vitrighe`, `loaikhachhang`) VALUES
('Hữu Đức', '02022002', '001082546333', '14A', 'Kim cương'),
('Hải', '02032002', '001082546888', '15A', 'Kim cương'),

CREATE TABLE `nhanvien` (
    `sdt` int(10) NOT NULL,
    `matkhau` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `hoten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `ngaysinh` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;   

ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`sdt`);

CREATE TABLE `banner` (
    `mabanner` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `anhbanner` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

ALTER TABLE `banner`
    ADD PRIMARY KEY (`mabanner`);


CREATE TABLE `baiviet` (
    `mabaiviet` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `chitetbai` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
    `ngaydang` varchar(50) COLLATE utf8_unicode_ci NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;   

ALTER TABLE `baiviet`
    ADD PRIMARY KEY (`mabaiviet`);


CREATE TABLE `sanbay` (
  `masanbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tensanbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `thanhpho` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `quocgia` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;   

ALTER TABLE `sanbay`
    ADD PRIMARY KEY (`masanbay`);


CREATE TABLE `chuyenbay` (
    `machuyenbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `tenmaybay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `ngaydi` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
    `ngayden` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;   

ALTER TABLE `chuyenbay`
    ADD PRIMARY KEY (`machuyenbay`);

CREATE TABLE `thanhtoan` (
    `magiaodich` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `tenkhachhang` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `phuongthucthanhtoan` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
    `ngaygiaodich` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `sotien` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

ALTER TABLE `thanhtoan`
    ADD PRIMARY KEY (`magiaodich`);

--ALTER TABLE Users ADD FOREIGN KEY(groupid) REFERENCES Groups(groupid);