# Airbnb_Project1 - dbt Project Documentation

This directory contains the dbt Core project responsible for transforming raw Airbnb data into analytics-ready datasets using the Medallion Architecture.

---

# Project Structure

```text
Airbnb_Project1
│
├── analyses/
├── macros/
├── models/
│   ├── Raw/
│   ├── Silver/
│   └── Gold/
├── seeds/
├── snapshots/
├── tests/
├── sources/
├── dbt_project.yml
└── README.md
```

---

# Model Layers

## Bronze Layer

The Bronze layer ingests raw Airbnb data from Snowflake staging tables while preserving the original source data.

### Models

- raw_bookings
- raw_hosts
- raw_listings

### Features

- Incremental Loading
- Source Definitions
- Raw Data Preservation

---

## Silver Layer

The Silver layer applies business transformations, standardization, and feature engineering to prepare data for analytics.

### Models

- silver_bookings
- silver_hosts
- silver_listings

### Transformations

- Booking amount calculation
- Price categorization
- Response rate categorization
- Host name standardization
- Data cleaning
- Business logic implementation

---

## Gold Layer

The Gold layer combines the transformed Silver models into a single analytics-ready **One Big Table (OBT)** optimized for reporting and Business Intelligence.

### Model

- obt_airbnb

---

# Incremental Models

Incremental loading is implemented using dbt's native incremental materialization.

Example configuration:

```jinja
{{ config(
    materialized='incremental',
    unique_key='BOOKING_ID'
) }}
```

The project uses:

- `materialized='incremental'`
- `unique_key`
- `is_incremental()`
- `CREATED_AT` watermark filtering

---

# Custom Macros

The project includes reusable Jinja macros located in the `macros/` directory.

| Macro | Purpose |
|--------|---------|
| multiply.sql | Calculates booking totals |
| tag.sql | Categorizes property prices |
| trim.sql | Cleans and standardizes string values |

---

# Metadata-Driven Pipeline

The Gold layer follows a metadata-driven design that minimizes repetitive SQL by using reusable configurations and modular transformations. This approach improves maintainability and scalability while keeping the SQL concise and reusable.

---

# Project Configuration

The project configuration is managed through:

- `dbt_project.yml`
- `profiles.yml`
- `sources.yml`

These files define model configurations, Snowflake connections, schemas, and source tables.

---

# Running the Project

Compile all models

```bash
dbt compile
```

Run all models

```bash
dbt run
```

Run a specific model

```bash
dbt run --select silver_bookings
```

Generate documentation

```bash
dbt docs generate
```

Serve documentation

```bash
dbt docs serve
```

---

# Future Improvements

- Add dbt Data Quality Tests
- Implement dbt Snapshots (SCD Type 2)
- Build a dimensional Star Schema alongside the current OBT model
- Automate deployments with CI/CD
- Improve pipeline monitoring and observability

---

# Notes

This dbt project was developed as part of a hands-on learning journey inspired by the excellent **End-to-End Data Engineering Project** by **Ansh Lamba**. The implementation was completed independently to gain practical experience with Snowflake, dbt Core, SQL, and modern ELT pipeline development.
