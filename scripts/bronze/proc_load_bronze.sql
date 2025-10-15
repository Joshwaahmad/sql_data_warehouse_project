/*
===========================================================
Stored Procedure: Load bronze layer(source -> Bronze)
===========================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
   DECLARE @start_time DATETIME , @end_time DATETIME;
   BEGIN TRY
		PRINT '============================';
		PRINT 'Loading the bronze layer';
		PRINT '============================';

		PRINT'-----------------------------';
		PRINT'Loading CRM Tables';
		PRINT'-----------------------------';
		SET @start_time = GETDATE();	
			TRUNCATE TABLE bronze.crm_cust_info 

			BULK INSERT bronze.crm_cust_info
			FROM 'C:\SQL\csv-files\bronze.crm_cust_info.csv'
			WITH (
				  FIRSTROW = 2,
				  FIELDTERMINATOR = ',',
				  TABLOCK 
			);

			SELECT * FROM bronze.crm_cust_info
			SELECT COUNT(*) FROM bronze.crm_cust_info
			SET @end_time = GETDATE();
			PRINT '>>Load Duration;' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

			TRUNCATE TABLE bronze.crm_prd_info 
			BULK INSERT bronze.crm_prd_info
			FROM 'C:\SQL\csv-files\bronze.crm_prd_info.csv'
			WITH (
				  FIRSTROW = 2,
				  FIELDTERMINATOR = ',',
				  TABLOCK 
			);

			SELECT * FROM bronze.crm_prd_info
			SELECT COUNT(*) FROM bronze.crm_prd_info

			TRUNCATE TABLE bronze.crm_sales_details 
			BULK INSERT bronze.crm_sales_details
			FROM 'C:\SQL\csv-files\bronze.crm_sales_details.csv'
			WITH (
				  FIRSTROW = 2,
				  FIELDTERMINATOR = ',',
				  TABLOCK 
			);

			SELECT * FROM bronze.crm_sales_details
			SELECT COUNT(*) FROM bronze.crm_sales_details

			TRUNCATE TABLE bronze.crm_sales_details 
			BULK INSERT bronze.crm_sales_details
			FROM 'C:\SQL\csv-files\bronze.crm_sales_details.csv'
			WITH (
				  FIRSTROW = 2,
				  FIELDTERMINATOR = ',',
				  TABLOCK 
			);

			SELECT * FROM bronze.crm_sales_details
			SELECT COUNT(*) FROM bronze.crm_sales_details

			TRUNCATE TABLE bronze.erp_loc_a101 
			BULK INSERT bronze.erp_loc_a101
			FROM 'C:\SQL\csv-files\bronze.erp_loc_a101.csv'
			WITH (
				  FIRSTROW = 2,
				  FIELDTERMINATOR = ',',
				  TABLOCK 
			);
		PRINT'-----------------------------';
		PRINT'Loading ERP Tables';
		PRINT'-----------------------------';

			SELECT * FROM bronze.erp_loc_a101
			SELECT COUNT(*) FROM bronze.erp_loc_a101

			TRUNCATE TABLE bronze.erp_cust_az12 
			BULK INSERT bronze.erp_cust_az12
			FROM 'C:\SQL\csv-files\bronze.erp_cust_az12.csv'
			WITH (
				  FIRSTROW = 2,
				  FIELDTERMINATOR = ',',
				  TABLOCK 
			);

			SELECT * FROM bronze.erp_cust_az12
			SELECT COUNT(*) FROM bronze.erp_cust_az12

			TRUNCATE TABLE bronze.erp_px_cat_g1v2 
			BULK INSERT bronze.erp_px_cat_g1v2
			FROM 'C:\SQL\csv-files\bronze.erp_px_cat_g1v2.csv'
			WITH (
				  FIRSTROW = 2,
				  FIELDTERMINATOR = ',',
				  TABLOCK 
			);

			SELECT * FROM bronze.erp_px_cat_g1v2
			SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2
   END TRY
   BEGIN CATCH
   PRINT '============================ '
   PRINT 'Error occured during loading '
   PRINT '============================ '
   END CATCH
END 
