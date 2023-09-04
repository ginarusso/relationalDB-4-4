DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS countries;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL,
    password VARCHAR(25) NOT NULL,
    email VARCHAR(50) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL
    );

CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL
    );

CREATE TABLE addresses (
    id SERIAL PRIMARY KEY,
    user_id INT,
    country_id INT,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(country_id) REFERENCES countries(id) 
);

INSERT INTO users (username, password, email, first_name, last_name) VALUES
('grusso', 'password123', 'grusso@gmail.com', 'Gina', 'Russo'),
 ('arusso', 'password321', 'arusso@gmail.com', 'Andrew', 'Russo');

INSERT INTO countries (name) VALUES
('Italy'), 
('Australia'),
('Germany');

INSERT INTO addresses (user_id, country_id) VALUES
(1, 1),
(2, 1),
(2, 3);

-- List all the countries
SELECT * FROM countries;
-- List all user emails
SELECT users.email FROM users;
-- List all user firstNames that have the letter "e" in the name
SELECT first_name FROM users WHERE first_name LIKE '%e%';
-- List all the countries where user_id = 2 lives
SELECT c.name
FROM countries c
JOIN addresses a ON c.id = a.country_id
WHERE a.user_id = 2;