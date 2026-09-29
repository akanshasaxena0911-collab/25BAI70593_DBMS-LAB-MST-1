-- Question 1: Library Management System
-- A. Theory:
-- Explain how DDL, DML, and integrity constraints work together in a database application. Explain the difference between ALTER and RENAME, and describe how WHERE is used with DML queries.
-- B. Practical:
-- Create a simple Library Management System using Book and Member tables.
-- 1. Create both tables with suitable attributes.
-- 2. Apply Primary Key, Foreign Key, NOT NULL, UNIQUE, and DEFAULT constraints.
-- 3. Insert at least 5 books and 3 members.
-- 4. Display books belonging to a particular category.
-- 5. Update the availability status of a book.
-- 6. Delete a book based on its ID.
-- 7. Add a new column to the Book table using ALTER.
-- 8. Rename the Book table using RENAME.
-- 9. Display the records after performing the operations.

CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Member (
    member_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) NOT NULL,
    membership_type VARCHAR(20) 
);
CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    member_id INT,
    availability VARCHAR(20) ,
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);
INSERT INTO Member
(member_id, name, email, phone, membership_type)
VALUES
(1, 'Akansha','akansha@gmail.com', '9876543210', 'Premium'),
(2, 'Rahul','rahul@gmail.com', '9876543211', 'Regular'),
(3, 'Priya','priya@gmail.com', '9876543212', 'Regular');
INSERT INTO Book
(book_id, title, category, author, member_id, availability)
VALUES
(101, 'The Alchemist','Fiction','Paulo Coelho',3, 'Available'),
(102, 'The silent patient','thriller','dont remember',1, 'Issued'),
(103, 'demon slayer','Biography','manga',NULL, 'Available'),
(104, 'hercules','fiction','unknown',2,'Issued'),
(105, 'Alice in the wonderland','Fiction','J.R.R. Tolkien',NULL,'Available');

SELECT * FROM Book
WHERE category = 'fiction';

UPDATE Book
SET availability = 'Issued'
WHERE book_id = 101;

DELETE FROM Book
WHERE book_id = 105;

ALTER TABLE Book
ADD COLUMN publisher VARCHAR(100);

RENAME TABLE Book TO LibraryBook;

SELECT * FROM LibraryBook;

SELECT * FROM Member;







