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
-- Struktur untuk view `normalisasi`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `normalisasi`  AS  select `penilaian`.`id_penilaian` AS `id_nilai`,`penilaian`.`nim` AS `nim`,`penilaian`.`id_kriteria` AS `id_kriteria`,`penilaian`.`id_alternatif` AS `id_alternatif`,`penilaian`.`id_bobot` AS `id_bobot`,`skala`.`id_skala` AS `id_skala`,`skala`.`value` AS `value_skala`,`bobot`.`sifat` AS `sifat`,`bagi`.`bagi` AS `bagi`,if(`bobot`.`sifat` = 'benefit',`skala`.`value` / `bagi`.`bagi`,`bagi`.`bagi` / `skala`.`value`) AS `normalisasi` from (((`penilaian` join `bagi`) join `skala`) join `bobot` on(`penilaian`.`id_bobot` = `bobot`.`id_bobot`)) where `penilaian`.`id_skala` = `skala`.`id_skala` and `bagi`.`id_kriteria` = `penilaian`.`id_kriteria` group by `penilaian`.`id_penilaian` ;

--
-- VIEW  `normalisasi`
-- Data: Tidak ada
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
