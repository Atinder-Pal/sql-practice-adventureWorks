-- Query 1-----------------
SELECT CONCAT(COALESCE(contact.Title,''),contact.FirstName,' ',COALESCE(contact.Title,''),' ', contact.LastName)AS EmployeeName
FROM `contact` 
WHERE contact.ContactID IN(SELECT employee.ContactID FROM `employee` WHERE VacationHours = (SELECT MAX(VacationHours) FROM employee));
--Query1 Alternative --------------------------------
-- Thanks to Amr Fouad for suggesting to use COALESCE(columnName,'') on Slack to display values where Title IS NULL
SELECT CONCAT(COALESCE(contact.Title,''),contact.FirstName,' ',COALESCE(contact.Title,''),' ', contact.LastName)AS EmployeeName
FROM employee
INNER JOIN contact USING (ContactID)
WHERE contact.ContactID IN(SELECT employee.ContactID FROM `employee` WHERE VacationHours = (SELECT MAX(VacationHours) FROM employee));
-- ----------------------------------------------------
--Query1 Alternative --------------------------------
-- Thanks to Zhen Li for suggesting to use IFNULL(columnName,'') on Slack to display values where Title IS NULL
SELECT CONCAT(IFNULL(contact.Title,''),contact.FirstName,' ',COALESCE(contact.Title,''),' ', contact.LastName)AS EmployeeName
FROM contact
INNER JOIN employee USING (ContactID)
WHERE contact.ContactID IN(SELECT employee.ContactID FROM `employee` WHERE VacationHours = (SELECT MAX(VacationHours) FROM employee));
-- ----------------------------------------------------

-- Query2----------------------------------------------
SELECT COUNT(*)
FROM contact 
INNER JOIN employee USING (ContactID)
WHERE FirstName LIKE 's%';
-- -----------------------------------------------------

-- Query3-----------------------------------------------
SELECT Rate 
FROM `employeepayhistory`
INNER JOIN employee USING (EmployeeID)
WHERE Title = 'Chief Executive Officer';
-- -----------------------------------------------------
-- Query4-----------------------------------------------
SELECT Count(EmployeeID), department.Name
FROM `employeedepartmenthistory` 
RIGHT JOIN department USING (DepartmentID)
GROUP BY DepartmentID
ORDER BY department.Name;
-- ------------------------------------------------------

-- Challenge1--------------------------------------------
-- Citation
-- https://www.w3schools.com/sql/func_sqlserver_right.asp
-- Above surce mentions how to extract last character from a string(starting from right)
-- ------------------------------------------------------
-- Citation
-- https://stackoverflow.com/questions/28749911/query-select-group-by-last-character-in-field
-- Above source shows how to group rows based on last char of a columnValue
-- End Citation
SELECT RIGHT(LoginID,1) as LoginIDEndDigit, Count(*) as Count
FROM employee
Group by RIGHT(LoginID,1)
Order by RIGHT(LoginID,1);
-- ------------------------------------------------------