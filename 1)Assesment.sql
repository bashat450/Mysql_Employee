CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Employee (
	Employee_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);
SELECT * FROM Employee;
INSERT INTO Employee 
	(Employee_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	Employee_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (Employee_REF_ID)
		REFERENCES Worker(Employee_ID)
        ON DELETE CASCADE
);
SELECT * FROM Bonus;
INSERT INTO Bonus 
	(Employee_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
CREATE TABLE Title (
	Employee_REF_ID INT,
	Employee_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (Employee_REF_ID)
		REFERENCES Employee(Employee_ID)
        ON DELETE CASCADE
);
SELECT * FROM Title;
INSERT INTO Title 
	(Employee_REF_ID, Employee_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
-- Q-1. Write an SQL query to fetch “FIRST_NAME” from  Employee table using the alias name as <EMPLOYEE_NAME>.
Select FIRST_NAME AS EMPLOYEE_NAME from Employee;    
    
-- Q-2. Write an SQL query to fetch “FIRST_NAME” from  EMPLOYEE table in upper case.
SELECT UPPER(FIRST_NAME) 
   FROM Employee;
   
-- Q-3. Write an SQL query to fetch unique values of  DEPARTMENT from EMPLOYEE table. 
SELECT DISTINCT DEPARTMENT 
	FROM Employee;
    
-- Q-4. Write an SQL query to print the first three characters  of FIRST_NAME from EMPLOYEE table.
SELECT SUBSTRING(FIRST_NAME,1,3) 
     FROM Employee;
     
-- Q-5. Write an SQL query to find the position of the  alphabet (‘a’) in the first name column ‘Amitabh’ from  EMPLOYEE table.
SELECT INSTR(FIRST_NAME, BINARY'a') from Employee where FIRST_NAME = 'Amitabh';   

-- Q-6. Write an SQL query to print the FIRST_NAME from  EMPLOYEE table after removing white spaces from the right side.
Select RTRIM(FIRST_NAME) from Employee;  
-- Q-7. Write an SQL query to print the DEPARTMENT from  EMPLOYEE table after removing white spaces from the  left side.
Select LTRIM(DEPARTMENT) from Employee;    

-- Q-8. Write an SQL query that fetches the unique values of  DEPARTMENT from EMPLOYEE table and prints its  length.
Select distinct length(DEPARTMENT) from Employee;

-- Q-9. Write an SQL query to print the FIRST_NAME from  EMPLOYEE table after replacing ‘a’ with ‘A’. 
Select REPLACE(FIRST_NAME,'a','A') from Employee;

-- Q-10. Write an SQL query to print the FIRST_NAME and  LAST_NAME from EMPLOYEE table into a single column COMPLETE_NAME. A space char should separate them.
Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' from Employee;

-- Q-11. Write an SQL query to print all EMPLOYEE details  from the EMPLOYEE table order by FIRST_NAME  Ascending.
Select * from Employee order by FIRST_NAME asc;

-- Q-12. Write an SQL query to print all EMPLOYEE details  from the EMPLOYEE table order by FIRST_NAME  Ascending and DEPARTMENT Descending.
Select * from Employee order by FIRST_NAME asc,DEPARTMENT desc;

-- Q-13. Write an SQL query to print details for EMPLOYEEs  with the first name as “Vipul” and “Satish” from  EMPLOYEE table.
Select * from Employee where FIRST_NAME in ('Vipul','Satish');

-- Q-14. Write an SQL query to print details of EMPLOYEEs  excluding first names, “Vipul” and “Satish” from  EMPLOYEE table.
Select * from Employee where FIRST_NAME not in ('Vipul','Satish');

-- Q-15. Write an SQL query to print details of EMPLOYEEs  with DEPARTMENT name as “Admin”.
Select * from Employee where DEPARTMENT like 'Admin%';

-- Q-16. Write an SQL query to print details of the  EMPLOYEEs whose FIRST_NAME contains ‘a’.
Select * from Employee where FIRST_NAME like '%a%';

-- Q-17. Write an SQL query to print details of the  EMPLOYEEs whose FIRST_NAME ends with ‘a’.
Select * from Employee where FIRST_NAME like '%a';

-- Q-18. Write an SQL query to print details of the  EMPLOYEEs whose FIRST_NAME ends with ‘h’ and  contains six alphabets.
Select * from Employee where FIRST_NAME like '_____h';

-- Q-19. Write an SQL query to print details of the  EMPLOYEEs whose SALARY lies between 100000 and  500000.
Select * from Employee where SALARY between 100000 and 500000;

-- Q-20. Write an SQL query to print details of the  EMPLOYEEs who have joined in Feb’2014.
Select * from Employee where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;

  
    