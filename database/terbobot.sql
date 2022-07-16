-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Des 2020 pada 14.49
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
-- Struktur untuk view `terbobot`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `terbobot`  AS  select `normalisasi`.`id_nilai` AS `id_nilai`,`normalisasi`.`nim` AS `nim`,`normalisasi`.`id_kriteria` AS `id_kriteria`,`normalisasi`.`id_alternatif` AS `id_alternatif`,`normalisasi`.`id_bobot` AS `id_bobot`,`normalisasi`.`id_skala` AS `id_skala`,`normalisasi`.`value_skala` AS `value_skala`,`normalisasi`.`bagi` AS `bagi`,`normalisasi`.`normalisasi` AS `normalisasi`,`normalisasi`.`value_skala` * `normalisasi`.`normalisasi` AS `terbobot` from `normalisasi` group by `normalisasi`.`id_alternatif`,`normalisasi`.`nim` ;

--
-- VIEW  `terbobot`
-- Data: Tidak ada
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
