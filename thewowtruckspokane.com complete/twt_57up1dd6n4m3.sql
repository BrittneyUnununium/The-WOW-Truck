-- phpMyAdmin SQL Dump
-- version 2.8.0.1
-- http://www.phpmyadmin.net
-- 
-- Host: custsql-ipg50.eigbox.net
-- Generation Time: Mar 11, 2014 at 04:55 PM
-- Server version: 5.5.32
-- PHP Version: 4.4.9
-- 
-- Database: `twt_57up1dd6n4m3`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `categories`
-- 

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  `side` enum('left','right') NOT NULL DEFAULT 'left',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

-- 
-- Dumping data for table `categories`
-- 

INSERT INTO `categories` VALUES (1, 'Seafood', 'Made From Scratch Daily', 1, 'left');
INSERT INTO `categories` VALUES (2, 'Panther Buffalo Wings', 'Mild/Medium/Spicy', 2, 'left');
INSERT INTO `categories` VALUES (3, 'Outrageous Grill Cheese', '', 3, 'left');
INSERT INTO `categories` VALUES (4, 'WOW Burgers', '', 1, 'right');
INSERT INTO `categories` VALUES (5, 'Killer Burgers', '', 2, 'right');
INSERT INTO `categories` VALUES (6, 'Macho Nacho''s', '', 3, 'left');
INSERT INTO `categories` VALUES (7, 'Gourmet Mac & Cheese', 'Inc. Parmesan Crostini', 4, 'left');
INSERT INTO `categories` VALUES (8, 'Loco Burrito''s', '(All Meats Marinated) Guacamole Recommended', 4, 'right');
INSERT INTO `categories` VALUES (9, 'Paco Taco''s', 'Guacamole Recommended', 5, 'right');
INSERT INTO `categories` VALUES (10, 'Big City Dogs', '', 5, 'left');
INSERT INTO `categories` VALUES (11, 'Freaky Fries', 'Tasty Toppings', 6, 'left');
INSERT INTO `categories` VALUES (12, 'Breakfast Burritos', '(Includes eggs, hash browns, cheese)', 6, 'right');
INSERT INTO `categories` VALUES (13, 'Breakfast Sandwiches', '(Includes eggs, hash browns, cheese)', 7, 'right');
INSERT INTO `categories` VALUES (14, 'Biscuits & Gravy', '', 8, 'right');
INSERT INTO `categories` VALUES (15, 'Screamin Sandwiches', '', 7, 'left');
INSERT INTO `categories` VALUES (16, 'Slammin Subs', '', 8, 'right');
INSERT INTO `categories` VALUES (17, 'Dessert', '(Inc. Strawberry & Whipped Cream Topping)', 9, 'right');
INSERT INTO `categories` VALUES (18, 'Drinks', '', 10, 'right');
INSERT INTO `categories` VALUES (19, 'Sides', '', 11, 'right');

-- --------------------------------------------------------

-- 
-- Table structure for table `items`
-- 

CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=latin1 AUTO_INCREMENT=119 ;

-- 
-- Dumping data for table `items`
-- 

INSERT INTO `items` VALUES (1, 1, 'Fish & Chips', 'Includes fries and slaw', '', 0, 1);
INSERT INTO `items` VALUES (2, 1, '1 piece', '', 'fish_and_chips_with_slaw.jpg', 495, 2);
INSERT INTO `items` VALUES (3, 1, '2 piece', '', 'fish_and_chips_with_slaw.jpg', 695, 2);
INSERT INTO `items` VALUES (4, 1, '3 piece', '', 'fish_and_chips_with_slaw.jpg', 895, 2);
INSERT INTO `items` VALUES (5, 1, 'Ceviche Tostada', '', '', 0, 3);
INSERT INTO `items` VALUES (6, 1, 'Crab', '', 'crab_ceviche_tostada.jpg', 495, 4);
INSERT INTO `items` VALUES (7, 1, 'Shrimp', '', 'shrimp_ceviche_tostada.jpg', 495, 4);
INSERT INTO `items` VALUES (8, 1, 'Shrimp & Chips', 'Includes fries and slaw', '', 0, 5);
INSERT INTO `items` VALUES (9, 1, '6 piece', '', 'shrimp_basket.jpg', 650, 6);
INSERT INTO `items` VALUES (10, 1, '10 piece', '', 'shrimp_basket.jpg', 950, 7);
INSERT INTO `items` VALUES (11, 1, 'Shrimp/Crab Cocktail', '', '', 0, 8);
INSERT INTO `items` VALUES (12, 1, '12 oz.', '', 'shrimp-crab_cocktail.jpg', 595, 9);
INSERT INTO `items` VALUES (13, 1, '16 oz.', '', 'shrimp-crab_cocktail.jpg', 795, 10);
INSERT INTO `items` VALUES (14, 2, '6 wings', '', 'buffalo_wings.jpg', 425, 11);
INSERT INTO `items` VALUES (15, 2, '10 wings', '', 'buffalo_wings.jpg', 725, 12);
INSERT INTO `items` VALUES (16, 2, '15 wings', '', 'buffalo_wings.jpg', 1125, 13);
INSERT INTO `items` VALUES (17, 3, 'Pulled Pork/Grilled Onion', '', 'pulled_pork_grilled_cheese.jpg', 495, 1);
INSERT INTO `items` VALUES (18, 3, 'Bacon Mac & Cheese', '', 'bacon_mac_grilled_cheese.jpg', 595, 2);
INSERT INTO `items` VALUES (19, 3, 'Green Chili Pepper Jack', '', 'pepperjack_green_chile_grilled_cheese.jpg', 495, 3);
INSERT INTO `items` VALUES (20, 3, 'Bacon/Avacado', '', 'bacon_avacado_grilled_cheese.jpg', 595, 4);
INSERT INTO `items` VALUES (21, 3, 'Double Grill', '', 'double_grilled_cheese.jpg', 395, 5);
INSERT INTO `items` VALUES (22, 3, 'Grill Cheese', '', 'reg_grilled_cheese.jpg', 275, 6);
INSERT INTO `items` VALUES (23, 4, 'Reg Burger', '', 'reg_hamburger.jpg', 195, 1);
INSERT INTO `items` VALUES (24, 4, 'Cheese Burger', '', 'cheeseburger.jpg', 250, 2);
INSERT INTO `items` VALUES (25, 4, 'Bacon Cheese Burger', '', 'bacon_cheeseburger.jpg', 395, 3);
INSERT INTO `items` VALUES (26, 4, 'Double Cheese Burger', '', 'double_cheeseburger.jpg', 395, 4);
INSERT INTO `items` VALUES (27, 4, 'Triple Cheese Burger', '', 'triple_cheeseburger.jpg', 595, 5);
INSERT INTO `items` VALUES (28, 4, 'French Fries Stuffed Cheeseburger', '', 'french_fry_stuffed_burger.jpg', 395, 6);
INSERT INTO `items` VALUES (29, 5, 'Green Chili Pepper Jack', '', 'green_chile_pepperjack_burger.jpg', 395, 1);
INSERT INTO `items` VALUES (30, 5, 'Buffalo Blue Cheese', '', 'buffalo_blue_cheese.jpg', 495, 2);
INSERT INTO `items` VALUES (31, 5, 'Mushroom/Grilled Onion/Swiss', '', 'mushroom_swiss_burger.jpg', 425, 3);
INSERT INTO `items` VALUES (32, 5, 'Turkey/Avocado/Bacon/Ranch', '', 'turkey_avocado_bacon_burger.jpg', 495, 4);
INSERT INTO `items` VALUES (33, 5, 'Spicy Chorizo/Jalapeno/Guacamole', '', 'chorizo_jalapeno_guac_burger.jpg', 450, 5);
INSERT INTO `items` VALUES (34, 5, 'Pastrami Cheeseburger', '', 'pastrami_cheeseburger.jpg', 450, 6);
INSERT INTO `items` VALUES (35, 5, 'Chili Cheese Burger', '', 'chili_cheese_burger.jpg', 395, 7);
INSERT INTO `items` VALUES (36, 5, 'Bacon Mac & Cheese', '', 'bacon_mac_cheese_burger.jpg', 450, 8);
INSERT INTO `items` VALUES (37, 6, 'Chile Verde', '', 'chile_verde_nachos.jpg', 650, 1);
INSERT INTO `items` VALUES (38, 6, 'Steak', '', 'steak_nachos.jpg', 650, 2);
INSERT INTO `items` VALUES (39, 6, 'Chicken', '', 'chicken_nachos.jpg', 550, 3);
INSERT INTO `items` VALUES (40, 6, 'Ground Beef', '', 'ground_beef_nachos.jpg', 550, 4);
INSERT INTO `items` VALUES (41, 6, 'Pulled Pork/Guacamole', '', 'pulled_pork_nachos.jpg', 650, 5);
INSERT INTO `items` VALUES (42, 7, 'Mama´s Traditional', '', 'mamas_traditional_mac_and_cheese.jpg', 495, 1);
INSERT INTO `items` VALUES (43, 7, 'Mac Daddy Bacon Crusted', '', 'bacon_mac_and_cheese.jpg', 595, 2);
INSERT INTO `items` VALUES (44, 7, 'Blue Cheese Steak', '', 'blue_cheese_steak_mac_and_cheese.jpg', 695, 3);
INSERT INTO `items` VALUES (45, 7, 'Chile Verde', '', 'chile_verde_mac_and_cheese.jpg', 595, 4);
INSERT INTO `items` VALUES (46, 7, 'Jalapeno/Pepper Jack', '', 'jalapeno_pepperjack_mac_and_cheese.jpg', 595, 5);
INSERT INTO `items` VALUES (47, 8, 'Carne Asada (Steak)', '', 'carne_asada_burrito.jpg', 495, 1);
INSERT INTO `items` VALUES (48, 8, 'Chicken', '', 'chicken_burrito.jpg', 495, 2);
INSERT INTO `items` VALUES (49, 8, 'Carnitas (Shredded Pork)', '', 'carnitas_burrito.jpg', 495, 3);
INSERT INTO `items` VALUES (50, 8, 'Shrimp Fajitas', '', 'shrimp_burrito.jpg', 495, 4);
INSERT INTO `items` VALUES (51, 8, 'Chile Verde (Not Spicy)', '', 'chile_verde_burrito.jpg', 495, 5);
INSERT INTO `items` VALUES (52, 8, 'Chile Verde Wet Burrito (Verde Sauce smothered on top)', '', 'chile_verde_wet_burrito.jpg', 650, 6);
INSERT INTO `items` VALUES (53, 8, '', 'Make Any Burrito a Grande with Guacamole/Sour Cream $2.00 Extra', '', 0, 7);
INSERT INTO `items` VALUES (54, 9, 'Fish (Deep Fried)', '', 'fried_fish_taco.jpg', 275, 1);
INSERT INTO `items` VALUES (55, 9, 'Carne Asada (Steak)', '', 'carne_asada_tacos.jpg', 295, 2);
INSERT INTO `items` VALUES (56, 9, 'Chicken', '', 'chicken_tacos.jpg', 275, 3);
INSERT INTO `items` VALUES (57, 9, 'Carnitas', '', 'carnitas_tacos.jpg', 275, 4);
INSERT INTO `items` VALUES (58, 9, 'Chile Verde (Not Spicy)', '', 'chile_verde_tacos.jpg', 295, 5);
INSERT INTO `items` VALUES (60, 9, 'Shrimp Fajitas', '', 'shrimp_fajita.jpg', 350, 6);
INSERT INTO `items` VALUES (61, 9, 'House Special', '', 'house_special_tacos.jpg', 275, 7);
INSERT INTO `items` VALUES (62, 9, 'Taquitos (Two, Inc. Guacamole)', '', 'taquitos_guac.jpg', 550, 8);
INSERT INTO `items` VALUES (63, 10, 'BBQ Cole Slaw', '', 'bbq_slaw_dog.jpg', 395, 1);
INSERT INTO `items` VALUES (64, 10, 'Bacon/Chili Cheese', '', 'bacon_chili_cheese_dog.jpg', 395, 2);
INSERT INTO `items` VALUES (65, 10, 'Bacon/Grilled Onion', '', 'bacon_grilled_onion_dog.jpg', 395, 3);
INSERT INTO `items` VALUES (66, 10, 'Bacon Mac & Cheese', '', 'bacon_mac_cheese_dog.jpg', 450, 4);
INSERT INTO `items` VALUES (67, 10, 'Jalapeno/Guacamole/Salsa', '', 'salsa_dog.jpg', 495, 5);
INSERT INTO `items` VALUES (68, 10, 'Classic Chicago Style', '', 'chicago_dog.jpg', 395, 6);
INSERT INTO `items` VALUES (69, 10, 'Pastrami Chili Cheese', '', 'pastrami_chili_cheese_dog.jpg', 450, 7);
INSERT INTO `items` VALUES (70, 10, 'Nacho', '', 'nacho_dog.jpg', 395, 8);
INSERT INTO `items` VALUES (71, 10, 'Chimichanga (Deep Fried)', '', 'deep_fried_chimichanga_dog.jpg', 395, 9);
INSERT INTO `items` VALUES (72, 10, 'Hot Dog', '', 'hotdog.jpg', 295, 10);
INSERT INTO `items` VALUES (73, 11, 'Steak/Garlic Mayo', '', 'garlic_mayo_steak_fries.jpg', 595, 1);
INSERT INTO `items` VALUES (74, 11, 'Chili Cheese Fries', '', 'chili_cheese_fries.jpg', 495, 2);
INSERT INTO `items` VALUES (75, 11, 'Bacon Mac & Cheese', '', 'bacon_mac_cheese_fries.jpg', 595, 3);
INSERT INTO `items` VALUES (76, 11, 'Chile Verde/Cheese', '', 'chile_verde_cheese_fries.jpg', 595, 4);
INSERT INTO `items` VALUES (77, 11, 'Pastrami Chili Cheese', '', 'pastrami_chili_cheese.jpg', 595, 5);
INSERT INTO `items` VALUES (78, 11, 'Pulled Pork/Guacamole', '', 'pulled_pork_guacamole_fries.jpg', 595, 6);
INSERT INTO `items` VALUES (79, 11, 'Cheese Fries', '', 'cheese_fries.jpg', 295, 7);
INSERT INTO `items` VALUES (80, 11, 'French Fries', '', 'reg_french_fries.jpg', 195, 8);
INSERT INTO `items` VALUES (81, 12, '', 'Gravy Smothered on Top of Any Breakfast Burrito $1.50 Extra', '', 0, 1);
INSERT INTO `items` VALUES (82, 12, 'Steak', '', 'steak_breakfast_burrito.jpg', 450, 2);
INSERT INTO `items` VALUES (83, 12, 'Bacon', '', 'bacon_breakfast_burrito.jpg', 375, 3);
INSERT INTO `items` VALUES (84, 12, 'Sausage', '', 'sausage_breakfast_burrito.jpg', 375, 4);
INSERT INTO `items` VALUES (85, 12, 'Ham', '', 'ham_breakfast_burrito.jpg', 375, 5);
INSERT INTO `items` VALUES (86, 12, 'Country Gravy', '', 'country_gravy_breakfast_burrito.jpg', 450, 6);
INSERT INTO `items` VALUES (87, 12, 'Chile Verde', '', 'chile_verde_breakfast_burrito.jpg', 450, 7);
INSERT INTO `items` VALUES (88, 12, 'The Macho (Three Meats/The Works)', '', 'the_macho_three_meat_breakfast_burrito.jpg', 575, 8);
INSERT INTO `items` VALUES (89, 12, 'Chorizo', '', 'chorizo_breakfast_burrito.jpg', 375, 9);
INSERT INTO `items` VALUES (90, 13, 'Country Fried Steak & Gravy', '', 'country_fried_steak_and_gravy_breakfast_sandwich.jpg', 495, 1);
INSERT INTO `items` VALUES (91, 13, 'Bacon', '', 'bacon_breakfast_sandwich.jpg', 375, 2);
INSERT INTO `items` VALUES (92, 13, 'Ham', '', 'ham_breakfast_sandwich.jpg', 425, 3);
INSERT INTO `items` VALUES (93, 13, 'Steak', '', 'steak_breakfast_sandwich.jpg', 495, 4);
INSERT INTO `items` VALUES (94, 13, 'Burger/Ham', '', 'burger-ham_breakfast_sandwich.jpg', 495, 5);
INSERT INTO `items` VALUES (95, 13, 'Polish Sausage', '', 'polish_sausage_breakfast_sandwich.jpg', 425, 6);
INSERT INTO `items` VALUES (96, 14, 'Biscuits & Gravy', '', 'biscuits_and_gravy.jpg', 395, 1);
INSERT INTO `items` VALUES (97, 14, '', 'Add 2 fried eggs on top $1.00 Extra', '', 0, 2);
INSERT INTO `items` VALUES (98, 15, 'BLT', '', 'blt.jpg', 495, 1);
INSERT INTO `items` VALUES (99, 15, 'Chicken/Bacon/Avacado/Ranch', '', 'chicken_bacon_avacado_ranch.jpg', 595, 2);
INSERT INTO `items` VALUES (100, 15, 'BBQ Pulled Pork & Slaw', '', 'bbq_pulled_pork_and_slaw.jpg', 595, 3);
INSERT INTO `items` VALUES (101, 15, 'Fish Sandwich', '', 'fish_sandwich.jpg', 495, 4);
INSERT INTO `items` VALUES (102, 15, 'Shrimp BLT', '', 'shrimp_blt.jpg', 595, 5);
INSERT INTO `items` VALUES (103, 15, 'Philly Cheese Steak', '', 'philly_cheese_steak.jpg', 695, 6);
INSERT INTO `items` VALUES (104, 15, 'Chicken Cheese Steak', '', 'chicken_cheese_steak.jpg', 595, 7);
INSERT INTO `items` VALUES (105, 15, 'Reuben', '', 'reuben.jpg', 595, 8);
INSERT INTO `items` VALUES (106, 16, 'Turkey/Bacon', '', 'turkey_bacon_sub.jpg', 495, 1);
INSERT INTO `items` VALUES (107, 16, 'Honey Ham/Bacon', '', 'ham_bacon_sub.jpg', 495, 2);
INSERT INTO `items` VALUES (108, 17, 'Funnel Cake', '', 'funnel_cake_strawberries_whipped_cream.jpg', 500, 1);
INSERT INTO `items` VALUES (109, 18, 'Soda', '', 'soda_logos.jpg', 75, 1);
INSERT INTO `items` VALUES (110, 18, 'Water', '', 'water.jpg', 75, 2);
INSERT INTO `items` VALUES (111, 18, 'Orange Juice', '', 'orange_juice.jpg', 175, 3);
INSERT INTO `items` VALUES (112, 18, 'Milk', '', 'milk.jpg', 175, 4);
INSERT INTO `items` VALUES (113, 19, '', 'Sour Cream $0.75', '', 0, 1);
INSERT INTO `items` VALUES (114, 19, '', 'Guacamole $1.25', '', 0, 2);
INSERT INTO `items` VALUES (115, 19, '', 'Avocado $1.00', '', 0, 3);
INSERT INTO `items` VALUES (116, 19, '', 'Salsa $0.50', '', 0, 4);
INSERT INTO `items` VALUES (117, 19, '', 'Chips $0.75', '', 0, 5);
INSERT INTO `items` VALUES (118, 19, '', 'Cheese $0.75', '', 0, 6);
