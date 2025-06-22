-- Database: dkr_pangkalan
-- Membuat database baru jika belum ada
CREATE DATABASE IF NOT EXISTS `dkr_pangkalan`;

-- Menggunakan database yang baru dibuat
USE `dkr_pangkalan`;

-- Tabel: programs
-- Menyimpan informasi tentang program kegiatan Pramuka
CREATE TABLE IF NOT EXISTS `programs` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `brief_description` TEXT,
    `full_description` TEXT, -- Untuk deskripsi lengkap yang bisa dihasilkan LLM
    `image_url` VARCHAR(255),
    `category` VARCHAR(100),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel: news
-- Menyimpan artikel berita dan update kegiatan
CREATE TABLE IF NOT EXISTS `news` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `content` TEXT NOT NULL,
    `summary` TEXT, -- Untuk ringkasan berita yang dihasilkan LLM
    `image_url` VARCHAR(255),
    `published_date` DATE NOT NULL,
    `category` VARCHAR(100),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel: members
-- Menyimpan data anggota dewan kerja atau anggota inti lainnya
CREATE TABLE IF NOT EXISTS `members` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `position` VARCHAR(255),
    `bio` TEXT,
    `image_url` VARCHAR(255),
    `linkedin_url` VARCHAR(255),
    `instagram_url` VARCHAR(255),
    `email` VARCHAR(255),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel: settings
-- Bisa digunakan untuk menyimpan slogan atau kata mutiara dinamis, atau pengaturan situs lainnya
CREATE TABLE IF NOT EXISTS `settings` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `setting_key` VARCHAR(100) NOT NULL UNIQUE,
    `setting_value` TEXT,
    `description` TEXT,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Contoh Data (Opsional)
INSERT INTO `programs` (`title`, `brief_description`, `image_url`, `category`) VALUES
('Penjelajahan dan Konservasi Lingkungan', 'Melalui kegiatan penjelajahan alam dan edukasi, kami menumbuhkan kesadaran serta partisipasi dalam pelestarian lingkungan.', 'https://placehold.co/600x400/8B4513/FFFFFF/png?text=Pendidikan+Lingkungan+Coklat', 'Lingkungan'),
('Pelatihan Kepemimpinan & Manajerial', 'Membekali anggota dengan keterampilan kepemimpinan, organisasi, dan manajemen proyek melalui simulasi dan praktik.', 'https://placehold.co/600x400/A0522D/FFFFFF/png?text=Keterampilan+Kepemimpinan+Coklat', 'Pengembangan Diri'),
('Aksi Sosial dan Bakti Masyarakat', 'Mengajak Pramuka untuk aktif berkontribusi dalam kegiatan sosial, membantu sesama, dan membersihkan lingkungan.', 'https://placehold.co/600x400/654321/FFFFFF/png?text=Bakti+Masyarakat+Coklat', 'Sosial');

INSERT INTO `news` (`title`, `content`, `published_date`, `category`) VALUES
('Latihan Gabungan Pramuka Penegak se-Kabupaten Pangkalan Sukses Digelar!', 'Latihan gabungan yang diikuti oleh seluruh Pramuka Penegak di Kabupaten Pangkalan berjalan lancar dan penuh semangat. Para peserta dibekali materi pioneering dan tali-temali, serta diajak untuk mempererat tali persaudaraan antar-Gugus Depan. Kegiatan ini diharapkan dapat meningkatkan kualitas dan kapabilitas Pramuka Penegak dalam menghadapi tantangan di masa depan.', '2025-06-10', 'Kegiatan'),
('DKR PANGKALAN Gelar Aksi Bersih Lingkungan di Sungai Lokal', 'Sebagai bentuk kepedulian terhadap lingkungan, DKR Pangkalan bersama masyarakat setempat melakukan aksi bersih-bersih di sepanjang bantaran sungai. Kegiatan ini bertujuan untuk menjaga kebersihan ekosistem air dan menyadarkan pentingnya pelestarian lingkungan kepada generasi muda. Banyak sampah plastik berhasil dikumpulkan.', '2025-06-05', 'Bakti Masyarakat'),
('Perkemahan Bakti: Mengasah Kemandirian dan Kebersamaan Pramuka', 'Ratusan Pramuka mengikuti Perkemahan Bakti yang diselenggarakan oleh DKR Pangkalan. Kegiatan ini berfokus pada pengembangan keterampilan survival, kerja sama tim, dan pengabdian kepada masyarakat sekitar. Peserta diajarkan cara membangun bivak, navigasi darat, dan pertolongan pertama.', '2025-05-28', 'Perkemahan');

INSERT INTO `members` (`name`, `position`, `image_url`) VALUES
('Kak Arya Sanjaya', 'Ketua Dewan Kerja Ranting', 'https://placehold.co/150x150/8B4513/FFFFFF/png?text=Ketua+DKR'),
('Kak Bunga Lestari', 'Wakil Ketua DKR', 'https://placehold.co/150x150/8B4513/FFFFFF/png?text=Wakil+DKR'),
('Kak Candra Kirana', 'Sekretaris', 'https://placehold.co/150x150/8B4513/FFFFFF/png?text=Sekretaris'),
('Kak Dian Perwira', 'Bendahara', 'https://placehold.co/150x150/8B4513/FFFFFF/png?text=Bendahara');

INSERT INTO `settings` (`setting_key`, `setting_value`, `description`) VALUES
('motto_inspiratif', 'Disini kita lahir, disini kita dibesarkan, disini kita bersama mengabdi untuk bangsa. Dengan Satya ku dharmakan, Darma ku baktikan!', 'Slogan atau kata mutiara inspiratif Pramuka.');
