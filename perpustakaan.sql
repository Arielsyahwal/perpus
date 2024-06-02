-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jun 2024 pada 23.09
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `kode_buku` varchar(16) NOT NULL,
  `judul_buku` varchar(30) NOT NULL,
  `penerbit` varchar(20) NOT NULL,
  `pengarang` varchar(30) NOT NULL,
  `thn_terbit` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`kode_buku`, `judul_buku`, `penerbit`, `pengarang`, `thn_terbit`) VALUES
('001', 'Hujan', 'Gramedia', 'Tere Liye', '2008'),
('002', 'In A Blue Moon', 'Gramedia', 'Liana Tan', '2012'),
('003', 'Melukis Bulan Januari', 'Kosana Publisher', 'Fitri Asri Nur Fatimah, dkk', '2019'),
('004', 'Harry Potter', 'Gramedia', 'JK Rowling', '2000'),
('005', 'Laskar Pelangi', 'Bentang Pustaka', 'Andrea Hirata', '2000'),
('006', 'Filosofi Teras', 'Kompas', 'Henry Manampiring', '2015'),
('007', 'Laut Bercerita', 'Gramedia', 'Leila S. Chudori', '2017'),
('008', 'Bumi', 'Gramedia', 'Tere Liye', '2014'),
('009', 'Recalling the Memory', 'Bentang Pustaka', 'Sheva S.', '2007'),
('010', 'Loneliness is My Best Friend', 'Gramedia', 'Alvi Syahrin', '2019');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `npm` varchar(16) NOT NULL,
  `nama_mahasiswa` varchar(30) NOT NULL,
  `jurusan` varchar(20) NOT NULL,
  `kelas` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`npm`, `nama_mahasiswa`, `jurusan`, `kelas`) VALUES
('1', 'Fitri (disabled until 30 Juni)', 'SI', '4A'),
('2', 'Ariel', 'SI', '4A'),
('3', 'Farhan', 'SI', '4A');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `nip` varchar(16) NOT NULL,
  `id_users` int(11) NOT NULL,
  `nama_pegawai` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`nip`, `id_users`, `nama_pegawai`) VALUES
('1', 8, 'admin'),
('2', 9, 'Ariel Syahwal'),
('3', 10, 'Farhan Abyan Putra Karim'),
('4', 11, 'Fitri Asri Nur Fatimah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pinjam`
--

CREATE TABLE `pinjam` (
  `id_pinjam` int(11) NOT NULL,
  `kode_buku` varchar(16) NOT NULL,
  `nip` varchar(16) NOT NULL,
  `npm` varchar(16) NOT NULL,
  `tgl_pinjam` date NOT NULL DEFAULT current_timestamp(),
  `tgl_kembali` date DEFAULT NULL,
  `kembali` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pinjam`
--

INSERT INTO `pinjam` (`id_pinjam`, `kode_buku`, `nip`, `npm`, `tgl_pinjam`, `tgl_kembali`, `kembali`) VALUES
(22, '010', '4', '2', '2024-06-03', '2024-06-06', 'n'),
(23, '006', '2', '3', '2024-05-22', '2024-05-25', 'y'),
(24, '005', '2', '2', '2024-05-26', '2024-05-29', 'y'),
(25, '009', '4', '3', '2024-05-30', '2024-06-01', 'y'),
(29, '007', '4', '3', '2024-06-03', '2024-06-06', 'n'),
(30, '009', '4', '2', '2024-06-03', '2024-06-06', 'n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(8, 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(9, 'ariel', '4900d0a19b6894a4a514e9ff3afcc2c0'),
(10, 'farhan', 'd1bbb2af69fd350b6d6bd88655757b47'),
(11, 'fitri', '534a0b7aa872ad1340d0071cbfa38697');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kode_buku`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`npm`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `id_users` (`id_users`);

--
-- Indeks untuk tabel `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD KEY `nip` (`nip`,`npm`),
  ADD KEY `npm` (`npm`),
  ADD KEY `kode_buku` (`kode_buku`) USING BTREE;

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pinjam`
--
ALTER TABLE `pinjam`
  MODIFY `id_pinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `pinjam_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pinjam_ibfk_2` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pinjam_ibfk_3` FOREIGN KEY (`kode_buku`) REFERENCES `buku` (`kode_buku`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
