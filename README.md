🏡 Airbnb Data Engineering Pipeline using AWS, Snowflake & dbt
```{=html}
<p align="center">
```
![dbt](https://img.shields.io/badge/dbt-Core-orange)
![Snowflake](https://img.shields.io/badge/Snowflake-Cloud_Data_Warehouse-blue)
![AWS](https://img.shields.io/badge/AWS-S3-orange)
![SQL](https://img.shields.io/badge/SQL-Data_Engineering-green)
![Python](https://img.shields.io/badge/Python-3.12-blue)
![Git](https://img.shields.io/badge/Git-Version_Control-black)
```{=html}
</p>
```
---
📌 Project Overview
This project demonstrates an end-to-end ELT (Extract, Load,
Transform) pipeline built using AWS S3, Snowflake, and dbt
Core following the Medallion Architecture (Bronze → Silver →
Gold).
The pipeline ingests Airbnb data into Snowflake, transforms it using
modular dbt models, and produces an analytics-ready One Big Table
(OBT) for reporting. It showcases modern analytics engineering
concepts including incremental loading, metadata-driven pipelines,
reusable Jinja macros, modular SQL development, and cloud-native data
warehousing.
---
🎯 Project Objectives
Build an end-to-end cloud data pipeline
Implement Medallion Architecture
Develop reusable dbt models and macros
Implement metadata-driven transformations
Build incremental ELT pipelines
Produce analytics-ready datasets
---
🛠 Tech Stack
Category              Technology
---
Cloud Storage         AWS S3
Data Warehouse        Snowflake
Data Transformation   dbt Core
Language              SQL, Python
Template Engine       Jinja
Version Control       Git & GitHub
---
🏗 Architecture
``` text
Airbnb Dataset
      │
      ▼
 AWS S3 Bucket
      │
      ▼
Snowflake Stage
      │
      ▼
Snowflake Raw Tables
      │
      ▼
Bronze Layer
      │
      ▼
Silver Layer
      │
      ▼
Gold Layer (One Big Table)
      │
      ▼
Analytics / BI
```
---
🥉 Bronze Layer
Raw Airbnb data is ingested into Snowflake using incremental dbt models.
Models: - raw_bookings - raw_hosts - raw_listings
Features: - Incremental Loading - Source Definitions - Raw Data
Preservation
---
🥈 Silver Layer
Business transformations are applied to clean and standardize the data.
Models: - silver_bookings - silver_hosts - silver_listings
Transformations: - Data Cleaning - Derived Columns - Feature
Engineering - Price Categorization - Response Rate Categorization -
Standardized Host Names
---
🥇 Gold Layer
The Gold layer combines booking, listing, and host data into a
denormalized One Big Table (OBT) optimized for reporting and
analytics.
Benefits: - Analytics-ready dataset - BI-friendly structure - Reduced
joins - Single source of truth
---
⚡ Incremental Loading
Implemented using:
`materialized='incremental'`
`unique_key`
`is_incremental()`
`CREATED_AT` watermark filtering
---
🧩 Metadata-Driven Pipeline
The project uses reusable configurations and modular SQL components to
drive transformations, making the pipeline scalable, maintainable, and
easy to extend.
---
🔧 Custom Macros
multiply.sql -- Calculates booking totals
tag.sql -- Categorizes property prices
trim.sql -- Cleans and standardizes strings
---
📂 Repository Structure
``` text
Airbnb_Project1
│
├── models
│   ├── Raw
│   ├── Silver
│   └── Gold
│
├── macros
├── snapshots
├── tests
├── analyses
├── sources
├── dbt_project.yml
└── README.md
```
---
🚀 Getting Started
``` bash
git clone https://github.com/<your-username>/<repository>.git

cd Airbnb_Project1

dbt deps
dbt compile
dbt run
```
---
📊 Skills Demonstrated
AWS S3
Snowflake
dbt Core
SQL
Jinja
Medallion Architecture
Metadata-Driven Pipelines
Incremental Loading
One Big Table (OBT)
ELT Pipeline Development
Git & GitHub
---
🚧 Future Enhancements
Implement dbt Data Quality Tests
Implement dbt Snapshots (SCD Type-2)
Build a Star Schema alongside the OBT model
Generate dbt Documentation & Lineage
CI/CD using GitHub Actions
Data Quality Monitoring
Performance Optimization
---
📚 Learning Outcomes
This project provided hands-on experience with:
Cloud Data Engineering
Snowflake Data Warehousing
dbt Core
Incremental ELT Pipelines
Metadata-Driven Development
Modular SQL Design
Analytics Engineering
Git Workflows
---
🙏 Acknowledgements
This project was inspired by and built while following the excellent
end-to-end Data Engineering tutorial by Ansh Lamba.
The implementation was completed as a hands-on learning project.
Throughout the project, I independently configured the environment,
debugged issues, implemented transformations, documented the solution,
and gained practical experience with AWS, Snowflake, and dbt.
Special thanks to Ansh Lamba for creating such a comprehensive
educational resource.
---
👨‍💻 About Me
Akshay Balaji
Aspiring Data Engineer passionate about building scalable cloud-native
data platforms using Snowflake, dbt, SQL, Python, and AWS.
---
⭐ If you found this project helpful, consider giving it a star!
