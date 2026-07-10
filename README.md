# 🏡 Airbnb Data Engineering Pipeline using Snowflake & dbt

An end-to-end **ELT (Extract, Load, Transform)** data engineering pipeline built using **Snowflake** and **dbt Core**, following the **Medallion Architecture (Bronze → Silver → Gold)**. This project demonstrates modern data engineering practices including incremental data loading, reusable Jinja macros, modular SQL transformations, and the development of an analytics-ready **One Big Table (OBT)** for reporting.

> **Project Status:** ✅ Completed (Bronze, Silver & Gold Layers)

---

# 📖 Table of Contents

- Project Overview
- Tech Stack
- Architecture
- Project Structure
- Data Pipeline
- Bronze Layer
- Silver Layer
- Gold Layer
- Custom dbt Macros
- Incremental Loading
- Running the Project
- Future Improvements
- Learning Outcomes

---

# 🚀 Project Overview

This project simulates a real-world Airbnb analytics pipeline by transforming raw operational data into clean, analytics-ready datasets using **Snowflake** and **dbt Core**.

The project follows the **ELT (Extract → Load → Transform)** approach where raw Airbnb data is loaded into Snowflake and transformed through multiple layers using dbt.

The pipeline consists of:

- Bronze Layer (Raw Data)
- Silver Layer (Business Transformations)
- Gold Layer (Analytics-ready One Big Table)
- Incremental Data Loading
- Reusable dbt Macros
- Modular SQL Models

---

# 🛠 Tech Stack

| Technology | Purpose |
|------------|---------|
| Snowflake | Cloud Data Warehouse |
| dbt Core | Data Transformation |
| SQL | Data Modeling & Transformation |
| Jinja | Dynamic SQL Generation |
| Python | dbt Environment |
| Git & GitHub | Version Control |

---

# 🏗 Architecture

```text
                Source Data
                     │
                     ▼
            Snowflake Staging Tables
                     │
                     ▼
        ┌────────────────────────┐
        │      Bronze Layer      │
        │   Raw Incremental Load │
        └────────────────────────┘
                     │
                     ▼
        ┌────────────────────────┐
        │      Silver Layer      │
        │ Cleaned & Standardized │
        └────────────────────────┘
                     │
                     ▼
        ┌────────────────────────┐
        │       Gold Layer       │
        │     One Big Table      │
        └────────────────────────┘
```

---

# 📂 Project Structure

```text
Airbnb_Project1/

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
├── macros/
│   ├── multiply.sql
│   ├── tag.sql
│   └── trim.sql
│
├── sources/
│   └── sources.yml
│
├── dbt_project.yml
│
└── README.md
```

---

# ⚙ Data Pipeline

```text
Source Data
      │
      ▼
Snowflake Staging
      │
      ▼
Bronze Layer
      │
      ▼
Silver Layer
      │
      ▼
Gold Layer (One Big Table)
```

---

# 🥉 Bronze Layer

The Bronze layer ingests raw Airbnb data into Snowflake using incremental dbt models while preserving the original source data.

### Models

- raw_bookings
- raw_hosts
- raw_listings

### Features

- Incremental Loading
- Source Definitions
- Raw Data Preservation
- Medallion Architecture

---

# 🥈 Silver Layer

The Silver layer performs business transformations, standardization, and feature engineering to prepare high-quality datasets for analytics.

### Models

- silver_bookings
- silver_hosts
- silver_listings

### Transformations

- Data Cleaning
- Derived Columns
- Price Categorization
- Response Rate Categorization
- Standardized Host Names
- Business Logic Implementation

---

# 🥇 Gold Layer

The Gold layer combines transformed booking, listing, and host data into a single **One Big Table (OBT)** optimized for analytics and reporting.

### Model

- obt_airbnb

### Features

- Analytics-ready Dataset
- Denormalized Reporting Table
- Optimized for BI & Dashboarding
- Combines Booking, Listing, and Host Information

---

# ⚡ Incremental Loading

Incremental loading is implemented using dbt's built-in incremental materialization.

Features used:

- `materialized='incremental'`
- `unique_key`
- `is_incremental()`
- Watermark filtering using `CREATED_AT`

Example:

```sql
{% if is_incremental() %}
WHERE CREATED_AT >
(
    SELECT COALESCE(MAX(CREATED_AT), '1900-01-01')
    FROM {{ this }}
)
{% endif %}
```

---

# 🔧 Custom dbt Macros

Reusable Jinja macros were created to simplify SQL development and improve maintainability.

### multiply.sql

Calculates total booking amount.

### tag.sql

Categorizes property prices into:

- Low
- Medium
- High

### trim.sql

Reusable string-cleaning macro.

---

# ▶ Running the Project

Clone the repository

```bash
git clone https://github.com/<your-username>/<repository-name>.git
```

Navigate to the project

```bash
cd Airbnb_Project1
```

Install dependencies

```bash
dbt deps
```

Compile models

```bash
dbt compile
```

Run models

```bash
dbt run
```

Run tests

```bash
dbt test
```

---

# 📈 Current Progress

| Component | Status |
|-----------|--------|
| Bronze Layer | ✅ Completed |
| Silver Layer | ✅ Completed |
| Gold Layer (OBT) | ✅ Completed |
| Incremental Loading | ✅ Completed |
| Custom Macros | ✅ Completed |
| Documentation | ✅ Completed |

---

# 🚀 Future Improvements

- Implement dbt Data Quality Tests (`unique`, `not_null`, `relationships`, `accepted_values`)
- Generate interactive dbt Documentation and Lineage (`dbt docs`)
- Implement dbt Snapshots for Slowly Changing Dimensions (SCD Type 2)
- Build a dimensional Star Schema (Fact & Dimension tables) as an alternative to the current One Big Table (OBT) model
- Integrate AWS S3 as the data ingestion layer
- Automate pipeline execution using GitHub Actions or dbt Cloud Jobs
- Add data quality monitoring and pipeline validation
- Optimize models using advanced dbt materializations and performance tuning

---

# 📚 Learning Outcomes

Through this project, I gained hands-on experience in:

- Building ELT pipelines using dbt Core
- Developing scalable transformations in Snowflake
- Implementing Medallion Architecture
- Creating Incremental Data Pipelines
- Writing Reusable Jinja Macros
- Data Cleaning & Feature Engineering
- Building Analytics-ready Gold Models
- Modular SQL Development
- Git Version Control

---

# 👨‍💻 Author

**Akshay Balaji**

Aspiring Data Engineer passionate about designing scalable cloud-based data platforms using Snowflake, dbt, SQL, Python, and modern data engineering best practices.

---

# ⭐ If you found this project helpful, consider giving it a star!
