-- Create Airlines table
CREATE TABLE Airlines (
    AirlineID INT PRIMARY KEY,
    AirlineName VARCHAR(50)NOT NULL,
    Country VARCHAR(50)
);

-- Insert data into Airlines table
INSERT ALL
INTO Airlines VALUES (1, 'Air Canada', 'Canada')
INTO Airlines VALUES(2, 'Delta Air Lines', 'United States')
INTO Airlines VALUES(3, 'Lufthansa', 'Germany')
INTO Airlines VALUES(4, 'British Airways', 'UK')
SELECT * FROM dual;
COMMIT;

-- Create Flights table
DROP TABLE FLIGHTS;
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    AirlineID INT NOT NULL,
    FlightNumber VARCHAR(10) NOT NULL,
    Origin VARCHAR(50)NOT NULL,
    Destination VARCHAR(50)NOT NULL,
    DepartureTime DATE,
    ArrivalTime DATE,
    CONSTRAINT AIRLINE_FK FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
);

-- Insert data into Flights table
INSERT ALL
INTO Flights VALUES(101, 1, 'AC101', 'Toronto', 'Vancouver', TO_DATE('2024-06-01 08:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-01 10:00:00','YYYY-MM-DD HH24:MI:SS'))
INTO Flights VALUES(102, 1, 'AC102', 'Vancouver', 'Toronto', TO_DATE('2024-06-01 12:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-01 14:00:00','YYYY-MM-DD HH24:MI:SS'))
INTO Flights VALUES(103, 2, 'DL201', 'New York', 'Los Angeles', TO_DATE('2024-06-02 09:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-02 12:00:00','YYYY-MM-DD HH24:MI:SS'))
INTO Flights VALUES(104, 2, 'DL202', 'Los Angeles', 'New York', TO_DATE('2024-06-02 13:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE( '2024-06-02 19:00:00','YYYY-MM-DD HH24:MI:SS'))
INTO Flights VALUES(105, 3, 'LH301', 'Frankfurt', 'London', TO_DATE('2024-06-03 07:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-03 09:00:00','YYYY-MM-DD HH24:MI:SS'))
INTO Flights VALUES(106, 3, 'LH302', 'London', 'Frankfurt', TO_DATE('2024-06-03 10:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-03 12:00:00','YYYY-MM-DD HH24:MI:SS'))
SELECT * FROM dual;
COMMIT;

-- Create Passengers table
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY,
    FlightID INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50)NOT NULL,
    SeatNumber VARCHAR(10),
    CONSTRAINT FLIGHT_FK FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

-- Insert data into Passengers table
INSERT ALL
INTO Passengers VALUES (1, 101, 'John', 'Doe', '12A')
INTO Passengers VALUES (2, 101, 'Jane', 'Smith', '12B')
INTO Passengers VALUES (3, 102, 'Alice', 'Johnson', '14C')
INTO Passengers VALUES (4, 103, 'Bob', 'Brown', '18D')
INTO Passengers VALUES (5, 104, 'Carol', 'Davis', '20E')
INTO Passengers VALUES (6, 105, 'David', 'Wilson', '22F')
INTO Passengers VALUES (7, 106, 'Eve', 'Taylor', '24A')
INTO Passengers VALUES (8, 106, 'Frank', 'Anderson', '24B')
INTO Passengers VALUES (9, 102, 'Grace', 'Lee', '14A')
INTO Passengers VALUES (10, 105, 'Henry', 'Martinez', '22D')
SELECT * FROM dual;
COMMIT;