# Airbnb_Project1 - dbt Project Documentation

This directory contains the **dbt Core** project responsible for transforming raw Airbnb data into analytics-ready datasets using the **Medallion Architecture (Bronze → Silver → Gold)** on Snowflake.

---

# 📁 Project Structure

```text
Airbnb_Project1
│
├── analyses/
├── macros/
├── models/
│   ├── Bronze/
│   ├── Silver/
│   └── Gold/
├── seeds/
├── snapshots/
├── tests/
├── dbt_project.yml
├── sources.yml
└── README.md
```

---

# 🏗 Project Architecture

```text
AWS S3
   │
   ▼
Snowflake Stage
   │
   ▼
Bronze Models
   │
   ▼
Silver Models
   │
   ▼
Gold Models
   ├── Star Schema
   └── One Big Table (OBT)
```

---

# 🥉 Bronze Layer

The Bronze layer ingests raw Airbnb datasets from AWS S3 into Snowflake while preserving the original source data.

### Models

- `raw_bookings`
- `raw_hosts`
- `raw_listings`

### Features

- Incremental Models
- COPY INTO
- Snowflake External Stages
- Source Definitions
- Raw Data Preservation

---

# 🥈 Silver Layer

The Silver layer cleans, standardizes, and enriches raw datasets using modular SQL transformations and reusable Jinja macros.

### Models

- `silver_bookings`
- `silver_hosts`
- `silver_listings`

### Transformations

- Data Cleaning
- Data Standardization
- Feature Engineering
- Business Logic
- Metadata-Driven Transformations
- Incremental Processing

---

# 🥇 Gold Layer

The Gold layer contains business-ready datasets designed for reporting and analytics.

### Implemented Models

- ⭐ Star Schema
- ⭐ One Big Table (OBT)

### Features

- Dimensional Modeling
- Reporting Models
- Analytics-Ready Tables
- Historical Tracking using Snapshots

---

# ⚡ Incremental Models

Incremental loading is implemented using dbt's incremental materialization.

```jinja
{{ config(
    materialized='incremental',
    unique_key='BOOKING_ID'
) }}
```

Combined with:

- `unique_key`
- `is_incremental()`
- Watermark filtering using `CREATED_AT`

This ensures that only newly added records are processed during subsequent pipeline executions.

---

# 🧩 Metadata-Driven Pipeline

The project follows a metadata-driven approach where reusable configurations and Jinja templating are used to reduce repetitive SQL and improve maintainability.

Benefits include:

- Reusable SQL
- Centralized business logic
- Easy scalability
- Cleaner model design

---

# 🔧 Custom Macros

Reusable Jinja macros are stored in the `macros/` directory.

| Macro | Description |
|--------|-------------|
| `multiply.sql` | Calculates booking totals |
| `tag.sql` | Categorizes listing prices |
| `trim.sql` | Standardizes string values |

---

# 📸 Snapshots (SCD Type 2)

Snapshots are implemented to capture historical changes in dimension tables.

Features:

- Slowly Changing Dimensions (Type 2)
- Historical Record Tracking
- Auditability

---

# ✅ Data Quality Tests

The project includes dbt tests to validate data quality.

Implemented validations include:

- `not_null`
- `unique`
- `relationships`
- `accepted_values`

---

# 📚 Source Definitions

Source tables are defined using `sources.yml`.

Benefits:

- Automatic Lineage Generation
- Documentation
- Source Freshness
- Centralized Source Management

---

# ▶ Running the Project

Compile models

```bash
dbt compile
```

Run all models

```bash
dbt run
```

Run tests

```bash
dbt test
```

Generate documentation

```bash
dbt docs generate
```

View documentation

```bash
dbt docs serve
```

---

# 📖 Project Configuration

Configuration files used in this project:

- `dbt_project.yml`
- `profiles.yml`
- `sources.yml`

These files define:

- Snowflake connection settings
- Model materializations
- Custom schemas
- Source definitions
- Project configurations

---

# 🚀 Future Improvements

Potential enhancements include:

- Apache Airflow orchestration
- GitHub Actions CI/CD
- Docker support
- Data observability
- Infrastructure as Code (Terraform)

---

# 📝 Notes

This dbt project was implemented as part of a hands-on learning journey inspired by **Ansh Lamba's End-to-End Data Engineering Project**.

The project was completed to gain practical experience with **AWS S3**, **Snowflake**, **dbt Core**, **Jinja**, and modern cloud-native data engineering workflows.
