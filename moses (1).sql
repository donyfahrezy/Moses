-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Feb 2024 pada 00.51
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moses`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail`
--

CREATE TABLE `detail` (
  `iddetail` int(11) NOT NULL,
  `jenis` enum('pasok','distribusi','jual') NOT NULL,
  `jumlah` int(11) NOT NULL,
  `idproduk` char(9) NOT NULL,
  `idtransaksi` char(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail`
--

INSERT INTO `detail` (`iddetail`, `jenis`, `jumlah`, `idproduk`, `idtransaksi`) VALUES
(1, 'pasok', 30, 'PRMOS2681', 'PSMOS1402202442946'),
(2, 'pasok', 100, 'PRMOS3930', 'PSMOS1402202442946'),
(3, 'pasok', 200, 'PRMOS7975', 'PSMOS1402202442946'),
(4, 'distribusi', 10, 'PRMOS2681', 'DSMOS1402202454618'),
(5, 'distribusi', 24, 'PRMOS7975', 'DSMOS1402202454618'),
(6, 'distribusi', 24, 'PRMOS3930', 'DSMOS1402202454618'),
(7, 'distribusi', 10, 'PRMOS2681', 'DSMOS1402202430376'),
(8, 'distribusi', 16, 'PRMOS3930', 'DSMOS1402202430376'),
(9, '', 1, 'PRMOS2681', 'PJMOS1402202470660'),
(10, '', 10, 'PRMOS3930', 'PJMOS1402202470660'),
(11, '', 1, 'PRMOS2681', 'PJMOS1402202443293'),
(12, '', 12, 'PRMOS3930', 'PJMOS1402202443293'),
(13, '', 6, 'PRMOS7975', 'PJMOS1402202443293'),
(14, '', 1, 'PRMOS2681', 'PJMOS1402202479888'),
(15, '', 2, 'PRMOS3930', 'PJMOS1402202479888'),
(16, '', 8, 'PRMOS7975', 'PJMOS1402202479888');

-- --------------------------------------------------------

--
-- Struktur dari tabel `distribusi`
--

CREATE TABLE `distribusi` (
  `idtransaksi` char(18) NOT NULL,
  `waktu` datetime NOT NULL,
  `jenis` enum('pasok','distribusi','jual','pesan') NOT NULL,
  `uraian` text NOT NULL,
  `status` enum('0','1','2','3') NOT NULL,
  `agen` char(9) NOT NULL,
  `idpengguna` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `distribusi`
--

INSERT INTO `distribusi` (`idtransaksi`, `waktu`, `jenis`, `uraian`, `status`, `agen`, `idpengguna`) VALUES
('DSMOS1402202430376', '2024-02-14 08:55:19', 'distribusi', 'contoh askdjabs dkajb', '0', 'PGMOS9543', 'PGMOS3943'),
('DSMOS1402202454618', '2024-02-14 04:57:41', 'pesan', 'contoh keterangan', '0', 'PGMOS1994', 'PGMOS3943'),
('PSMOS1402202442946', '2024-02-13 20:47:55', 'pasok', 'contoh keterangan', '0', '0', 'PGMOS3943');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `idpengguna` char(9) NOT NULL,
  `nama` varchar(63) NOT NULL,
  `jekel` enum('Pria','Wanita') NOT NULL,
  `telepon` char(14) NOT NULL,
  `alamat` text NOT NULL,
  `provinsi` varchar(72) NOT NULL,
  `kabupaten` varchar(72) NOT NULL,
  `kecamatan` varchar(72) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `username` varchar(99) NOT NULL,
  `password` char(32) NOT NULL,
  `level` enum('ad','ds','ag') NOT NULL,
  `status` enum('Aktif','Nonaktif') NOT NULL,
  `inp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`idpengguna`, `nama`, `jekel`, `telepon`, `alamat`, `provinsi`, `kabupaten`, `kecamatan`, `latitude`, `longitude`, `username`, `password`, `level`, `status`, `inp`) VALUES
('PGMOS1701', 'Nama Distributor Batang', 'Pria', '078436044579', 'Gg. K.H. Wahid Hasyim (Kopo) No. 712, Tanjung Pinang 20372, SumBar', 'JAWA TENGAH', 'KAB. PEKALONGAN', '33.26.13_Kedungwuni', -7.071114595031142, 109.88006169962479, 'nama875', 'e10adc3949ba59abbe56e057f20f883e', 'ds', 'Aktif', '2024-02-13 00:31:36'),
('PGMOS1994', 'Dewi', 'Wanita', '085292232665', 'Tambakboyo, Reban', 'JAWA TENGAH', 'KAB. BATANG', '33.25.04_Reban', -7.089887508959551, 109.89001048686362, 'dewi760', 'e10adc3949ba59abbe56e057f20f883e', 'ag', 'Aktif', '2024-02-13 01:16:20'),
('PGMOS3260', 'Primkopad A10', 'Pria', '085878745471', 'Batang', 'JAWA TENGAH', 'KAB. BATANG', '33.25.11_Batang', -7.068487367192496, 109.8774878586695, 'primkopad524', 'e10adc3949ba59abbe56e057f20f883e', 'ag', 'Aktif', '2024-02-13 02:54:48'),
('PGMOS3616', 'Teguh Gita Tri Widodo', 'Pria', '082322100022', 'Jl. Raya Limpung Reban RT.01 RW.02', 'JAWA TENGAH', 'KAB. BATANG', '33.25.04_Reban', -6.921763035879063, 109.75854855157303, 'teguh856', 'e10adc3949ba59abbe56e057f20f883e', 'ag', 'Aktif', '2024-02-13 03:04:31'),
('PGMOS3943', 'Nama Distributor Reban', 'Pria', '0880653565', 'Kpg. Pasteur No. 49, Cirebon 15201, KalTim', 'JAWA TENGAH', 'KAB. BATANG', '33.25.04_Reban', -6.9079772142545615, 109.73535790051925, 'nama957', 'e10adc3949ba59abbe56e057f20f883e', 'ds', 'Aktif', '2024-02-13 20:35:59'),
('PGMOS6084', 'Rohani', 'Pria', '085229520611', 'Akasia 8/11 RT04 RW09, Kauman', 'JAWA TENGAH', 'KAB. BATANG', '33.25.11_Batang', -6.905573375855655, 109.73104636827962, 'rohani760', 'e10adc3949ba59abbe56e057f20f883e', 'ag', 'Aktif', '2024-02-13 02:59:51'),
('PGMOS6961', 'Thohiri', 'Pria', '085869222109', 'Gajah Mada Gg. Perkutut 17 RT 4/4', 'JAWA TENGAH', 'KAB. BATANG', '33.25.11_Batang', -6.945055278926518, 109.70003696610941, 'thohiri814', 'e10adc3949ba59abbe56e057f20f883e', 'ag', 'Aktif', '2024-02-13 03:06:41'),
('PGMOS8555', 'Herman Susilo (Toko Mandiri)', 'Pria', '082314713090', 'Cendana No. 45, RT 2/2, Limpung', 'JAWA TENGAH', 'KAB. BATANG', '33.25.08_Limpung', -7.042213525191896, 109.9007493566124, 'herman340', 'e10adc3949ba59abbe56e057f20f883e', 'ag', 'Aktif', '2024-02-13 01:20:20'),
('PGMOS8716', 'Indri', 'Wanita', '08112610710', 'Perumahan Pisma Griya, Terban Blok B.16', 'JAWA TENGAH', 'KAB. BATANG', '33.25.04_Reban', -7.065601134476628, 109.85408538205435, 'indri499', 'e10adc3949ba59abbe56e057f20f883e', 'ag', 'Aktif', '2024-02-13 01:25:19'),
('PGMOS9543', 'Damiri Anjar Kuntoro', 'Pria', '085326881147', 'Dukuh Pacet Baru RT 05/02', 'JAWA TENGAH', 'KAB. BATANG', '33.25.01_Wonotunggal', -7.105281670927103, 109.91208009860281, 'damiri836', 'e10adc3949ba59abbe56e057f20f883e', 'ag', 'Aktif', '2024-02-13 01:02:19'),
('PGMOS9804', 'Castro Sudirjo', 'Pria', '085869023343', 'Dk. Selokarto RT 01 / 02, Pecalungan', 'JAWA TENGAH', 'KAB. MAGELANG', '33.08.04_Salam', -7.064762833685193, 109.76737276705681, 'castro865', 'e10adc3949ba59abbe56e057f20f883e', 'ag', 'Aktif', '2024-02-13 00:55:43'),
('PGMOS9999', 'Administrator', 'Pria', '081388045977', 'JL. Puri Anjasmoro H5 No.3, Semarang 50144, Indonesia', '', '', 'Batang', 0, 0, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'ad', 'Aktif', '2024-02-13 09:02:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `idtransaksi` char(18) NOT NULL,
  `waktu` datetime NOT NULL,
  `uraian` text NOT NULL,
  `idpengguna` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`idtransaksi`, `waktu`, `uraian`, `idpengguna`) VALUES
('PJMOS1402202443293', '2024-02-14 09:07:28', '-', 'PGMOS1994'),
('PJMOS1402202470660', '2024-02-14 09:01:42', '-', 'PGMOS9543'),
('PJMOS1402202479888', '2024-02-14 09:07:40', '-', 'PGMOS1994');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `idproduk` char(9) NOT NULL,
  `nama` varchar(36) NOT NULL,
  `isi` float NOT NULL,
  `satuanisi` char(2) NOT NULL,
  `satuankemasan` char(9) NOT NULL,
  `status` enum('Aktif','Nonaktif') NOT NULL,
  `inp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`idproduk`, `nama`, `isi`, `satuanisi`, `satuankemasan`, `status`, `inp`) VALUES
('PRMOS2681', 'Galon 19L', 19, 'l', 'Galon', 'Aktif', '2024-02-12 19:58:57'),
('PRMOS3930', 'Botol 1000ml', 1000, 'ml', 'Botol', 'Aktif', '2024-02-12 19:59:53'),
('PRMOS5505', 'Botol 330ml', 330, 'ml', 'Botol', 'Aktif', '2024-02-12 20:00:25'),
('PRMOS7146', 'Cup 240ml', 240, 'ml', 'Cup', 'Aktif', '2024-02-12 19:58:47'),
('PRMOS7975', 'Botol 600ml', 600, 'ml', 'Botol', 'Aktif', '2024-02-12 20:00:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok`
--

CREATE TABLE `stok` (
  `idstok` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `idproduk` char(9) NOT NULL,
  `idpengguna` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `stok`
--

INSERT INTO `stok` (`idstok`, `stok`, `idproduk`, `idpengguna`) VALUES
(1, 10, 'PRMOS2681', 'PGMOS3943'),
(2, 60, 'PRMOS3930', 'PGMOS3943'),
(3, 176, 'PRMOS7975', 'PGMOS3943'),
(4, 8, 'PRMOS2681', 'PGMOS1994'),
(5, 10, 'PRMOS7975', 'PGMOS1994'),
(6, 10, 'PRMOS3930', 'PGMOS1994'),
(7, 9, 'PRMOS2681', 'PGMOS9543'),
(8, 6, 'PRMOS3930', 'PGMOS9543');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`iddetail`);

--
-- Indeks untuk tabel `distribusi`
--
ALTER TABLE `distribusi`
  ADD PRIMARY KEY (`idtransaksi`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`idpengguna`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`idtransaksi`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`);

--
-- Indeks untuk tabel `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`idstok`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail`
--
ALTER TABLE `detail`
  MODIFY `iddetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `stok`
--
ALTER TABLE `stok`
  MODIFY `idstok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
