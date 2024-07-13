-- 1. List the 4 ways that we know that a transaction can be started

-- Explicitly using the BEGIN TRANSACTION statement.
-- By executing a data manipulation language (DML) statement like INSERT, UPDATE, or DELETE if autocommit is off.
-- Using the SET TRANSACTION statement to set transaction characteristics.
-- Through stored procedures or triggers that implicitly start a transaction.


-- 2.Using SQL, create an empty table, that is the same as the employees table, and name it NEWEMPLOYEES.
CREATE TABLE NEWEMPLOYEES (
    employeenumber INT,
    lastname VARCHAR(255),
    firstname VARCHAR(255),
    extension VARCHAR(10),
    email VARCHAR(255),
    officecode INT,
    reportsto INT,
    jobtitle VARCHAR(255)
);


-- 3. Execute the following commands.
SET AUTOCOMMIT OFF;
SET TRANSACTION READ WRITE;


-- 4. Write an INSERT statement to populate the NEWEMPLOYEES table with the rows of the sample data.
-- Insert the NULL value for the reportsto column. (Write a single INSERT statement to insert all the rows)
INSERT INTO NEWEMPLOYEES (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) VALUES
(100, 'Patel', 'Ralph', '22333', 'rpatel@gmail.com', 1, NULL, 'Sales Rep');

INSERT INTO NEWEMPLOYEES (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) VALUES
(101, 'Denis', 'Betty', '33444', 'bdenis@gmail.com', 4, NULL, 'Sales Rep');

INSERT INTO NEWEMPLOYEES (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) VALUES
(102, 'Biri', 'Ben', '44555', 'bbirir@gmail.com', 2, NULL, 'Sales Rep');

INSERT INTO NEWEMPLOYEES (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) VALUES
(103, 'Newman', 'Chad', '66777', 'cnewman@gmail.com', 3, NULL, 'Sales Rep');

INSERT INTO NEWEMPLOYEES (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) VALUES
(104, 'Ropeburn', 'Audrey', '77888', 'aropebur@gmail.com', 1, NULL, 'Sales Rep');


-- 5. Create a query that shows all the inserted rows from the NEWEMPLOYEES table. How many rows are
-- selected?

SELECT * FROM NEWEMPLOYEES;

-- 6. Execute the rollback command. Display all rows and columns from the NEWEMPLOYEES table. How
-- many rows are selected?

ROLLBACK;
SELECT * FROM NEWEMPLOYEES;
-- After roll back, there are 0 row.


-- 7. Repeat Task 4. Make the insertion permanent to the table NEWEMPLOYEES. Display all rows and
-- columns from the NEWEMPLOYEES table. How many rows are selected?

INSERT INTO NEWEMPLOYEES (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) VALUES
(100, 'Patel', 'Ralph', '22333', 'rpatel@gmail.com', 1, NULL, 'Sales Rep');

INSERT INTO NEWEMPLOYEES (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) VALUES
(101, 'Denis', 'Betty', '33444', 'bdenis@gmail.com', 4, NULL, 'Sales Rep');

INSERT INTO NEWEMPLOYEES (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) VALUES
(102, 'Biri', 'Ben', '44555', 'bbirir@gmail.com', 2, NULL, 'Sales Rep');

INSERT INTO NEWEMPLOYEES (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) VALUES
(103, 'Newman', 'Chad', '66777', 'cnewman@gmail.com', 3, NULL, 'Sales Rep');

INSERT INTO NEWEMPLOYEES (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) VALUES
(104, 'Ropeburn', 'Audrey', '77888', 'aropebur@gmail.com', 1, NULL, 'Sales Rep');

COMMIT;
SELECT * FROM NEWEMPLOYEES;

-- query shows 5 rows.

-- 8. Write an update statement to update the value of column jobtitle to ‘unknown’ for all the employees
-- in the NEWEMPLOYEES table.
UPDATE NEWEMPLOYEES SET jobtitle = 'unknown';



-- 9. Make your changes permanent.
COMMIT;

-- 10. Execute the rollback command.
ROLLBACK;

-- a. Display all employees from the NEWEMPLOYEES table whose job title is ‘unknown’. How many
-- rows are still updated?
SELECT * FROM NEWEMPLOYEES WHERE jobtitle = 'unknown';


-- b. Was the rollback command effective?
-- No the rollback is not effective

-- c. What was the difference between the result of the rollback execution from Task 6 and the
-- result of the rollback execution of this task?
-- As the COMMIT command is executed and therefore the change happends permanently. 
-- Rollback will not be effective to reach the previous step.

-- 11. Begin a new transaction and then create a statement to delete 2 employees from the NEWEMPLOYEES
-- table
SET TRANSACTION READ WRITE;
DELETE FROM NEWEMPLOYEES WHERE employeenumber IN (100, 101);



-- 12. Create a VIEW, called VWNEWEMP, that queries all the records in the NEWEMPLOYEES table sorted by
-- last name and then by first name.
CREATE VIEW VWNEWEMP AS
SELECT * FROM NEWEMPLOYEES
ORDER BY lastname, firstname;


-- 13. Perform a rollback to undo the deletion of the employees
ROLLBACK;
-- a. How many employees are now in the NEWEMPLOYEES table?
SELECT * FROM NEWEMPLOYEES;
-- b. Was the rollback effective and why?
-- I believe that the CREATE VIEW, may cause an implicit commit, which commits all changes made prior to that statement. If this happens, 
-- the ROLLBACK will not undo the deletion because the transaction was already committed.


-- 14. Begin a new transaction and rerun the data insertion from Task 4 (copy the code down to Task 14 and
-- run it)
SET TRANSACTION READ WRITE;
INSERT INTO NEWEMPLOYEES (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) VALUES
(100, 'Patel', 'Ralph', '22333', 'rpatel@gmail.com', 1, NULL, 'Sales Rep');

INSERT INTO NEWEMPLOYEES (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) VALUES
(101, 'Denis', 'Betty', '33444', 'bdenis@gmail.com', 4, NULL, 'Sales Rep');

INSERT INTO NEWEMPLOYEES (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) VALUES
(102, 'Biri', 'Ben', '44555', 'bbirir@gmail.com', 2, NULL, 'Sales Rep');

INSERT INTO NEWEMPLOYEES (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) VALUES
(103, 'Newman', 'Chad', '66777', 'cnewman@gmail.com', 3, NULL, 'Sales Rep');

INSERT INTO NEWEMPLOYEES (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) VALUES
(104, 'Ropeburn', 'Audrey', '77888', 'aropebur@gmail.com', 1, NULL, 'Sales Rep');

SELECT * FROM NEWEMPLOYEES;



-- 15. Set a Savepoint, called insertion, after inserting the data
SAVEPOINT insertion;

-- 16. Rerun the update statement from Task 8 and run a query to view the data (copy the code down and
-- run it again)
UPDATE NEWEMPLOYEES SET jobtitle = 'unknown';
SELECT * FROM NEWEMPLOYEES;



-- 17. Rollback the transaction to the Savepoint created in task 15 above and run a query to view the data.
-- What does the data look like (i.e. describe what happened?
ROLLBACK TO SAVEPOINT insertion;
SELECT * FROM NEWEMPLOYEES;

--The data should look like it did after the insertion, with the original job titles restored.

-- 18. Use the basic form of the rollback statement and again view the data. Describe what the results look
-- like and what happened.
ROLLBACK;
SELECT * FROM NEWEMPLOYEES;

--It reverts the database to the state before Task 14, 
-- meaning no data in the NEWEMPLOYEES table is re-inserted.

-- 19. Write statements to permanently remove the view and table created for this lab
DROP VIEW VWNEWEMP;
DROP TABLE NEWEMPLOYEES;
COMMIT;