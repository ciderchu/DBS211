SELECT 
    Flights.FlightID,
    Flights.FlightNumber,
    Flights.Origin,
    Flights.Destination,
    Flights.DepartureTime,
    Flights.ArrivalTime,
    Airlines.AirlineName,
    Airlines.Country
FROM 
    Flights
JOIN 
    Airlines ON Flights.AirlineID = Airlines.AirlineID
WHERE 
    UPPER(Flights.Destination) LIKE '%O%';

-- Q2
SELECT 
    Flights.FlightID,
    Flights.FlightNumber,
    Flights.Origin,
    Flights.Destination,
    Flights.DepartureTime,
    Flights.ArrivalTime,
    Airlines.AirlineName,
    Airlines.Country
FROM 
    Flights
LEFT OUTER JOIN 
    Airlines ON Flights.AirlineID = Airlines.AirlineID;

-- Q3
SELECT 
    Flights.FlightID,
    Flights.FlightNumber,
    Flights.Origin,
    Flights.Destination,
    Flights.DepartureTime,
    Flights.ArrivalTime,
    Airlines.AirlineName,
    Airlines.Country
FROM 
    Flights
RIGHT OUTER JOIN 
    Airlines ON Flights.AirlineID = Airlines.AirlineID;

-- Q4
SELECT 
    Flights.FlightID,
    Flights.FlightNumber,
    Flights.Origin,
    Flights.Destination,
    Flights.DepartureTime,
    Flights.ArrivalTime,
    Airlines.AirlineName,
    Airlines.Country
FROM 
    Flights
LEFT OUTER JOIN 
    Airlines ON Flights.AirlineID = Airlines.AirlineID
WHERE Flights.AirlineID IS NULL;

-- Q5
SELECT 
    Flights.FlightID,
    Flights.FlightNumber,
    Flights.Origin,
    Flights.Destination,
    Flights.DepartureTime,
    Flights.ArrivalTime,
    Airlines.AirlineName,
    Airlines.Country
FROM 
    Flights
RIGHT OUTER JOIN 
    Airlines ON Flights.AirlineID = Airlines.AirlineID
WHERE Flights.AirlineID IS NULL;

-- Q6
--•	firstname, last name, seat number, origin, destination, departure time, arrival time
SELECT p.firstname, p.lastname, p.seatnumber, f.origin, f.destination, f.departuretime, f.arrivaltime
FROM passengers p
JOIN flights f ON p.flightid = f.flightid;

--Q7
SELECT p.firstname, p.lastname, p.seatnumber, f.origin, f.destination, f.departuretime, f.arrivaltime
FROM passengers p
LEFT JOIN flights f ON p.flightid = f.flightid;

--Q8
SELECT p.firstname, p.lastname, p.seatnumber, f.origin, f.destination, f.departuretime, f.arrivaltime
FROM passengers p
LEFT JOIN flights f ON p.flightid = f.flightid
WHERE p.flightid IS NULL;

--Q9
SELECT a.AirlineName, a.Country, p.firstname, p.lastname, p.seatnumber, f.origin, f.destination, f.departuretime, f.arrivaltime
FROM Airlines a
JOIN FLIGHTS f ON a.AIRLINEID = f.AIRLINEID
JOIN PASSENGERS p ON p.flightid = f.flightid;

--Q10
SELECT a.AirlineName, a.Country, p.firstname, p.lastname, p.seatnumber, f.origin, f.destination, f.departuretime, f.arrivaltime
FROM Airlines a
JOIN FLIGHTS f ON a.AIRLINEID = f.AIRLINEID
RIGHT JOIN PASSENGERS p ON p.flightid = f.flightid
WHERE p.flightid IS NULL;

--Q11

CREATE VIEW Passenger_Airline_Flight AS
SELECT a.AirlineName, a.Country, p.firstname, p.lastname, p.seatnumber, f.origin, f.destination, f.departuretime, f.arrivaltime
FROM Airlines a
JOIN FLIGHTS f ON a.AIRLINEID = f.AIRLINEID
JOIN PASSENGERS p ON p.flightid = f.flightid;

SELECT * FROM Passenger_Airline_Flight;

--Q12
-- 12.	Create a query that shows retail customers first name and last name along with their sales rep employee number and their first name, last name, city, phone number and postal code for all retail customers who live in Singapore.
SELECT rc.CONTACTLASTNAME, rc.CONTACTFIRSTNAME, 
    re.EMPLOYEENUMBER, re.FIRSTNAME,re.LASTNAME, rO.CITY, rO.PHONE, rO.POSTALCODE
FROM RETAILCUSTOMERS rc
JOIN RETAILEMPLOYEES re ON rc.SALESREPEMPLOYEENUMBER = re.EMPLOYEENUMBER
JOIN  RETAILOFFICES ro ON re.OFFICECODE = rO.OFFICECODE
WHERE rc.CITY = 'Singapore';

SELECT rc.CONTACTLASTNAME, rc.CONTACTFIRSTNAME, 
    re.EMPLOYEENUMBER, re.FIRSTNAME, re.LASTNAME, rO.CITY, rO.PHONE, rO.POSTALCODE
FROM RETAILCUSTOMERS rc, RETAILEMPLOYEES re, RETAILOFFICES ro
WHERE rc.SALESREPEMPLOYEENUMBER = re.EMPLOYEENUMBER
AND re.OFFICECODE = rO.OFFICECODE
AND rc.CITY = 'Singapore';


--Q13
SELECT  rc.CUSTOMERNUMBER, rc.CONTACTFIRSTNAME || ' ' || rc.CONTACTLASTNAME AS CUSTOMERNAME,
    rc.COUNTRY, TO_CHAR(rp.PAYMENTDATE, 'DD-MON-YY') AS PAYMENTDATE, rp.AMOUNT
FROM RETAILCUSTOMERS rc
JOIN RETAILPAYMENTS rp ON rc.CUSTOMERNUMBER = rp.CUSTOMERNUMBER
WHERE UPPER(rc.COUNTRY) = 'USA'
ORDER BY rc.CUSTOMERNUMBER ASC;

--Q14
SELECT  rc.CUSTOMERNUMBER, rc.CONTACTFIRSTNAME || ' ' || rc.CONTACTLASTNAME AS CUSTOMERNAME, 
    rp.AMOUNT
FROM RETAILCUSTOMERS rc
LEFT JOIN RETAILPAYMENTS rp ON rc.CUSTOMERNUMBER = rp.CUSTOMERNUMBER
WHERE LOWER(rc.COUNTRY) = 'canada'
ORDER BY rc.CUSTOMERNUMBER ASC;

--Q15
SELECT  od.ORDERNUMBER, od.QUANTITYORDERED, od.PRICEEACH, rc.CUSTOMERNUMBER
FROM ORDERDETAILS od
JOIN RETAILORDERS ro ON od.ORDERNUMBER = ro.ORDERNUMBER
JOIN RETAILCUSTOMERS rc ON ro.CUSTOMERNUMBER = rc.CUSTOMERNUMBER
WHERE ro.STATUS = 'Shipped'
AND
LOWER(rc.COUNTRY) = 'denmark';

--Q16
CREATE VIEW vwProductOrder AS 
SELECT rp.PRODUCTCODE, rp.PRODUCTNAME, rp.MSRP, rp.BUYPRICE, od.QUANTITYORDERED, od.PRICEEACH
FROM RETAILPRODUCTS rp
JOIN ORDERDETAILS od ON rp.PRODUCTCODE = od.PRODUCTCODE;

SELECT * FROM vwProductOrder;

--Q17
SELECT vwp.PRODUCTNAME, vwp.BUYPRICE, od.ORDERLINENUMBER
FROM vwProductOrder vwp
JOIN ORDERDETAILS od ON vwp.PRODUCTCODE = od.PRODUCTCODE
WHERE vwp.BUYPRICE BETWEEN 30 AND 40
AND vwp.PRODUCTCODE LIKE 'S32%'
ORDER BY vwp.PRODUCTNAME ASC, vwp.BUYPRICE ASC;

--Q18
SELECT  rc.CUSTOMERNUMBER, rc.CONTACTFIRSTNAME || ' ' || rc.CONTACTLASTNAME AS CUSTOMERNAME, 
    rc.PHONE, rc.CREDITLIMIT
FROM RETAILCUSTOMERS rc
LEFT JOIN RETAILORDERS ro ON rc.CUSTOMERNUMBER = rO.CUSTOMERNUMBER
WHERE ro.ORDERNUMBER IS NULL;

--Q19
CREATE VIEW vwEmployeeManager AS
SELECT re.FIRSTNAME || ' ' || re.LASTNAME AS EMPLOYEENAME, 
    rm.FIRSTNAME || ' ' || rm.LASTNAME AS MANAGERNAME
FROM RETAILEMPLOYEES re
LEFT JOIN RETAILEMPLOYEES rm ON re.REPORTSTO = rm.EMPLOYEENUMBER;

SELECT * FROM vwEmployeeManager;

--Q20
CREATE OR REPLACE VIEW vwEmployeeManager AS
SELECT re.FIRSTNAME || ' ' || re.LASTNAME AS EMPLOYEENAME, 
    rm.FIRSTNAME || ' ' || rm.LASTNAME AS MANAGERNAME
FROM RETAILEMPLOYEES re
LEFT JOIN RETAILEMPLOYEES rm ON re.REPORTSTO = rm.EMPLOYEENUMBER
WHERE re.REPORTSTO IS NOT NULL;

SELECT * FROM vwEmployeeManager;


