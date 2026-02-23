DATA WAREHOUSE AND ANALYTICS PROJECT
Welcome to the Data Warehouse and Analytics Project repository! 🚀
This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

---
🏗️ PROJECT ARCHITECTURE
The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers:

<img width="1584" height="1056" alt="Screenshot 2026-02-23 235541" src="https://github.com/user-attachments/assets/f91cc9bc-e315-4a51-8ad7-ebfcca1dddff" />


1. BROZE LAYER: Bronze Layer: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. Silver Layer: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. Gold Layer: Houses business-ready data modeled into a star schema required for reporting and analytics.

---
📖 Project Overview
This project involves:

Data Architecture: Designing a Modern Data Warehouse Using Medallion Architecture Bronze, Silver, and Gold layers.
ETL Pipelines: Extracting, transforming, and loading data from source systems into the warehouse.
Data Modeling: Developing fact and dimension tables optimized for analytical queries.
Analytics & Reporting: Creating SQL-based reports and dashboards for actionable insights.

---
🚀 Project Requirements
Building the Data Warehouse (Data Engineering)
Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

Specifications
Data Sources: Import data from two source systems (ERP and CRM) provided as CSV files.
Data Quality: Cleanse and resolve data quality issues prior to analysis.
Integration: Combine both sources into a single, user-friendly data model designed for analytical queries.
Scope: Focus on the latest dataset only; historization of data is not required.
Documentation: Provide clear documentation of the data model to support both business stakeholders and analytics teams.
---
%3CmxGraphModel%3E%3Croot%3E%3CmxCell%20id%3D%220%22%2F%3E%3CmxCell%20id%3D%221%22%20parent%3D%220%22%2F%3E%3CmxCell%20id%3D%222%22%20parent%3D%221%22%20style%3D%22image%3Baspect%3Dfixed%3Bhtml%3D1%3Bpoints%3D%5B%5D%3Balign%3Dcenter%3BfontSize%3D12%3Bimage%3Dimg%2Flib%2Fazure2%2Fanalytics%2FPower_BI_Embedded.svg%3BstrokeWidth%3D2%3B%22%20value%3D%22%22%20vertex%3D%221%22%3E%3CmxGeometry%20height%3D%2246.66%22%20width%3D%2235%22%20x%3D%22730%22%20y%3D%22247%22%20as%3D%22geometry%22%2F%3E%3C%2FmxCell%3E%3C%2Froot%3E%3C%2FmxGraphModel%3EBI: Analytics & Reporting (Data Analysis)
Objective
Develop SQL-based analytics to deliver detailed insights into:

Customer Behavior
Product Performance
Sales Trends
These insights empower stakeholders with key business metrics, enabling strategic decision-making.
