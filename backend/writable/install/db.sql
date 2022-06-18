-- Flangapp
-- version 1.0
-- http://flangapp.com/

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Data table `apps`
--

CREATE TABLE `apps` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `user` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL,
  `color_theme` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `color_title` int(11) NOT NULL,
  `template` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `app_id` text COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8_unicode_ci NOT NULL,
  `orientation` int(11) NOT NULL,
  `loader` int(11) NOT NULL,
  `pull_to_refresh` int(11) NOT NULL,
  `loader_color` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gps` int(11) NOT NULL,
  `language` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `camera` int(11) NOT NULL,
  `microphone` int(11) NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `display_title` int(11) NOT NULL,
  `icon_color` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active_color` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Data table  `bar_navigation`
--

CREATE TABLE `bar_navigation` (
  `id` int(11) UNSIGNED NOT NULL,
  `app_id` int(11) NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Data table  `builds`
--

CREATE TABLE `builds` (
  `id` int(11) UNSIGNED NOT NULL,
  `app_id` int(11) NOT NULL,
  `uid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `platform` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `android_key_id` int(11) NOT NULL,
  `ios_key_id` int(11) NOT NULL,
  `version` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `publish` int(11) NOT NULL,
  `format` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fail` int(11) NOT NULL,
  `build_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `static` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Data table  `builds_queue`
--

CREATE TABLE `builds_queue` (
  `id` int(11) UNSIGNED NOT NULL,
  `build` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Data table  `drawers`
--

CREATE TABLE `drawers` (
  `id` int(11) UNSIGNED NOT NULL,
  `app_id` int(11) NOT NULL,
  `mode` int(11) NOT NULL,
  `color` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `theme` int(11) NOT NULL,
  `logo_enabled` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` text COLLATE utf8_unicode_ci NOT NULL,
  `logo` text COLLATE utf8_unicode_ci NOT NULL,
  `background` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Data table `email_config`
--

CREATE TABLE `email_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL,
  `host` text COLLATE utf8_unicode_ci NOT NULL,
  `user` text COLLATE utf8_unicode_ci NOT NULL,
  `port` int(11) NOT NULL,
  `timeout` int(11) NOT NULL,
  `charset` text COLLATE utf8_unicode_ci NOT NULL,
  `sender` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Damp `email_config`
--

INSERT INTO `email_config` (`id`, `status`, `host`, `user`, `port`, `timeout`, `charset`, `sender`, `password`) VALUES
(1, 1, 'smtp.example.com', 'connect@example.com', 465, 5, 'UTF-8', 'Flangapp', 'password');

-- --------------------------------------------------------

--
-- Data table `locals`
--

CREATE TABLE `locals` (
  `id` int(11) UNSIGNED NOT NULL,
  `string_1` text COLLATE utf8_unicode_ci NOT NULL,
  `string_2` text COLLATE utf8_unicode_ci NOT NULL,
  `string_3` text COLLATE utf8_unicode_ci NOT NULL,
  `string_4` text COLLATE utf8_unicode_ci NOT NULL,
  `string_5` text COLLATE utf8_unicode_ci NOT NULL,
  `string_6` text COLLATE utf8_unicode_ci NOT NULL,
  `string_7` text COLLATE utf8_unicode_ci NOT NULL,
  `string_8` text COLLATE utf8_unicode_ci NOT NULL,
  `error_image` text COLLATE utf8_unicode_ci NOT NULL,
  `offline_image` text COLLATE utf8_unicode_ci NOT NULL,
  `app_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Data table  `modal_navigation`
--

CREATE TABLE `modal_navigation` (
  `id` int(11) UNSIGNED NOT NULL,
  `app_id` int(11) NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `icon` text COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Data table  `navigation`
--

CREATE TABLE `navigation` (
  `id` int(11) UNSIGNED NOT NULL,
  `app_id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Data table  `plans`
--

CREATE TABLE `plans` (
  `id` int(11) UNSIGNED NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `save` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `mark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Data table `push`
--

CREATE TABLE `push` (
  `id` int(11) UNSIGNED NOT NULL,
  `app_id` int(11) NOT NULL,
  `apple_enabled` int(11) NOT NULL,
  `android_enabled` int(11) NOT NULL,
  `os_app_id` varbinary(1000) NOT NULL,
  `os_api_key` varbinary(1000) NOT NULL,
  `sign_key` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Data table `reset_attempts`
--

CREATE TABLE `reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `token` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Data table  `settings`
--

CREATE TABLE `settings` (
  `set_key` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Damp `settings`
--

INSERT INTO `settings` (`set_key`, `value`) VALUES
('codemagic_id', ''),
('codemagic_key', '4'),
('currency_code', 'USD'),
('currency_symbol', '$'),
('github_repo', ''),
('github_token', ''),
('github_username', ''),
('google_enabled', '0'),
('google_id', ''),
('ionic_icons', 'https://raw.githubusercontent.com/ionic-team/ionicons/main/src/data.json'),
('site_logo', 'logosvg.svg'),
('site_name', 'Flangapp'),
('site_url', 'http://localhost:8080/#/'),
('stripe_publish_key', ''),
('stripe_secret_key', '');

-- --------------------------------------------------------

--
-- Data table  `signs_android`
--

CREATE TABLE `signs_android` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `uid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `alias` text COLLATE utf8_unicode_ci NOT NULL,
  `keystore_password` varbinary(1000) NOT NULL,
  `key_password` varbinary(1000) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `file` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Data table `signs_ios`
--

CREATE TABLE `signs_ios` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `uid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `issuer_id` text COLLATE utf8_unicode_ci NOT NULL,
  `key_id` text COLLATE utf8_unicode_ci NOT NULL,
  `file` text COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Data table  `splashscreens`
--

CREATE TABLE `splashscreens` (
  `id` int(10) UNSIGNED NOT NULL,
  `background` int(11) NOT NULL,
  `color` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `tagline` text COLLATE utf8_unicode_ci NOT NULL,
  `logo` text COLLATE utf8_unicode_ci NOT NULL,
  `delay` int(11) NOT NULL,
  `theme` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `use_logo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Data table  `styles`
--

CREATE TABLE `styles` (
  `id` int(11) UNSIGNED NOT NULL,
  `app_id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Data table `support_comments`
--

CREATE TABLE `support_comments` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `estimation` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `uid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ticket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Data table  `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Data table  `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `app_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `method_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Data table  `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) NOT NULL,
  `admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Indexed table `apps`
--
ALTER TABLE `apps`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `bar_navigation`
--
ALTER TABLE `bar_navigation`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `builds`
--
ALTER TABLE `builds`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `builds_queue`
--
ALTER TABLE `builds_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `drawers`
--
ALTER TABLE `drawers`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `email_config`
--
ALTER TABLE `email_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `locals`
--
ALTER TABLE `locals`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `modal_navigation`
--
ALTER TABLE `modal_navigation`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `navigation`
--
ALTER TABLE `navigation`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `push`
--
ALTER TABLE `push`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `reset_attempts`
--
ALTER TABLE `reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`set_key`);

--
-- Indexed table `signs_android`
--
ALTER TABLE `signs_android`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `signs_ios`
--
ALTER TABLE `signs_ios`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `splashscreens`
--
ALTER TABLE `splashscreens`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `styles`
--
ALTER TABLE `styles`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `support_comments`
--
ALTER TABLE `support_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexed table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for saving tables
--

--
-- AUTO_INCREMENT for table `apps`
--
ALTER TABLE `apps`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `bar_navigation`
--
ALTER TABLE `bar_navigation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `builds`
--
ALTER TABLE `builds`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `builds_queue`
--
ALTER TABLE `builds_queue`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `drawers`
--
ALTER TABLE `drawers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `email_config`
--
ALTER TABLE `email_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `locals`
--
ALTER TABLE `locals`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `modal_navigation`
--
ALTER TABLE `modal_navigation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `navigation`
--
ALTER TABLE `navigation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `push`
--
ALTER TABLE `push`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `reset_attempts`
--
ALTER TABLE `reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `signs_android`
--
ALTER TABLE `signs_android`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `signs_ios`
--
ALTER TABLE `signs_ios`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `splashscreens`
--
ALTER TABLE `splashscreens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `styles`
--
ALTER TABLE `styles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `support_comments`
--
ALTER TABLE `support_comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
