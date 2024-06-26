CREATE DATABASE library;

-- create a book table
CREATE TABLE IF NOT EXISTS books (
	id SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	author VARCHAR(20) NOT NULL,
	publication_year INTEGER NOT NULL
);

-- create a user table
CREATE TABLE IF NOT EXISTS users (
	id SERIAL PRIMARY KEY,
	full_name VARCHAR(50) NOT NULL
);

-- create many to many
CREATE TABLE IF NOT EXISTS borrows_history (
	book_id int REFERENCES books(id),
	user_id int REFERENCES users(id),
	CONSTRAINT borrows_history_pkey PRIMARY KEY (book_id, user_id)
);


-- insert some data to users
INSERT INTO users (full_name) VALUES
('Bill Bowerman'),
('Mel Blanc'),
('Jack Dee'),
('Jim Elliot'),
('George Fox'),
('Lorenz Hart'),
('Ann Landers'),
('Karl Marx'),
('Robert Kennedy');

-- insert some data to books
INSERT INTO books(title, author, publication_year) VALUES
('The Lord of the Rings', 'J.R.R. Tolkien', 1954),
('Python Concurrency with Asyncio', 'Matthew Fowler', 2022),
('Clean Architecture: Software Structure and Design', 'Robert C. Martin', 2017),
('Architecture Patterns with Python', ' Harry Percival', 2020),
('Designing Data-Intensive Applications', 'Martin Kleppmann', 2017),
('The Witcher: Last wish', 'Andrzej Sapkowski', 1993);

-- insert some data to many to many table
INSERT INTO borrows_history(book_id, user_id) VALUES
(3, 2),
(3, 5),
(5, 1),
(4, 6),
(2, 8),
(2, 9),
(1, 1),
(4, 8);


-- select all users who borrowed a specific book
SELECT users.full_name
	FROM borrows_history
	JOIN books ON books.id = book_id
	JOIN users ON users.id = user_id
	WHERE books.title = 'Clean Architecture: Software Structure and Design';


-- delete data from all tables using transactions
BEGIN TRANSACTION;
	-- delete data from borrows_history table
	DELETE FROM borrows_history;
	-- delete data from books table
	DELETE FROM books;
	-- delete data from users table
	DELETE FROM users;
COMMIT TRANSACTION;