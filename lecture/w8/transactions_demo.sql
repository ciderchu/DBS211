/*
Week 8 Transactions demo
Author: Jennifer Short
Date: July 2, 2024
*/

-- create a table to mess around with
CREATE TABLE xPeople
(
    peopleid INT PRIMARY KEY,
    firstname VARCHAR(40) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR(100),
    province CHAR(2)
);
-- in sert 3 records to start
INSERT INTO xPeople VALUES
    (1,'Jennifer','Short', TO_DATE('05-16-2000','mm-dd-yyyy'),
    'jennifer.short@senecapolytechnic.ca', 'ON');
INSERT INTO xPeople VALUES
    (2,'Imma','Short', TO_DATE('05-16-2001','mm-dd-yyyy'),
    'imma.short@senecapolytechnic.ca', 'ON');
INSERT INTO xPeople VALUES
    (3,'Kinda','Short', TO_DATE('06-26-1990','mm-dd-yyyy'),
    'kinda.short@senecapolytechnic.ca', 'ON');

SELECT * FROM xPeople; -- view the current data

COMMIT; -- make changes permanent 

-- insert another record
INSERT INTO xPeople VALUES
    (4,'Super','Short', TO_DATE('12-27-1992','mm-dd-yyyy'),
    'Super.short@senecapolytechnic.ca', 'ON');
    
SELECT * FROM xPeople;  -- view the current data

SAVEPOINT A; -- create and name a savepoint 

-- insert another record
INSERT INTO xPeople VALUES
    (5,'Really','Short', TO_DATE('11-12-3004','mm-dd-yyyy'),
    'Really.short@senecapolytechnic.ca', 'ON');

SAVEPOINT B; -- create and name a savepoint 

SELECT * FROM xPeople;  -- view the current data

-- insert another record
INSERT INTO xPeople VALUES
    (6,'Seriously','Short', TO_DATE('11-09-2004','mm-dd-yyyy'),
    'Seriously.short@senecapolytechnic.ca', 'ON');
    
ROLLBACK TO B; -- rollback changes to savepoint B

SELECT * FROM xPeople; -- view the current data

ROLLBACK TO A; -- rollback changes to savepoint A
  
-- insert another record
INSERT INTO xPeople VALUES
    (5,'Really','Short', TO_DATE('11-12-3004','mm-dd-yyyy'),
    'Really.short@senecapolytechnic.ca', 'ON');

SAVEPOINT B; -- create and name a savepoint 

-- insert another record
INSERT INTO xPeople VALUES
    (6,'Seriously','Short', TO_DATE('11-09-2004','mm-dd-yyyy'),
    'Seriously.short@senecapolytechnic.ca', 'ON');
    
SELECT * FROM xPeople; -- view the current data

COMMIT; -- make changes permanent 

ROLLBACK TO B;  -- attempt to rollback changes to savepoint B, will get an error