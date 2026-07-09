# 🏡 Airbnb Data Engineering Pipeline using Snowflake & dbt

An end-to-end **Data Engineering Pipeline** built using **Snowflake** and **dbt Core**, following the **Medallion Architecture (Bronze → Silver → Gold)**. This project demonstrates modern ELT development practices including incremental data loading, reusable Jinja macros, modular SQL transformations, and dimensional data modeling.

> **Project Status:** 🟡 Bronze & Silver Layers Completed | Gold Layer In Progress

---

# 📖 Table of Contents

- Project Overview
- Tech Stack
- Architecture
- Project Structure
- Data Pipeline
- Bronze Layer
- Silver Layer
- Custom dbt Macros
- Incremental Loading
- Getting Started
- Future Improvements
- Learning Outcomes

---

# 🚀 Project Overview

This project simulates a real-world Airbnb analytics pipeline by transforming raw operational data into clean, analytics-ready datasets using **dbt Core** and **Snowflake**.

The project follows the **ELT (Extract → Load → Transform)** approach where raw data is first loaded into Snowflake and then transformed using dbt.

Current implementation includes:

- Bronze Layer (Raw Data)
- Silver Layer (Cleaned & Standardized Data)
- Incremental Loading
- Reusable dbt Macros
- Modular SQL Models

---

# 🛠 Tech Stack

| Technology | Purpose |
|------------|---------|
| Snowflake | Cloud Data Warehouse |
| dbt Core | Data Transformation |
| SQL | Data Modeling |
| Jinja | Dynamic SQL Generation |
| Git & GitHub | Version Control |
| Python | dbt Environment |

---

# 🏗 Architecture

```
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
        │ Cleaned & Transformed  │
        └────────────────────────┘
                     │
                     ▼
        ┌────────────────────────┐
        │       Gold Layer       │
        │ Business Models (WIP)  │
        └────────────────────────┘
```

---

# 📂 Project Structure

```
Airbnb_Project1/

│
├── models/
│   │
│   ├── Raw/
│   │   ├── raw_bookings.sql
│   │   ├── raw_hosts.sql
│   │   └── raw_listings.sql
│   │
│   └── Silver/
│       ├── silver_bookings.sql
│       ├── silver_hosts.sql
│       └── silver_listings.sql
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

```
Snowflake Source Tables
        │
        ▼
Raw Models (Bronze)
        │
        ▼
Silver Models
        │
        ▼
Gold Models (Coming Soon)
```

---

# 🥉 Bronze Layer

The Bronze layer loads raw Airbnb data into Snowflake using **incremental models**.

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

The Silver layer performs business transformations and data standardization.

### Models

- silver_bookings
- silver_hosts
- silver_listings

### Transformations

- Data Cleaning
- Derived Columns
- Response Rate Categorization
- Price Tag Categorization
- Standardized Host Names
- Business Logic Implementation

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

Reusable Jinja macros were created to avoid repetitive SQL.

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

Install dbt dependencies

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

| Layer | Status |
|---------|--------|
| Bronze | ✅ Completed |
| Silver | ✅ Completed |
| Gold | 🚧 In Progress |
| Tests | 🚧 Planned |
| Snapshots | 🚧 Planned |
| Documentation | 🚧 Planned |

---

# 🚀 Future Improvements

- Gold Layer Star Schema
- Fact & Dimension Tables
- dbt Tests
- dbt Snapshots (SCD Type-2)
- dbt Documentation
- GitHub Actions CI/CD
- AWS S3 Integration
- Data Quality Monitoring

---

# 📚 Learning Outcomes

This project helped me gain practical experience in:

- Building ELT pipelines using dbt
- Implementing Medallion Architecture
- Snowflake Data Warehousing
- Incremental Data Loading
- SQL Data Transformation
- Jinja Templating
- Reusable dbt Macros
- Modular Data Modeling
- Git Version Control

---

# 👨‍💻 Author

**Akshay Balaji**

Data Engineer passionate about building scalable cloud-based data platforms using Snowflake, dbt, SQL, Python, and modern data engineering best practices.

---

# ⭐ If you found this project helpful, consider giving it a star!
