/*
Truncate the table : empty the table,
load your data
select the table.

This is not very expensive as it just refresh and update the table from the data source

note: to execute the page you have to run the procedure function in the procedure page ==== refresh_bronze_tables()
*/
	CREATE OR REPLACE PROCEDURE refresh_bronze_tables()
	LANGUAGE plpgsql
	AS $$
	
	DECLARE
	    start_time TIMESTAMP;
	    end_time TIMESTAMP;
		
	BEGIN
	    -- Capture start time
	    start_time := now();
	
	    -- Logging
	    RAISE NOTICE '========================';
	    RAISE NOTICE 'Loading bronze layer';
	    RAISE NOTICE '========================';
	
	    -- First Table: crm_cust_info
		
	    RAISE NOTICE 'Loading bronze layer';
	    RAISE NOTICE '_________________________';
		
	    RAISE NOTICE 'Loading bronze.crm_cust_info';
		
	    TRUNCATE TABLE bronze.crm_cust_info;
		
	    COPY bronze.crm_cust_info
	    FROM 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PostgreSQL 17\data\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	    WITH (FORMAT csv, HEADER true);
	
	    -- Second Table: crm_prd_info
		
	    RAISE NOTICE 'Loading bronze.crm_prd_info';
		
	    TRUNCATE TABLE bronze.crm_prd_info;
		
	    COPY bronze.crm_prd_info
	    FROM 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PostgreSQL 17\data\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	    WITH (FORMAT csv, HEADER true);
	
	    -- Third Table: crm_sales_details
		
	    RAISE NOTICE 'Loading bronze.crm_sales_details';
		
	    TRUNCATE TABLE bronze.crm_sales_details;
		
	    COPY bronze.crm_sales_details
	    FROM 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PostgreSQL 17\data\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	    WITH (FORMAT csv, HEADER true);
	
	    -- Fourth Table: erp_cust_az12
	    RAISE NOTICE 'Loading erp layer';
	    RAISE NOTICE '_______________________';
		
	    RAISE NOTICE 'Loading bronze.erp_cust_az12';
		
	    TRUNCATE TABLE bronze.erp_cust_az12;
		
	    COPY bronze.erp_cust_az12
	    FROM 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PostgreSQL 17\data\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	    WITH (FORMAT csv, HEADER true);
	
	    -- Fifth Table: erp_loc_a101
	    RAISE NOTICE 'Loading bronze.erp_loc_a101';
		
	    TRUNCATE TABLE bronze.erp_loc_a101;
		
	    COPY bronze.erp_loc_a101
	    FROM 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PostgreSQL 17\data\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	    WITH (FORMAT csv, HEADER true);
	
	    -- Sixth Table: erp_px_cat_g1v2
	    RAISE NOTICE 'Loading bronze.erp_px_cat_g1v2';
		
	    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		
	    COPY bronze.erp_px_cat_g1v2
	    FROM 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PostgreSQL 17\data\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	    WITH (FORMAT csv, HEADER true);
	
	    -- Capture end time
	    end_time := now();
	
	    -- Logging completion time
	    RAISE NOTICE 'All tables truncated and reloaded successfully!';
		
	    RAISE NOTICE 'Execution Time: % seconds', EXTRACT(EPOCH FROM (end_time - start_time));
	END;
	$$;
	
	
	

