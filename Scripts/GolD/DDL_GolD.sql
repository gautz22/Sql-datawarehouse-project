/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
--===============================================================================
*/
-- =============================================================================
-- Create Dimension: gold.dim_customers
-- =============================================================================
IF OBJECT_ID('GolD.dim_customers' , 'V') IS NOT NULL
		DROP VIEW GolD.dim_customers
GO
CREATE VIEW GolD.dim_customers AS
SELECT
	ci.cst_id			AS customer_id,
	ci.cst_key			AS customer_key,
	ci.cst_firstname	AS first_name,
	ci.cst_lastname		AS last_name,
	cl.cntry			AS country,
	cg.gen				AS Gender,
	cg.bdate			AS birth_date,
	ci.cst_marital_status AS Maritial_status,
	ci.cst_create_date  AS Creation_date

FROM SilveR.crm_cust_info CI
LEFT JOIN SilveR.erp_loc_a101 CL
ON CI.cst_key = CL.cid
LEFT JOIN SilveR.erp_cus_az12 CG
ON CI.cst_key = CG.cid

GO
-- =============================================================================
-- Create Dimension: gold.dim_products
-- =============================================================================

IF OBJECT_ID('GolD.dim_products', 'V') IS NOT NULL
    DROP VIEW GolD.dim_products;
go
    CREATE VIEW GolD.dim_products as
SELECT
    ROW_NUMBER() OVER (ORDER BY pn.prd_start_dt, pn.prd_key) AS product_key, -- Surrogate key
    pn.prd_id       AS product_id,
    pn.prd_key      AS product_number,
    pn.prd_nm       AS product_name,
    pn.cat_id       AS category_id,
    pc.cat          AS category,
    pc.subcat       AS subcategory,
    pc.maintenance  AS maintenance,
    pn.prd_cost     AS cost,
    pn.prd_line     AS product_line,
    pn.prd_start_dt AS start_date
FROM silver.crm_prd_info pn
LEFT JOIN silver.erp_cat_g1v2 pc
    ON pn.cat_id = pc.id
WHERE pn.prd_end_dt IS NULL; -- Filter out all historical data
GO

-- =============================================================================
-- Create Dimension: gold.fact_sales
-- =============================================================================

IF OBJECT_ID('GolD.fact_sales', 'V') IS NOT NULL
    DROP VIEW GolD.fact_sales;
GO

CREATE VIEW GolD.fact_sales AS
SELECT
    sd.sls_ord_num  AS order_number,
    pr.product_key  AS product_key,
    cu.customer_key AS customer_key,
    sd.sls_order_dt AS order_date,
    sd.sls_ship_dt  AS shipping_date,
    sd.sls_due_dt   AS due_date,
    sd.sls_sales    AS sales_amount,
    sd.sls_quantity AS quantity,
    sd.sls_price    AS price
FROM silver.crm_sales_details sd
LEFT JOIN GolD.dim_products pr
    ON sd.sls_prd_key = pr.product_number
LEFT JOIN GolD.dim_customers cu
    ON sd.sls_cust_id = cu.customer_id;
GO



