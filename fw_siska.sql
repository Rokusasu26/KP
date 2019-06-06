-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jun 2019 pada 12.44
-- Versi server: 10.1.35-MariaDB
-- Versi PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fw_siska`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ekstra`
--

CREATE TABLE `ekstra` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) CHARACTER SET utf8 NOT NULL,
  `jenis` enum('Organisasi','Kepanitiaan') CHARACTER SET utf8 NOT NULL,
  `aktif` enum('Y','T') CHARACTER SET utf8 DEFAULT NULL,
  `ruang_lingkup_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ekstra`
--

INSERT INTO `ekstra` (`id`, `nama`, `jenis`, `aktif`, `ruang_lingkup_id`) VALUES
(2, 'Dekan Cup 2018', '', 'Y', 1),
(3, 'BEM Fakultas Psikologi', 'Organisasi', 'Y', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ekstra_mahasiswa`
--

CREATE TABLE `ekstra_mahasiswa` (
  `user_id` varchar(20) CHARACTER SET utf8 NOT NULL,
  `ekstra_id` int(11) NOT NULL,
  `posisi_id` int(11) NOT NULL,
  `bukti` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `status` enum('diterima','diproses','ditolak') CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `groupprivilege`
--

CREATE TABLE `groupprivilege` (
  `kodeGroup` varchar(10) NOT NULL,
  `kodeMenu` varchar(20) NOT NULL,
  `level` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `groupprivilege`
--

INSERT INTO `groupprivilege` (`kodeGroup`, `kodeMenu`, `level`) VALUES
('ADMIN', '1', 90),
('ADMIN', '99', 90),
('ADMIN', '99.1', 90),
('ADMIN', '99.10', 90),
('ADMIN', '99.2', 90),
('ADMIN', '99.3', 90),
('ADMIN', '99.4', 90),
('ADMIN', '99.6', 90),
('ADMIN', '99.7', 90),
('ADMIN', '99.8', 90),
('ADMIN', '99.9', 90),
('STUDENT', '1', 90),
('STUDENT', '2', 90),
('STUDENT', '2.1', 90),
('STUDENT', '2.2', 90);

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `kodeGroup` varchar(10) NOT NULL,
  `nama` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `groups`
--

INSERT INTO `groups` (`kodeGroup`, `nama`) VALUES
('ADMIN', 'ADMINISTRATOR'),
('STUDENT', 'STUDENT');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kompetensi`
--

CREATE TABLE `kompetensi` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `deskripsi` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `jenis` enum('ekstra','intra') CHARACTER SET utf8 DEFAULT NULL,
  `aktif` enum('Y','T') CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kompetensi`
--

INSERT INTO `kompetensi` (`id`, `nama`, `deskripsi`, `level`, `jenis`, `aktif`) VALUES
(1, 'Kepemimpinan', 'something else else', 1, 'ekstra', 'Y'),
(2, 'Kejujuran', 'something something', 0, '', 'T');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `kodeMenu` varchar(20) NOT NULL,
  `judul` varchar(25) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `aktif` enum('Y','T') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`kodeMenu`, `judul`, `link`, `aktif`) VALUES
('1', 'Beranda', '', 'Y'),
('2', 'Pengajuan', '#', 'Y'),
('2.1', 'Ekstrakurikuler', 'view/pengajuan-ekstra', 'Y'),
('2.2', 'PKM', 'view/pengajuan-pkm', 'Y'),
('99', 'Pengaturan', '#', 'Y'),
('99.1', 'Menu', 'view/menu_list', 'Y'),
('99.10', 'Kompetensi', 'view/kompetensi_list', 'Y'),
('99.2', 'Group User', 'view/userGroup_list', 'Y'),
('99.3', 'User', 'view/user_list', 'Y'),
('99.4', 'Group', 'view/group_list', 'Y'),
('99.5', 'Setting', 'view/setting_list', 'Y'),
('99.6', 'Ruang Lingkup', 'view/ruangLingkup_list', 'Y'),
('99.7', 'Posisi', 'view/posisi_list', 'Y'),
('99.8', 'Ekstrakurikuler', 'view/ekstra_list', 'Y'),
('99.9', 'PKM', 'view/pkm_list', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pkm`
--

CREATE TABLE `pkm` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `aktif` enum('Y','T') CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pkm`
--

INSERT INTO `pkm` (`id`, `nama`, `aktif`) VALUES
(1, 'Pekan Ilmiah Mahasiswa UBAYA 2018', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pkm_mahasiswa`
--

CREATE TABLE `pkm_mahasiswa` (
  `user_id` varchar(20) CHARACTER SET utf8 NOT NULL,
  `pkm_id` int(11) NOT NULL,
  `lolos_ubaya` enum('Y','T') DEFAULT NULL,
  `lolos_nasional` enum('Y','T') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `posisi`
--

CREATE TABLE `posisi` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) CHARACTER SET utf8 NOT NULL,
  `aktif` enum('Y','T') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `posisi`
--

INSERT INTO `posisi` (`id`, `nama`, `aktif`) VALUES
(1, 'Penanggung Jawab', 'Y'),
(2, 'Ketua', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang_lingkup`
--

CREATE TABLE `ruang_lingkup` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `aktif` enum('Y','T') CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ruang_lingkup`
--

INSERT INTO `ruang_lingkup` (`id`, `nama`, `aktif`) VALUES
(1, 'Fakultas', 'Y'),
(2, 'Universitas', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sertifikat`
--

CREATE TABLE `sertifikat` (
  `user_id` varchar(20) CHARACTER SET utf8 NOT NULL,
  `kompetensi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `syarat_ekstra`
--

CREATE TABLE `syarat_ekstra` (
  `id` int(11) NOT NULL,
  `jenis` enum('organisasi','kepanitiaan','keduanya') CHARACTER SET utf8 DEFAULT NULL,
  `ruang_lingkup_id` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `posisi_id` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `jumlah_min` int(11) DEFAULT NULL,
  `kompetensi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `syarat_ekstra`
--

INSERT INTO `syarat_ekstra` (`id`, `jenis`, `ruang_lingkup_id`, `posisi_id`, `jumlah_min`, `kompetensi_id`) VALUES
(3, 'kepanitiaan', '1', '2', 1, 1),
(5, '', '1', '1', 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `kodeUser` varchar(20) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `aktif` enum('Y','T') DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`kodeUser`, `nama`, `aktif`, `password`) VALUES
('119', 'Wisnu', 'Y', 'c362fc386d4bc0ba7f10572f9b038e0b67ffcdaa08239b731294f9e4c8a9a0c0d5c64ce554743dcd863f227db02e472958bf5a9360c6de0c1739eb5135344910'),
('Umum', 'Umum', 'Y', '54b295cfe5ad72949790cc477f2e26d916c398218082bd5febc9cbeeb9095694c57f11b525652d47198ed4a25a6c48968750c581d12dbfc6f837038b067379e8');

-- --------------------------------------------------------

--
-- Struktur dari tabel `usergroup`
--

CREATE TABLE `usergroup` (
  `iduserGroup` int(11) NOT NULL,
  `kodeGroup` varchar(10) NOT NULL,
  `kodeUser` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `usergroup`
--

INSERT INTO `usergroup` (`iduserGroup`, `kodeGroup`, `kodeUser`) VALUES
(1, 'ADMIN', 'Umum'),
(3, 'STUDENT', '119');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ekstra`
--
ALTER TABLE `ekstra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ruang_lingkup_id` (`ruang_lingkup_id`);

--
-- Indeks untuk tabel `ekstra_mahasiswa`
--
ALTER TABLE `ekstra_mahasiswa`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ekstra_id` (`ekstra_id`),
  ADD KEY `posisi_id` (`posisi_id`);

--
-- Indeks untuk tabel `groupprivilege`
--
ALTER TABLE `groupprivilege`
  ADD PRIMARY KEY (`kodeGroup`,`kodeMenu`),
  ADD KEY `fk_groups_has_menu_menu1` (`kodeMenu`),
  ADD KEY `fk_groups_has_menu_groups1` (`kodeGroup`);

--
-- Indeks untuk tabel `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`kodeGroup`);

--
-- Indeks untuk tabel `kompetensi`
--
ALTER TABLE `kompetensi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`kodeMenu`);

--
-- Indeks untuk tabel `pkm`
--
ALTER TABLE `pkm`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pkm_mahasiswa`
--
ALTER TABLE `pkm_mahasiswa`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pkm_id` (`pkm_id`);

--
-- Indeks untuk tabel `posisi`
--
ALTER TABLE `posisi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ruang_lingkup`
--
ALTER TABLE `ruang_lingkup`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sertifikat`
--
ALTER TABLE `sertifikat`
  ADD KEY `kompetensi_id` (`kompetensi_id`),
  ADD KEY `mahasiswa_id` (`user_id`);

--
-- Indeks untuk tabel `syarat_ekstra`
--
ALTER TABLE `syarat_ekstra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kompetensi_id` (`kompetensi_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`kodeUser`);

--
-- Indeks untuk tabel `usergroup`
--
ALTER TABLE `usergroup`
  ADD PRIMARY KEY (`iduserGroup`),
  ADD KEY `fk_userGroup_groups1` (`kodeGroup`),
  ADD KEY `fk_userGroup_user1` (`kodeUser`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `ekstra`
--
ALTER TABLE `ekstra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kompetensi`
--
ALTER TABLE `kompetensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pkm`
--
ALTER TABLE `pkm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `posisi`
--
ALTER TABLE `posisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `ruang_lingkup`
--
ALTER TABLE `ruang_lingkup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `syarat_ekstra`
--
ALTER TABLE `syarat_ekstra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `usergroup`
--
ALTER TABLE `usergroup`
  MODIFY `iduserGroup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ekstra`
--
ALTER TABLE `ekstra`
  ADD CONSTRAINT `ekstra_ibfk_1` FOREIGN KEY (`ruang_lingkup_id`) REFERENCES `ruang_lingkup` (`id`);

--
-- Ketidakleluasaan untuk tabel `ekstra_mahasiswa`
--
ALTER TABLE `ekstra_mahasiswa`
  ADD CONSTRAINT `ekstra_mahasiswa_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`kodeUser`),
  ADD CONSTRAINT `ekstra_mahasiswa_ibfk_2` FOREIGN KEY (`ekstra_id`) REFERENCES `ekstra` (`id`),
  ADD CONSTRAINT `ekstra_mahasiswa_ibfk_3` FOREIGN KEY (`posisi_id`) REFERENCES `posisi` (`id`);

--
-- Ketidakleluasaan untuk tabel `groupprivilege`
--
ALTER TABLE `groupprivilege`
  ADD CONSTRAINT `groupprivilege_ibfk_1` FOREIGN KEY (`kodeGroup`) REFERENCES `groups` (`kodeGroup`),
  ADD CONSTRAINT `groupprivilege_ibfk_2` FOREIGN KEY (`kodeMenu`) REFERENCES `menu` (`kodeMenu`);

--
-- Ketidakleluasaan untuk tabel `pkm_mahasiswa`
--
ALTER TABLE `pkm_mahasiswa`
  ADD CONSTRAINT `pkm_mahasiswa_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`kodeUser`),
  ADD CONSTRAINT `pkm_mahasiswa_ibfk_2` FOREIGN KEY (`pkm_id`) REFERENCES `pkm` (`id`);

--
-- Ketidakleluasaan untuk tabel `sertifikat`
--
ALTER TABLE `sertifikat`
  ADD CONSTRAINT `kompetensi_id` FOREIGN KEY (`kompetensi_id`) REFERENCES `kompetensi` (`id`),
  ADD CONSTRAINT `mahasiswa_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`kodeUser`);

--
-- Ketidakleluasaan untuk tabel `syarat_ekstra`
--
ALTER TABLE `syarat_ekstra`
  ADD CONSTRAINT `syarat_ekstra_ibfk_1` FOREIGN KEY (`kompetensi_id`) REFERENCES `kompetensi` (`id`);

--
-- Ketidakleluasaan untuk tabel `usergroup`
--
ALTER TABLE `usergroup`
  ADD CONSTRAINT `usergroup_ibfk_1` FOREIGN KEY (`kodeUser`) REFERENCES `user` (`kodeUser`),
  ADD CONSTRAINT `usergroup_ibfk_2` FOREIGN KEY (`kodeGroup`) REFERENCES `groups` (`kodeGroup`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
