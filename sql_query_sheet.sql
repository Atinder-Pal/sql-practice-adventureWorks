-- Query 1-----------------
SELECT CONCAT(contact.FirstName,' ', contact.LastName)AS EmployeeName
FROM `contact` 
WHERE contact.ContactID IN(SELECT employee.ContactID FROM `employee` WHERE VacationHours = (SELECT MAX(VacationHours) FROM employee));
-- ----------------------------