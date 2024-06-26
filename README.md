**Library Management System**
**Objective**: you need to create a simple library management database with Book and Reader tables.
All SQL code needs to be stored in .sql file.
 
**Tasks**:
1) Create database "library" and use it.
2) Create a table "book" with attributes id (integer autoincrement primary key), title (string with limit of 50 symbols), author (string with limit of 20 symbols), publication_year (integer).
3) Create a table "user" with attributes id (integer autoincrement primary key), full_name (string with limit of 50 symbols).
4) Create a Many-to-Many relationship between user and book tables in a form of a join table borrows_history.
5) Add some users to user table using INSERT.
6) Add some books to book table using INSERT.
7) Add joins between them in borrows_history table using INSERT.
8) Make a SELECT statement that returns all users who borrowed a specific book.
9) Delete data from both tables at the same time using transactions.