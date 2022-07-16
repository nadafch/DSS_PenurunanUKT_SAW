-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Des 2020 pada 10.46
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dsspenurunanukt`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `alternatif`
--

CREATE TABLE `alternatif` (
  `id_alternatif` int(11) NOT NULL,
  `nm_alternatif` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `alternatif`
--

INSERT INTO `alternatif` (`id_alternatif`, `nm_alternatif`) VALUES
(1, 'golongan 1'),
(2, 'golongan 2'),
(3, 'golongan 3');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `bagi`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `bagi` (
`id_kriteria` int(11)
,`sifat` enum('benefit','cost')
,`bobot` int(11)
,`bagi` bigint(11)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bobot`
--

CREATE TABLE `bobot` (
  `id_bobot` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `sifat` enum('benefit','cost') NOT NULL,
  `bobot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bobot`
--

INSERT INTO `bobot` (`id_bobot`, `id_kriteria`, `sifat`, `bobot`) VALUES
(1, 1, 'benefit', 6),
(2, 2, 'cost', 5),
(3, 3, 'benefit', 5),
(4, 4, 'cost', 3),
(5, 5, 'cost', 2),
(6, 6, 'cost', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `nm_kriteria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `nm_kriteria`) VALUES
(1, 'IPK'),
(2, 'Gaji Ortu'),
(3, 'Tanggungan Ortu'),
(4, 'Listrik'),
(5, 'PBB'),
(6, 'kepimilikan kendaraan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `fakultas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jurusan`, `fakultas`) VALUES
('18650000', 'Hanbin', 'TA', 'Saintek'),
('18650099', 'Nada Filsa', 'TI', 'Saintek');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `normalisasi`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `normalisasi` (
`id_nilai` int(11)
,`nim` char(11)
,`id_kriteria` int(11)
,`id_alternatif` int(11)
,`id_bobot` int(11)
,`id_skala` int(11)
,`value_skala` int(11)
,`sifat` enum('benefit','cost')
,`bagi` bigint(11)
,`normalisasi` decimal(23,4)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian`
--

CREATE TABLE `penilaian` (
  `id_penilaian` int(11) NOT NULL,
  `nim` char(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `id_alternatif` int(11) NOT NULL,
  `id_bobot` int(11) NOT NULL,
  `id_skala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penilaian`
--

INSERT INTO `penilaian` (`id_penilaian`, `nim`, `id_kriteria`, `id_alternatif`, `id_bobot`, `id_skala`) VALUES
(7, '18650099', 1, 1, 1, 2),
(8, '18650099', 2, 1, 2, 6),
(9, '18650099', 3, 1, 3, 9),
(10, '18650099', 4, 1, 4, 11),
(11, '18650099', 5, 1, 5, 14),
(12, '18650099', 6, 1, 6, 17),
(13, '18650099', 1, 2, 1, 3),
(14, '18650099', 2, 2, 2, 5),
(15, '18650099', 3, 2, 3, 9),
(16, '18650099', 4, 2, 4, 11),
(17, '18650099', 5, 2, 5, 14),
(18, '18650099', 6, 2, 6, 17),
(19, '18650099', 1, 3, 1, 2),
(20, '18650099', 2, 3, 2, 5),
(21, '18650099', 3, 3, 3, 9),
(22, '18650099', 4, 3, 4, 11),
(23, '18650099', 5, 3, 5, 14),
(24, '18650099', 6, 3, 6, 17);

-- --------------------------------------------------------

--
-- Struktur dari tabel `register`
--

CREATE TABLE `register` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `register`
--

INSERT INTO `register` (`username`, `password`, `nama`, `email`) VALUES
('0', '0', '0', '0'),
('nada', 'Nada Filsa Chaitra', '81dc9bdb52d04dc20036dbd8313ed055', 'nadafilsa@gmail.com'),
('petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 'petugas', 'petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `skala`
--

CREATE TABLE `skala` (
  `id_skala` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `nm_skala` varchar(100) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `skala`
--

INSERT INTO `skala` (`id_skala`, `id_kriteria`, `keterangan`, `nm_skala`, `value`) VALUES
(1, 1, '2,0 - 2,5', 'rendah', 1),
(2, 1, '2,6 - 3,5', 'sedang', 2),
(3, 1, '3,6 - 4,0', 'Tinggi', 3),
(4, 2, 'kurang dari < 1.000.000', 'rendah', 1),
(5, 2, '1.000.000 - 3.000.000', 'Sedang', 2),
(6, 2, 'diatas > 3.000.000', 'Atas', 3),
(7, 3, '1-2 Orang', 'Rendah', 1),
(8, 3, '3-4 Orang', 'Sedang', 2),
(9, 3, 'lebih > 4 Orang', 'Atas', 3),
(10, 4, 'kurang < 50.000', 'Rendah', 1),
(11, 4, '50.000 - 150.000', 'Sedang', 2),
(12, 4, 'lebih > 150.000', 'Atas', 3),
(13, 5, 'kurang < 50.000', 'Rendah', 1),
(14, 5, '50.000 - 150.000', 'Sedang', 2),
(15, 5, 'lebih > 150.000', 'atas', 3),
(16, 6, 'tidak ada / 1 kendaraan', 'Rendah', 1),
(17, 6, '2-3 kendaraan', 'Sedang', 2),
(18, 5, 'lebih > 3 kendaraan', 'atas', 3);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `terbobot`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `terbobot` (
`id_nilai` int(11)
,`nim` char(11)
,`id_kriteria` int(11)
,`id_alternatif` int(11)
,`id_bobot` int(11)
,`id_skala` int(11)
,`value_skala` int(11)
,`bagi` bigint(11)
,`normalisasi` decimal(23,4)
,`terbobot` decimal(33,4)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `bagi`
--
DROP TABLE IF EXISTS `bagi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bagi`  AS  select `penilaian`.`id_kriteria` AS `id_kriteria`,`bobot`.`sifat` AS `sifat`,(select `bobot`.`bobot` from `bobot` where `bobot`.`id_kriteria` = `kriteria`.`id_kriteria`) AS `bobot`,round(if(`bobot`.`sifat` = 'benefit',max(`skala`.`value`),min(`skala`.`value`)),1) AS `bagi` from (((`penilaian` join `skala`) join `kriteria`) join `bobot` on(`penilaian`.`id_bobot` = `bobot`.`id_bobot`)) where `skala`.`id_skala` = `penilaian`.`id_skala` and `kriteria`.`id_kriteria` = `penilaian`.`id_kriteria` group by `kriteria`.`id_kriteria` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `normalisasi`
--
DROP TABLE IF EXISTS `normalisasi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `normalisasi`  AS  select `penilaian`.`id_penilaian` AS `id_nilai`,`penilaian`.`nim` AS `nim`,`penilaian`.`id_kriteria` AS `id_kriteria`,`penilaian`.`id_alternatif` AS `id_alternatif`,`penilaian`.`id_bobot` AS `id_bobot`,`skala`.`id_skala` AS `id_skala`,`skala`.`value` AS `value_skala`,`bobot`.`sifat` AS `sifat`,`bagi`.`bagi` AS `bagi`,if(`bobot`.`sifat` = 'benefit',`skala`.`value` / `bagi`.`bagi`,`bagi`.`bagi` / `skala`.`value`) AS `normalisasi` from (((`penilaian` join `bagi`) join `skala`) join `bobot` on(`penilaian`.`id_bobot` = `bobot`.`id_bobot`)) where `penilaian`.`id_skala` = `skala`.`id_skala` and `bagi`.`id_kriteria` = `penilaian`.`id_kriteria` group by `penilaian`.`id_penilaian` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `terbobot`
--
DROP TABLE IF EXISTS `terbobot`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `terbobot`  AS  select `normalisasi`.`id_nilai` AS `id_nilai`,`normalisasi`.`nim` AS `nim`,`normalisasi`.`id_kriteria` AS `id_kriteria`,`normalisasi`.`id_alternatif` AS `id_alternatif`,`normalisasi`.`id_bobot` AS `id_bobot`,`normalisasi`.`id_skala` AS `id_skala`,`normalisasi`.`value_skala` AS `value_skala`,`normalisasi`.`bagi` AS `bagi`,`normalisasi`.`normalisasi` AS `normalisasi`,`normalisasi`.`value_skala` * `normalisasi`.`normalisasi` AS `terbobot` from `normalisasi` group by `normalisasi`.`id_alternatif`,`normalisasi`.`nim` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id_alternatif`);

--
-- Indeks untuk tabel `bobot`
--
ALTER TABLE `bobot`
  ADD PRIMARY KEY (`id_bobot`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id_penilaian`),
  ADD KEY `id_kasus` (`nim`,`id_alternatif`,`id_bobot`,`id_skala`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_skala` (`id_skala`),
  ADD KEY `id_bobot` (`id_bobot`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `skala`
--
ALTER TABLE `skala`
  ADD PRIMARY KEY (`id_skala`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id_alternatif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `bobot`
--
ALTER TABLE `bobot`
  MODIFY `id_bobot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `skala`
--
ALTER TABLE `skala`
  MODIFY `id_skala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bobot`
--
ALTER TABLE `bobot`
  ADD CONSTRAINT `bobot_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);

--
-- Ketidakleluasaan untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`),
  ADD CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  ADD CONSTRAINT `penilaian_ibfk_3` FOREIGN KEY (`id_skala`) REFERENCES `skala` (`id_skala`),
  ADD CONSTRAINT `penilaian_ibfk_4` FOREIGN KEY (`id_bobot`) REFERENCES `bobot` (`id_bobot`),
  ADD CONSTRAINT `penilaian_ibfk_5` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);

--
-- Ketidakleluasaan untuk tabel `skala`
--
ALTER TABLE `skala`
  ADD CONSTRAINT `skala_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
