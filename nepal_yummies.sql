-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2024 at 08:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nepal_yummies`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `gtotal` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `product` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `price`, `quantity`, `total`, `gtotal`, `order_date`, `product`) VALUES
(56, 7, 150.00, 1, 150.00, 0.00, '2024-07-20 08:18:48', 'Chicken Pizza'),
(57, 8, 120.00, 1, 120.00, 0.00, '2024-07-20 08:19:54', 'Pizza'),
(59, 17, 120.00, 2, 240.00, 0.00, '2024-07-20 08:22:53', 'Buff Momo');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `featured` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `image_name`, `featured`, `status`) VALUES
(10, 'PIZZA', 'Category_5088.jpg', 'Yes', 'Yes'),
(19, 'Burger', 'Category_9018.jpg', 'No', 'Yes'),
(20, 'MOMO', 'Category_8310.jpg', 'Yes', 'Yes'),
(25, 'Dal Bhat(sakhari)', 'Category_3355.jpg', 'Yes', 'Yes'),
(26, 'Dal Bhat(non veg)', 'Category_5422.jpg', 'Yes', 'Yes'),
(27, 'Chicken Chilly', 'Category_2388.jpg', 'No', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_feedback` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `customer_name`, `customer_email`, `customer_feedback`) VALUES
(1, 'Jakeem Stout', 'sijylaj@mailinator.com', 'Ad atque voluptate r'),
(2, 'Fletcher Harrell', 'wepivux@mailinator.com', 'Dolorem do debitis sab\r\ncd\r\nef\r\ng'),
(3, 'Patrick Price', 'kydota@mailinator.com', 'Amet veniam blandi'),
(4, 'Rae Atkinson', 'gunykudafi@mailinator.com', 'Aut consequatur cup'),
(5, 'Olympia Solomon', 'bopaga@mailinator.com', 'Ut ducimus totam no'),
(6, 'Lydia Stout', 'vimuf@mailinator.com', 'Illo earum non vitae'),
(7, 'samir baniya', '9841558311', '“I love the avocado toast and the California focaccia”\r\n\r\n“Their brunch is awesome, I love the avocado toast and the California focaccia. Pizza is really good as well.” – Alison B.\r\n\r\n“Not just on the lower Cape…. anywhere!”\r\n\r\n“Best Pizza EVER! Not just on the lower Cape…. anywhere!” – Ellen H.\r\n\r\n“I will definitely be back!”\r\n\r\n“I was so impressed with my breakfast this morning! I tried the Fried Green Tomato Benedict and my boyfriend got the Crab Cakes Benedict. We both finished our whole plates and were so impressed with the quality of the food and the short amount of time it took to receive it. Our waitress was sweet and helpful. I will definitely be back!” – Julia L.\r\n\r\n“Always worth the stop.”\r\n\r\n“This is always our breakfast stop before heading home from vacation. Always delicious. Always great service. Always worth the stop.” – Kristine R.\r\n\r\n“I would recommend Fairway Restaurant.”\r\n\r\n“I won a $30. Gift card for Fairway Restaurant in Eastham from Cape 104.7 radio. Brought my sister for breakfast. The breakfast was crab cakes with spinach and poached eggs and hollandaise sauce. Jill got fried green tomatoes with spinach and poached eggs with hollandaise sauce. Both were Excellent. The restaurant is very clean. Professional Staff. I would recommend Fairway Restaurant.” – James T.\r\n\r\n“One of the best places…”\r\n\r\n“One of the best places I’ve eaten on Cape Cod. Great cocktails, awesome.” – Eric T.\r\n\r\n“Im from the south, thats saying a lot…”\r\n\r\n“Breakfast was delicious. Like a good homestyle country savory breakfast (and Im from the south, thats saying a lot)… Enjoyed the whole experience and definitely recommend this place for a place to eat on the cape.” – Ronnie E.\r\n\r\n“Best breakfast on the east coast!”'),
(8, '', 'setojamucy@mailinator.com', 'sdfg\r\n'),
(9, 'name', 'verav@mailinator.com', ''),
(10, 'Solomon Hensley', 'zufyqy@mailinator.com', 'Est sequi voluptate '),
(11, 'Garrison Barry', 'guhemofa@mailinator.com', 'Iste dolor quo minim'),
(12, 'Jayme Pierce', 'lexo@mailinator.com', 'Excepturi excepturi '),
(13, 'Wayne Green', 'fyca@mailinator.com', 'Rerum minima ad ut i'),
(14, 'samir baniya', 'samirbaniya500@gmail.com', 'asdf');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `c_name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_address` varchar(150) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_contact` varchar(15) NOT NULL,
  `customer_feedback` text NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `product` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `image_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `description`, `category_id`, `featured`, `status`, `image_name`) VALUES
(7, 'Chicken Pizza', 150.00, 'Succulent grilled chicken, gooey mozzarella, and tangy tomato sauce on a crispy crust make our chicken pizza a delicious treat!', 10, 'Yes', 'Yes', 'Product_5871.jpg'),
(8, 'Pizza', 120.00, 'Enjoy a classic pizza topped with savory tomato sauce, melted mozzarella cheese, and a medley of fresh toppings, all baked to perfection on a golden, crispy crust.', 10, 'Yes', 'Yes', 'Product_2667.jpg'),
(17, 'Buff Momo', 120.00, 'Explore our unique buffalo momo—a fusion of Tibetan dumplings with spicy buffalo sauce, delivering bold flavors in every bite.', 20, 'Yes', 'Yes', 'Product_3876.jpg'),
(18, 'Cheese Pizza', 150.00, 'Indulge in the timeless simplicity of ourextra  cheese pizza, featuring a perfect blend of melted mozzarella atop a crisp, golden crust.', 10, 'Yes', 'Yes', 'Product_9856.png'),
(19, 'Burger', 200.00, 'made with 100% pure beef patty, topped with melted cheddar cheese, crisp lettuce, ripe tomato, pickles, and served on a toasted bun with our secret sauce.', 19, 'Yes', 'Yes', 'product_9936.jpg'),
(21, 'Dal Bhat', 120.00, 'Dal Bhat Sakahari is a traditional Nepali dish featuring lentils (dal) and rice (bhat), served with a variety of vegetarian (sakahari) side dishes, offering a wholesome and satisfying culinary experience.\"', 25, 'Yes', 'Yes', 'Product_2238.jpg'),
(22, 'Chicken Momo', 130.00, 'Chicken momo: Juicy minced chicken wrapped in delicate dough, steamed to perfection and served with a flavorful dipping sauce.', 20, 'Yes', 'Yes', 'product_1927.jpg'),
(23, 'Fried Chicken Momo', 130.00, 'Fried chicken momo: Crispy, golden dumplings filled with seasoned chicken, perfect for a deliciously crunchy twist on a classic favorite.', 20, 'Yes', 'Yes', 'product_3074.jpg'),
(24, 'Veg Momo', 120.00, 'Veg momo: Delicate dumplings filled with a savory mixture of vegetables, steamed to perfection and served with a delightful dipping sauce.', 20, 'Yes', 'Yes', 'product_3077.jpg'),
(25, 'Dal Bhat(chicken)', 150.00, 'A hearty Nepali meal featuring aromatic rice (bhat) served with lentil soup (dal) and flavorful chicken curry, offering a balanced and satisfying dining experience.', 26, 'No', 'Yes', 'product_8446.jpg'),
(26, 'Dal Bhat(mutton)', 190.00, 'A traditional Nepali meal comprising fragrant rice (bhat) accompanied by lentil soup (dal) and tender mutton curry, delivering a robust and flavorful culinary experience.', 26, 'Yes', 'Yes', 'Product_5398.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `user_name`, `password`) VALUES
(23, 'Gopal Sharma', 'Gopal', 'b6d767d2f8ed5d21a44b0e5886680cb9'),
(24, 'Hari Prasad KC', 'Hari', 'd41d8cd98f00b204e9800998ecf8427e'),
(29, 'Ali Ware', 'fujove', 'd41d8cd98f00b204e9800998ecf8427e'),
(30, 'Lee Alston', 'rurafoneva', 'd41d8cd98f00b204e9800998ecf8427e'),
(31, 'sallu', 'sam', 'd41d8cd98f00b204e9800998ecf8427e'),
(32, 'Raj Shrestha', 'Raj', 'd41d8cd98f00b204e9800998ecf8427e'),
(33, 'Sam KC', 'sam', 'd41d8cd98f00b204e9800998ecf8427e'),
(35, 'sam', 'sam', '332532dcfaa1cbf61e2a266bd723612c'),
(38, 'Shyam Shrestha', 'shyam', '5a4cd850fc787d454416aa3a47580468'),
(39, 'Hari Nepal', 'Hari', 'a9bcf1e4d7b95a22e2975c812d938889');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
