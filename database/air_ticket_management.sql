-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 19, 2022 lúc 07:22 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10
CREATE DATABASE `air_ticket_management`;

CREATE DATABASE IF NOT EXISTS data CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

USE air_ticket_management;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `air_ticket_management`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baiviet`
--

CREATE TABLE `baiviet` (
  `mabaiviet` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tenbaiviet` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `chitietbai` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `ngaydang` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `baiviet`
--

INSERT INTO `baiviet` (`mabaiviet`, `tenbaiviet`, `chitietbai`, `ngaydang`) VALUES
('BV01', 'Ưu đãi cuối tuần', 'GIÁ VÉ MÁY BAY CUỐI TUẦN CHỈ TỪ 699.000 VND/CHIỀU Ưu đãi hấp dẫn duy nhất trong hai ngày cuối tuần, bạn đã sẵn sàng chưa?', '2022-11-12'),
('BV02', 'Mua vé tết âm lịch', 'Chương trình áp dụng cho vé máy bay mua qua website và ứng dụng di động có ngày khởi hành từ nay đến hết 31/03/2023 (không áp dụng cho các giai đoạn cao điểm từ 29/12/2022 đến 05/01/2023 và giai đoạn cao điểm Tết Âm lịch)', '2022-11-11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `mabanner` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `anhbanner` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tendangnhap` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `mabaiviet` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banner`
--

INSERT INTO `banner` (`mabanner`, `anhbanner`, `tendangnhap`, `mabaiviet`) VALUES
('BN01', '123456', 'nhanvien1', 'BV02'),
('BN02', '123456', 'nhanvien3', 'BV01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietchuyenbay`
--

CREATE TABLE `chitietchuyenbay` (
  `machuyenbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `masanbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietchuyenbay`
--

INSERT INTO `chitietchuyenbay` (`machuyenbay`, `masanbay`) VALUES
('FT01', 'SGN'),
('FT01', 'HAN'),
('FT01', 'VCL'),
('FT02', 'VCL'),
('FT04', 'VCL'),
('FT05', 'DLI'),
('FT07', 'DLI'),
('FT02', 'DLI'),
('FT07', 'SGN'),
('FT01', 'DLI');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuyenbay`
--

CREATE TABLE `chuyenbay` (
  `machuyenbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tenmaybay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngaydi` datetime DEFAULT NULL,
  `ngayden` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chuyenbay`
--

INSERT INTO `chuyenbay` (`machuyenbay`, `tenmaybay`, `ngaydi`, `ngayden`) VALUES
('FT01', 'Boeing 777', '2022-11-11 02:30:00', '2022-11-11 05:30:00'),
('FT02', 'Airbus A330', '2022-12-11 01:30:00', '2022-12-11 04:00:00'),
('FT03', 'Fokker 70', '2022-12-12 10:00:00', '2022-12-12 12:00:00'),
('FT04', 'ATR 72', '2022-12-13 12:20:00', '2022-12-13 21:30:00'),
('FT05', 'Boeing 777', '2022-11-18 02:30:00', '2022-11-18 05:30:00'),
('FT06', 'Airbus A330', '2022-12-19 01:30:00', '2022-12-19 04:00:00'),
('FT07', 'Fokker 70', '2022-12-12 10:00:00', '2022-12-12 12:00:00'),
('FT08', 'ATR 72', '2022-12-13 12:20:00', '2022-12-13 21:30:00'),
('FT09', 'Boeing 777', '2022-12-12 02:30:00', '2022-12-12 05:30:00'),
('FT10', 'Airbus A330', '2022-12-11 01:30:00', '2022-12-11 04:00:00'),
('FT11', 'Fokker 70', '2022-12-12 10:00:00', '2022-12-12 12:00:00'),
('FT12', 'ATR 72', '2022-12-13 12:20:00', '2022-12-13 21:30:00'),
('FT13', 'Boeing 777', '2022-11-11 02:30:00', '2022-11-11 05:30:00'),
('FT14', 'Airbus A330', '2022-12-12 01:30:00', '2022-12-12 04:00:00'),
('FT15', 'Fokker 70', '2022-12-12 10:00:00', '2022-12-12 12:00:00'),
('FT16', 'ATR 72', '2022-12-13 12:20:00', '2022-12-13 21:30:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `sdt` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `matkhau` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `danhxung` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hoten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinh` date DEFAULT NULL,
  `cccd_passport` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `quoctich` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gioitinh` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`sdt`, `matkhau`, `danhxung`, `hoten`, `ngaysinh`, `cccd_passport`, `quoctich`, `email`, `gioitinh`) VALUES
('0378588998', '123456', 'Mr. Hữu Đức', 'Hữu', '2002-02-10', '001082546478', 'Việt Nam', 'huu@gmail.com', 'Nam'),
('0378886998', '123456', 'Mr. Hải Đức', 'Hải', '2001-02-10', '001082549988', 'Việt Nam', 'hai@gmail.com', 'Nam'),
('0378888928', '123456', 'Khôi', 'Khôi', '1998-02-10', '001082546368', 'Việt Nam', 'khoi@gmail.com', 'Nam'),
('0378888998', '123456', 'Mr. Đức', 'Hữu Đức', '2002-03-02', '001082546333', 'Việt Nam', 'khongbiet@gmail.com', 'Nam'),
('0399799999', '123456', 'Trâm', 'Trâm', '1999-02-10', '001082546798', 'Việt Nam', 'tram@gmail.com', 'Nữ'),
('0399939999', '123456', 'Mr. Ci', 'Ci', '2000-02-10', '001082546368', 'Việt Nam', 'Ci@gmail.com', 'Nam'),
('0399979999', '123456', 'Mr. Đức Hưu', 'Hữu Đức', '2002-03-02', '001082846333', 'Việt Nam', 'khongbiet@gmail.com', 'Nam'),
('0399999999', '123456', 'Mr. Hải', 'Hải', '2002-02-10', '001082546888', 'Việt Nam', 'hai@gmail.com', 'Nam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `tendangnhap` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `matkhau` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hoten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinh` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`tendangnhap`, `matkhau`, `email`, `hoten`, `ngaysinh`) VALUES
('admin', '123456', '123456@gmail.com', 'A23456', '2002-02-10'),
('nhanvien1', '123456', 'khoi@gmail.com', 'Khôi', '2002-02-10'),
('nhanvien2', '123456', 'tram@gmail.com', 'Ngân Trâm', '2002-03-02'),
('nhanvien3', '123456', 'hai@gmail.com', 'Đức Hải', '2002-02-10'),
('nhanvien4', '123456', 'duc@gmail.com', 'Hữu Đức', '2002-03-02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanbay`
--

CREATE TABLE `sanbay` (
  `masanbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tensanbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `thanhpho` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `quocgia` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanbay`
--

INSERT INTO `sanbay` (`masanbay`, `tensanbay`, `thanhpho`, `quocgia`) VALUES
('BMV', 'Sân Bay Buôn Ma Thuột', 'TP Buôn Ma Thuột', 'Việt Nam'),
('CXR', 'Sân Bay Quốc Tế Cam Ranh', 'TP Cam ranh', 'Việt Nam'),
('DAD', 'Sân Bay Quốc Tế Đà Nẵng', 'TP Đà nẵng', 'Việt Nam'),
('DLI', 'Sân Bay Đà lạt', 'TP Đà lạt', 'Việt Nam'),
('HAN', 'Nội Bài', 'TP Hà Nội', 'Việt Nam'),
('PQC', 'Sân Bay Phú Quốc', 'TP Phú quốc', 'Việt Nam'),
('SGN', 'Tân Sơn Nhất', 'TP HCM', 'Việt Nam'),
('VCL', 'Sân bay Chu Lai', 'TP Chu lai', 'Việt Nam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `soghe`
--

CREATE TABLE `soghe` (
  `machuyenbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `masoghe` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `soghe`
--

INSERT INTO `soghe` (`machuyenbay`, `masoghe`) VALUES
('FT01', 'A01'),
('FT01', 'A02'),
('FT01', 'A03'),
('FT01', 'A04'),
('FT01', 'A05'),
('FT01', 'A06'),
('FT01', 'A07'),
('FT01', 'A08'),
('FT01', 'A09'),
('FT01', 'A10'),
('FT01', 'B01'),
('FT01', 'B02'),
('FT01', 'B03'),
('FT01', 'B04'),
('FT01', 'B05'),
('FT01', 'B06'),
('FT01', 'B07'),
('FT01', 'B08'),
('FT01', 'B09'),
('FT01', 'B10'),
('FT02', 'A01'),
('FT02', 'A02'),
('FT02', 'A03'),
('FT02', 'A04'),
('FT02', 'A05'),
('FT02', 'A06'),
('FT02', 'A07'),
('FT02', 'A08'),
('FT02', 'A09'),
('FT02', 'A10'),
('FT02', 'B01'),
('FT02', 'B02'),
('FT02', 'B03'),
('FT02', 'B04'),
('FT02', 'B05'),
('FT02', 'B06'),
('FT02', 'B07'),
('FT02', 'B08'),
('FT02', 'B09'),
('FT02', 'B10'),
('FT03', 'A01'),
('FT03', 'A02'),
('FT03', 'A03'),
('FT03', 'A04'),
('FT03', 'A05'),
('FT03', 'A06'),
('FT03', 'A07'),
('FT03', 'A08'),
('FT03', 'A09'),
('FT03', 'A10'),
('FT04', 'B01'),
('FT04', 'B02'),
('FT04', 'B03'),
('FT04', 'B04'),
('FT04', 'B05'),
('FT04', 'B06'),
('FT04', 'B07'),
('FT04', 'B08'),
('FT04', 'B09'),
('FT04', 'B10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanhtoan`
--

CREATE TABLE `thanhtoan` (
  `magiaodich` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tenkhachhang` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phuongthucthanhtoan` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ngaygiaodich` date DEFAULT NULL,
  `sotien` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thanhtoan`
--

INSERT INTO `thanhtoan` (`magiaodich`, `tenkhachhang`, `phuongthucthanhtoan`, `ngaygiaodich`, `sotien`) VALUES
('GD01', 'Hữu Đức', 'Paypal', '2022-11-11', 1200000),
('GD02', 'Đức Hải', 'Momo', '2022-12-10', 1000000),
('GD03', 'Nguyễn văn A', 'Paypal', '2022-12-20', 1200000),
('GD04', 'Đức Hải', 'Momo', '2022-12-10', 2200000),
('GD05', 'Lê Văn Đ', 'Paypal', '2022-12-20', 2200000),
('GD06', 'Phạm OK', 'Momo', '2022-12-10', 1000000),
('GD07', 'Hữu Đức', 'Paypal', '2022-12-20', 1200000),
('GD08', 'Trâm trâm', 'Momo', '2022-12-10', 1000000),
('GD09', 'Hữu Hữu', 'Paypal', '2022-12-20', 1200000),
('GD10', 'Lê Thị C', 'Momo', '2022-12-10', 1000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vemaybay`
--

CREATE TABLE `vemaybay` (
  `madatcho` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sodienthoaikhachdangnhap` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotenkhachhang` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinhkhachhang` date DEFAULT NULL,
  `sodienthoai` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cccd_passport` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loaikhachhang` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `vitrighe` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `congvao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sohangly_tuixach` int(10) NOT NULL,
  `tonggiave` int(100) NOT NULL,
  `loaive` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tinhtrang` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngaydat` date NOT NULL,
  `machuyenbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `magiaodich` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `vemaybay`
--

INSERT INTO `vemaybay` (`madatcho`, `sodienthoaikhachdangnhap`, `hotenkhachhang`, `ngaysinhkhachhang`, `sodienthoai`, `cccd_passport`, `loaikhachhang`, `vitrighe`, `congvao`, `sohangly_tuixach`, `tonggiave`, `loaive`, `tinhtrang`, `ngaydat`, `machuyenbay`, `magiaodich`) VALUES
('VE101', NULL, 'Hữu Đức', '2002-03-02', NULL, '001072546333', 'Kim cương', '12A', '02', 2, 2200000, 'Thương gia', 'Đã thanh toán', '2022-12-12', 'FT01', 'GD03'),
('VE102', '0378888998', 'Hữu Đức', '2002-03-02', NULL, '001082546333', 'Kim cương', '14A', '02', 2, 2200000, 'Thương gia', 'Đã thanh toán', '2022-12-12', 'FT01', 'GD06'),
('VE103', '0399999999', 'Hải', '2002-02-10', NULL, '001082546888', 'Kim cương', '15A', '02', 1, 2200000, 'Thương gia', 'Đã thanh toán', '2022-12-12', 'FT01', 'GD02'),
('VE104', NULL, 'Hải', '2002-02-10', NULL, '001082596888', 'Kim cương', '11A', '02', 1, 2200000, 'Thương gia', 'Đã thanh toán', '2022-11-11', 'FT01', 'GD05'),
('VE105', NULL, 'Trâm', '2002-03-02', NULL, '001082546333', 'Kim cương', '10A', '02', 2, 2200000, 'Thương gia', 'Đã thanh toán', '2022-11-11', 'FT02', 'GD04'),
('VE106', '0399979999', 'Khôi', '2002-02-10', NULL, '001082516888', 'Kim cương', '15B', '02', 1, 500000, 'Bình dân', 'Đã thanh toán', '2022-11-11', 'FT01', 'GD08'),
('VE107', '0378886998', 'Hữu Hải', '2002-03-02', NULL, '005082546333', 'Bạc', '14B', '02', 2, 2600000, 'Thương gia', 'Đã thanh toán', '2022-11-11', 'FT09', 'GD01'),
('VE108', '0399939999', 'Hải Đức', '2002-02-10', NULL, '004082546888', 'Kim cương', '15A', '02', 1, 2200000, 'Thương gia', 'Đã thanh toán', '2022-11-12', 'FT01', 'GD07'),
('VE109', '0378588998', 'Hữu Hữu', '2002-03-02', NULL, '006082546333', 'Bạc', '11B', '02', 2, 4200000, 'Thương gia', 'Đã thanh toán', '2022-12-12', 'FT05', 'GD08'),
('VE110', '0399799999', 'Hải Hải', '2002-02-10', NULL, '003082546888', 'Kim cương', '15C', '02', 1, 2200000, 'Thương gia', 'Đã thanh toán', '2022-12-12', 'FT01', 'GD02'),
('VE111', NULL, 'Đức Đức', '1990-03-02', NULL, '009082546333', 'Kim cương', '14C', '02', 2, 200000, 'Thương gia', 'Đã thanh toán', '2022-12-12', 'FT07', 'GD06'),
('VE112', NULL, 'Trâm trâm', '2002-02-10', NULL, '001082746888', 'Kim cương', '11C', '02', 1, 2200000, 'Thương gia', 'Đã thanh toán', '2022-09-09', 'FT09', 'GD08'),
('VE113', '0378888928', 'Khôi ', '2001-03-02', NULL, '001082546333', 'Kim cương', '16A', '02', 2, 200000, 'Bình dân', 'Đã thanh toán', '2022-09-09', 'FT03', 'GD02'),
('VE114', NULL, 'Nguyễn văn A', '2002-02-10', NULL, '001087546888', 'Kim cương', '15A', '02', 1, 2200000, 'Thương gia', 'Đã thanh toán', '2022-09-09', 'FT01', 'GD07'),
('VE115', NULL, 'Trần Tăn B', '2003-03-02', NULL, '001082549333', 'Vàng', '17A', '02', 2, 2200000, 'Thương gia', 'Đã thanh toán', '2022-12-12', 'FT06', 'GD02'),
('VE116', NULL, 'Lê Thị C', '2000-02-10', NULL, '001082546688', 'Vàng', '19A', '02', 1, 2200000, 'Thương gia', 'Đã thanh toán', '2022-12-12', 'FT01', 'GD09'),
('VE117', NULL, 'Hữu Đức', '2002-03-02', NULL, '001082547333', 'Kim cương', '19B', '02', 2, 2200000, 'Thương gia', 'Đã thanh toán', '2022-08-08', 'FT01', 'GD02'),
('VE118', NULL, 'Lê Văn Đ', '2002-02-10', NULL, '001086546888', 'Bạch kim', '20A', '02', 1, 200000, 'Bình dânThương gia', 'Đã thanh toán', '2022-08-08', 'FT01', 'GD07'),
('VE119', NULL, 'Phạm OK', '1990-03-02', NULL, '001082346333', 'Kim cương', '09C', '02', 2, 2700000, 'Thương gia', 'Đã thanh toán', '2022-12-12', 'FT06', 'GD01'),
('VE120', NULL, 'Trần H', '2002-02-10', NULL, '001082576888', 'Đồng', '15D', '02', 1, 2200000, 'Thương gia', 'Đã thanh toán', '2022-12-12', 'FT04', 'GD07');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD PRIMARY KEY (`mabaiviet`);

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`mabanner`),
  ADD KEY `banner_ibfk_1` (`tendangnhap`),
  ADD KEY `banner_ibfk_2` (`mabaiviet`);

--
-- Chỉ mục cho bảng `chitietchuyenbay`
--
ALTER TABLE `chitietchuyenbay`
  ADD KEY `chitietchuyenbay_ibfk_1` (`masanbay`),
  ADD KEY `chitietchuyenbay_ibfk_2` (`machuyenbay`);

--
-- Chỉ mục cho bảng `chuyenbay`
--
ALTER TABLE `chuyenbay`
  ADD PRIMARY KEY (`machuyenbay`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`sdt`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`tendangnhap`);

--
-- Chỉ mục cho bảng `sanbay`
--
ALTER TABLE `sanbay`
  ADD PRIMARY KEY (`masanbay`);

--
-- Chỉ mục cho bảng `soghe`
--
ALTER TABLE `soghe`
  ADD PRIMARY KEY (`machuyenbay`,`masoghe`);

--
-- Chỉ mục cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  ADD PRIMARY KEY (`magiaodich`);

--
-- Chỉ mục cho bảng `vemaybay`
--
ALTER TABLE `vemaybay`
  ADD PRIMARY KEY (`madatcho`),
  ADD KEY `sodienthoaikhachdangnhap` (`sodienthoaikhachdangnhap`),
  ADD KEY `machuyenbay` (`machuyenbay`),
  ADD KEY `magiaodich` (`magiaodich`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `banner`
--
ALTER TABLE `banner`
  ADD CONSTRAINT `banner_ibfk_1` FOREIGN KEY (`tendangnhap`) REFERENCES `nhanvien` (`tendangnhap`),
  ADD CONSTRAINT `banner_ibfk_2` FOREIGN KEY (`mabaiviet`) REFERENCES `baiviet` (`mabaiviet`);

--
-- Các ràng buộc cho bảng `chitietchuyenbay`
--
ALTER TABLE `chitietchuyenbay`
  ADD CONSTRAINT `chitietchuyenbay_ibfk_1` FOREIGN KEY (`masanbay`) REFERENCES `sanbay` (`masanbay`),
  ADD CONSTRAINT `chitietchuyenbay_ibfk_2` FOREIGN KEY (`machuyenbay`) REFERENCES `chuyenbay` (`machuyenbay`);

--
-- Các ràng buộc cho bảng `soghe`
--
ALTER TABLE `soghe`
  ADD CONSTRAINT `soghe_ibfk_1` FOREIGN KEY (`machuyenbay`) REFERENCES `chuyenbay` (`machuyenbay`);

--
-- Các ràng buộc cho bảng `vemaybay`
--
ALTER TABLE `vemaybay`
  ADD CONSTRAINT `vemaybay_ibfk_1` FOREIGN KEY (`sodienthoaikhachdangnhap`) REFERENCES `khachhang` (`sdt`),
  ADD CONSTRAINT `vemaybay_ibfk_2` FOREIGN KEY (`machuyenbay`) REFERENCES `chuyenbay` (`machuyenbay`),
  ADD CONSTRAINT `vemaybay_ibfk_3` FOREIGN KEY (`magiaodich`) REFERENCES `thanhtoan` (`magiaodich`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
