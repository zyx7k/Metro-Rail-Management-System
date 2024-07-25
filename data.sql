USE `metro`;


INSERT INTO PASSENGER(FirstName, MiddleName, LastName, DateOfBirth, PhoneNo, Privilege) VALUES
('Dhriti', 'N', 'Seth', '1946-08-24', 9991605193, 'SeniorCitizen'),
('Arav', 'H', 'Pratap', '1916-09-17', 7593128504, 'Student'),
('Mallikarjun', 'N', 'Tiwari', '1937-01-15', 9731879457, 'Regular'),
('Jiabur', 'I', 'Gupta', '1995-08-30', 6766764652, 'Student'),
('Price', 'W', 'Gupta', '1914-12-14', 8285623395, 'Premium'),
('Uday', 'S', 'Bhan', '2019-12-10', 7027735377, 'Student'),
('Murali', 'P', 'Krishna', '2000-10-08', 8963877087, 'Regular'),
('Swamy', 'Y', 'Kumari', '1933-08-13', 9410456398, 'Premium'),
('Classic', 'M', 'Divedi', '1952-05-11', 9541702296, 'Student'),
('Visram', 'M', 'Seth', '1929-08-02', 9913266710, 'SeniorCitizen'),
('Zahid', 'Q', 'Yadav', '1940-08-05', 6718765648, 'Premium'),
('Sakaram', 'L', 'Sonkar', '1955-04-14', 8078690081, 'SeniorCitizen'),
('Vasudevan', 'I', 'Singh', '1962-09-23', 9575431066, 'Premium'),
('Bharvad', 'N', 'Rao', '1939-04-22', 6684525282, 'SeniorCitizen'),
('Lakesh', 'E', 'Divedi', '1924-09-08', 6315797222, 'Premium'),
('Malkit', 'T', 'Divedi', '1954-12-22', 9268326289, 'Student'),
('Magar', 'T', 'Tiwari', '1977-07-06', 8213117214, 'Premium'),
('Nawaj', 'W', 'Pandit', '2004-06-17', 7271194318, 'Regular'),
('Shahnoor', 'G', 'Kumar', '1957-04-23', 7857104188, 'Regular');

INSERT INTO STATION (Area, City, State, PlatformCount, DateOfEstablishment, Administrator) VALUES
('LBNagar',      'Hyderabad', 'Telangana', 2, '2011-10-27', 1),
('MGBusStation', 'Hyderabad', 'Telangana', 4, '2007-04-14', 1),
('Ameerpet',     'Hyderabad', 'Telangana', 2, '2021-09-20', 1),
('Miyapur',      'Hyderabad', 'Telangana', 6, '2019-02-22', 1),
('Falakuma',     'Hyderabad', 'Telangana', 7, '2020-08-07', 4),
('ParadeGround', 'Hyderabad', 'Telangana', 8, '2018-04-07', 4),
('Charminar',    'Hyderabad', 'Telangana', 7, '2019-05-17', 1),
('Kukatpally',   'Hyderabad', 'Telangana', 6, '2020-02-05', 3),
('Nagole',       'Hyderabad', 'Telangana', 7, '2019-01-11', 3),
('Begumpet',     'Hyderabad', 'Telangana', 4, '2004-10-11', 4),
('HITechCity',   'Hyderabad', 'Telangana', 2, '2018-04-21', 3),
('RaiDurg',      'Hyderabad', 'Telangana', 8, '2015-08-12', 1);

INSERT INTO TRAIN (SeatingCapacity, EngineModel, CoachCount, ServiceYears) VALUES
(348, 'PX48A9', 15, 10),
(327, 'C7233TYK', 7, 1),
(123, 'U0GHIGZP', 13, 9),
(335, 'GIT5X', 6, 4),
(211, 'SH312OLU', 5, 7),
(362, 'DP3BZCDY', 9, 6),
(420, 'HSC466TS', 13, 1),
(222, 'CNJVS1W', 6, 4),
(174, 'KY1BYFG', 7, 7),
(311, 'TWFF62', 14, 5);

INSERT INTO LINE (LineID, Color, City, TotalTravelTime) VALUES
(1, 'red', 'Hyderabad', 77),
(2, 'green', 'Hyderabad', 84),
(3, 'blue', 'Hyderabad', 69);

INSERT INTO TICKET (Source, Destination, TimeOfPurchase, PassengerID, Price) VALUES
(4, 10, '2020-09-19 18:16:54', 5, 10),
(5, 6, '2020-08-01 21:16:56', 8, 20),
(6, 2, '2023-04-26 08:46:08', 7, 30),
(6, 1, '2020-12-06 23:15:14', 6, 40),
(8, 2, '2018-02-22 22:05:33', 16, 60),
(6, 3, '2018-05-17 00:00:11', 6, 20),
(1, 9, '2015-04-07 00:15:34', 19, 40),
(2, 4, '2022-07-23 18:35:38', 19, 10),
(8, 12, '2018-11-20 00:04:49', 10, 70),
(11, 6, '2022-05-09 14:24:54', 3, 50),
(11, 10, '2017-11-21 21:47:00', 19, 30),
(4, 10, '2022-09-12 01:53:41', 13, 40),
(3, 11, '2023-09-24 12:02:53', 2, 20),
(8, 1, '2015-01-27 11:40:00', 6, 10),
(1, 7, '2021-11-21 08:56:53', 5, 20),
(9, 10, '2017-10-15 03:34:44', 1, 50),
(7, 4, '2016-03-03 12:12:52', 19, 60),
(6, 1, '2016-07-15 15:45:41', 13, 60),
(3, 10, '2016-06-12 01:44:38', 5, 40),
(5, 4, '2019-11-07 01:09:39', 1, 30);

INSERT INTO TIMETABLE (Station, TimeOfArrival, TimeOfDeparture) VALUES
(2, '18:39:13', '18:40:13'),
(6, '03:28:48', '03:31:48'),
(4, '13:49:07', '13:52:07'),
(11, '06:30:04', '06:32:04'),
(12, '23:13:35', '23:16:35'),
(5, '22:16:24', '22:18:24'),
(7, '06:00:01', '06:01:01'),
(8, '05:11:06', '05:14:06'),
(5, '17:58:18', '18:01:18'),
(8, '05:52:17', '05:55:17'),
(7, '02:51:08', '02:52:08'),
(1, '02:42:13', '02:45:13'),
(10, '17:18:20', '17:19:20'),
(5, '02:06:10', '02:08:10'),
(6, '23:10:33', '23:11:33'),
(5, '08:52:24', '08:53:24'),
(7, '13:15:45', '13:16:45'),
(7, '07:09:30', '07:11:30'),
(2, '13:19:59', '13:22:59'),
(8, '06:48:47', '06:51:47'),
(1, '15:33:50', '15:34:50'),
(4, '11:06:20', '11:09:20'),
(7, '08:09:37', '08:12:37'),
(1, '02:59:46', '03:02:46'),
(7, '15:09:41', '15:11:41'),
(3, '11:56:44', '11:58:44'),
(6, '00:45:04', '00:48:04'),
(6, '12:56:50', '12:59:50'),
(12, '19:51:04', '19:52:04'),
(3, '02:52:17', '02:53:17'),
(5, '00:08:08', '00:10:08'),
(10, '01:36:55', '01:38:55'),
(4, '09:03:44', '09:05:44'),
(9, '22:23:44', '22:25:44'),
(4, '17:44:19', '17:47:19'),
(5, '19:10:09', '19:12:09'),
(7, '10:39:24', '10:41:24'),
(3, '13:42:40', '13:43:40'),
(7, '22:14:58', '22:15:58'),
(3, '07:27:50', '07:28:50'),
(9, '15:54:04', '15:55:04'),
(8, '10:10:48', '10:11:48'),
(6, '07:04:40', '07:06:40'),
(11, '15:55:21', '15:58:21'),
(8, '22:29:57', '22:30:57'),
(8, '09:38:54', '09:39:54'),
(4, '10:20:04', '10:23:04'),
(7, '04:55:22', '04:56:22'),
(10, '14:04:57', '14:07:57'),
(1, '00:45:56', '00:46:56'),
(5, '09:31:09', '09:33:09'),
(2, '20:05:11', '20:07:11'),
(9, '03:15:50', '03:17:50'),
(11, '15:32:30', '15:35:30'),
(7, '21:42:10', '21:43:10'),
(11, '17:59:24', '18:00:24'),
(3, '06:13:21', '06:14:21'),
(2, '21:39:00', '21:42:00'),
(12, '13:07:10', '13:09:10'),
(10, '03:38:12', '03:39:12'),
(5, '21:36:11', '21:39:11'),
(9, '03:41:59', '03:44:59'),
(11, '17:58:39', '18:00:39'),
(8, '08:27:33', '08:29:33'),
(11, '05:00:35', '05:03:35'),
(6, '10:05:23', '10:06:23'),
(10, '03:03:35', '03:05:35'),
(6, '21:37:24', '21:38:24'),
(7, '18:12:17', '18:14:17'),
(10, '21:12:59', '21:13:59'),
(12, '03:36:59', '03:38:59'),
(3, '00:09:01', '00:10:01'),
(1, '02:35:53', '02:37:53'),
(3, '22:43:25', '22:46:25'),
(10, '12:49:49', '12:51:49'),
(11, '03:37:27', '03:39:27'),
(9, '09:33:51', '09:34:51'),
(7, '21:15:45', '21:17:45'),
(11, '05:44:42', '05:46:42'),
(12, '13:14:11', '13:17:11');

INSERT INTO METRO_CARD (AvailableBalance, Validity, Status) VALUES
(2520.71, '2023-03-21', 'Expired'),
(2399.81, '2022-07-09', 'Expired'),
(539.08, '2024-09-16', 'Expired'),
(1671.37, '2024-03-31', 'Expired'),
(2181.5, '2022-01-14', 'Expired'),
(846.83, '2022-08-09', 'Expired'),
(639.63, '2024-06-24', 'Active'),
(229.29, '2025-11-11', 'Blocked'),
(331.26, '2025-02-16', 'Blocked'),
(1563.92, '2023-07-15', 'Expired'),
(1463.12, '2023-06-07', 'Expired'),
(2384.7, '2024-11-07', 'Active');


INSERT INTO TRANSACTION (TimeOfEntry, SwipeType) VALUES
('2022-01-11 21:16:20', 0),
('2022-01-11 21:28:22', 1),
('2022-01-09 20:31:56', 1),
('2022-01-09 20:53:03', 0),
('2022-07-04 18:45:24', 0),
('2022-07-04 19:25:24', 1),
('2021-05-22 02:30:56', 1),
('2021-05-22 03:17:17', 0),
('2022-04-26 16:03:37', 1),
('2020-05-19 16:05:32', 1),
('2020-05-19 16:23:15', 0),
('2022-09-21 16:39:26', 0),
('2022-09-21 17:29:46', 1),
('2021-01-16 10:12:06', 0),
('2020-12-10 02:44:59', 0),
('2021-10-18 00:01:50', 1),
('2021-10-18 00:44:27', 0),
('2022-05-04 03:34:55', 0),
('2023-08-01 04:18:10', 0),
('2023-08-01 04:40:49', 1),
('2023-02-21 03:51:46', 0),
('2023-02-21 04:03:57', 1),
('2022-01-08 12:46:33', 0),
('2021-06-03 19:27:06', 0),
('2020-01-16 18:52:35', 0),
('2020-01-16 19:19:38', 1),
('2023-05-01 18:34:06', 1),
('2020-07-05 09:30:15', 0),
('2020-07-05 10:03:25', 1),
('2020-04-15 08:41:57', 0),
('2020-04-15 09:14:10', 1),
('2020-06-03 21:18:04', 0),
('2020-11-20 10:52:06', 0),
('2023-07-09 22:12:13', 0),
('2023-07-09 22:30:57', 1),
('2022-04-09 16:20:07', 0),
('2022-04-09 17:05:57', 1),
('2020-10-16 03:05:18', 1),
('2020-10-16 03:31:56', 0),
('2023-03-19 06:04:47', 0),
('2022-06-29 21:12:54', 0),
('2022-06-29 21:55:16', 1),
('2020-11-23 22:23:26', 0),
('2020-11-23 22:55:38', 1),
('2022-04-24 22:56:04', 1),
('2022-04-24 23:36:36', 0),
('2021-10-06 22:07:25', 1),
('2021-10-06 22:41:09', 0),
('2022-02-24 07:23:27', 1);


--  INSERT INTO TRANSACTION (TimeOfEntry, SwipeType) VALUES
-- ('01:11:15', 1),
-- ('14:34:27', 0),
-- ('23:49:20', 1),
-- ('03:11:00', 0),
-- ('14:02:57', 1),
-- ('09:37:02', 1),
-- ('06:37:50', 1),
-- ('13:22:09', 1),
-- ('08:05:29', 1),
-- ('23:06:27', 1),
-- ('23:12:16', 1),
-- ('07:15:33', 1),
-- ('23:54:21', 0),
-- ('01:42:06', 1),
-- ('22:46:36', 1),
-- ('12:06:25', 0),
-- ('21:06:33', 1),
-- ('16:54:46', 1),
-- ('13:43:57', 0),
-- ('14:59:20', 1),
-- ('16:05:51', 0),
-- ('21:57:13', 1),
-- ('11:18:08', 1),
-- ('14:38:12', 0),
-- ('20:36:30', 1),
-- ('15:22:36', 1),
-- ('01:34:49', 1),
-- ('07:20:23', 0),
-- ('08:27:32', 1),
-- ('15:59:23', 0),
-- ('10:21:58', 1);


INSERT INTO EATERY (Name, Location, StationID, AveragePrice, Rating, NonVegOptions) VALUES
('Haldirams', 'MainEntrance', 1, 320.23, 4.12, 1),
('KFC', 'WaitingLounge', 1, 388.77, 4.29, 0),
('Haldirams', 'MainEntrance', 8, 150.91, 3.67, 1),
('Dominos', 'MainEntrance', 8, 102.83, 3.49, 0),
('Wendys', 'TicketCounter', 10, 353.83, 3.31, 0),
('PizzaHut', 'WaitingLounge', 6, 112.87, 3.07, 0),
('OvenStory', 'TicketCounter', 2, 149.1, 4.26, 1),
('KSBakers', 'Underpass', 4, 359.43, 4.7, 1),
('KSBakers', 'Rooftop', 1, 295.2, 3.94, 1),
('BurgerKing', 'MainEntrance', 9, 358.11, 2.8, 0),
('PizzaHut', 'MainExit', 4, 101.81, 2.6, 1),
('PizzaHut', 'Underpass', 1, 307.86, 4.72, 1),
('KarachiBakery', 'Underpass', 11, 295.77, 5.0, 1),
('McDonalds', 'MainEntrance', 12, 261.8, 2.58, 1),
('BurgerKing', 'TicketCounter', 6, 377.77, 2.14, 1),
('Wendys', 'WaitingLounge', 12, 311.44, 3.12, 1),
('Dominos', 'Underpass', 8, 352.31, 2.95, 0),
('KarachiBakery', 'TicketCounter', 3, 104.68, 2.18, 1),
('Haldirams', 'MainExit', 7, 269.51, 3.7, 1),
('OvenStory', 'TicketCounter', 6, 350.0, 2.3, 1),
('Haldirams', 'WaitingLounge', 5, 190.58, 2.9, 1),
('KarachiBakery', 'MainEntrance', 5, 168.1, 2.89, 0),
('MojoPizza', 'Underpass', 1, 192.67, 4.13, 0),
('KFC', 'MainEntrance', 5, 398.79, 3.52, 0);

INSERT INTO EATERY_ITEMS (ItemName, EateryName, EateryLocation) VALUES
('Muffins', 'KarachiBakery', '5'),
('Bread rolls', 'PizzaHut', '6'),
('Whiskey', 'OvenStory', '6'),
('Wine', 'McDonalds', '12'),
('Tea', 'KarachiBakery', '5'),
('Pizza', 'KFC', '1'),
('Vodka', 'BurgerKing', '9'),
('French toast', 'OvenStory', '6'),
('Chocolate cake', 'MojoPizza', '1'),
('Potato chips', 'PizzaHut', '1'),
('Pizza', 'McDonalds', '12'),
('Croissants', 'Dominos', '8'),
('Vodka', 'BurgerKing', '6'),
('Trail mix', 'McDonalds', '12'),
('Panna cotta', 'Haldirams', '1'),
('Tea', 'Haldirams', '1');




-- INSERT INTO EATERY (Name, Location, StationID, AveragePrice, Rating, NonVegOptions) VALUES
-- ('OvenStory', 'TicketCounter', 9, 329.9, 4.38, 1),
-- ('OvenStory', 'Rooftop', 2, 321.1, 4.18, 0),
-- ('Dominos', 'TicketCounter', 6, 242.59, 2.12, 1),
-- ('PizzaHut', 'Underpass', 1, 161.03, 4.22, 0),
-- ('PizzaHut', 'WaitingLounge', 12, 161.03, 4.22, 0),
-- ('PizzaHut', 'MainExit', 6, 261.03, 2.12, 0),
-- ('Haldirams', 'MainExit', 2, 261.03, 2.12, 0),
-- ('Dominos', 'Rooftop', 5, 339.39, 4.35, 0),
-- ('Dominos', 'MainExit', 4, 208.23, 4.27, 0),
-- ('KSBakers', 'WaitingLounge', 8, 208.23, 4.27, 0),
-- ('Haldirams', 'Underpass', 2, 232.51, 2.31, 1),
-- ('Wendys', 'WaitingLounge', 12, 265.51, 2.24, 1),
-- ('KFC', 'MainEntrance', 11, 259.86, 2.95, 0),
-- ('Wendys', 'WaitingLounge', 4, 158.39, 4.22, 0),
-- ('Wendys', 'MainEntrance', 8, 273.82, 4.64, 0),
-- ('Haldirams', 'MainEntrance', 3, 273.82, 4.64, 0),
-- ('Dominos', 'MainExit', 3, 269.76, 4.43, 1),
-- ('Haldirams', 'TicketCounter', 1, 337.28, 4.43, 1),
-- ('MojoPizza', 'TicketCounter', 10, 288.83, 3.43, 0),
-- ('BurgerKing', 'Underpass', 3, 162.21, 2.85, 0),
-- ('BurgerKing', 'Rooftop', 4, 162.21, 2.85, 0),
-- ('KarachiBakery', 'MainExit', 1, 108.67, 2.78, 1),
-- ('KarachiBakery', 'MainEntrance', 7, 108.67, 2.78, 1),
-- ('KSBakers', 'MainEntrance', 6, 216.66, 2.23, 1),
-- ('KFC', 'WaitingLounge', 8, 297.28, 3.7, 1),
-- ('Dominos', 'WaitingLounge', 4, 297.28, 3.7, 1),
-- ('KarachiBakery', 'WaitingLounge', 1, 270.68, 4.38, 1),
-- ('KFC', 'MainExit', 2, 152.74, 2.67, 1),
-- ('BurgerKing', 'MainExit', 3, 158.37, 2.24, 0),
-- ('OvenStory', 'WaitingLounge', 3, 126.54, 2.91, 0),
-- ('MojoPizza', 'WaitingLounge', 10, 126.54, 2.91, 0),
-- ('Haldirams', 'Rooftop', 1, 212.09, 4.36, 0),
-- ('PizzaHut', 'Rooftop', 5, 212.09, 4.36, 0),
-- ('PizzaHut', 'TicketCounter', 2, 212.09, 4.36, 0),
-- ('PizzaHut', 'MainEntrance', 6, 212.09, 4.36, 0),
-- ('MojoPizza', 'MainEntrance', 11, 212.09, 4.36, 0),
-- ('McDonalds', 'WaitingLounge', 8, 357.43, 4.47, 0),
-- ('KarachiBakery', 'WaitingLounge', 10, 316.13, 3.35, 1),
-- ('BurgerKing', 'WaitingLounge', 5, 272.33, 4.55, 0),
-- ('BurgerKing', 'Rooftop', 2, 272.33, 4.55, 0),
-- ('Haldirams', 'WaitingLounge', 7, 272.33, 4.55, 0),
-- ('KarachiBakery', 'Underpass', 3, 293.84, 4.64, 1),
-- ('KarachiBakery', 'TicketCounter', 1, 293.84, 4.64, 1),
-- ('McDonalds', 'WaitingLounge', 10, 198.99, 2.51, 1),
-- ('McDonalds', 'Rooftop', 8, 198.99, 2.51, 1),
-- ('OvenStory', 'Underpass', 6, 217.33, 3.23, 1),
-- ('MojoPizza', 'TicketCounter', 5, 349.23, 3.84, 1),
-- ('MojoPizza', 'Rooftop', 8, 299.64, 3.95, 1),
-- ('Wendys', 'MainEntrance', 3, 274.5, 4.61, 1),
-- ('Wendys', 'Underpass', 9, 214.53, 2.98, 0),
-- ('KFC', 'TicketCounter', 7, 171.61, 2.06, 1),
-- ('Dominos', 'Underpass', 3, 243.08, 3.51, 1),
-- ('McDonalds', 'MainEntrance', 12, 144.19, 4.81, 0),
-- ('KFC', 'Rooftop', 7, 332.55, 4.57, 0),
-- ('OvenStory', 'MainEntrance', 11, 201.75, 3.46, 0),
-- ('OvenStory', 'MainExit', 1, 161.25, 3.96, 1),
-- ('KSBakers', 'TicketCounter', 9, 128.75, 3.99, 0),
-- ('KSBakers', 'Underpass', 10, 128.75, 3.99, 0),
-- ('KSBakers', 'MainExit', 12, 132.66, 2.57, 1),
-- ('KFC', 'Underpass', 12, 135.15, 2.35, 1),
-- ('MojoPizza', 'Underpass', 7, 135.15, 2.35, 1),
-- ('McDonalds', 'Underpass', 5, 189.95, 4.97, 0),
-- ('MojoPizza', 'MainExit', 7, 378.06, 3.34, 0),
-- ('BurgerKing', 'TicketCounter', 2, 215.17, 2.29, 0),
-- ('KarachiBakery', 'Rooftop', 12, 324.52, 3.77, 1),
-- ('KSBakers', 'Rooftop', 12, 324.52, 3.77, 1);



-- -- TC Men MEx Rt Up Wl
-- -- OvenStory 
-- -- Dominos  
-- -- pizzahut   
-- -- KSbakers 
-- -- Wendys   
-- -- kfc 
-- -- mojopizza 
-- -- haldirams  
-- -- karachibakery  
-- -- BurgerKing


-- INSERT INTO EATERY_ITEMS (ItemName, EateryName, EateryLocation) VALUES
-- -- ('Cheesecake', 'KarachiBakery', 'MainExit'),
-- ('Fruit juice', 'MojoPizza', 'Underpass'),
-- ('Ice cream', 'McDonalds', 'WaitingLounge'),
-- ('Cheesecake', 'Wendys', 'MainEntrance'),
-- ('Ice cream', 'MojoPizza', 'Underpass'),
-- ('Croissants', 'McDonalds', 'MainEntrance'),
-- ('Omelette', 'KarachiBakery', 'MainExit'),
-- ('Espresso', 'McDonalds', 'WaitingLounge'),
-- ('Pretzels', 'Wendys', 'MainEntrance'),
-- ('Muffins', 'PizzaHut', 'MainEntrance'),
-- ('Milkshakes', 'McDonalds', 'Rooftop'),
-- ('Martini', 'PizzaHut', 'MainExit'),
-- ('Popcorn', 'KarachiBakery', 'WaitingLounge'),
-- ('Chai', 'KarachiBakery', 'TicketCounter'),
-- ('Nachos', 'BurgerKing', 'WaitingLounge'),
-- ('Biryani', 'BurgerKing', 'WaitingLounge'),
-- ('Whiskey', 'Dominos', 'Underpass'),
-- ('Cereal', 'KarachiBakery', 'TicketCounter'),
-- ('Steak', 'PizzaHut', 'MainEntrance'),
-- ('Chai', 'KarachiBakery', 'Underpass'),
-- ('Ice cream', 'KarachiBakery', 'MainEntrance'),
-- ('Omelette', 'OvenStory', 'Rooftop'),
-- ('French toast', 'BurgerKing', 'Rooftop'),
-- ('Cereal', 'Dominos', 'Underpass'),
-- ('Croissants', 'Haldirams', 'MainEntrance'),
-- ('Biryani', 'Wendys', 'MainExit'),
-- ('Bread rolls', 'KarachiBakery', 'Rooftop'),
-- ('Smoothies', 'Wendys', 'MainExit'),
-- ('Martini', 'KSBakers', 'TicketCounter'),
-- ('Croissants', 'KarachiBakery', 'MainExit'),
-- ('Samosas', 'KarachiBakery', 'WaitingLounge'),
-- ('Croissants', 'PizzaHut', 'MainExit'),
-- ('Fruit salad', 'KSBakers', 'TicketCounter'),
-- ('Vodka', 'Dominos', 'WaitingLounge'),
-- ('Pretzels', 'KSBakers', 'WaitingLounge'),
-- ('Omelette', 'KarachiBakery', 'TicketCounter'),
-- ('Fruit juice', 'Dominos', 'Underpass'),
-- ('Fruit juice', 'Dominos', 'Underpass'),
-- ('Cheesecake', 'KarachiBakery', 'MainEntrance'),
-- ('Croissants', 'KFC', 'TicketCounter'),
-- ('Soda', 'KFC', 'WaitingLounge'),
-- ('Tacos', 'PizzaHut', 'MainEntrance'),
-- ('Chocolate cake', 'KSBakers', 'TicketCounter'),
-- ('Ice cream', 'KarachiBakery', 'Rooftop'),
-- ('Steak', 'PizzaHut', 'Rooftop'),
-- ('Coffee', 'PizzaHut', 'Underpass'),
-- ('Pizza', 'Wendys', 'MainEntrance'),
-- ('Coffee', 'KarachiBakery', 'MainEntrance'),
-- ('Tacos', 'Wendys', 'Rooftop'),
-- ('Martini', 'KarachiBakery', 'WaitingLounge'),
-- ('Bruschetta', 'KarachiBakery', 'TicketCounter'),
-- ('Whiskey', 'KarachiBakery', 'MainExit'),
-- ('French toast', 'KarachiBakery', 'TicketCounter'),
-- ('Bruschetta', 'BurgerKing', 'MainExit'),
-- ('Popcorn', 'KarachiBakery', 'WaitingLounge'),
-- ('Bread rolls', 'KFC', 'WaitingLounge'),
-- ('Vodka', 'KarachiBakery', 'MainExit'),
-- ('Sushi', 'Wendys', 'WaitingLounge'),
-- ('Samosas', 'MojoPizza', 'Underpass'),
-- ('Trail mix', 'KarachiBakery', 'MainExit'),
-- ('Fruit juice', 'PizzaHut', 'MainEntrance'),
-- ('Croissants', 'KarachiBakery', 'Rooftop'),
-- ('Ice cream', 'Wendys', 'MainEntrance'),
-- ('Tacos', 'KFC', 'TicketCounter'),
-- ('Sushi', 'Wendys', 'MainEntrance'),
-- ('Muffins', 'PizzaHut', 'WaitingLounge'),
-- ('Beer', 'Dominos', 'MainEntrance'),
-- ('Fruit juice', 'Haldirams', 'Rooftop'),
-- ('Donuts', 'Wendys', 'MainEntrance'),
-- ('Tacos', 'KarachiBakery', 'MainEntrance'),
-- ('Martini', 'KarachiBakery', 'MainEntrance'),
-- ('Bruschetta', 'KarachiBakery', 'MainEntrance'),
-- ('Panna cotta', 'KarachiBakery', 'TicketCounter'),
-- ('Croissants', 'Dominos', 'Underpass'),
-- ('Nachos', 'OvenStory', 'WaitingLounge'),
-- ('Smoothies', 'PizzaHut', 'Rooftop'),
-- ('Espresso', 'McDonalds', 'MainEntrance'),
-- ('Fruit salad', 'KarachiBakery', 'TicketCounter'),
-- ('Bread rolls', 'KarachiBakery', 'MainExit'),
-- ('French toast', 'KFC', 'WaitingLounge'),
-- ('Vodka', 'KFC', 'WaitingLounge'),
-- ('Nachos', 'PizzaHut', 'MainExit'),
-- ('Bread rolls', 'PizzaHut', 'MainExit'),
-- ('Wine', 'PizzaHut', 'Underpass'),
-- ('Sushi', 'MojoPizza', 'MainEntrance'),
-- ('Samosas', 'PizzaHut', 'Underpass'),
-- ('Fruit juice', 'KSBakers', 'WaitingLounge'),
-- ('Whiskey', 'PizzaHut', 'MainEntrance'),
-- ('Panna cotta', 'Dominos', 'Underpass'),
-- ('Espresso', 'KSBakers', 'MainExit'),
-- ('Biryani', 'Dominos', 'WaitingLounge'),
-- ('Chai', 'KarachiBakery', 'WaitingLounge'),
-- ('Smoothies', 'KFC', 'TicketCounter'),
-- ('Samosas', 'OvenStory', 'Rooftop');



-- INSERT INTO EATERY_ITEMS (ItemName, EateryName, EateryLocation) VALUES
-- ('Tacos', 'McDonalds', 'WaitingLounge'),
-- ('Nachos', 'KarachiBakery', 'Underpass'),
-- ('Croissants', 'BurgerKing', 'Rooftop'),
-- ('Milkshakes', 'KFC', 'MainEntrance'),
-- ('Biryani', 'KarachiBakery', 'WaitingLounge'),
-- ('Fruit juice', 'KSBakers', 'Underpass'),
-- ('Chocolate cake', 'Wendys', 'MainEntrance'),
-- ('Tea', 'KFC', 'MainEntrance'),
-- ('Spring rolls', 'KSBakers', 'MainEntrance'),
-- ('French toast', 'MojoPizza', 'WaitingLounge'),
-- ('Chai', 'BurgerKing', 'WaitingLounge'),
-- ('Soda', 'Dominos', 'MainExit'),
-- ('Ice cream', 'McDonalds', 'Underpass'),
-- ('Chai', 'Haldirams', 'Underpass'),
-- ('Sushi', 'KFC', 'Rooftop'),
-- ('Bread rolls', 'KarachiBakery', 'WaitingLounge'),
-- ('Caprese salad', 'Wendys', 'Underpass'),
-- ('Milkshakes', 'McDonalds', 'WaitingLounge'),
-- ('Fruit juice', 'KFC', 'MainEntrance'),
-- ('Martini', 'OvenStory', 'TicketCounter'),
-- ('Avocado toast', 'Haldirams', 'Underpass'),
-- ('Vodka', 'KFC', 'TicketCounter'),
-- ('Omelette', 'Dominos', 'WaitingLounge'),
-- ('Coffee', 'KFC', 'MainEntrance'),
-- ('Steak', 'MojoPizza', 'MainExit'),
-- ('Tea', 'MojoPizza', 'TicketCounter'),
-- ('Soda', 'Dominos', 'Rooftop'),
-- ('Fruit salad', 'MojoPizza', 'WaitingLounge'),
-- ('Hot chocolate', 'Dominos', 'TicketCounter'),
-- ('Chai', 'MojoPizza', 'Rooftop'),
-- ('Whiskey', 'KarachiBakery', 'WaitingLounge'),
-- ('Bruschetta', 'MojoPizza', 'TicketCounter'),
-- ('Cheesecake', 'Haldirams', 'Underpass');

INSERT INTO STOPS_AT (Train, Station) VALUES
(7, 1),
(7, 2),
(7, 3),
(7, 8),
(7, 4),
(2, 5),
(2, 2),
(2, 6),
(4, 9),
(4, 6),
(4, 10);

-- INSERT INTO FOLLOWS (Train, LineID, Timetable) VALUES
-- (9, 3, 63),
-- (8, 1, 42),
-- (4, 1, 55),
-- (7, 3, 5),
-- (2, 1, 17),
-- (9, 3, 47),
-- (8, 3, 27),
-- (2, 1, 3),
-- (7, 1, 58),
-- (4, 3, 66),
-- (1, 1, 28),
-- (1, 3, 24),
-- (5, 1, 46),
-- (9, 1, 23),
-- (2, 2, 26),
-- (7, 2, 63),
-- (4, 1, 66),
-- (2, 3, 37),
-- (5, 1, 66),
-- (9, 1, 4),
-- (6, 2, 15),
-- (7, 1, 26),
-- (5, 2, 29),
-- (3, 2, 42),
-- (5, 1, 44),
-- (6, 1, 42),
-- (5, 2, 58),
-- (4, 1, 68),
-- (7, 1, 29),
-- (8, 1, 48),
-- (2, 3, 54),
-- (9, 1, 2),
-- (6, 3, 29),
-- (4, 2, 38),
-- (3, 2, 78),
-- (3, 1, 41),
-- (5, 1, 52),
-- (7, 3, 35),
-- (3, 3, 49),
-- (3, 1, 7),
-- (1, 1, 52),
-- (6, 2, 53),
-- (3, 2, 13),
-- (6, 1, 14),
-- (3, 2, 74),
-- (5, 1, 37),
-- (6, 1, 19),
-- (9, 1, 78),
-- (4, 2, 76),
-- (1, 1, 48),
-- (8, 1, 56),
-- (4, 2, 35),
-- (7, 1, 52),
-- (6, 3, 65),
-- (8, 1, 32),
-- (8, 3, 52),
-- (4, 2, 25),
-- (4, 1, 62),
-- (2, 1, 7),
-- (6, 1, 46),
-- (3, 3, 9),
-- (7, 1, 18),
-- (3, 1, 55),
-- (7, 3, 72),
-- (6, 1, 40),
-- (7, 1, 8),
-- (3, 1, 36),
-- (4, 3, 2),
-- (7, 1, 34),
-- (1, 1, 46),
-- (9, 3, 6),
-- (8, 3, 55),
-- (4, 1, 65),
-- (9, 2, 49),
-- (9, 2, 28),
-- (5, 1, 45),
-- (2, 1, 22),
-- (5, 2, 74),
-- (3, 1, 74),
-- (9, 1, 5),
-- (9, 3, 78),
-- (3, 2, 62),
-- (3, 2, 3),
-- (3, 2, 28),
-- (1, 3, 31),
-- (6, 2, 43),
-- (9, 1, 21),
-- (5, 2, 48),
-- (2, 1, 63),
-- (6, 1, 9),
-- (5, 3, 30),
-- (6, 2, 2),
-- (1, 3, 39),
-- (4, 1, 41),
-- (2, 1, 24),
-- (7, 2, 23),
-- (2, 1, 56),
-- (3, 2, 46),
-- (1, 1, 73);



INSERT INTO FOLLOWS (Train, LineID, Timetable) VALUES
(4, 2, 25),
(5, 3, 41),
(8, 2, 21),
(8, 1, 13),
(9, 1, 80),
(3, 1, 23),
(4, 3, 43),
(6, 2, 46),
(6, 1, 26),
(3, 1, 17),
(7, 1, 22),
(1, 1, 48),
(1, 1, 46),
(1, 1, 11),
(5, 2, 79),
(5, 2, 4),
(9, 2, 52),
(3, 1, 26),
(7, 2, 6),
(2, 3, 59),
(8, 1, 35),
(7, 1, 31),
(1, 2, 34),
(3, 1, 5),
(4, 2, 7),
(1, 1, 40),
(1, 2, 22),
(1, 1, 34),
(7, 1, 45),
(7, 1, 40),
(5, 1, 79),
(1, 1, 50),
(1, 1, 60),
(1, 3, 14),
(1, 1, 8),
(5, 1, 47),
(8, 2, 14),
(4, 3, 50),
(7, 3, 48),
(7, 1, 53),
(8, 2, 62),
(3, 1, 54),
(3, 2, 22),
(1, 3, 49),
(3, 1, 44),
(9, 1, 59),
(6, 1, 74),
(1, 1, 61),
(4, 3, 51),
(4, 3, 70),
(5, 3, 10),
(4, 3, 13),
(6, 1, 32),
(9, 1, 13),
(2, 1, 42),
(9, 1, 1),
(4, 1, 14),
(8, 3, 80),
(9, 3, 17),
(7, 2, 31),
(6, 3, 13),
(5, 1, 68),
(6, 3, 67),
(6, 1, 61),
(7, 2, 17),
(5, 1, 31),
(3, 1, 66),
(4, 1, 17),
(8, 3, 49),
(1, 1, 31),
(3, 3, 74),
(8, 1, 63),
(2, 3, 62),
(1, 1, 58),
(8, 3, 25),
(9, 1, 47),
(2, 1, 46),
(8, 1, 41),
(1, 1, 59),
(7, 2, 64),
(5, 1, 48),
(1, 1, 2),
(3, 2, 3),
(7, 1, 10),
(2, 2, 69),
(5, 1, 36),
(1, 2, 60),
(6, 1, 9),
(7, 2, 76),
(7, 1, 78),
(3, 2, 33),
(1, 1, 80),
(5, 3, 76),
(2, 3, 8),
(4, 2, 37);


INSERT INTO TRAIN_STOPS (LineID, StopName, StopNum) VALUES
(1, 1, 0),
(1, 2, 1),
(1, 3, 2),
(1, 8, 3),
(2, 5, 0),
(2, 2, 1),
(2, 6, 2),
(3, 9, 0),
(3, 6, 1),
(3, 10, 2),
(3, 3, 3),
(3, 11, 4),
(3, 12, 5);

INSERT INTO ASSIGNED_TO (MetroCard, Passenger, StationOfIssue, DateOfIssue) VALUES
(1234567890, 18, 2, '2021-07-06'),
(1234567892, 19, 4, '2024-01-05'),
(1234567891, 1 , 1, '2022-01-18');

INSERT INTO CREATE_TXN (Passenger, MetroCard, Station, Transaction) VALUES
(18, 1234567890, 4, 50000),
(18, 1234567890, 5, 50001),
(18, 1234567890, 5, 50002),
(18, 1234567890, 2, 50003),
(18, 1234567890, 2, 50004),
(18, 1234567890, 1, 50005),
(18, 1234567890, 1, 50006),
(18, 1234567890, 9, 50007),
(18, 1234567890, 9, 50008),
(18, 1234567890, 2, 50009),
(1,  1234567891, 2, 50010),
(1,  1234567891, 1, 50011),
(1,  1234567891, 1, 50012),
(1,  1234567891, 9, 50013),
(1,  1234567891, 9, 50014),
(1,  1234567891, 2, 50015);


INSERT INTO STATION_MASTER (FirstName, MiddleName, Lastname, DateOfBirth, PhoneNo, WorksIn, DateOfJoining) VALUES
('Chitrasen', 'S', 'Srivastav', '2007-12-29', 7108963489, 7, '2023-10-09'),
('Suseel', 'D', 'Yadav', '1978-03-06', 7797505270, 10, '2018-04-25'),
('Vivek', 'J', 'Rai', '1986-07-16', 9631196740, 5, '2018-07-19'),
('Babali', 'I', 'Vishwakarma', '2023-06-26', 8802485781, 1, '2013-11-26'),
('Sahajad', 'H', 'Yadav', '2006-06-23', 9264851073, 3, '2010-01-05'),
('Jamini', 'Q', 'Singh', '2002-11-27', 9381403522, 4, '2023-08-11'),
('Kapila', 'N', 'Pandey', '2002-04-19', 8656417307, 2, '2010-12-24'),
('Hrithik', 'V', 'Sonkar', '1931-08-05', 7105864370, 6, '2020-05-06'),
('Kameswar', 'D', 'Thakur', '1976-10-17', 8727260075, 8, '2018-12-07'),
('Aas', 'I', 'Gupta', '1970-10-26', 9941087355, 9, '2020-03-31');

INSERT INTO TRAIN_DRIVER (FirstName, MiddleName, Lastname, DateOfBirth, PhoneNo, TrainID, DateOfJoining) VALUES
('Nagendra', 'Q', 'Singh', '2009-11-14', 6970423230, 9, '2010-04-07'),
('Kinu', 'A', 'Mishra', '1990-03-15', 9602552501, 1, '2011-04-08'),
('Bhumihar', 'Z', 'Yadav', '1913-11-06', 8163825318, 8, '2017-01-25'),
('Umanath', 'I', 'Gupta', '1952-01-25', 6017922459, 4, '2018-02-01'),
('Bindash', 'L', 'Mishra', '1945-08-04', 9417675846, 2, '2014-12-01'),
('Virander', 'L', 'Rao', '2016-04-21', 9552082602, 7, '2011-09-21'),
('Sankar', 'M', 'Srivastav', '1979-02-26', 7596273016, 3, '2021-04-30'),
('Rajnish', 'R', 'Kumar', '2018-12-06', 9389418880, 5, '2023-01-08');