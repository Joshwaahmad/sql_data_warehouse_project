/*
Create Database and Schemas
............................
This script creates a new database named DataWarehouse, checking if it already exists.
If it exists, it will delete it and recreate a new one.
Warning
..............
Running this script will delete the entire DataWarehouse database if it exists.
All the data in the database will be deleted.
Could you create a backup before doing it?

*/
USE master;
GO
IF EXIST (SELECT 1 FROM sys.database WHERE name = 'DataWarehouse')
BEGIN
ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE DataWarehouse;
END;
GO
--.................................................................. 
--Create database  
CREATE DATABASE DataWarehouse;
GO
  
USE DataWarehouse;
GO
--Create schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
