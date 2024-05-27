CREATE TYPE employee_name (
	firstName TEXT,
	lastName TEXT
);

CREATE TYPE item (
	code TEXT,
	quantity INT,
);

CREATE TABLE employee (
	id INT,
	name employee_name,
	emails SET<TEXT>,
	phones MAP<TEXT, TEXT>,
	address TUPLE<TEXT, TEXT, SMALLINT>,
	position TEXT,
	start DATE,
	end DATE
 	PRIMARY KEY (id)
);

CREATE INDEX idx_employee_position ON employee (position);

CREATE TABLE confectionery (
	code TEXT,
	manufacture_date DATE,
	name TEXT,
	description TEXT,
	calories INT,
	nutritions MAP<TEXT, INT>,
	allergens SET<TEXT>,
	manufacturer TEXT,
	expiration DATE,
	in_stock BOOLEAN,
	price INT,
	PRIMARY KEY (code)
);

CREATE TABLE receipt (
	number INT,
	saleDate TIMESTAMP,
	shop MAP<TEXT, TEXT>,
	sellerId INT,
	items LIST<frozen <item>>,
	total_price INT,
	PRIMARY KEY ((number), saleDate)
);

// Insert Employees
INSERT INTO employee (id, name, emails, phones, address, position, start, terminated)
VALUES (1, {first : 'Jan', last : 'Urban'}, {'jan.urban@gmail.com', 'jan.urban@sweet.com'}, {'personal' : '+420123123123', 'work' : '+420111111111'}, ('Sinkuleho 2', 'Praha', 16000), 'cashier', '20-07-2016', '31-10-2019');

INSERT INTO employee (id, name, emails, phones, address, position, start, terminated)
VALUES (2, {first : 'Prokop', last : 'Kraus'}, { 'prokop.kraus@gmail.com', 'prokop.kraus@sweet.com'}, {'personal' : '+42190123456789', 'work' : '+420222222222'}, ('Dejvicka 19', 'Praha', 16000), 'cashier', '20-07-2016', null);

INSERT INTO employee (id, name, emails, phones, address, position, start, terminated)
VALUES (3, {first : 'Eva', last : 'Havel'}, { 'eva.havel@gmail.com', 'eva.havel@sweet.com'}, {'personal' : '+420123321123', 'work' : '+420333333333'}, ('Konevova 198', 'Praha', 13000), 'cleaner', '20-07-2016', null);

INSERT INTO employee (id, name, emails, phones, address, position, start, terminated) 
VALUES (4, {first : 'Arina', last : 'Momot'}, { 'arina.momot@gmail.com', 'arina.momot@sweet.com'}, {'personal' : '+420123321321', 'work' : '+420444444444'}, ('Kopernikova 12', 'Praha', 12000), 'cashier', '31-08-2019', null);

INSERT INTO employee (id, name, emails, phones, address, position, start, terminated)
VALUES (5, {first : 'Pavel', last : 'Marek'}, { 'pavel.marek@gmail.com', 'pavel.marek@sweet.com'}, {'personal' : '+420321321123', 'work' : '+420555555555'}, ('Podolska 23', 'Praha', 14700), 'trainee', '31-05-2022', null);

// Insert Confectioneries
INSERT INTO confectionery (code, manufacture_date, name, description, calories, nutritions, allergens, manufacturer, expiration, in_stock, price)
VALUES ('СС132', '05-10-2022', 'Сarrot cake', 'Delicious and healthy carrot cake with sour cream', 650, {'fat': 25, 'carbohydrates': 78, 'protein': 4}, {'Walnuts', 'Milk', 'Egg', 'Soya'}, 'Costa', '15-10-2022', true, 129);

INSERT INTO confectionery (code, manufacture_date, name, description, calories, nutritions, allergens, manufacturer, expiration, in_stock, price)
VALUES ('BB253', '10-10-2022', 'Banana Bread', 'Banana loaf bread with pecans and walnuts', 374, {'fat': 20, 'carbohydrates': 42, 'protein': 6}, {'Wheat', 'Walnuts', 'Egg', 'Pecan'}, 'Cross Cafe', '14-11-2022', false, 95);

INSERT INTO confectionery (code, manufacture_date, name, description, calories, nutritions, allergens, manufacturer, expiration, in_stock, price)
VALUES ('BM321', '25-09-2022', 'Blueberry Muffin', 'A classic Starbucks muffin packed with blueberries, filled with a smooth blueberry filling', 394, {'fat': 18, 'carbohydrates': 52, 'protein': 6}, {'Wheat', 'Oat', 'Egg', 'Milk', 'Soya'}, 'Costa', '14-11-2022', true, 75);

INSERT INTO confectionery (code, manufacture_date, name, description, calories, nutritions, allergens, manufacturer, expiration, in_stock, price)
VALUES ('CHC492', '06-10-2022', 'Сhocolate Cookie', 'All butter cookie with three irresistible chocolates chunks: dark, milk and white', 377, {'fat': 21, 'carbohydrates': 41, 'protein': 5}, {'Wheat', 'Milk', 'Egg', 'Soya'}, 'Paul', '16-11-2022', true, 59);

INSERT INTO confectionery (code, manufacture_date, name, description, calories, nutritions, allergens, manufacturer, expiration, in_stock, price)
VALUES ('LL598', '06-10-2022', 'Lemon Loaf', 'A moist buttery lemon loaf cake topped with a lemon icing glaze and caramelised lemon zest', 397, {'fat': 23, 'carbohydrates': 41, 'protein': 6}, {'Wheat', 'Milk', 'Egg', 'Almonds'}, 'Paul', '11-12-2022', false, 89);

// Insert Receipts
INSERT INTO receipt (number, saleDate, shop, sellerId, items, total_price)
VALUES (23423451, '15/10/2022 09:25:31', {'name': 'Sweets', 'address': 'Sinkulova 79', 'phone': '+420769345839'}, 4, [('СС132', 2), ('BB253', 1)], 353);

INSERT INTO receipt (number, saleDate, shop, sellerId, items, total_price)
VALUES (94753985, '11/10/2022 12:05:41', {'name': 'Sweets', 'address': 'Sinkulova 79', 'phone': '+420769345839'}, 5, [('СС132', 1), ('LL598', 3)], 396);

INSERT INTO receipt (number, saleDate, shop, sellerId, items, total_price)
VALUES (84621792, '13/10/2022 16:10:23', {'name': 'Sweets', 'address': 'Sinkulova 79', 'phone': '+420769345839'}, 5, [('CHC492', 2), ('BB253', 1), ('LL598', 3)], 480);

INSERT INTO receipt (number, saleDate, shop, sellerId, items, total_price)
VALUES (32156732, '02/11/2022 21:25:31', {'name': 'Sweets', 'address': 'Sinkulova 79', 'phone': '+420769345839'}, 4, [('BM321', 5), ('BB253', 1)], 470);

INSERT INTO receipt (number, saleDate, shop, sellerId, items, total_price)
VALUES (65443275, '04/11/2022 13:12:31', {'name': 'Sweets', 'address': 'Sinkulova 79', 'phone': '+420769345839'}, 4, [('СС132', 10)], 1290);

// Update Employee - replace SET, MAP, TUPLE
UPDATE employee
SET
	emails = {'janurban@gmail.com'},
	phones = {'personal' : '+4207758849933'},
	address = ('Rudska 76', 'Podebrady', 15000)
WHERE (id = 1);

// REMOVE SET, MAP
UPDATE employee
SET
	emails = emails - {'jan.urban@sweet.com'},
	phones = phones - {'personal'}
WHERE (id = 1);

// ADD SET, MAP
UPDATE employee
SET
	emails = emails + {'arinamomot2000@gmail.com'},
	phones = phones + {'reserve' : '+420918273645'}
WHERE (id = 4);

// Update receipt - replace LIST
UPDATE receipt
SET
	items = [('СС132', 5), ('CHC492', 5)],
	total_price = 940
where number = 23423451 and saleDate = '15/10/2022 09:25:31';

// Add LIST
UPDATE receipt
SET
	items = items + [('СС132', 2)],
	total_price = 654
WHERE number = 94753985 and saleDate = '11/10/2022 12:05:41';

// Remove LIST
UPDATE receipt
SET
	items = items - [('BB253', 1)],
	total_price = 385
WHERE number = 84621792 and saleDate = '13/10/2022 16:10:23';


//SELECTS
SELECT * FROM employee WHERE position = 'cashier' ORDER BY start DESC;

SELECT * FROM confectionery WHERE manufacturer = 'Costa' and in_stock = true ALLOW FILTERING;

SELECT * FROM receipt WHERE sellerId = 4 ORDER BY saleDate DESC;