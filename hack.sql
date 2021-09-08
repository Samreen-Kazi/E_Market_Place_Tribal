-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 05, 2021 at 09:47 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hack`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(8, 'Samreen Kazi', 'sammy@gmail.com', '$2y$10$PmzjhxliFemEYTqrFjn7TuEcXJ8r1/BvfpNN25ybv6LH3ziDsri9O', '0');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `brand_id` int(100) NOT NULL AUTO_INCREMENT,
  `brand_title` text NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Bhil'),
(3, 'Warli'),
(4, 'Tribal Arts'),
(5, 'Pithora'),
(6, 'Wooden Products'),
(7, 'Handmade Products'),
(8, 'Metal Products'),
(9, 'Curtains'),
(10, 'Door Hanging'),
(11, 'Mats'),
(12, 'Cushion Cover'),
(13, 'Bedsheets'),
(14, 'Honey'),
(15, 'Palm Oil');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(100) NOT NULL AUTO_INCREMENT,
  `cat_title` text NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'Painting'),
(3, 'Handicrafts'),
(4, 'Arts'),
(5, 'Home Decor'),
(6, 'Forest Products');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(5, 3, 13, 1, '29B33012XW487590G', 'Completed'),
(6, 3, 15, 1, '1YA0461114661711D', 'Completed'),
(7, 3, 15, 1, '4FW00757GG8086738', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fk_product_cat` (`product_cat`),
  KEY `fk_product_brand` (`product_brand`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(15, 2, 4, 'Tribal Art', 600, 200, 'Tribal art generally reflects the creative energy found in rural areas that acts as an undercurrent to the craftsmanship of the tribal people. Tribal art ranges through a wide range of art forms, such as wall paintings, tribal dances, tribal music, and so on.', '1578800806_download.jpg', 'Tribal Art'),
(16, 2, 5, 'Pithora', 300, 200, 'Pithora paintings are highly enriched folk art culture of Gujarat done on the walls by several tribes such as the Rathwas and Bhilalas who live in the central Gujarat, 90 km (56 mi) from Vadodara, in a village called Tejgadh. Pithora paintings are more of a ritual than an art form', '1578801152_pithora.jpg', 'Pithora'),
(17, 3, 6, 'Wooden Jewelry Box', 1000, 200, 'We are one of the renowned manufacturers and exporters of Wooden Products. \r\nOur range of products is not limited to furniture. \r\nAlong with furniture, we also manufacture wooden idols, frames, showpieces, pen stands, jewellery boxes, wooden carving brackets, kitchen ware and plenty more\r\n', '1578801451_wooden jwellery box.jpg', 'Wooden Jewelry Box'),
(18, 3, 6, 'Wooden Statue', 800, 200, 'We are one of the renowned manufacturers and exporters of Wooden Products. \r\nOur range of products is not limited to furniture. \r\nAlong with furniture, we also manufacture wooden idols, frames, showpieces, pen stands, jewellery boxes, wooden carving brackets, kitchen ware and plenty more\r\n', '1578801615_wooden statue.jpg', 'Wooden Statue'),
(19, 3, 6, 'Wooden Key Holder', 300, 200, 'We are one of the renowned manufacturers and exporters of Wooden Products. \r\nOur range of products is not limited to furniture. \r\nAlong with furniture, we also manufacture wooden idols, frames, showpieces, pen stands, jewellery boxes, wooden carving brackets, kitchen ware and plenty more\r\n', '1578801796_Wall Hanging Wooden Key Holder.jpg', 'Wooden Key Holder'),
(20, 3, 7, 'Handmade Fan', 200, 200, 'We manufacture wooden idols, frames, showpieces, pen stands, jewelry boxes, wooden carving brackets, kitchen ware and plenty more', '1578801973_handmade fan.jpg', 'Handmade Fan'),
(21, 3, 7, 'Handmade Statue', 600, 200, 'We manufacture wooden idols, frames, showpieces, pen stands, jewelry boxes, wooden carving brackets, kitchen ware and plenty more', '1578802095_handmade show piece.jpg', 'Handmade Statue'),
(22, 4, 8, 'Dokra Fork And Spoon', 900, 200, 'The craft used â€œDhalaiâ€ , also known as sand molded casting, is a metal casting process characterized by using sand as the mold material. Casting is a craft process by which a liquid material is usually poured into a mold, which contains a hollow cavity of the desired shape, and then allowed to solidify. The solidified part is ejected or broken out\r\nof the mold to complete the process.\r\n', '1578802539_dokra.jpg', 'Metal Spoon and Fork '),
(23, 2, 1, 'Bhil', 400, 200, 'Bhil paintings usually consist of large, un-lifelike shapes of everyday characters filled in with earthy, yet bright colours, and then covered with an overlay of uniform dots in several patterns and colours that stand out strikingly against the background. The dots on a Bhil painting are not random.', '1578818646_bhil.jpg', 'Bhil'),
(24, 2, 3, 'Warli', 600, 200, 'Warli painting is a style of tribal art mostly created by the tribal people from the North Sahyadri Range in India. This range encompasses cities such as Dahanu, Talasari, Jawhar, Palghar, Mokhada, and Vikramgad of Palghar district. This tribal art was originated in Maharashtra, where it is still practiced today.', '1578818695_warli.jpg', 'Warli'),
(25, 4, 8, 'Metal Nandi Sitting', 900, 200, 'Nandi, the vehicle of the Hindu God Shiva, stands as a symbol for strength, virility, and load bearing capacity. Considering that Lord Shiva never had to fight any fierce battles and could travel at His own pace between the worlds- most of the time He is pictured meditating- there was no need for Him to have a more agile vahana. Moreover, with bulls being the best form of transportation in rural India, it makes perfect sense to have Lord Shiva taking a form that was close to the people.', '1578819300_nandi.jpg', 'Nandi'),
(26, 4, 8, 'Door Handling Danawala', 700, 200, 'Traditionally the Gadwa, Gond and Dhurwa tribes of Kondagaon in Bastar region of Chattisgarh have been practising the Dhokra art with lost wax technique or hollow casting. It involves patterning a clay core intricately with wax wires and then coating it carefully with a mix of clay and hay. The wax covered clay core is put in the cauldron of molten metal with an opening/hole in the clay mixture, where the wax is subsequently melted off, and the space thus created is filled with metal- an alloy of copper, brass and tin which enters through the hole. The outer layer of clay is then chipped off and the metal icon is polished and finished as desired', '1578819365_door handle.jpg', 'Door Handle'),
(27, 4, 8, 'Handmade Brass Standard Statue', 800, 200, 'This brass folk musician statue originates from Orissa, India.', '1578819430_brass statue.jpg', 'Brass Statue'),
(28, 5, 9, 'Curtains', 1200, 200, 'The craft is traditional to the Santhal tribe of West Bengal. Madhurkathi grass which is abundantly available in West Bengal such as in 24 Pargana area is used in weaving traditional mats. Floor mats and curtains/blinds, for doors and windows are woven by these tribals. Patterns are made by dying the grass in different colors and then weaving the same with cotton thread as either warp or weft. The strips of woven mat are joined together by stitching with cotton fabric, which forms the folds and gives the particular color to the curtain/ blind.', '1578819497_curtains.jpg', 'Curtains'),
(29, 5, 10, 'Door Hangings', 600, 200, 'Single or multiple door leaf, sliding hangar doors are available in any required size\r\nSliding hangar doors can sustain extreme weather conditions and can provide excellent insulation\r\nSliding hangar doors provide the best alternative for large-scale door locations, requiring high-quality heat and noise insulation\r\n', '1578819557_door hangings.jpg', 'Door Hangings'),
(30, 5, 11, 'Mats', 1300, 200, 'The craft is traditional to the Santhal tribe of West Bengal. Madhurkathi grass which is abundantly available in West Bengal such as in 24 Pargana area is used in weaving traditional mats. Floor mats and curtains/blinds, for doors and windows are woven by these tribals. Patterns are made by dying the grass in different colors and then weaving the same with cotton thread as either warp or weft. The strips of woven mat are joined together by stitching with cotton fabric, which forms the folds and gives the particular color to the curtain/ blind', '1578819610_mats.jpg', 'Mats'),
(31, 5, 12, 'Cushion Cover', 600, 200, 'Panpaliya presents Wholesale Ethnic Indian Tribal Creative Handmade Patch Work, Applique work Hand Embroidery & Mirror work Cushions Cover is made using cotton fabric. It Contains Attractive Mirror Work Patch work. ', '1578819666_cushion.jpg', 'Cushion Cover'),
(32, 5, 13, 'Bed Sheets', 2000, 200, 'Inspired by Warli- an art of painting by Adivasi-tribals of India, this Bedsheet in Purple is crafted from premium cotton quality that guarantees a happy experience. a beautiful pick to opt to add in your decor at festive occasions.Wash Care Instructions :- first few wash separately | cold machine wash | do not tumble dry | dry in shade.Good quality, Best price, Value for money & an Excellent buying experience.', '1578819728_bed.jpg', 'Panpaliya presents Wholesale Ethnic Indian Tribal Creative Handmade Patch Work, Applique work Hand Embroidery & Mirror work Cushions Cover is made using cotton fabric. It Contains Attractive Mirror Work Patch work. '),
(33, 6, 14, 'Honey', 500, 200, 'Today, honey is one of the major foods sourced from forests. The biggest sellers of honey are communities that stay next to forests. Most governments allow humans neighbouring forests to carry out commercial activities in the forests as long as they do not harm the forest. ', '1578819876_honey.jpg', 'Honey'),
(34, 6, 15, 'Palm Oil', 600, 200, 'Palm oil production is the main economic activities of humans in the regions where palm trees grow. Although farmers can cultivate palm trees in their farms, the communities also share the produce from the palm forests within their vicinity.', '1578819915_plam.jpg', 'Palm Oil');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE IF NOT EXISTS `user_info` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(3, 'Arsheen ', 'Kazi', 'arsheen@gmail.com', '8f552968b51391c6b9a397e99a32fd5c', '9892220193', 'Mumbai', 'India'),
(4, 'Shabana', 'Kazi', 'shabanakazi@gmail.com', '9e3b4aebfa8751ff1894d8c3a42100da', '9892254556', 'Mumbai', 'India');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
