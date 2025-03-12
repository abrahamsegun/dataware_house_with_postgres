/*
========
DON'T RUN THIS CODE, IT CREATES AND DELETE EXISTING TABLES .
DONT RUN
DONT RUN
DONT RUN


========
DROP TABLE IF EXISTS bronze.crm_cust_info
======== Dont run this code only if needed if is expensive 
THis code create customer information id they exist alreadty 
For the Marital_status 
S- single, M- Married, D- Divorced, W-Widowed
*/

DROP TABLE IF EXISTS bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info (
    cst_id INT, 
    cst_key VARCHAR(50), 
    cst_firstname VARCHAR(50), 
    cst_lastname VARCHAR(50) ,
    cst_marital_status VARCHAR(15) ,
    cst_gndr CHAR(10) ,  
    cst_create_date DATE 

);

DROP TABLE IF EXISTS bronze.crm_prd_info;

CREATE TABLE bronze.crm_prd_info (
    prd_id INT,
	prd_key VARCHAR(50),
    prd_nm VARCHAR(50), 
    prd_cost DECIMAL(10,2),
    prd_line VARCHAR(3), 
    prd_start_dt DATE,  
    prd_end_dt DATE  
);

DROP TABLE IF EXISTS bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num VARCHAR(50), 
    sls_prd_key VARCHAR(50), 
    sls_cust_id BIGINT,
    sls_order_dt varchar(50), 
    sls_ship_dt DATE,  
    sls_due_dt DATE,
	sls_sales int,
	sls_quantity int, 
	sls_price DECIMAL(10,2)
	
);

DROP TABLE IF EXISTS bronze.erp_CUST_AZ12;

CREATE TABLE bronze.erp_CUST_AZ12 (
    CID VARCHAR(30) , 
    BDATE DATE ,
	GEN VARCHAR(10) 
);


DROP TABLE IF EXISTS bronze.erp_LOC_A101;

CREATE TABLE bronze.erp_LOC_A101 (
    CID VARCHAR(30), 
    CNTRY VARCHAR(50)
);

DROP TABLE IF EXISTS bronze.erp_PX_CAT_G1V2;

CREATE TABLE bronze.erp_PX_CAT_G1V2 (
    ID VARCHAR(10), 
    CAT VARCHAR(50),
	SUBCAT VARCHAR(50),
	MAINTENANCE VARCHAR(10)
);


select * from bronze.crm_cust_info;

/* 
LIST OF ALL TABLE UNDER BRONZE
*/
-- SELECT table_name 
-- FROM information_schema.tables 
-- WHERE table_schema = 'bronze';

/* 
ALL TABLE UNDER BRONZE INFO
*/

SELECT table_name, column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_schema = 'bronze'
ORDER BY table_name, ordinal_position;
