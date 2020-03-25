--CREATION OF TABLES

-- create customer table
CREATE TABLE Customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	vip BOOLEAN
);

--create tickets table
CREATE TABLE Tickets(
	ticket_id SERIAL PRIMARY KEY,
	ticket_date DATE,
	ticket_price NUMERIC(2,2),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

ALTER TABLE Tickets
ALTER COLUMN ticket_price TYPE NUMERIC(4,2);
	
--create movie table
CREATE TABLE Movie(
	movie_id SERIAL PRIMARY KEY,
	movie_time TIME,
	movie_name VARCHAR(100),
	ticket_id INTEGER NOT NULL,
	FOREIGN KEY(ticket_id) REFERENCES Tickets(ticket_id)
);

--create concessions table
CREATE TABLE Concessions(
	register_id SERIAL PRIMARY KEY,
	item_id VARCHAR(10),
	item_name VARCHAR(20),
	amount NUMERIC(2,2),
	total NUMERIC(3,2),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

ALTER TABLE Concessions
ALTER COLUMN amount TYPE NUMERIC(4,2);

ALTER TABLE Concessions
ALTER COLUMN total TYPE NUMERIC(5,2);

-- INSERT DATA INTO TABLES

--insert data into customer table
INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	vip
)
VALUES(
	1,
	'Niel',
	'Armstrong',
	TRUE
);

INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	vip
)
VALUES(
	2,
	'John',
	'Doe',
	FALSE
);


--insert data into tickets table
INSERT INTO tickets(
	ticket_id,
	ticket_date,
	ticket_price,
	customer_id
)
VALUES(
	14142,
	'10/18/2019',
	14.99,
	1
);

INSERT INTO tickets(
	ticket_id,
	ticket_date,
	ticket_price,
	customer_id
)
VALUES(
	12652,
	'07/09/2019',
	11.99,
	2
);

--insert data into movie table
INSERT INTO movie(
	movie_id,
	movie_time,
	movie_name,
	ticket_id
)
VALUES(
	33,
	'20:30',
	'Cop Out',
	12652	
);

INSERT INTO movie(
	movie_id,
	movie_time,
	movie_name,
	ticket_id
)
VALUES(
	47,
	'18:00',
	'AVATAR',
	14142
);

--insert data into concessions
INSERT INTO concessions(
	register_id,
	item_id,
	item_name,
	amount,
	total,
	customer_id
)
VALUES(
	4,
	'F471',
	'Small Popcorn',
	7.99,
	8.55,
	1
);

INSERT INTO concessions(
	register_id,
	item_id,
	item_name,
	amount,
	total,
	customer_id
)
VALUES(
	2,
	'Q23C',
	'Medium Slurpee',
	8.99,
	9.75,
	2
);