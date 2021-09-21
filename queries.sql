-- E X P L O R E R  M O D E

-- Create database and table
CREATE TABLE "Employees" (
	"ID" 				      SERIAL Primary Key,
  "FullName" 		    TEXT NOT NULL,
	"Salary"			    NUMERIC,
	"JobPosition"	    TEXT,
	"PhoneExtension"  TEXT,
	"IsPartTime"		  BOOL
);

-- Used to delete made-up data in the table and follow homework needs
TRUNCATE TABLE "Employees";

-- Create employees
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") 
VALUES 
	('Martin Cordero', 1337, 'Software Dev', '7', false),
  ('Kelly Dobson', 27, 'Director', '12', true),
  ('Eleanor Miller', 525600, 'Head Honcho', '42', true),
	('Gordon Ramsay', 666, 'Cook', '1', false),
 	('Tana Ramsay', 999, 'Cook', '2', false),
  ('John Doe', 4587, 'Assistant Coroner', '123', true),
  ('Jane Doe', 4892, 'Coroner', '456', false),
  ('Mister Ed', 250, 'Talking Horse', '3', true),
  ('Link Link', 79345, 'Legendary Hero', '2', false),
	('Lazy Larry', 2000000, 'Profession Sitter', '0', true);
    
-- Select all columns for all employees
SELECT * FROM "Employees";

-- Select only the full names and phone extensions for only full-time employees
SELECT ("FullName", "PhoneExtension") FROM "Employees" WHERE "IsPartTime" = false;

-- Insert a new part-time employee, as a software developer, with a salary of 450
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Gavin', 450, 'Software Dev', '11', true);

-- Update all employees that are cooks to have a salary of 500
UPDATE "Employees" SET "Salary" = 500 WHERE "JobPosition" = 'Cook';

-- Delete all employees that have the full name of "Lazy Larry"
DELETE FROM "Employees" WHERE "FullName" = 'Lazy Larry';

-- Add a column to the table: ParkingSpot as textual information that can store up to 10 characters
ALTER TABLE "Employees" ADD COLUMN "ParkingSpot" VARCHAR(10);

-- Added Gavin's last name for continuity
UPDATE "Employees" SET "FullName" = 'Gavin Stark' WHERE "FullName" = 'Gavin';

-- A D V E N T U R E  M O D E

-- Use NOT NULL for columns you feel are required (created with table: "FullName")
-- Add a primary key named ID to your table (created with table: "ID" SERIAL Primary Key)

-- E P I C  M O D E

-- Create a second table: Departments that has columns; "Name" and "BuildingNumber"
CREATE TABLE "Departments" (
	"Name" 				    TEXT,
 	"BuildingNumber"  TEXT
);

-- Create a column on the Employees table named "DepartmentID" to relate to the "Departments" table. Make it a foreign key.

 ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INT NULL REFERENCES "Departments" ("Id");

 UPDATE "Employees" SET "DepartmentId" = 1 WHERE "ID" IN (41, 42, 43, 51);
 UPDATE "Employees" SET "DepartmentId" = 3 WHERE "ID" IN (44, 45);
 UPDATE "Employees" SET "DepartmentId" = 2 WHERE "ID" IN (46, 47);
 UPDATE "Employees" SET "DepartmentId" = 4 WHERE "ID" IN (48);
 UPDATE "Employees" SET "DepartmentId" = 5 WHERE "ID" IN (49);

 SELECT *
 FROM "Employees"
 JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id";