# 🏡 Airbnb Data Engineering Pipeline using AWS, Snowflake & dbt

<p align="center">

![AWS](https://img.shields.io/badge/AWS-S3-orange?style=for-the-badge&logo=amazonaws)
![Snowflake](https://img.shields.io/badge/Snowflake-Cloud%20Data%20Warehouse-29B5E8?style=for-the-badge&logo=snowflake)
![dbt](https://img.shields.io/badge/dbt-Core-FF694B?style=for-the-badge&logo=dbt)
![SQL](https://img.shields.io/badge/SQL-Data%20Engineering-336791?style=for-the-badge&logo=postgresql)
![Python](https://img.shields.io/badge/Python-3.12-3776AB?style=for-the-badge&logo=python)
![Git](https://img.shields.io/badge/Git-Version%20Control-F05032?style=for-the-badge&logo=git)

</p>

<p align="center">

An end-to-end cloud-native Data Engineering Pipeline implementing the Medallion Architecture using AWS S3, Snowflake and dbt Core.

</p>

---

# 📖 Table of Contents

- Project Overview
- Objectives
- Tech Stack
- Architecture
- Project Workflow
- Bronze Layer
- Silver Layer
- Gold Layer
- Metadata Driven Pipeline
- Incremental Loading
- Custom Macros
- Repository Structure
- Getting Started
- Skills Demonstrated
- Future Enhancements
- Learning Outcomes
- Acknowledgements
- About Me

---

# 🚀 Project Overview

This project demonstrates the implementation of a modern **ELT (Extract, Load, Transform)** pipeline using **AWS S3**, **Snowflake**, and **dbt Core** following the **Medallion Architecture**.

The goal of this project is to simulate how data is ingested, transformed, and modeled in production-grade cloud data platforms.

Raw Airbnb datasets are loaded into Snowflake from AWS S3 before being transformed through multiple dbt layers to produce an analytics-ready dataset for reporting and business intelligence.

The project focuses on industry best practices including:

- Modular SQL Development
- Incremental Data Processing
- Metadata-Driven Pipelines
- Reusable Jinja Macros
- Cloud Data Warehousing
- Analytics Engineering
- Data Modeling
- Version Control

---

# 🎯 Project Objectives

The primary objectives of this project were:

- Design an end-to-end ELT Pipeline
- Implement Medallion Architecture
- Build scalable transformation models
- Reduce repetitive SQL using reusable macros
- Create Metadata-Driven Pipelines
- Implement Incremental Loading
- Build an analytics-ready Gold Layer
- Learn industry-standard dbt development practices
- Gain hands-on experience with Snowflake

---

# 🛠 Tech Stack

| Category | Technology |
|------------|----------------|
| Cloud Storage | AWS S3 |
| Cloud Data Warehouse | Snowflake |
| Transformation Tool | dbt Core |
| Programming Language | SQL |
| Templating Engine | Jinja |
| Environment | Python 3.12 |
| Version Control | Git & GitHub |

---

# 🏗 Solution Architecture

```text
                    Airbnb Dataset
                           │
                           ▼
                    AWS S3 Bucket
                           │
                           ▼
                 Snowflake External Stage
                           │
                           ▼
                Snowflake Staging Tables
                           │
                           ▼
            ┌──────────────────────────┐
            │      Bronze Layer        │
            │ Raw Incremental Models   │
            └──────────────────────────┘
                           │
                           ▼
            ┌──────────────────────────┐
            │      Silver Layer        │
            │ Business Transformations │
            └──────────────────────────┘
                           │
                           ▼
            ┌──────────────────────────┐
            │       Gold Layer         │
            │     One Big Table        │
            └──────────────────────────┘
                           │
                           ▼
                  Analytics & Reporting
```

---

# 🌊 Project Workflow

```text
Airbnb Dataset

        │

        ▼

AWS S3

        │

        ▼

Snowflake Stage

        │

        ▼

Snowflake Raw Tables

        │

        ▼

Bronze Models

        │

        ▼

Silver Models

        │

        ▼

Gold One Big Table

        │

        ▼

Business Intelligence
```

---

# ✨ Key Features

- ✅ Medallion Architecture
- ✅ Bronze Layer
- ✅ Silver Layer
- ✅ Gold Layer (One Big Table)
- ✅ Incremental Loading
- ✅ Metadata Driven Pipeline
- ✅ Custom dbt Macros
- ✅ Modular SQL Models
- ✅ Cloud Data Warehouse
- ✅ AWS S3 Integration
- ✅ Snowflake
- ✅ dbt Core
- ✅ Git Version Control

---

# 🥉 Bronze Layer (Raw Layer)

The **Bronze Layer** is responsible for ingesting raw Airbnb datasets into Snowflake without applying any business transformations. This layer serves as the foundation of the Medallion Architecture and preserves the source data in its original structure.

### Bronze Models

| Model | Description |
|---------|-------------|
| `raw_bookings` | Raw booking transaction data |
| `raw_hosts` | Raw host information |
| `raw_listings` | Raw property listing data |

### Key Features

- Incremental Data Loading
- Raw Data Preservation
- Source Definitions using `sources.yml`
- Cloud Data Warehousing
- Reusable dbt Models

### Example Bronze Flow

```text
Snowflake Staging Tables
        │
        ▼
raw_bookings
raw_hosts
raw_listings
```

---

# 🥈 Silver Layer (Transformation Layer)

The **Silver Layer** transforms the raw data into standardized, clean, and enriched datasets ready for analytics.

Business logic is applied here using SQL transformations and reusable Jinja macros.

### Silver Models

| Model | Description |
|---------|-------------|
| `silver_bookings` | Booking transformations |
| `silver_hosts` | Host data standardization |
| `silver_listings` | Listing transformations |

---

## Booking Transformations

Implemented:

- Booking Amount Calculation
- Incremental Processing
- Data Standardization

Example:

```sql
TOTAL_BOOKING_AMT =
NIGHTS_BOOKED × BOOKING_AMOUNT
```

---

## Host Transformations

Implemented:

- Host Name Standardization
- Response Rate Categorization
- Business Rules

Example Categories

| Response Rate | Category |
|---------------|----------|
| >95 | VERY GOOD |
| >80 | GOOD |
| >60 | OKAY |
| Else | BAD |

---

## Listing Transformations

Implemented:

- Property Price Categorization
- Data Cleaning
- Feature Engineering

Example

| Price | Category |
|--------|----------|
| <100 | Low |
| 100–199 | Medium |
| ≥200 | High |

---

### Silver Layer Benefits

- Clean Data
- Standardized Data
- Feature Engineering
- Business Transformations
- Analytics Ready

---

# 🥇 Gold Layer (Business Layer)

The **Gold Layer** contains the final business-ready dataset used for reporting and dashboarding.

Instead of implementing a traditional **Star Schema**, this project follows a **One Big Table (OBT)** approach.

---

## What is a One Big Table (OBT)?

A One Big Table combines multiple entities into a single denormalized table.

Rather than joining multiple fact and dimension tables during reporting, all required attributes already exist inside one table.

This approach is commonly used in analytics engineering and Business Intelligence because it simplifies reporting and improves dashboard performance.

---

## Gold Model

| Model | Description |
|---------|-------------|
| `obt_airbnb` | Analytics-ready Airbnb dataset |

---

## Data Sources

The Gold model combines data from:

- Silver Bookings
- Silver Listings
- Silver Hosts

using dbt model references.

```sql
{{ ref('silver_bookings') }}

{{ ref('silver_listings') }}

{{ ref('silver_hosts') }}
```

---

## Gold Layer Features

- Analytics Ready
- Reporting Ready
- Business Friendly
- Denormalized Dataset
- Reduced Joins
- Optimized for BI Tools

---

## Final Data Flow

```text
Bronze

↓

Silver

↓

Gold (OBT)

↓

Power BI / Tableau / Reporting
```

---

# 📊 Medallion Architecture

This project follows the Medallion Architecture, where data quality improves as it moves through each layer.

| Layer | Purpose |
|---------|----------|
| Bronze | Store raw source data |
| Silver | Clean and transform data |
| Gold | Deliver business-ready datasets |

This layered approach improves scalability, maintainability, and simplifies downstream analytics.

---

# ⚡ Incremental Loading

To optimize performance and reduce unnecessary data processing, the Bronze and Silver layers use **dbt Incremental Models**.

Instead of reprocessing the entire dataset every time the pipeline runs, only newly created records are loaded into the target tables.

### Incremental Strategy

This project leverages:

- `materialized='incremental'`
- `unique_key`
- `is_incremental()`
- Watermark filtering using `CREATED_AT`

### Example

```sql
{{ config(
    materialized='incremental',
    unique_key='BOOKING_ID'
) }}

SELECT *
FROM {{ ref('raw_bookings') }}

{% if is_incremental() %}
WHERE CREATED_AT >
(
    SELECT COALESCE(MAX(CREATED_AT), '1900-01-01')
    FROM {{ this }}
)
{% endif %}
```

### Benefits

- Faster execution
- Lower compute cost
- Efficient processing
- Scalable pipelines
- Production-ready implementation

---

# 🧩 Metadata-Driven Pipeline

One of the primary goals of this project was to build a **Metadata-Driven Pipeline**.

Instead of hardcoding transformations repeatedly, reusable SQL logic and configurations were developed using dbt macros and modular models.

### Advantages

- Less repetitive SQL
- Easier maintenance
- Better scalability
- Centralized business logic
- Cleaner project structure

The pipeline is designed so that transformations can be reused across multiple models with minimal code duplication.

---

# 🔧 Custom dbt Macros

To improve maintainability and reduce repetitive SQL, several reusable Jinja macros were developed.

---

## multiply.sql

Calculates derived booking metrics dynamically.

Example

```sql
{{ multiply('NIGHTS_BOOKED', 'BOOKING_AMOUNT', 2) }}
```

Compiles to

```sql
ROUND(
    NIGHTS_BOOKED * BOOKING_AMOUNT,
    2
)
```

---

## tag.sql

Categorizes listing prices into business-friendly categories.

Example

```sql
{{ tag('PRICE_PER_NIGHT') }}
```

Output

| Price | Category |
|--------|----------|
| <100 | Low |
| 100–199 | Medium |
| ≥200 | High |

---

## trim.sql

Reusable string-cleaning macro.

Used for:

- Removing unwanted spaces
- Standardizing text
- Improving data quality

---

# 📂 Repository Structure

```text
Airbnb_Project1
│
├── analyses/
│
├── macros/
│   ├── multiply.sql
│   ├── tag.sql
│   └── trim.sql
│
├── models/
│   │
│   ├── Raw/
│   │   ├── raw_bookings.sql
│   │   ├── raw_hosts.sql
│   │   └── raw_listings.sql
│   │
│   ├── Silver/
│   │   ├── silver_bookings.sql
│   │   ├── silver_hosts.sql
│   │   └── silver_listings.sql
│   │
│   └── Gold/
│       └── obt_airbnb.sql
│
├── snapshots/
│
├── tests/
│
├── seeds/
│
├── sources/
│   └── sources.yml
│
├── dbt_project.yml
│
└── README.md
```

---

# 🚀 Getting Started

## Clone the Repository

```bash
git clone https://github.com/yourusername/airbnb-data-engineering-pipeline.git
```

---

## Navigate to the Project

```bash
cd Airbnb_Project1
```

---

## Create a Virtual Environment

```bash
python -m venv .venv
```

---

## Activate Environment

### Windows

```bash
.venv\Scripts\activate
```

### macOS / Linux

```bash
source .venv/bin/activate
```

---

## Install Dependencies

```bash
pip install dbt-snowflake
```

---

## Configure dbt

Update your `profiles.yml` with your Snowflake credentials.

```yaml
Airbnb_Project1:
  outputs:
    dev:
      type: snowflake
      account: <ACCOUNT_ID>
      user: <USERNAME>
      password: <PASSWORD>
      role: ACCOUNTADMIN
      database: AIRBNB
      warehouse: COMPUTE_WH
      schema: dbt_schema
      threads: 1
  target: dev
```

---

# ▶ Running the Pipeline

Compile models

```bash
dbt compile
```

---

Run models

```bash
dbt run
```

---

Run a specific model

```bash
dbt run --select silver_bookings
```

---

Generate documentation

```bash
dbt docs generate
```

---

Serve documentation

```bash
dbt docs serve
```

---

Clean the project

```bash
dbt clean
```

---

Install packages

```bash
dbt deps
```

---

# 📊 Skills Demonstrated

Throughout this project, I gained practical experience in modern cloud-based data engineering by implementing an end-to-end ELT pipeline using industry-standard tools and best practices.

### Data Engineering

- ELT Pipeline Development
- Medallion Architecture
- Metadata-Driven Pipelines
- Incremental Data Loading
- Data Warehousing
- Analytics Engineering
- Modular SQL Development

### Cloud Technologies

- AWS S3
- Snowflake

### Data Transformation

- dbt Core
- Jinja Templating
- SQL
- Incremental Models
- One Big Table (OBT)

### Software Engineering

- Git
- GitHub
- Version Control
- Reusable Code
- Project Documentation

---

# 📌 Key Project Highlights

✔ End-to-End ELT Pipeline

✔ AWS S3 Integration

✔ Snowflake Data Warehouse

✔ dbt Core Implementation

✔ Bronze Layer

✔ Silver Layer

✔ Gold Layer (One Big Table)

✔ Metadata-Driven Pipeline

✔ Incremental Data Loading

✔ Custom Jinja Macros

✔ Business Logic Transformations

✔ Modular SQL Models

✔ Cloud-native Data Engineering

✔ Analytics-ready Dataset

---

# 📈 Project Outcomes

This project demonstrates the implementation of a modern cloud data platform capable of transforming raw Airbnb datasets into business-ready analytical datasets.

Key outcomes include:

- Reduced repetitive SQL through reusable macros
- Efficient incremental processing for large datasets
- Modular and maintainable data models
- Analytics-ready One Big Table (OBT)
- Clear separation of Bronze, Silver, and Gold layers
- Scalable ELT architecture using dbt

---

# 🚧 Future Enhancements

The following improvements can be implemented to further extend the project:

- Implement dbt Data Quality Tests (`unique`, `not_null`, `relationships`, `accepted_values`)
- Implement dbt Snapshots for Slowly Changing Dimensions (SCD Type-2)
- Build a dimensional Star Schema alongside the existing One Big Table (OBT)
- Generate interactive dbt Documentation & Lineage
- Automate pipeline execution using GitHub Actions or dbt Cloud Jobs
- Add data quality monitoring and alerting
- Implement model performance optimization
- Deploy the pipeline in a production environment

---

# 📚 Learning Outcomes

This project provided hands-on experience with:

- Cloud Data Engineering
- AWS S3
- Snowflake
- dbt Core
- SQL Development
- Jinja Templating
- Incremental ELT Pipelines
- Metadata-Driven Pipelines
- Analytics Engineering
- Data Warehousing
- Medallion Architecture
- Git Version Control
- End-to-End Data Pipeline Development

---

# 📷 Screenshots

> *(Add screenshots after completing the project.)*

### Architecture

```
images/architecture.png
```

### dbt Lineage

```
images/dbt_lineage.png
```

### Snowflake Warehouse

```
images/snowflake_tables.png
```

### Gold Layer (OBT)

```
images/obt_preview.png
```

---

# 🙏 Acknowledgements

This project was inspired by and built while following the excellent **End-to-End Data Engineering Project** by **Ansh Lamba**.

The tutorial served as a learning resource to understand modern data engineering concepts including AWS, Snowflake, dbt Core, Medallion Architecture, incremental loading, and metadata-driven pipelines.

While following the project, I independently configured the environment, implemented the pipeline, debugged issues, built the transformations, created reusable macros, documented the project, and gained hands-on experience with modern data engineering workflows.

Special thanks to **Ansh Lamba** for creating such a comprehensive educational resource.

---

# 👨‍💻 About Me

## Akshay Balaji

Aspiring **Data Engineer** passionate about designing scalable cloud-native data platforms.

### Interests

- Data Engineering
- Cloud Computing
- Data Warehousing
- Analytics Engineering
- SQL Optimization
- Modern ELT Pipelines

### Technologies

- Snowflake
- dbt
- SQL
- Python
- AWS
- Git

Feel free to connect with me on **LinkedIn** or explore my other repositories on GitHub.

---

# ⭐ Support

If you found this project helpful, consider giving it a ⭐ on GitHub.

It motivates me to continue building and sharing more data engineering projects.

---

## 📄 License

This project is intended for educational and portfolio purposes.

Please refer to the original tutorial by **Ansh Lamba** for the source learning material while respecting the creator's work and intellectual property.
