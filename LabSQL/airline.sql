CREATE DATABASE airline;

USE airline;

CREATE TABLE customers (
    customer_name VARCHAR(255) PRIMARY KEY,
    customer_status VARCHAR(255),
    total_customer_mileage INT
);

CREATE TABLE aircrafts (
    aircraft VARCHAR(255) PRIMARY KEY,
    total_aircraft_seats INT
);

CREATE TABLE flights (
    flight_number VARCHAR(255) PRIMARY KEY,
    aircraft VARCHAR(255),
    flight_mileage INT,
    FOREIGN KEY (aircraft) REFERENCES aircrafts(aircraft)
);

CREATE TABLE bookings (
    customer_name VARCHAR(255),
    flight_number VARCHAR(255),
    PRIMARY KEY (customer_name, flight_number),
    FOREIGN KEY (customer_name) REFERENCES customers(customer_name),
    FOREIGN KEY (flight_number) REFERENCES flights(flight_number)
);

INSERT INTO customers (customer_name, customer_status, total_customer_mileage)
    VALUES
        ('Agustine Riviera', 'Silver', 115235),
        ('Alaina Sepulvida', 'None', 6008),
        ('Tom Jones', 'Gold', 205767),
        ('Sam Rio', 'None', 2653),
        ('Jessica James', 'Silver', 127656),
        ('Ana Janco', 'Silver', 136773),
        ('Jennifer Cortez', 'Gold', 300582),
        ('Christian Janco', 'Silver', 14642);

INSERT INTO aircrafts (aircraft, total_aircraft_seats)
    VALUES
        ('Boeing 747', 400),
        ('Airbus A330', 236),
        ('Boeing 777', 264);


INSERT INTO flights (flight_number, aircraft, flight_mileage)
    VALUES
        ('DL143', 'Boeing 747', 135),
        ('DL122', 'Airbus A330', 4370),
        ('DL53', 'Boeing 777', 2078),
        ('DL222', 'Boeing 777', 1765),
        ('DL37', 'Boeing 747', 531);

INSERT INTO bookings (customer_name, flight_number)
VALUES
    ('Agustine Riviera', 'DL143'),
    ('Agustine Riviera', 'DL122'),
    ('Alaina Sepulvida', 'DL122'),
    ('Tom Jones', 'DL122'),
    ('Tom Jones', 'DL53'),
    ('Tom Jones', 'DL222'),
    ('Sam Rio', 'DL143'),
    ('Sam Rio', 'DL37'),
    ('Jessica James', 'DL143'),
    ('Jessica James', 'DL122'),
    ('Ana Janco', 'DL222'),
    ('Jennifer Cortez', 'DL222'),
    ('Christian Janco', 'DL222');


SELECT COUNT(DISTINCT flight_number) FROM flights;
SELECT AVG(flight_mileage) FROM flights;
SELECT AVG(aircrafts.total_aircraft_seats) FROM aircrafts;
SELECT customer_status, AVG(total_customer_mileage) FROM customers GROUP BY customer_status;
SELECT customer_status, MAX(total_customer_mileage) FROM customers GROUP BY customer_status;
SELECT COUNT(*) FROM aircrafts WHERE aircraft LIKE '%Boeing%';
SELECT * FROM flights WHERE flight_mileage BETWEEN 300 AND 2000;

SELECT c.customer_status, AVG(f.flight_mileage)
FROM bookings b
         JOIN customers c ON b.customer_name = c.customer_name
         JOIN flights f ON b.flight_number = f.flight_number
GROUP BY c.customer_status;

SELECT a.aircraft, COUNT(*) AS total_bookings
FROM bookings b
         JOIN customers c ON b.customer_name = c.customer_name
         JOIN flights f ON b.flight_number = f.flight_number
         JOIN aircrafts a ON f.aircraft = a.aircraft
WHERE c.customer_status = 'Gold'
GROUP BY a.aircraft
ORDER BY total_bookings DESC
LIMIT 1;

