-- Second SQL Exercise
/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT Products.Name AS 'Product',  Categories.Name AS 'Category'
FROM Products
JOIN Categories ON Products.ProductID = Categories.CategoryID;
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT Products.Name, Products.Price, Reviews.Rating 
 FROM Products 
 INNER JOIN Reviews 
 ON Reviews.ProductID = Products.ProductID
 WHERE Reviews.Rating = '5'
 ORDER BY Price ASC;
 /* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT Employees.FirstName, SUM(Sales.Quantity) AS Total
FROM Sales
INNER JOIN employees
ON Employees.EmployeeID = Sales.EmployeeID
GROUP BY Employees.EmployeeID
ORDER BY Total ASC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT Departments.Name AS 'Department', Categories.Name AS 'Category'
FROM Departments
LEFT JOIN Categories
 ON Categories.DepartmentID = Departments.DepartmentID
WHERE Categories.Name = 'Appliances' OR Categories.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT P.Name, SUM(S.Quantity) AS 'Total Sold',
SUM(S.Quantity * S.PricePerUnit) AS 'Total Price'
From Products AS P
INNER JOIN Sales AS S ON S.ProductID = P.ProductID
WHERE P.ProductID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT P.Name, R.Reviewer, R.Rating, R.Comment
From Products AS P
INNER JOIN Reviews AS R ON R.ProductID = P.ProductID
Where P.ProductID = 857 AND R.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT E.EmployeeID, E.FirstName, E.LastName, P.Name, Sum(S.Quantity) AS 'Total Sold'
From Sales AS S
INNER JOIN Employees AS E ON E.EmployeeID = S.EmployeeID
INNER JOIN Products AS P ON P.ProductID = S.ProductID
Group BY E.EmployeeID, P.ProductID
ORDER BY EmployeeID;