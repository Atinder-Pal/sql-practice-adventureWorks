-- Query 1-----------------
SELECT CONCAT(contact.FirstName,' ', contact.LastName)AS EmployeeName
FROM `contact` 
WHERE contact.ContactID IN(SELECT employee.ContactID FROM `employee` WHERE VacationHours = (SELECT MAX(VacationHours) FROM employee));
--Query1 Alternative --------------------------------
SELECT CONCAT(contact.FirstName,' ', contact.LastName)AS EmployeeName
FROM employee
INNER JOIN contact USING (ContactID)
WHERE contact.ContactID IN(SELECT employee.ContactID FROM `employee` WHERE VacationHours = (SELECT MAX(VacationHours) FROM employee));
-- ----------------------------------------------------
--Query1 Alternative --------------------------------
SELECT CONCAT(contact.FirstName,' ', contact.LastName)AS EmployeeName
FROM contact
INNER JOIN employee USING (ContactID)
WHERE contact.ContactID IN(SELECT employee.ContactID FROM `employee` WHERE VacationHours = (SELECT MAX(VacationHours) FROM employee));
-- ----------------------------------------------------