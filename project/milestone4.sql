-- -- Milestone 4:

-- -- Complete the SELECT, JOIN,VIEW commands for the 2 tables selected 
-- from the ERD in Teams Group number channel before June 16th , 11:59 pm 

-- Milestone 4:
-- Each team member in the group should use the same 2 tables selected from the ERD.
-- Combined work of reports in one Word file in the Group Teams channel.


-- Complete the SELECT,JOIN,VIEW commands for the 2 tables selected from the ERD in Teams Group
-- number channel before June 16th , 11:59 pm


-- Group File submission: SELECT, JOIN, VIEWS
-- 1. Group SQL REPORT Word document (Groupnumber_GROUPSQL_REPORT.docx) Combine all your
-- creation and insert scripts from your team members and create reports with your table and other team
-- members’ table.
--  The submission will be a single MS Word document submitted through blackboard. This will
-- include the name of team members and a list of who made which table.

--  Specify at least 6 SELECT reports with a combination of team members tables. (6 simple SQL
-- queries with WHERE clause, aliases and screen shot of results)- Each team member will have
-- one SELECT query from each of their table.

--  3 JOIN query reports chosen from different team members with sorting and aliases for selected
-- columns and a where clause with 2 conditions with String and Integer data type columns. Each
-- team member will have one JOIN query from their tables.



-- Select for Sin Kau's own table
SELECT* FROM MEDICATIONS
WHERE REFILLS >= 2
ORDER BY REFILLS DESC, MEDICATIONID ASC;

-- Select for other's table by Sin Kau
SELECT* FROM HEALTHRECORDS
WHERE PETID IN (20110,20111,20112,20113,20114,20115,20120)
ORDER BY HEALTHRECORDID ASC;

-- Join for Sin Kau's own Healthrecords table with other's Pets TABLER
SELECT hr.HEALTHRECORDID, hr.PETID, hr.DIAGNOSIS, hr.TREATMENT
FROM HEALTHRECORDS hr
JOIN PETS p ON hr.PETID = p.PETID
WHERE hr.HEALTHRECORDID <= 100016
AND hr.DIAGNOSIS LIKE 'P%'
ORDER BY hr.HEALTHRECORDID ASC;

--  3 VIEW query chosen from different team members with sorting and aliases for selected
-- columns and a where clause with 2 conditions with String and Integer data type columns. Each
-- team member will have one VIEW query from their tables.

DROP VIEW vwVETS_DIAGNOSIS;

--Create view for Sin Kau's table and join to other's VETS table
CREATE VIEW vwVETS_DIAGNOSIS AS
SELECT v.VETID, v.FIRSTNAME || ' ' || v.LASTNAME AS VETSNASME, hr.HEALTHRECORDID, hr.PETID, hr.DIAGNOSIS, hr.TREATMENT
FROM HEALTHRECORDS hr
JOIN VETS v ON hr.VETID = v.VETID
WHERE hr.HEALTHRECORDID <= 100016
AND
hr.NOTES LIKE 'R%'
ORDER BY v.VETID ASC;

SELECT* FROM vwVETS_DIAGNOSIS;


SELECT re1.FIRSTNAME AS employeeName, re2.FIRSTNAME AS managerNAme, ro.
FROM retailemployees re1 
LEFT JOIN retailemployees re2 ON re1.reportsto = re2.employeenumber
LEFT JOIN retailoffices ro ON re1.officecode = ro.officecode
LEFT JOIN retailoffices ro ON re2.officecode = ro.officecode
WHERE ro.country = 'USA' OR ro.country = 'UK';



