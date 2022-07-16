-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Des 2020 pada 10.47
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
-- Struktur untuk view `bagi`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bagi`  AS  select `penilaian`.`id_kriteria` AS `id_kriteria`,`bobot`.`sifat` AS `sifat`,(select `bobot`.`bobot` from `bobot` where `bobot`.`id_kriteria` = `kriteria`.`id_kriteria`) AS `bobot`,round(if(`bobot`.`sifat` = 'benefit',max(`skala`.`value`),min(`skala`.`value`)),1) AS `bagi` from (((`penilaian` join `skala`) join `kriteria`) join `bobot` on(`penilaian`.`id_bobot` = `bobot`.`id_bobot`)) where `skala`.`id_skala` = `penilaian`.`id_skala` and `kriteria`.`id_kriteria` = `penilaian`.`id_kriteria` group by `kriteria`.`id_kriteria` ;

--
-- VIEW  `bagi`
-- Data: Tidak ada
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
