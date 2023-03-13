-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2023 at 02:45 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry_arlinka`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` double NOT NULL,
  `total_harga` double NOT NULL,
  `keterangan` text NOT NULL,
  `total_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `id_transaksi`, `id_paket`, `qty`, `total_harga`, `keterangan`, `total_bayar`) VALUES
(16, 36, 20, 20, 44000, '', 500000),
(17, 37, 20, 50, 110000, '', 200000),
(18, 39, 21, 15, 21000, '', 25000),
(19, 40, 20, 10, 22000, '', 22000),
(20, 41, 20, 10, 22000, '', 50000),
(21, 42, 22, 10, 15000, '', 0),
(22, 43, 22, 2, 3000, '', 0),
(23, 44, 22, 2, 3000, '', 0),
(24, 45, 22, 2, 3000, '', 0),
(25, 46, 22, 2, 3000, '', 0),
(26, 47, 22, 2, 3000, '', 0),
(27, 48, 22, 1, 1500, '', 0),
(28, 49, 22, 1, 1500, '', 0),
(29, 50, 22, 10, 15000, '', 0),
(30, 56, 22, 2, 3000, '', 0),
(31, 57, 22, 2, 3000, '', 0),
(32, 58, 22, 1, 1500, '', 0),
(33, 59, 22, 2, 3000, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `outlet`
--

CREATE TABLE `outlet` (
  `id_outlet` int(11) NOT NULL,
  `nama_outlet` varchar(228) CHARACTER SET utf8mb4 DEFAULT NULL,
  `alamat_outlet` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `telp_outlet` varchar(15) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `outlet`
--

INSERT INTO `outlet` (`id_outlet`, `nama_outlet`, `alamat_outlet`, `telp_outlet`) VALUES
(9, 'Outlet Merah', 'Yogyakarta, Indonesia', '08555555555'),
(10, 'Outlet Putih', 'Bantul, Yogyakarta, Indonesia', '081222222222'),
(11, 'Outlet Biru', 'Bantul, Daerah Istimewa Yogyakarta', '081223446312');

-- --------------------------------------------------------

--
-- Table structure for table `paket_cuci`
--

CREATE TABLE `paket_cuci` (
  `id_paket` int(11) NOT NULL,
  `jenis_paket` enum('kiloan','selimut','bedcover','kaos','lain') NOT NULL,
  `nama_paket` varchar(228) NOT NULL,
  `harga` int(11) NOT NULL,
  `outlet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paket_cuci`
--

INSERT INTO `paket_cuci` (`id_paket`, `jenis_paket`, `nama_paket`, `harga`, `outlet_id`) VALUES
(20, 'kiloan', 'Paket Wangi Tahan Lama', 22000, 9),
(21, 'kaos', 'Paket Cepat Kering', 1400, 10),
(22, 'selimut', 'Paket Harum', 1500, 11),
(23, 'kiloan', 'Paket Kering Wangi', 2500, 9),
(24, 'selimut', 'Paket Selimut', 15000, 9);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(228) NOT NULL,
  `alamat_pelanggan` text NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `telp_pelanggan` varchar(15) NOT NULL,
  `no_ktp` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `jenis_kelamin`, `telp_pelanggan`, `no_ktp`) VALUES
(23, 'Aline', 'Jakarta', 'P', '0888884434', '123456789'),
(24, 'Haikal', 'Bandung', 'L', '08393931', '0987654321'),
(26, 'Arga', 'Jakarta', 'L', '089544353', '193456789');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `kode_invoice` varchar(228) CHARACTER SET utf8mb4 DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `tgl` datetime DEFAULT NULL,
  `batas_waktu` datetime DEFAULT NULL,
  `tgl_pembayaran` datetime DEFAULT NULL,
  `biaya_tambahan` int(11) DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `pajak` int(11) DEFAULT NULL,
  `status` enum('baru','proses','selesai','diambil') CHARACTER SET utf8mb4 DEFAULT NULL,
  `status_bayar` enum('dibayar','belum') CHARACTER SET utf8mb4 DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `outlet_id`, `kode_invoice`, `id_pelanggan`, `tgl`, `batas_waktu`, `tgl_pembayaran`, `biaya_tambahan`, `diskon`, `pajak`, `status`, `status_bayar`, `id_user`) VALUES
(36, 9, 'CLN202009033737', 23, '2020-09-03 04:37:43', '2020-09-10 12:00:00', '2020-09-03 04:40:03', 0, 0, 0, 'baru', 'dibayar', 1),
(37, 9, 'CLN202009035702', 23, '2020-09-03 05:03:37', '2020-09-10 12:00:00', '2020-09-03 05:08:28', 0, 0, 0, 'baru', 'dibayar', 1),
(39, 10, 'CLN202009034317', 24, '2020-09-03 05:19:12', '2020-09-10 12:00:00', '2020-09-03 05:21:41', 0, 0, 0, 'baru', 'dibayar', 7),
(40, 9, 'CLN202009040521', 24, '2020-09-04 03:21:09', '2020-09-11 12:00:00', '2023-02-09 01:29:58', 0, 0, 0, 'diambil', 'dibayar', 1),
(41, 9, 'CLN202009040528', NULL, '2020-09-04 03:28:21', '2020-09-11 12:00:00', '2020-09-04 03:29:00', 0, 0, 0, 'selesai', 'dibayar', 1),
(42, 11, 'CLN202302090032', 26, '2023-02-09 01:32:19', '2023-02-16 12:00:00', NULL, 50, 0, 0, 'baru', 'belum', NULL),
(43, 11, 'CLN202302090314', 26, '2023-02-09 02:14:24', '2023-02-16 12:00:00', NULL, 0, 0, 10, 'baru', 'belum', NULL),
(44, 11, 'CLN202302094614', 24, '2023-02-09 02:14:53', '2023-02-16 12:00:00', NULL, 0, 0, 10, 'baru', 'belum', NULL),
(45, 11, 'CLN202302094017', 26, '2023-02-09 02:18:00', '2023-02-16 12:00:00', NULL, 0, 0, 10, 'baru', 'belum', NULL),
(46, 11, 'CLN202302090523', 26, '2023-02-09 02:23:15', '2023-02-16 12:00:00', NULL, 0, 0, 10, 'baru', 'belum', NULL),
(47, 11, 'CLN202302090927', 26, '2023-02-09 02:27:17', '2023-02-16 12:00:00', NULL, 0, 0, 10, 'baru', 'belum', NULL),
(48, 11, 'CLN202302094928', 26, '2023-02-09 02:28:58', '2023-02-16 12:00:00', NULL, 0, 0, 10, 'baru', 'belum', NULL),
(49, 11, 'CLN202302095730', 26, '2023-02-09 02:31:00', '2023-02-16 12:00:00', NULL, 0, 0, 10, 'baru', 'belum', NULL),
(50, 11, 'CLN202302091231', 26, '2023-02-09 02:31:17', '2023-02-16 12:00:00', NULL, 0, 0, 0, 'baru', 'belum', NULL),
(51, 11, 'CLN202302090146', 26, '2023-02-09 02:46:22', '2023-02-16 12:00:00', NULL, 0, 0, 0, 'baru', 'belum', NULL),
(52, 11, 'CLN202302090146', 26, '2023-02-09 02:46:44', '2023-02-16 12:00:00', NULL, 0, 0, 0, 'baru', 'belum', NULL),
(53, 11, 'CLN202302094546', 26, '2023-02-09 02:46:47', '2023-02-16 12:00:00', NULL, 0, 0, 0, 'baru', 'belum', NULL),
(54, 11, 'CLN202302094546', 26, '2023-02-09 02:46:50', '2023-02-16 12:00:00', NULL, 0, 0, 0, 'baru', 'belum', NULL),
(55, 11, 'CLN202302094546', 26, '2023-02-09 02:47:05', '2023-02-16 12:00:00', NULL, 0, 0, 0, 'baru', 'belum', NULL),
(56, 11, 'CLN202302094948', 24, '2023-02-09 02:48:58', '2023-02-16 12:00:00', NULL, 0, 0, 10, 'baru', 'belum', NULL),
(57, 11, 'CLN202302091556', 26, '2023-02-09 02:56:29', '2023-02-16 12:00:00', NULL, 0, 10, 10, 'baru', 'belum', NULL),
(58, 11, 'CLN202302091357', 24, '2023-02-09 02:57:37', '2023-02-16 12:00:00', NULL, 0, 10, 10, 'baru', 'belum', NULL),
(59, 11, 'CLN202302095659', 26, '2023-02-09 03:00:16', '2023-02-16 12:00:00', NULL, 0, 10, 10, 'baru', 'belum', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(228) CHARACTER SET utf8mb4 DEFAULT NULL,
  `username` varchar(228) CHARACTER SET utf8mb4 DEFAULT NULL,
  `password` varchar(228) CHARACTER SET utf8mb4 DEFAULT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `role` enum('admin','kasir','owner') CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `outlet_id`, `role`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 9, 'admin'),
(7, 'Kasir Putih', 'kasirputih', '2443e07a602220051698d22bdc6ac718', 11, 'kasir'),
(12, 'owner', 'owner', '72122ce96bfec66e2396d2e25225d70a', 10, 'owner');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_paket` (`id_paket`);

--
-- Indexes for table `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indexes for table `paket_cuci`
--
ALTER TABLE `paket_cuci`
  ADD PRIMARY KEY (`id_paket`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id_outlet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `paket_cuci`
--
ALTER TABLE `paket_cuci`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_3` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_ibfk_4` FOREIGN KEY (`id_paket`) REFERENCES `paket_cuci` (`id_paket`) ON UPDATE CASCADE;

--
-- Constraints for table `paket_cuci`
--
ALTER TABLE `paket_cuci`
  ADD CONSTRAINT `paket_cuci_ibfk_1` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paket_cuci_ibfk_2` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_5` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_6` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
