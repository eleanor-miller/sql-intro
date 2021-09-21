CREATE TABLE "Departments" (
  "ID"					      SERIAL Primary Key, 
  "DepartmentName"		TEXT NOT NULL,
  "Building"			    TEXT
  );
  
ALTER TABLE "Employees" ADD COLUMN "DepartmentID" INTEGER NULL REFERENCES "Departments" ("ID");

CREATE TABLE "Products" (
  "ID"					      SERIAL Primary Key,
  "Price"				      NUMERIC, 
  "Name"				      TEXT,
  "Description"			  TEXT,
  "QuantityInStock"		INTEGER
  );
  
CREATE TABLE "Orders" (
  "ID"					      SERIAL Primary Key,
  "OrderNumber"			  TEXT, 
  "DatePlaced"			  DATE,
  "Email"				      TEXT
  );
  
CREATE TABLE "ProductOrders" (
  "ID"					      SERIAL Primary Key, 
  "ProductID"			    INTEGER NULL REFERENCES "Products" ("ID"),
  "OrderID"				    INTEGER NULL REFERENCES "Orders" ("ID"),
  "OrderQuantity"		  INTEGER
  );
  
INSERT INTO "Departments" ("DepartmentName", "Building")
VALUES 
    ('Development', 'Main'), 
    ('Marketing', 'North');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentID") 
VALUES 
	  ('Tim Smith', 40000, 'Programmer', '123', false, 1),
    ('Barbara Ramsey', 80000, 'Manager', '234', false, 1),
    ('Tom Jones', 32000, 'Admin', '456', true, 2);
    
-- TRUNCATE TABLE "Employees";

INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
VALUES 
	  (12.45, 'Widget', 'The Orignial Widget', 100),
    (99.99, 'Flowbee', 'Perfect for haircuts', 3);
    

-- Try to correct the date/time with the time 4:55 PM
INSERT INTO "Orders" ("OrderNumber", "DatePlaced", "Email")
VALUES
	  ('X529', TO_DATE('01/01/2020', 'DD/MM/YYYY'), 'person@example.com');
    
INSERT INTO "ProductOrders" ("ProductID", "OrderID", "OrderQuantity")
VALUES
	  (1, 1, 3);
    
INSERT INTO "ProductOrders" ("ProductID", "OrderID", "OrderQuantity")
VALUES
	  (2, 1, 2);
    
SELECT * FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentID" = "Departments"."ID";
WHERE "Building" = 'Main';

SELECT * FROM "Orders"
JOIN "ProductOrders" ON "Orders"."ID" = "ProductOrders"."OrderID"
WHERE "ProductID" = 2;

SELECT * FROM "Products"
JOIN "ProductOrders" ON "Products"."ID" = "ProductOrders"."ProductID"
WHERE "Name" = 'Flowbee';