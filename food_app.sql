CREATE DATABASE food_app;
USE food_app;

CREATE TABLE `user` (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE restaurant (
    res_id INT PRIMARY KEY AUTO_INCREMENT,
    res_name VARCHAR(255),
    image VARCHAR(255),
    `desc` VARCHAR(255)
);

CREATE TABLE food (
    food_id INT PRIMARY KEY AUTO_INCREMENT,
    food_name VARCHAR(255),
    image VARCHAR(255),
    price FLOAT,
    `desc` VARCHAR(255),
    type_id INT,

    FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

CREATE TABLE sub_food (
    sub_id INT PRIMARY KEY AUTO_INCREMENT,
    sub_name VARCHAR(255),
    sub_price FLOAT,
    food_id INT,

    FOREIGN KEY (food_id) REFERENCES food(food_id)
);

CREATE TABLE `order` (
    user_id INT,
    food_id INT,
    amount INT,
    code VARCHAR(255),
    arr_sub_id VARCHAR(255),

    FOREIGN KEY (user_id) REFERENCES `user`(user_id),
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);

CREATE TABLE like_res (
    user_id INT,
    res_id INT,
    date_like DATETIME,

    PRIMARY KEY (user_id, res_id),

    FOREIGN KEY (user_id) REFERENCES `user`(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

CREATE TABLE rate_res (
    user_id INT,
    res_id INT,
    amount INT,
    date_rate DATETIME,

    PRIMARY KEY (user_id, res_id),

    FOREIGN KEY (user_id) REFERENCES `user`(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);


INSERT INTO `user` (full_name, email, password) VALUES
	('Nguyen Van An', 'an@gmail.com', '12345678'),
	('Tran Thi Binh', 'binh@gmail.com', '12345678'),
	('Le Van Cuong', 'cuong@gmail.com', '12345678'),
	('Pham Thi Dung', 'dung@gmail.com', '12345678'),
	('Hoang Van Em', 'em@gmail.com', '12345678'),
	('Vo Thi Hoa', 'hoa@gmail.com', '12345678'),
	('Dang Van Hung', 'hung@gmail.com', '12345678'),
	('Bui Thi Lan', 'lan@gmail.com', '12345678'),
	('Do Van Minh', 'minh@gmail.com', '12345678'),
	('Ngo Thi Phuong', 'phuong@gmail.com', '12345678'),
	('Nguyen Le Minh Thanh', 'phuong@gmail.com', '12345678'),
	('Nguyen Le Minh Hieu', 'phuong@gmail.com', '12345678');

INSERT INTO restaurant (res_name, image, `desc`) VALUES
	('The Pizza Company', 'pizza.jpg', 'Nha hang chuyen pizza va mon Y'),
	('Kichi Kichi', 'kichi.jpg', 'Nha hang buffet lau bang chuyen'),
	('Gogi House', 'gogi.jpg', 'Nha hang nuong Han Quoc'),
	('King BBQ', 'kingbbq.jpg', 'Nha hang buffet nuong'),
	('Manwah', 'manwah.jpg', 'Nha hang buffet lau Dai Loan');

INSERT INTO food (food_name, image, price, `desc`) VALUES
	('Pizza Hai San', 'pizza_seafood.jpg', 189000, 'Pizza hai san pho mai'),
	('Mi Y Bo Bam', 'spaghetti.jpg', 99000, 'Mi Y sot ca chua bo bam'),
	('Ga Ran', 'fried_chicken.jpg', 45000, 'Ga ran gion'),
	('Hamburger Bo', 'hamburger.jpg', 79000, 'Hamburger bo pho mai'),
	('Com Chien Hai San', 'fried_rice.jpg', 85000, 'Com chien tom muc'),
	('Salad Rau Cu', 'salad.jpg', 55000, 'Salad rau cu tuoi'),
	('Suon Nuong BBQ', 'ribs.jpg', 159000, 'Suon heo nuong BBQ'),
	('Lau Thai', 'hotpot.jpg', 299000, 'Lau Thai chua cay'),
	('Tra Dao', 'peach_tea.jpg', 35000, 'Tra dao cam sa'),
	('Coca Cola', 'coca.jpg', 20000, 'Nuoc ngot Coca Cola');
	
INSERT INTO `order` (user_id, food_id, amount, code, arr_sub_id) VALUES
	(1, 1, 2, 'ORD001', '1,2'),
	(2, 3, 1, 'ORD002', '3'),
	(3, 2, 3, 'ORD003', '1,3,4'),
	(4, 5, 2, 'ORD004', '2,5'),
	(5, 4, 1, 'ORD005', '1'),
	(6, 1, 3, 'ORD006', '2,3'),
	(7, 3, 2, 'ORD007', '1,4'),
	(8, 2, 1, 'ORD008', '3'),
	(9, 5, 4, 'ORD009', '1,2,5'),
	(10, 4, 2, 'ORD010', '2,4'),
	(1, 3, 1, 'ORD011', '1'),
	(2, 5, 2, 'ORD012', '3,5'),
	(3, 1, 1, 'ORD013', '2'),
	(4, 4, 3, 'ORD014', '1,2,3'),
	(5, 2, 2, 'ORD015', '4,5'),
	(6, 5, 1, 'ORD016', '1'),
	(7, 1, 2, 'ORD017', '2,3'),
	(8, 4, 1, 'ORD018', '3'),
	(9, 2, 3, 'ORD019', '1,4'),
	(10, 3, 2, 'ORD020', '2,5');

INSERT INTO like_res (user_id, res_id, date_like) VALUES
	(1, 1, '2026-10-20 08:30:00'),
	(1, 2, '2026-10-21 09:00:00'),
	(2, 1, '2026-10-22 10:00:00'),
	(2, 3, '2026-10-23 11:00:00'),
	(3, 1, '2026-10-24 12:00:00'),
	(3, 2, '2026-10-25 13:00:00'),
	(4, 1, '2026-10-26 14:00:00'),
	(4, 4, '2026-10-27 15:00:00'),
	(5, 1, '2026-10-28 16:00:00'),
	(5, 3, '2026-10-29 17:00:00'),
	(6, 2, '2026-10-30 18:00:00'),
	(7, 3, '2026-10-31 19:00:00'),
	(8, 4, '2026-11-01 20:00:00'),
	(9, 5, '2026-11-02 21:00:00'),
	(10, 1, '2026-11-03 22:00:00');

INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
	(1, 1, 5, '2026-10-20 09:00:00'),
	(1, 2, 4, '2026-10-21 10:00:00'),
	(2, 1, 5, '2026-10-22 11:00:00'),
	(2, 3, 3, '2026-10-23 12:00:00'),
	(3, 1, 4, '2026-10-24 13:00:00'),
	(3, 2, 5, '2026-10-25 14:00:00'),
	(4, 1, 5, '2026-10-26 15:00:00'),
	(4, 4, 3, '2026-10-27 16:00:00'),
	(5, 1, 4, '2026-10-28 17:00:00'),
	(5, 3, 5, '2026-10-29 18:00:00'),
	(6, 2, 4, '2026-10-30 19:00:00'),
	(7, 3, 5, '2026-10-31 20:00:00'),
	(8, 4, 2, '2026-11-01 21:00:00'),
	(9, 5, 4, '2026-11-02 22:00:00'),
	(10, 1, 5, '2026-11-03 23:00:00');
	
-- Tìm 5 người đã like nhà hàng nhiều nhất.
SELECT `user`.user_id,`user`.full_name,COUNT(user.user_id) AS "Tổng lượt like"
FROM like_res
INNER JOIN `user` ON `user`.user_id = like_res.user_id
GROUP BY `user`.user_id 
ORDER BY `Tổng lượt like` DESC
LIMIT 5 

-- Tìm 2 nhà hàng có lượt like nhiều nhất.
SELECT restaurant.res_id, restaurant.res_name , COUNT(restaurant.res_id) AS "Tổng số like của nhà hàng"
FROM like_res
INNER JOIN restaurant ON restaurant.res_id = like_res.res_id
GROUP BY restaurant.res_id
ORDER BY `Tổng số like của nhà hàng` DESC
LIMIT 2

-- Tìm người đã đặt hàng nhiều nhất.
SELECT `user`.user_id, `user`.full_name, COUNT(user.user_id) AS "Tổng lượt order"
FROM `order`
INNER JOIN `user` ON `order`.user_id = `user`.user_id
GROUP BY `user`.user_id
ORDER BY `Tổng lượt order` DESC
LIMIT 1

-- Tìm người dùng không hoạt động trong hệ thống
-- (không đặt hàng, không like, không đánh giá nhà hàng).
SELECT `user`.full_name AS "Những người không hoạt động trong hệ thống"
FROM user
LEFT JOIN `order` ON `order`.user_id = `user`.user_id
LEFT JOIN like_res ON like_res.user_id = `user`.user_id
LEFT JOIN rate_res ON rate_res.user_id = `user`.user_id
WHERE `order`.user_id IS NULL AND like_res.user_id IS NULL AND rate_res.user_id IS NULL
