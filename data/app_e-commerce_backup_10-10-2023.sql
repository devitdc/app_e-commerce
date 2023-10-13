/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

--
-- Déchargement des données de la table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `name`, `firstname`, `lastname`, `company`, `address1`, `address2`, `postal_code`, `city`, `country`, `phone`, `is_billing`) VALUES
(2, 2, 'Domicile', 'User', 'Demo', NULL, '1 rue du lac', NULL, '69000', 'Lyon', 'FR', '0607080910', 1),
(3, 3, 'Domicile', 'Thierry', 'Dupont', NULL, '9 rue de la belle rose', NULL, '77330', 'Charlan', 'FR', '0670809050', 1);

-- --------------------------------------------------------

--
-- Déchargement des données de la table `carriers`
--

INSERT INTO `carriers` (`id`, `name`, `delay`, `price`, `type`) VALUES
(1, 'Colissimo', '2 à 5 jours ouvrés', 9.9, 'Livraison standard'),
(2, 'Chronopost', '24 heures', 14.9, 'Livraison express'),
(3, 'UPS', '48 heures', 12.9, 'Livraison express');

-- --------------------------------------------------------

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `is_active`) VALUES
(1, 'Manteaux', 1),
(2, 'Bonnets', 1),
(3, 'T-shirts', 1),
(4, 'Echarpes', 1),
(5, 'Sweat', 1),
(6, 'Pull-over', 1),
(7, 'Jeans', 1),
(8, 'Chemises', 1),
(9, 'Polos', 1),
(10, 'Veste', 1);

-- --------------------------------------------------------

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230921102518', '2023-09-21 12:31:08', 10042);

-- --------------------------------------------------------

--
-- Déchargement des données de la table `header`
--

INSERT INTO `header` (`id`, `title`, `content`, `btn_title`, `btn_url`, `image`, `is_active`, `name`) VALUES
(1, 'NOUVELLE COLLECTION', '<div><strong>PULL EN MAILLE</strong></div>', 'Découvrir', '/products?string=&categories%5B%5D=6&submit=', 'efe09b6d489d75f20377ef6ae10ae8612ce4d40d.jpg', 1, 'Nouvelle collection pull hiver'),
(2, 'NOUVELLE COLLECTION', '<div><strong>CHEMISE CONFORT</strong></div>', 'Découvrir', '/products?string=&categories%5B%5D=8&submit=', '3993f0c9205b702a52ede7c97636fdc3ee63a8fe.webp', 1, 'Nouvelle collection chemise printemps-été 2023');

-- --------------------------------------------------------

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `created_at`, `carrier_name`, `carrier_price`, `is_paid`, `delivery_firstname`, `delivery_lastname`, `delivery_company`, `delivery_address1`, `delivery_address2`, `delivery_postal_code`, `delivery_city`, `delivery_country`, `delivery_phone`, `reference`, `stripe_session_id`, `delivery_state`, `updated_at`) VALUES
(9, 2, '2023-03-24 22:49:34', 'Colissimo', 9.9, 1, 'User', 'Demo', NULL, '1 rue du lac', NULL, '69000', 'Lyon', 'FR', '0607080910', '20230324-641e1aee06796', 'cs_test_b1A3rGSigFkwxzMNK3EILhCOyMc33B0CyRdwEW9F2MijAbwMOblWF7geng', 6, '2023-03-24 22:57:24'),
(10, 2, '2023-03-24 23:21:48', 'Colissimo', 9.9, 1, 'User', 'Demo', NULL, '1 rue du lac', NULL, '69000', 'Lyon', 'FR', '0607080910', '20230324-641e227ce0b20', 'cs_test_b1JBxkLZ7kvgXuS3iM9XtZpQvqAhYpcOVstSD6NheKy3GXHLwKJCmvbpgu', 6, '2023-03-24 23:22:20'),
(11, 2, '2023-03-30 11:05:27', 'Colissimo', 9.9, 0, 'User', 'Demo', NULL, '1 rue du lac', NULL, '69000', 'Lyon', 'FR', '0607080910', '20230330-642550d7d5567', NULL, 0, '2023-03-31 18:45:01'),
(12, 3, '2023-04-02 22:53:43', 'Colissimo', 9.9, 1, 'Thierry', 'Dupont', NULL, '9 rue de la belle rose', NULL, '77330', 'Charlan', 'FR', '0625457856', '20230402-6429eb57e7300', 'cs_test_b13o2GqIFhXw3tMW2Z2JooY1dxQbQlto6wv2YTbS1j6hJHgxRZdfLMaGI6', 6, '2023-04-02 22:59:13'),
(13, 3, '2023-04-02 23:35:58', 'Colissimo', 9.9, 1, 'Thierry', 'Dupont', NULL, '9 rue de la belle rose', NULL, '77330', 'Charlan', 'FR', '0625457856', '20230402-6429f53e6f594', 'cs_test_b1UrszsUcsgLZZYQyWdAQXOC7q7FMHGMVEzPPPpndKdEz1Lr5PlkgJEnPb', 6, '2023-04-02 23:37:04'),
(14, 3, '2023-04-03 17:33:41', 'Colissimo', 9.9, 1, 'Thierry', 'Dupont', NULL, '9 rue de la belle rose', NULL, '77330', 'Charlan', 'FR', '0625457856', '20230403-642af1d50bb76', 'cs_test_b1ZrN7pBaJDM4lH9BVrtO0VaAzfkxBPqavP6dswe3tWTcjXHeiHXjYjky0', 6, '2023-04-03 17:34:26'),
(15, 2, '2023-04-04 22:44:04', 'Colissimo', 9.9, 1, 'User', 'Demo', NULL, '1 rue du lac', NULL, '69000', 'Lyon', 'FR', '0607080910', '20230404-642c8c140fdec', 'cs_test_b1pDxmln4PPbz5iYgcKXgz2EDRk3gXs1vWHrKyVuJfklLSyflAUW3J2she', 6, '2023-04-04 22:44:24'),
(16, 3, '2023-04-06 21:21:35', 'Colissimo', 9.9, 1, 'Thierry', 'Dupont', NULL, '9 rue de la belle rose', NULL, '77330', 'Charlan', 'FR', '0625457856', '20230406-642f1bbf7a1df', 'cs_test_b1hImQ2oe2YTNpeF2aUfQ7XuHawdA2UrsKK28mbZ4sUwN7obJA8whaBeS2', 6, '2023-04-06 21:23:18'),
(17, 2, '2023-04-06 21:30:10', 'Colissimo', 9.9, 1, 'User', 'Demo', NULL, '1 rue du lac', NULL, '69000', 'Lyon', 'FR', '0607080910', '20230406-642f1dc26a5a9', 'cs_test_b1JlEpGI5yZyP7pJcNNu3LLOg6pqV26SXeurmoL20GvMA5TfMRlq0GqQSp', 6, '2023-04-06 21:30:21'),
(18, 2, '2023-04-07 14:49:56', 'UPS', 12.9, 1, 'User', 'Demo', NULL, '1 rue du lac', NULL, '69000', 'Lyon', 'FR', '0607080910', '20230407-643011744f065', 'cs_test_b1B7vYshtV4biSWSOBcNufrqcyYqyJjMAJUXsYiSFs5lfi7JB1kJ3ANLGa', 4, '2023-04-07 14:50:35'),
(19, 2, '2023-04-09 15:32:32', 'Colissimo', 9.9, 1, 'User', 'Demo', NULL, '1 rue du lac', NULL, '69000', 'Lyon', 'FR', '0607080910', '20230409-6432be703df84', 'cs_test_b1fQsDDcUFhnFt1lTVE42UWAvxHWD1W5n8P0Nstp4BA2FODTrjqawrklcQ', 4, '2023-04-09 15:33:04'),
(20, 2, '2023-04-17 21:09:00', 'Colissimo', 9.9, 1, 'User', 'Demo', NULL, '1 rue du lac', NULL, '69000', 'Lyon', 'FR', '0607080910', '20230417-643d994ce8627', 'cs_test_b1FuKyksycyHPTT35p9TIcrb2irUqXpZQhe0pG4gUc7UCeemhtW5qK0YTN', 3, '2023-04-17 21:09:47'),
(21, 2, '2023-06-04 14:10:14', 'Colissimo', 9.9, 1, 'User', 'Demo', NULL, '1 rue du lac', NULL, '69000', 'Lyon', 'FR', '0607080910', '20230604-647c7f26995b9', 'cs_test_b1v2ib7lXCzg441itZHeEeZLTaWC2nxioRgsMJnwlxhcPsFpdPp5Gv6QtC', 3, '2023-06-04 14:10:54'),
(22, 2, '2023-09-01 10:44:23', 'Colissimo', 9.9, 1, 'User', 'Demo', NULL, '1 rue du lac', NULL, '69000', 'Lyon', 'FR', '0607080910', '20230901-64f1a467c16d1', 'cs_test_b1QQyAqBahvMk1IyP0QtYj4k1uuZelvYTE9JNrLT8640qKt54cBY9WYUkT', 3, '2023-09-01 10:44:40'),
(23, 2, '2023-09-20 14:12:19', 'Colissimo', 9.9, 1, 'User', 'Demo', NULL, '1 rue du lac', NULL, '69000', 'Lyon', 'FR', '0607080910', '20230920-650ae1a408e66', 'cs_test_b1pdmUZVWko9lsjzVx6NbuqQMs8iYHOZawX1WsyXFtt3gQJHU2Usrvq7cN', 3, '2023-09-20 14:12:35');

-- --------------------------------------------------------

--
-- Déchargement des données de la table `orders_details`
--

INSERT INTO `orders_details` (`id`, `my_order_id`, `product`, `quantity`, `price`, `total`, `image_name`, `product_id`) VALUES
(18, 9, 'Bonnet tricoté doux et chaud', 1, 12, 12, '8213c725380842e410b1a5e2768f5a662eec770c.jpg', 2),
(19, 10, 'T-shirt manche longue', 1, 24.9, 24.9, '8e49f3ca02e39e4f6486708f038493a9433eb9c6.jpg', 7),
(21, 11, 'Bonnet tricoté doux et chaud', 1, 12, 12, '8213c725380842e410b1a5e2768f5a662eec770c.jpg', 2),
(23, 12, 'Jean coupe droite', 2, 59.99, 119.98, '55db4e78e1bf2a6f203a1c8ef446bdc71d6c06df.webp', 12),
(24, 13, 'Bonnet tricoté doux et chaud', 1, 12, 12, '8213c725380842e410b1a5e2768f5a662eec770c.jpg', 2),
(25, 14, 'Echarpe châle avec frange', 1, 19, 19, '1054e3d60268bd6b6769ce878d5c292dbf021b89.jpg', 3),
(26, 14, 'Bonnet tricoté doux et chaud', 1, 12, 12, '8213c725380842e410b1a5e2768f5a662eec770c.jpg', 2),
(27, 15, 'Jean coupe droite', 1, 59.99, 59.99, '55db4e78e1bf2a6f203a1c8ef446bdc71d6c06df.webp', 12),
(28, 16, 'Chemise noir', 2, 22.99, 45.98, '25889c941aab0709f84fe6e1b25523f05044fd46.webp', 15),
(29, 17, 'Chemise à carreaux rouge et noir', 1, 32.99, 32.99, '6b613594cefa047b7d7bc60eda0d253a7ff48e2f.webp', 14),
(30, 18, 'Chemise à carreaux rouge et noir', 3, 32.99, 98.97, '6b613594cefa047b7d7bc60eda0d253a7ff48e2f.webp', 14),
(31, 18, 'Jean coupe droite', 3, 59.99, 179.97, '55db4e78e1bf2a6f203a1c8ef446bdc71d6c06df.webp', 13),
(32, 19, 'Chemise noir', 1, 22.99, 22.99, '25889c941aab0709f84fe6e1b25523f05044fd46.webp', 15),
(33, 20, 'Chemise à carreaux rouge et noir', 2, 32.99, 65.98, '6b613594cefa047b7d7bc60eda0d253a7ff48e2f.webp', 14),
(34, 21, 'Jean coupe droite', 1, 59.99, 59.99, '55db4e78e1bf2a6f203a1c8ef446bdc71d6c06df.webp', 13),
(35, 22, 'Bonnet multi couleur en tricot', 2, 9, 18, 'a9fa3c4e5d056c28f1b54df8e0a982edea1c902e.webp', 1),
(36, 23, 'Chemise à carreaux rouge et noir', 1, 32.99, 32.99, '6b613594cefa047b7d7bc60eda0d253a7ff48e2f.webp', 14);

-- --------------------------------------------------------

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `image`, `description`, `price`, `is_top_seller`, `stock`, `is_active`, `updated_at`, `created_at`) VALUES
(1, 2, 'Bonnet multi couleur en tricot', 'bonnet-multi-couleur-en-tricot', 'a9fa3c4e5d056c28f1b54df8e0a982edea1c902e.webp', '<div>Ce bonnet multi couleur est un accessoire de mode incontournable pour les journées froides d\'hiver.</div><div>&nbsp;</div><div>Fabriqué avec un mélange de laine et d\'acrylique, il est chaud et confortable à porter tout en ayant une belle tenue. Le pompon assorti ajoute une touche de style supplémentaire.</div><div>&nbsp;</div><div>Avec ses couleurs vives et sa finition soignée, ce bonnet sera le choix parfait pour compléter votre look hivernal.</div>', 9, 1, 7, 1, '2023-10-09 20:28:56', '2021-02-02 15:52:01'),
(2, 2, 'Bonnet tricoté doux et chaud', 'bonnet-tricote-doux-et-chaud', '8213c725380842e410b1a5e2768f5a662eec770c.jpg', '<div>Ce bonnet de ski est parfait pour affronter les conditions froides et enneig&eacute;es des montagnes.</div>\r\n\r\n<div><br />\r\nSa doublure en polaire douce et son tricot &eacute;pais offrent chaleur et confort, tandis que son design ajust&eacute; permet un port confortable sous un casque.</div>', 12, 0, 147, 1, '2023-10-09 18:38:03', '2021-02-04 10:52:21'),
(3, 4, 'Echarpe châle avec frange', 'echarpe-chale-avec-frange', '1054e3d60268bd6b6769ce878d5c292dbf021b89.jpg', 'Echarpe rouge en laine douce. 200x80cm.', 19, 0, 147, 1, '2023-10-09 18:38:03', '2021-02-04 11:25:53'),
(4, 4, 'Echarpe tendance homme', 'echarpe-tendance-homme', 'b985bcfdda029c5ec3a3aa6a9590cf8cdaecbe32.jpg', '<p>Cette &eacute;charpe douce et l&eacute;g&egrave;re est l&#39;accessoire parfait pour une tenue d&eacute;contract&eacute;e le weekend.</p>\r\n\r\n<p>Elle est con&ccedil;ue pour vous tenir chaud tout en vous permettant de bouger librement.</p>\r\n\r\n<p>Avec ses jolis motifs et ses couleurs vibrantes, elle ajoutera une touche de style &agrave; votre look.<br />\r\nEnroulez-la autour de votre cou et profitez de votre journ&eacute;e en toute d&eacute;contraction. Lavage &agrave; la main seulement.</p>', 14.9, 0, 149, 1, '2023-10-09 18:38:02', '2021-02-04 15:17:03'),
(5, 1, 'Manteau à boutons unis gris', 'manteau-a-bouton-unis-gris', '454b8f827a3ed977314f819bd20f568d7d7e8885.jpg', '<div>Le manteau à boutons unis gris vintage peut vous garder un charme féminin rétro en hiver!<br><br>Vous pouvez boutonner tous les boutons et le décolleté gris qui s\'enroule autour de votre cou pour plus de chaleur et d\'élégance.&nbsp;<br><br>Fabriqué avec des matériaux de haute qualité, il vous offrira un confort inégalé tout en vous donnant une allure raffinée et chic.</div><div>Sa coupe ajustée et sa finition soignée en font un must-have.</div>', 69.99, 0, 147, 1, '2023-10-09 18:38:01', '2021-02-04 17:05:33'),
(7, 3, 'T-shirt manche longue', 't-shirt-manche-longue', '8e49f3ca02e39e4f6486708f038493a9433eb9c6.jpg', '<p>Ce t-shirt &agrave; manches longues pour homme est id&eacute;al pour les tenues d&eacute;contract&eacute;es et les sorties occasionnelles.</p>\r\n\r\n<p>Avec son design &eacute;l&eacute;gant et sa coupe confortable, il vous offrira un style d&eacute;contract&eacute; et tendance.</p>\r\n\r\n<p>La mati&egrave;re douce et l&eacute;g&egrave;re vous garantira un confort optimal tout au long de la journ&eacute;e.</p>', 24.9, 0, 147, 1, '0000-00-00 00:00:00', '2021-03-16 15:58:52'),
(8, 3, 'T-shirt basique blanc', 't-shirt-basique-blanc', '00bc05be26a25e91496e615fc9c2157a101654df.webp', '<div>Ce t-shirt basique est un essentiel pour toute garde-robe masculine.</div><div>Avec sa coupe classique et son col rond, il peut être porté seul ou sous une chemise pour un look plus habillé.</div><div>Fabriqué à partir d\'un mélange de coton doux, ce t-shirt vous offrira un confort optimal tout au long de la journée.</div>', 9.9, 0, 4, 1, '2023-10-10 15:22:58', '2021-03-16 16:05:51'),
(10, 5, 'Sweat bleu à capuche', 'sweat-bleu-a-capuche', '15e8d499c0813dfa5985b59d38a3b7de2fce620f.webp', '<div>Exclusivité internet. Regular-fit. Tissu coton durable mélangé. Capuche avec cordon de serrage.<br>&nbsp;Manches longues. Poche kangourou. Bords élastiques.</div>', 29.99, 0, 148, 1, '2023-09-21 15:30:00', '2021-04-17 15:55:12'),
(13, 7, 'Jean coupe droite', 'jean-coupe-droite', '55db4e78e1bf2a6f203a1c8ef446bdc71d6c06df.webp', '<div>Jean coupe droite.</div>', 59.99, 1, 4, 1, '2023-10-09 18:38:49', '2023-03-30 12:44:42'),
(14, 8, 'Chemise à carreaux rouge et noir', 'chemise-a-carreaux-rouge-et-noir', '6b613594cefa047b7d7bc60eda0d253a7ff48e2f.webp', '<div>Chemise à carreaux rouge et noir 100% coton. Cintré.</div>', 32.99, 0, 3, 1, '2023-04-05 14:30:05', '2023-04-04 22:55:03'),
(15, 8, 'Chemise noir', 'chemise-noir', '25889c941aab0709f84fe6e1b25523f05044fd46.webp', '<div>Chemise noir cintré.</div>', 22.99, 0, 16, 1, '2023-10-10 15:26:52', '2023-04-05 12:12:47'),
(16, 9, 'Lot de 3 polos', 'lot-de-3-polos', 'c8c6ad8e8ccc33b5b9c8b60c4365d2c11593a0cb.webp', '<div>Magnifique lot de 3 polos.</div>', 29.99, 0, 20, 1, '2023-09-21 17:11:18', '2023-09-21 17:10:23'),
(17, 6, 'Pull 100% coton gris chine', 'pull-100-coton-gris-chine', 'b7beb1ff99ea3d89b0ff2ca095786ae7a2582faa.png', '<div>Pull 100% coton gris chine.</div>', 29.99, 0, 20, 1, NULL, '2023-09-21 17:40:43'),
(18, 6, 'Pull 100% coton kaki', 'pull-100-coton-kaki', 'db9cd8cf50e70939dc3f884715f2c44e4bf3b662.webp', '<div>Pull 100% coton kaki.</div>', 34.99, 1, 20, 1, '2023-10-09 18:38:29', '2023-09-21 17:46:51'),
(19, 3, 'T-shirt basique noir', 't-shirt-basique-noir', 'f4e0d78a0de00ffbfee8eb8d483e4fa1d2cb0763.png', '<div>Ce t-shirt basique est un essentiel pour toute garde-robe masculine.</div><div>Avec sa coupe classique et son col rond, il peut être porté seul ou sous une chemise pour un look plus habillé.</div><div>Fabriqué à partir d\'un mélange de coton doux, ce t-shirt vous offrira un confort optimal tout au long de la journée.</div>', 9.9, 0, 40, 1, '2023-09-21 18:12:02', '2021-03-16 16:05:51'),
(20, 3, 'T-shirt basique rouge', 't-shirt-basique-rouge', 'db47035ec544a7e570befe1330dee3a5356a5ba4.webp', '<div>Ce t-shirt basique est un essentiel pour toute garde-robe masculine.</div><div>Avec sa coupe classique et son col rond, il peut être porté seul ou sous une chemise pour un look plus habillé.</div><div>Fabriqué à partir d\'un mélange de coton doux, ce t-shirt vous offrira un confort optimal tout au long de la journée.</div>', 9.9, 0, 40, 1, '2023-09-21 18:14:55', '2021-03-16 16:05:51'),
(25, 8, 'Chemise fleuri', 'chemise-fleuri', '09c48017ebb43ca280a54daa85137b1c34c29116.webp', '<div>Chemise fleuri 100% coton. Cintré.</div>', 44.99, 1, 10, 1, '2023-10-10 15:23:44', '2023-04-04 22:55:03'),
(32, 8, 'Chemise à pois', 'chemise-a-carreaux-rouge-et-noir', '5f5f2da453ab0d0fd5103ae082905bc40c48269c.webp', '<div>Chemise à points 100% coton. Cintré.</div>', 39.99, 0, 10, 1, '2023-10-10 15:24:20', '2023-04-04 22:55:03'),
(33, 6, 'Pull 100% coton multi couleur', 'pull-100-coton-multi-couleur', 'f01078d81c57140c4b337f276bf725be1608b18a.webp', '<div>Pull 100% coton multi couleur.</div>', 34.99, 1, 20, 1, '2023-10-10 15:24:50', '2023-09-21 17:46:51'),
(34, 6, 'Pull 100% coton marron', 'pull-100-coton-marron', '2b496022d5eb5450968c9820b3139f786b992429.webp', '<div>Pull 100% coton marron.</div>', 34.99, 0, 20, 1, '2023-10-10 15:25:21', '2023-09-21 17:46:51'),
(35, 10, 'Veste élégance', 'veste-elegance', 'ff7a36ab1667e8ae27f57d8054a3c4b28c0c13f9.webp', '<div>Mesdames, préparez-vous à étinceler ! Cette veste rose dorée, la pièce maîtresse pour toute fashionista en quête d\'éclat. Une explosion de glamour, ce produit est la définition même de l\'élégance contemporaine associée à une touche d\'audace.</div>', 39.9, 1, 48, 1, '2023-10-10 15:25:31', '2021-02-04 17:05:33');

-- --------------------------------------------------------

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`, `is_verified`) VALUES
(1, 'admin@demo.local', '[\"ROLE_ADMIN\"]', '$2y$13$oKjW1kQfdipaoHDUhD22UORdOngTBEp3z2huUoAQUZT9CnBTBZ73G', 'Administrator', 'Demo', 1),
(2, 'user@demo.local', '[\"ROLE_USER\"]', '$2y$13$969KETx5P6SkjSh8fSZzp.QNFuWYHnO9tnPlLLyFuYM/Tze2QJW5y', 'User', 'Demo', 1),
(3, 'tdupont@demo.local', '[\"ROLE_USER\"]', '$2y$13$969KETx5P6SkjSh8fSZzp.QNFuWYHnO9tnPlLLyFuYM/Tze2QJW5y', 'Thierry', 'Dupont', 1);

-- --------------------------------------------------------

--
-- AUTO_INCREMENT pour la table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `carriers`
--
ALTER TABLE `carriers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `header`
--
ALTER TABLE `header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `orders_details`
--
ALTER TABLE `orders_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users_reset_password`
--
ALTER TABLE `users_reset_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;