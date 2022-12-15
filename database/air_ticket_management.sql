-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 15, 2022 lúc 10:55 AM
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
  `chitietbai` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `ngaydang` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `baiviet`
--

INSERT INTO `baiviet` (`mabaiviet`, `chitietbai`, `ngaydang`) VALUES
('01', 'GIÁ VÉ MÁY BAY CUỐI TUẦN CHỈ TỪ 699.000 VND/CHIỀU Ưu đãi hấp dẫn duy nhất trong hai ngày cuối tuần, bạn đã sẵn sàng chưa?', '2022-11-12'),
('02', 'Chương trình áp dụng cho vé máy bay mua qua website và ứng dụng di động có ngày khởi hành từ nay đến hết 31/03/2023 (không áp dụng cho các giai đoạn cao điểm từ 29/12/2022 đến 05/01/2023 và giai đoạn cao điểm Tết Âm lịch)', '2022-11-11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `mabanner` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `anhbanner` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banner`
--

INSERT INTO `banner` (`mabanner`, `anhbanner`) VALUES
('01', '123456'),
('02', '123456');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitetchuyenbay`
--

CREATE TABLE `chitetchuyenbay` (
  `masanbaydi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `machuyenbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `masanbayden` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Nơi đi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Nơi đến` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitetchuyenbay`
--

INSERT INTO `chitetchuyenbay` (`masanbaydi`, `machuyenbay`, `masanbayden`, `Nơi đi`, `Nơi đến`) VALUES
('01', '03', '02', 'Sài gòn', 'Hà nội'),
('02', '04', '05', 'Hà nội', 'Đà Nẵng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuyenbay`
--

CREATE TABLE `chuyenbay` (
  `machuyenbay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tenmaybay` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngaydi` date DEFAULT NULL,
  `ngayden` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chuyenbay`
--

INSERT INTO `chuyenbay` (`machuyenbay`, `tenmaybay`, `ngaydi`, `ngayden`) VALUES
('01', 'Boeing 777', '2022-11-11', '2022-11-11'),
('02', 'Airbus A330', '2022-12-11', '2022-12-11'),
('03', 'Fokker 70', '2022-12-12', '2022-12-12'),
('04', 'ATR 72', '2022-12-13', '2022-12-13');

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
('0378888998', '123456', 'Mr. Đức', 'Hữu Đức', '2002-03-02', '001082546333', 'Việt Nam', 'khongbiet@gmail.com', 'Nam'),
('0399999999', '123456', 'Mr. Hải', 'Hải', '2002-02-10', '001082546888', 'Việt Nam', 'hai@gmail.com', 'Nam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `sdt` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `matkhau` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hoten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinh` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`sdt`, `matkhau`, `email`, `hoten`, `ngaysinh`) VALUES
('0389999966', '123456', 'khoi@gmail.com', 'Khôi', '2002-02-10'),
('0389999977', '123456', 'tram@gmail.com', 'Ngân Trâm', '2002-03-02'),
('0389999989', '123456', 'hai@gmail.com', 'Đức Hải', '2002-02-10'),
('0389999999', '123456', 'duc@gmail.com', 'Hữu Đức', '2002-03-02');

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
('01', 'Tân Sơn Nhất', 'TP HCM', 'Việt Nam'),
('02', 'Nội Bài', 'TP Hà Nội', 'Việt Nam'),
('03', 'Sân Bay Quốc Tế Cam Ranh', 'TP Cam ranh', 'Việt Nam'),
('04', 'Sân Bay Buôn Ma Thuột', 'TP Buôn Ma Thuột', 'Việt Nam'),
('05', 'Sân Bay Quốc Tế Đà Nẵng', 'TP Đà nẵng', 'Việt Nam');

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
('01', 'Hữu Đức', 'Online', '2022-11-11', 1200000),
('02', 'Đức Hải', 'Offline', '2022-12-10', 1000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vemaybay`
--

CREATE TABLE `vemaybay` (
  `madatcho` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sodienthoaikhachdangnhap` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `hotenkhachhang` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinhkhachhang` date DEFAULT NULL,
  `cccd_passport` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
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

INSERT INTO `vemaybay` (`madatcho`, `sodienthoaikhachdangnhap`, `hotenkhachhang`, `ngaysinhkhachhang`, `cccd_passport`, `loaikhachhang`, `vitrighe`, `congvao`, `sohangly_tuixach`, `tonggiave`, `loaive`, `tinhtrang`, `ngaydat`, `machuyenbay`, `magiaodich`) VALUES
('VE102', '0378888998', 'Hữu Đức', '2002-03-02', '001082546333', 'Kim cương', '14A', '02', 2, 2200000, 'Thương gia', 'Đã thanh toán', '2022-12-12', '01', '02'),
('VE103', '0399999999', 'Hải', '2002-02-10', '001082546888', 'Kim cương', '15A', '02', 1, 2200000, 'Thương gia', 'Đã thanh toán', '2022-12-12', '01', '02');

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
  ADD PRIMARY KEY (`mabanner`);

--
-- Chỉ mục cho bảng `chitetchuyenbay`
--
ALTER TABLE `chitetchuyenbay`
  ADD KEY `masanbaydi` (`masanbaydi`),
  ADD KEY `machuyenbay` (`machuyenbay`),
  ADD KEY `masanbayden` (`masanbayden`);

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
  ADD PRIMARY KEY (`sdt`);

--
-- Chỉ mục cho bảng `sanbay`
--
ALTER TABLE `sanbay`
  ADD PRIMARY KEY (`masanbay`);

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
-- Các ràng buộc cho bảng `chitetchuyenbay`
--
ALTER TABLE `chitetchuyenbay`
  ADD CONSTRAINT `chitetchuyenbay_ibfk_1` FOREIGN KEY (`masanbaydi`) REFERENCES `sanbay` (`masanbay`),
  ADD CONSTRAINT `chitetchuyenbay_ibfk_2` FOREIGN KEY (`machuyenbay`) REFERENCES `chuyenbay` (`machuyenbay`),
  ADD CONSTRAINT `chitetchuyenbay_ibfk_3` FOREIGN KEY (`masanbayden`) REFERENCES `sanbay` (`masanbay`);

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
