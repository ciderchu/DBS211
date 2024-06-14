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
RIGHT OUTER JOIN 
    Airlines ON Flights.AirlineID = Airlines.AirlineID
WHERE Flights.AirlineID IS NULL;
