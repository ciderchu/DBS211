--Q1

CREATE TABLE MOVIES (
    movieid INT PRIMARY KEY,
    title VARCHAR(35) NOT NULL,
    releaseYear INT NOT NULL,
    director INT NOT NULL,
    score DECIMAL(3,2) CHECK (score >= 1 AND score <= 10)
);

--Q2
CREATE TABLE ACTORS (
    actorid INT PRIMARY KEY,
    Act_firstName VARCHAR(20) NOT NULL,
    Act_lastName VARCHAR(30) NOT NULL
);

--Q3
CREATE TABLE CASTINGS (
    movieid INT,
    actorid INT,
    PRIMARY KEY (movieid, actorid),
    CONSTRAINT movieid_fk FOREIGN KEY (movieid) REFERENCES MOVIES(movieid),
    CONSTRAINT actorid_fk FOREIGN KEY (actorid) REFERENCES ACTORS(actorid)
);


--Q4
CREATE TABLE DIRECTORS (
    directorid INT PRIMARY KEY,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(30) NOT NULL
);

--Q5
ALTER TABLE MOVIES
ADD directorid INT;


ALTER TABLE MOVIES
ADD CONSTRAINT fk_directorid
FOREIGN KEY (directorid) REFERENCES DIRECTORS(directorid);

ALTER TABLE MOVIES
DROP CONSTRAINT fk_directorid;


--Q6
ALTER TABLE MOVIES
ADD CONSTRAINT mv_title_uk UNIQUE (TITLE);

-- Q7

ALTER TABLE DIRECTORS
RENAME COLUMN firstname TO Dir_Firstname;

ALTER TABLE DIRECTORS
RENAME COLUMN lastname TO Dir_Lastname;


INSERT INTO DIRECTORS (directorid, Dir_Firstname, Dir_Lastname) VALUES (101, 'Denis', 'Villeneuve');
INSERT INTO DIRECTORS (directorid, Dir_Firstname, Dir_Lastname) VALUES (102, 'Jon', 'Watts');
INSERT INTO DIRECTORS (directorid, Dir_Firstname, Dir_Lastname) VALUES (103, 'Matt', 'Reeves');
INSERT INTO DIRECTORS (directorid, Dir_Firstname, Dir_Lastname) VALUES (104, 'Daniel Scheinert', 'Daniel Kwan');
INSERT INTO DIRECTORS (directorid, Dir_Firstname, Dir_Lastname) VALUES (105, 'Joseph', 'Kosinski');
INSERT INTO DIRECTORS (directorid, Dir_Firstname, Dir_Lastname) VALUES (106, 'Cary Joji', 'Fukunaga');
INSERT INTO DIRECTORS (directorid, Dir_Firstname, Dir_Lastname) VALUES (107, 'Ryan', 'Coogler');
INSERT INTO DIRECTORS (directorid, Dir_Firstname, Dir_Lastname) VALUES (108, 'James', 'Cameron');
INSERT INTO DIRECTORS (directorid, Dir_Firstname, Dir_Lastname) VALUES (109, 'Adam', 'McKay');
INSERT INTO DIRECTORS (directorid, Dir_Firstname, Dir_Lastname) VALUES (110, 'Wes', 'Anderson');

INSERT INTO DIRECTORS (directorid, Dir_Firstname, Dir_Lastname) VALUES (111, '7', '7');


--Q8
ALTER TABLE MOVIES
RENAME COLUMN movieid TO Id;

ALTER TABLE MOVIES
DROP COLUMN DIRECTOR;

ALTER TABLE MOVIES
RENAME COLUMN DIRECTORID TO DIRECTOR;


INSERT ALL
    INTO MOVIES (Id, Title, Year, Director, Score) VALUES (101, 'Dune', 2021, 101, 8.2)
    INTO MOVIES (Id, Title, Year, Director, MOVIES.SCORE) VALUES (102, 'Spider-Man: No Way Home', 2021, 102, 8.3)
    INTO MOVIES (Id, Title, Year, Director, Score) VALUES (103, 'The Batman', 2022, 103, 8)
    INTO MOVIES (Id, Title, Year, Director, Score) VALUES (104, 'Everything Everywhere All at Once', 2022, 104, 8.1)
    INTO MOVIES (Id, Title, Year, Director, Score) VALUES (105, 'Top Gun: Maverick', 2022, 105, 8.4)
    INTO MOVIES (Id, Title, Year, Director, Score) VALUES (106, 'No Time to Die', 2021, 106, 7.6)
    INTO MOVIES (Id, Title, Year, Director, Score) VALUES (107, 'Black Panther: Wakanda Forever', 2022, 107, 7.4)
    INTO MOVIES (Id, Title, Year, Director, Score) VALUES (108, 'Avatar: The Way of Water', 2022, 108, 7.8)
    INTO MOVIES (Id, Title, Year, Director, Score) VALUES (109, 'Don''t Look Up', 2021, 109, 7.2)
    INTO MOVIES (Id, Title, Year, Director, Score) VALUES (110, 'The French Dispatch', 2021, 110, 7.5)
SELECT 1 FROM DUAL;

SELECT*
FROM MOVIES;

--Q9

INSERT ALL
    INTO ACTORS (actorid, Act_firstName, Act_lastName) VALUES (2001, 'Timothée', 'Chalamet')
    INTO ACTORS (actorid, Act_firstName, Act_lastName) VALUES (2002, 'Tom', 'Holland')
    INTO ACTORS (actorid, Act_firstName, Act_lastName) VALUES (2003, 'Robert', 'Pattinson')
    INTO ACTORS (actorid, Act_firstName, Act_lastName) VALUES (2004, 'Michelle', 'Yeoh')
    INTO ACTORS (actorid, Act_firstName, Act_lastName) VALUES (2005, 'Tom', 'Cruise')
    INTO ACTORS (actorid, Act_firstName, Act_lastName) VALUES (2006, 'Daniel', 'Craig')
    INTO ACTORS (actorid, Act_firstName, Act_lastName) VALUES (2007, 'Letitia', 'Wright')
    INTO ACTORS (actorid, Act_firstName, Act_lastName) VALUES (2008, 'Sam', 'Worthington')
    INTO ACTORS (actorid, Act_firstName, Act_lastName) VALUES (2009, 'Leonardo', 'DiCaprio')
    INTO ACTORS (actorid, Act_firstName, Act_lastName) VALUES (2010, 'Bill', 'Murray')
SELECT * FROM DUAL;

SELECT *
FROM ACTORS;

--Q10
INSERT ALL
    INTO CASTINGS (movieid, actorid) VALUES (101, 2001)
    INTO CASTINGS (movieid, actorid) VALUES (102, 2002)
    INTO CASTINGS (movieid, actorid) VALUES (103, 2003)
    INTO CASTINGS (movieid, actorid) VALUES (104, 2004)
    INTO CASTINGS (movieid, actorid) VALUES (105, 2005)
    INTO CASTINGS (movieid, actorid) VALUES (106, 2006)
    INTO CASTINGS (movieid, actorid) VALUES (107, 2007)
    INTO CASTINGS (movieid, actorid) VALUES (108, 2008)
    INTO CASTINGS (movieid, actorid) VALUES (109, 2009)
    INTO CASTINGS (movieid, actorid) VALUES (110, 2010)

SELECT 1 FROM DUAL;

SELECT * FROM CASTINGS;

--Q11
ALTER TABLE ACTORS
ADD last_update DATE;

SELECT SYSDATE FROM DUAL;

UPDATE ACTORS
SET last_update = SYSDATE;

SELECT * FROM ACTORS;

--Q12

DROP TABLE Mov_Dir_Actor;

CREATE TABLE Mov_Dir_Actor (
    movie_title VARCHAR(255),
    actor_firstName VARCHAR(255),
    actor_lastName VARCHAR(255),
    director_firstName VARCHAR(255),
    director_lastName VARCHAR(255)
);

INSERT INTO Mov_Dir_Actor (movie_title, actor_firstName, actor_lastName, director_firstName, director_lastName)
SELECT M.TITLE, A.Act_firstName, A.Act_lastName, D.Dir_firstName, D.Dir_lastName
FROM MOVIES M
JOIN CASTINGS C ON C.movieid = M.id
JOIN ACTORS A ON A.actorid = C.actorid
JOIN DIRECTORS D ON D.directorid = M.director
WHERE M.id IN (102, 103, 107)
  AND C.actorid IN (2002, 2003, 2007)
  AND M.director IN (102, 103, 107);

SELECT * FROM Mov_Dir_Actor;

--Q13
CREATE TABLE officecopy AS
SELECT *
FROM retailoffices
WHERE 1=2;


--Q14
ALTER TABLE officecopy
ADD (
    ranking INT NULL
);

--Q15

INSERT INTO officecopy(officecode, city, phone, addressline1, addressline2, state, country, postalcode, territory, ranking)
SELECT r.officecode, r.city, r.phone, r.addressline1, r.addressline2, r.state, r.country, r.postalcode, r.territory, 0
FROM retailoffices r;

SELECT * FROM OFFICECOPY;

--Q16

UPDATE OFFICECOPY
SET ranking = NULL;

ALTER TABLE officecopy
ADD CONSTRAINT ck_ranking CHECK (ranking BETWEEN 1 AND 10);


--Q17
ALTER TABLE officecopy
RENAME COLUMN addressline1 TO "Apt/Suite/Unit";

--Q18
ALTER TABLE officecopy RENAME TO "retail-offices-2";

--Q19
DELETE FROM officecopy; -- this is not working and error prompts

DELETE FROM "retail-offices-2";

SELECT * FROM "retail-offices-2";

--Q20
DROP TABLE "retail-offices-2";