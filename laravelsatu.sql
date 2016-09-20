-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2016 at 10:05 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravelsatu`
--

-- --------------------------------------------------------

--
-- Table structure for table `chatter_categories`
--

CREATE TABLE `chatter_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chatter_categories`
--

INSERT INTO `chatter_categories` (`id`, `parent_id`, `order`, `name`, `color`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Introductions', '#3498DB', 'introductions', NULL, NULL),
(2, NULL, 2, 'General', '#2ECC71', 'general', NULL, NULL),
(3, NULL, 3, 'Feedback', '#9B59B6', 'feedback', NULL, NULL),
(4, NULL, 4, 'Random', '#E67E22', 'random', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chatter_discussion`
--

CREATE TABLE `chatter_discussion` (
  `id` int(10) UNSIGNED NOT NULL,
  `chatter_category_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `answered` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#232629'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chatter_discussion`
--

INSERT INTO `chatter_discussion` (`id`, `chatter_category_id`, `title`, `user_id`, `sticky`, `views`, `answered`, `created_at`, `updated_at`, `slug`, `color`) VALUES
(3, 1, 'Hello Everyone, This is my Introduction', 1, 0, 0, 0, '2016-08-18 07:27:56', '2016-08-18 07:27:56', 'hello-everyone-this-is-my-introduction', '#239900'),
(6, 2, 'Login Information for Chatter', 1, 0, 0, 0, '2016-08-18 07:39:36', '2016-08-18 07:39:36', 'login-information-for-chatter', '#1a1067'),
(7, 3, 'Leaving Feedback', 1, 0, 0, 0, '2016-08-18 07:42:29', '2016-08-18 07:42:29', 'leaving-feedback', '#8e1869'),
(8, 4, 'Just a random post', 1, 0, 0, 0, '2016-08-18 07:46:38', '2016-08-18 07:46:38', 'just-a-random-post', ''),
(9, 2, 'Welcome to the Chatter Laravel Forum Package', 1, 0, 0, 0, '2016-08-18 07:59:37', '2016-08-18 07:59:37', 'welcome-to-the-chatter-laravel-forum-package', '');

-- --------------------------------------------------------

--
-- Table structure for table `chatter_post`
--

CREATE TABLE `chatter_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `chatter_discussion_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chatter_post`
--

INSERT INTO `chatter_post` (`id`, `chatter_discussion_id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '<p>My name is Tony and I''m a developer at <a href="https://devdojo.com" target="_blank">https://devdojo.com</a> and I also work with an awesome company in PB called The Control Group: <a href="http://www.thecontrolgroup.com" target="_blank">http://www.thecontrolgroup.com</a></p>\n        <p>You can check me out on twitter at <a href="http://www.twitter.com/tnylea" target="_blank">http://www.twitter.com/tnylea</a></p>\n        <p>or you can subscribe to me on YouTube at <a href="http://www.youtube.com/devdojo" target="_blank">http://www.youtube.com/devdojo</a></p>', '2016-08-18 07:27:56', '2016-08-18 07:27:56'),
(5, 6, 1, '<p>Hey!</p>\n        <p>Thanks again for checking out chatter. If you want to login with the default user you can login with the following credentials:</p>\n        <p><strong>email address</strong>: tony@hello.com</p>\n        <p><strong>password</strong>: password</p>\n        <p>You''ll probably want to delete this user, but if for some reason you want to keep it... Go ahead :)</p>', '2016-08-18 07:39:36', '2016-08-18 07:39:36'),
(6, 7, 1, '<p>If you would like to leave some feedback or have any issues be sure to visit the github page here: <a href="https://github.com/thedevdojo/chatter" target="_blank">https://github.com/thedevdojo/chatter</a>&nbsp;and I''m sure I can help out.</p>\n        <p>Let''s make this package the go to Laravel Forum package. Feel free to contribute and share your ideas :)</p>', '2016-08-18 07:42:29', '2016-08-18 07:42:29'),
(7, 8, 1, '<p>This is just a random post to show you some of the formatting that you can do in the WYSIWYG editor. You can make your text <strong>bold</strong>, <em>italic</em>, or <span style="text-decoration: underline;">underlined</span>.</p>\n        <p style="text-align: center;">Additionally, you can center align text.</p>\n        <p style="text-align: right;">You can align the text to the right!</p>\n        <p>Or by default it will be aligned to the left.</p>\n        <ul>\n        <li>We can also</li>\n        <li>add a bulleted</li>\n        <li>list</li>\n        </ul>\n        <ol>\n        <li><span style="line-height: 1.6;">or we can</span></li>\n        <li><span style="line-height: 1.6;">add a numbered list</span></li>\n        </ol>\n        <p style="padding-left: 30px;"><span style="line-height: 1.6;">We can choose to indent our text</span></p>\n        <p><span style="line-height: 1.6;">Post links: <a href="https://devdojo.com" target="_blank">https://devdojo.com</a></span></p>\n        <p><span style="line-height: 1.6;">and add images:</span></p>\n        <p><span style="line-height: 1.6;"><img src="https://media.giphy.com/media/o0vwzuFwCGAFO/giphy.gif" alt="" width="300" height="300" /></span></p>', '2016-08-18 07:46:38', '2016-08-18 07:46:38'),
(8, 8, 1, '<p>Haha :) Cats!</p>\n        <p><img src="https://media.giphy.com/media/5Vy3WpDbXXMze/giphy.gif" alt="" width="250" height="141" /></p>\n        <p><img src="https://media.giphy.com/media/XNdoIMwndQfqE/200.gif" alt="" width="200" height="200" /></p>', '2016-08-18 07:55:42', '2016-08-18 08:45:13'),
(9, 9, 1, '<p>Hey There!</p>\n        <p>My name is Tony and I''m the creator of this package that you''ve just installed. Thanks for checking out it out and if you have any questions or want to contribute be sure to checkout the repo here: <a href="https://github.com/thedevdojo/chatter" target="_blank">https://github.com/thedevdojo/chatter</a></p>\n        <p>Happy programming!</p>', '2016-08-18 07:59:37', '2016-08-18 07:59:37'),
(10, 9, 1, '<p>Hell yeah Bro Sauce!</p>\n        <p><img src="https://media.giphy.com/media/j5QcmXoFWl4Q0/giphy.gif" alt="" width="366" height="229" /></p>', '2016-08-18 08:01:25', '2016-08-18 08:01:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_09_18_050231_create_table_tgambar', 2),
('2016_07_29_171118_create_chatter_categories_table', 3),
('2016_07_29_171118_create_chatter_discussion_table', 3),
('2016_07_29_171118_create_chatter_post_table', 3),
('2016_07_29_171128_create_foreign_keys', 3),
('2016_08_02_183143_add_slug_field_for_discussions', 3),
('2016_08_03_121747_add_color_row_to_chatter_discussions', 3),
('2016_09_20_055855_create_tblog_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblog`
--

CREATE TABLE `tblog` (
  `id` int(10) UNSIGNED NOT NULL,
  `judulblog` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `fotoblog` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `isiblog` longtext COLLATE utf8_unicode_ci NOT NULL,
  `kategoriblog` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `tagblog` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `slugblog` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblog`
--

INSERT INTO `tblog` (`id`, `judulblog`, `fotoblog`, `isiblog`, `kategoriblog`, `tagblog`, `slugblog`, `created_at`, `updated_at`) VALUES
(2, 'Tenggelamnya Kapal Vanderwick 2014', 'kapal-1.jpg', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.<br />The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 'hiburan', 'Semuanya', 'tenggelamnya-kapal-vanderwick-2014', '2016-09-20 00:34:32', '2016-09-20 00:55:16'),
(3, 'Judul apalh Itu', 'newss.jpg', '<p style="text-align: justify;">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'hiburan', 'dasdsadas', 'judul-apalh-itu', '2016-09-20 00:42:03', '2016-09-20 00:42:03'),
(4, 'sesuatu sesuatu', 'lapop.jpg', '<p style="text-align: justify;">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'sport', 'zxda', 'sesuatu-sesuatu', '2016-09-20 00:42:38', '2016-09-20 00:42:38'),
(5, 'BBC News', 'bbccc.png', '<p style="text-align: justify;">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'hiburan', 'fafasd', 'bbc-news', '2016-09-20 00:43:09', '2016-09-20 00:43:09'),
(6, 'Pon Jabar 2016', 'tiga-venue-cabor-pon-jabar-bakal-digeser-AQn.jpg', '<p style="text-align: justify;">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'sport', 'asdasd', 'pon-jabar-2016', '2016-09-20 00:44:07', '2016-09-20 00:44:07'),
(7, 'events Bandung 2016', 'eventss.jpg', '<p style="text-align: justify;">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'umum', 'sadasd', 'events-bandung-2016', '2016-09-20 00:44:45', '2016-09-20 00:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `tgambar`
--

CREATE TABLE `tgambar` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul_gambar` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `foto` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ket_gambar` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tgambar`
--

INSERT INTO `tgambar` (`id`, `judul_gambar`, `foto`, `ket_gambar`, `created_at`, `updated_at`) VALUES
(1, 'kookokoko', 'unikom.png', 'okeley', '2016-09-17 22:36:01', '2016-09-19 22:42:22'),
(2, 'cicicicicic', 'laravel-homestead1.png', 'Oke Lah Klo begitu', '2016-09-17 22:46:21', '2016-09-19 22:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `level`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$u5umIQ8qC6rYOR3BFKYRuuaGdIzPM2XlfGtFNaIepioVt0tLQE1Li', 'covJ632LIMUqDwr9wxpOv9MTw9hpYsbQxcBnlT6w1lR49f5bL2M1CuZbitWh', 'admin', '2016-09-17 09:26:41', '2016-09-19 08:46:42'),
(2, 'User Satu', 'user1@user.com', '$2y$10$Fz2towMbbySEjJDIIeQtbeJ7sO01XPn1nMCFG7jxCaF4nRlXtrUhy', 'yjiYYjILR0A7akcFov90aRzUj8pS8jXBJfcfwtjltKWNpgEO3YKj2XG0Raxg', 'user', '2016-09-19 07:38:13', '2016-09-19 20:09:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatter_categories`
--
ALTER TABLE `chatter_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatter_discussion`
--
ALTER TABLE `chatter_discussion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chatter_discussion_slug_unique` (`slug`),
  ADD KEY `chatter_discussion_chatter_category_id_foreign` (`chatter_category_id`),
  ADD KEY `chatter_discussion_user_id_foreign` (`user_id`);

--
-- Indexes for table `chatter_post`
--
ALTER TABLE `chatter_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chatter_post_chatter_discussion_id_foreign` (`chatter_discussion_id`),
  ADD KEY `chatter_post_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `tblog`
--
ALTER TABLE `tblog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tgambar`
--
ALTER TABLE `tgambar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatter_categories`
--
ALTER TABLE `chatter_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `chatter_discussion`
--
ALTER TABLE `chatter_discussion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `chatter_post`
--
ALTER TABLE `chatter_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tblog`
--
ALTER TABLE `tblog`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tgambar`
--
ALTER TABLE `tgambar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `chatter_discussion`
--
ALTER TABLE `chatter_discussion`
  ADD CONSTRAINT `chatter_discussion_chatter_category_id_foreign` FOREIGN KEY (`chatter_category_id`) REFERENCES `chatter_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chatter_discussion_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chatter_post`
--
ALTER TABLE `chatter_post`
  ADD CONSTRAINT `chatter_post_chatter_discussion_id_foreign` FOREIGN KEY (`chatter_discussion_id`) REFERENCES `chatter_discussion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chatter_post_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
