-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Okt 2020 pada 19.49
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-dress_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(1, 'Kemeja'),
(2, 'Kaos'),
(3, 'Celana'),
(4, 'Sepatu dan Sendal'),
(5, 'Topi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `level_users`
--

CREATE TABLE `level_users` (
  `level_id` int(11) NOT NULL,
  `level_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `level_users`
--

INSERT INTO `level_users` (`level_id`, `level_name`) VALUES
(1, 'Admin'),
(2, 'Customer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `change_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `price`, `stock`, `image`, `create_date`, `change_date`, `category_id`) VALUES
(1, 'Odza Classic Kemeja Batik', 'Spesifikasi Produk:1. Bahan 100% KATUN. Halus, adem, sejuk, nyaman di kulit dan menyerap keringat.2. Teknik PRINT kualitas PREMIUM untuk Hem Batik yang awet, tidak luntur, tidak menciut dan tidak transparant.3. Potongan kemeja SLIMFIT yang menyesuaikan bentuk badan memberikan kesan modern.4. Motif Batik Print yang Unik ORISINAL dan dibuat dengan jumlah yang sangat TERBATAS (1 Motif hanya diproduksi 1 kali).Referensi Ukuran Model yang di foto:Ukuran Baju: XLTinggi: 185 cm Berat: 78kg Lingkar Dada: 96 cm', '125000', 100, '/images/1599989447739-image.PNG', '2020-09-13 08:50:35', '2020-10-30 11:35:42', 1),
(2, 'Odza Classic Kemeja Batik Lengan Merah', 'Lengan Panjang Merah A - M-Spesifikasi Produk:1. Bahan 100% KATUN. Halus, adem, sejuk, nyaman di kulit dan menyerap keringat.2. Teknik PRINT kualitas PREMIUM untuk Hem Batik yang awet, tidak luntur, tidak menciut dan tidak transparant.3. Potongan kemeja SLIMFIT yang menyesuaikan bentuk badan memberikan kesan modern.4. Motif Batik Print yang Unik ORISINAL dan dibuat dengan jumlah yang sangat TERBATAS (1 Motif hanya diproduksi 1 kali).Referensi Ukuran Model yang di foto:Ukuran Baju: XLTinggi: 185 cm Berat: 78kg Lingkar Dada: 96 cm', '120000', 100, '/images/1599989712536-image.PNG', '2020-09-13 09:35:12', '2020-09-13 19:21:34', 1),
(3, 'NK BATIK KEMEJA BATIK PRIA LENGAN PANJANG TIO FURING JUMBO - Hijau, M', 'Bahan cotton HQ,original prodak ,Lapis furing,Kancing depan,Ada saku ,Varian prodak,Merah,Hijau,Biru ', '90000', 50, '/images/1599989909396-image.PNG', '2020-09-13 09:38:29', '2020-09-13 19:21:50', 1),
(4, 'Kemeja Batik pria lengan panjang SE05', 'Bahan:100% tidak luntur,Katun adem menyerap keringat dan nyaman dipakai,Reguler fit,Tanpa furing', '50000', 30, '/images/1599990096192-image.PNG', '2020-09-13 09:41:36', '2020-09-13 19:22:27', 1),
(5, 'Kemeja Batik Songket Pria Brown Panjang Slimfit Kerja Kantor Murah - M', 'Detail Ukuran:Lebar Dada X Panjang ,Ada di Gambar,M (50x70),L (52x72)', '120000', 100, '/images/1599990229895-image.PNG', '2020-09-13 09:43:49', '2020-09-20 18:45:00', 1),
(6, 'Kemeja Batik Slimfit Alisan Original', 'Warna Coklat Ukuran M. Tersedia berbagai ukuran.\nBahan nyaman dipakai.', '100000', 10, '/images/1600608319593-image.png', '2020-09-20 13:25:20', '2020-09-22 13:01:49', 1),
(7, 'T-shirt Astronaut Kaos Hitam Nyaman', 'Estimasi ukuran :\nALLSIZE FIT M - L\nQuality Import\nJahitan Double Stick dan Rapih\nDada 98CM-100CM*Barang Sesuai Dengan Foto Tanpa Edit\nLebar 50cm panjang 70cm\nBahan Cotton Combed 30S (Nyaman dan tidak panas)', '35000', 25, '/images/1600611728762-image.png', '2020-09-20 14:22:09', '2020-09-20 18:23:33', 2),
(9, 'Leos Original Celana Jeans Pria Panjang Slimfit Straight Fit', 'LEOS Original Slim Fit Wahsed Blue adalah jeans pria yang nyaman digunakan dengan material yang sejuk, lembut, elastis dan tidak mudah rusak. Dibuat dengan versi Straight Fit yang dapat digunakan dalam acara formal maupun non formal. Jahitan yang presisi sehingga kuat dan tidak mudah rusak. Memiliki ketebalan dan elastisitas yang medium.\n\nSize Chart:\nSize 28\nPanjang : 106 cm, Lingkar Pinggang : 38 cm, Lingkar Pinggul : 48.5 cm, Lingkar Bawah : 16 cm\nSize 30\nPanjang : 107 cm, Lingkar Pinggang : 40 cm, Lingkar Pinggul : 50.5 cm, Lingkar Bawah : 17 cm\nSize 32\nPanjang : 108 cm, Lingkar Pinggang : 42 cm, Lingkar Pinggul : 52.5 cm, Lingkar Bawah : 18 cm\nSize 34\nPanjang : 109 cm, Lingkar Pinggang : 44 cm, Lingkar Pinggul : 54.5 cm, Lingkar Bawah : 19 cm\nSize 36\nPanjang : 109.5 cm, Lingkar Pinggang : 46 cm, Lingkar Pinggul : 56.5 cm, Lingkar Bawah : 20 cm\nSize 38\nPanjang : 110 cm, Lingkar Pinggang : 48 cm, Lingkar Pinggul : 58.5 cm, Lingkar Bawah : 21 cm', '50000', 50, '/images/1600612826882-image.png', '2020-09-20 14:40:27', '2020-09-20 14:40:27', 3),
(10, 'Kaos Polos Oblong PE Hitam Nyaman', 'Bahan :\nPolyester 30S Premium\n\nUkuran :\nAll size / satu ukuran / tidak ada pilihan ukuran\nLebar 52CM / LD (Lingkar Dada) 104CM, Panjang 70CM\nMuat L sampai XL Dewasa\n\nSpesifikasi :\nUnisex artinya bisa dipakai Pria ataupun Wanita\nKuat, tidak mudah menyusut, tidak melar\nTidak mudah kusut', '30000', 30, '/images/1600660666971-image.png', '2020-09-21 02:05:09', '2020-09-21 03:57:47', 2),
(12, 'Kaos Hitam Lengan Panjang Nyaman Dipakai', 'Baju Fashion Pria\nBahan babyterry premium\nLengan panjang\n\nTersedia 3 ukuran:\nM\nUkuran LD: 98cm, PB: 64cm.\nhttps://tokopedia.link/FojyE2EAJ5\n\nL\nUkuran LD: 106cm, PB: 69cm.\nhttps://tokopedia.link/n14rOfIAJ5\n\nXL\nUkuran LD: 114cm, PB: 74cm.\nhttps://tokopedia.link/vcky5rLAJ5\n\nWarna:\n- maroon\n- hitam\n- abu-abu\n- biru\n- putih\n- merah\n- navy\n- kuning', '50000', 30, '/images/1600669378276-image.png', '2020-09-21 06:22:58', '2020-09-22 11:46:53', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `products` varchar(2000) NOT NULL,
  `total_item` varchar(255) NOT NULL,
  `price_item` varchar(255) NOT NULL,
  `totalprice` decimal(10,0) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `name`, `username`, `email`, `password`, `level_id`, `image`, `register_date`) VALUES
(1, 'SOLEHUDIN', 'solehudin1', 'solehudin1@surel.co.id', '$2b$10$kdYaAkSMuYc.90yjiSr2BemmvY15Yw4SyR4B6x3pXLmQIB0zBzK3m', 1, '', '2020-09-13 06:06:15'),
(2, 'Solehudin', 'solehudin2', 'solehudin2@gemail.com', '$2b$10$bVWGyxM2nkRjQBftCQ/Jd.SqjgSMWr8guhGLAJlSscDGc1g5wkod.', 2, '', '2020-09-14 02:04:18'),
(3, 'Solehudin', 'solehudin3', 'solehudin3', '$2b$10$g8mJa6I.6UgkgFqrBZhs5.Q0yhcszQ1m0xuZ0a.KQ6UyZwJKDsd0C', 2, '', '2020-09-14 02:13:24'),
(4, 'Solehudin', 'solehudin4', 'solehudin4', '$2b$10$pT63ABnFTFlWtd14oi3LSO4wM6K0cU6yFttNjSwEZldwQK4fbdl2a', 2, '', '2020-09-14 02:16:28'),
(5, 'Solehudin', 'solehudin5', 'solehudin5', '$2b$10$J6PFTKfcl/vLW8FhzXKZJOkhCuYBgNH1YCrI1jMK.TrAFgTlaXwli', 2, '', '2020-09-14 02:18:36'),
(6, 'Solehudin', 'solehudin6', 'solehudin6', '$2b$10$./MZLR2ymUubp4D5EgatkeUHgT.y6gJN4XQjg5IfBMzD/Ng2zclQG', 2, '', '2020-09-14 02:22:38'),
(7, 'Solehudin', 'solehudin7', 'solehudin7@surel.com', '$2b$10$vYa5STtsXVq153hvOVa8YuQPBSZ.P24Za5TN94QYwD6T1vysQVjHa', 2, '', '2020-09-14 02:35:25'),
(8, 'Solehudin Namaku', 'solehudin10', 'solehudin10@gmail.com', '$2b$10$/.FBHQ5TtgYvTl12eQHtmeP7GesbQP8gc8lFdhe55wy48ID4FiHO6', 2, '/profileImages/1600793347313-image.jpg', '2020-09-14 03:27:15'),
(9, 'Solehudin', 'solehudin8', 'solehudin8@surel.com', '$2b$10$Uud3WK/vZsuK24/f/KimE.t8GJ2TCCHAhExZ24r5/ynddiXhvu5H.', 2, '', '2020-09-17 17:39:17'),
(10, 'Solehudin', 'solehudin9', 'solehudin9@surel.com', '$2b$10$i1OCKoKbfrflpG99ssDhquJ0m37gbquvXI9VCs8FdcZpKhwOIagoq', 2, '/images/1600752938708-image.PNG', '2020-09-17 17:41:56'),
(11, 'Solehudin', 'solehudin11', 'solehudin11@surel.com', '$2b$10$2y3Knpp/nXVIYRKYmGXV1uBVEFHS4ZKQX2krwTn4rKSRObtLqgb3m', 2, '', '2020-09-17 17:44:34'),
(12, 'Solehudin', 'solehudin12', 'solehudin12@gemail.com', '$2b$10$u3ph78TxTCMFQVQd2o/4N.erzV.eQY2KxeVuFaVhNKXOrQzspnY/y', 2, '', '2020-09-22 17:44:21'),
(13, 'Solehudin', 'solehudin99', 'solehudin@gemail.com', '$2b$10$B5XMIz4fq/Vy6Zz7SFd6y.gMoJHShKydce.HXq/biMupHmSHJh3QS', 2, '', '2020-10-30 18:39:04');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
