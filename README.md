# 🏡 Airbnb Data Engineering Pipeline using AWS, Snowflake & dbt

<p align="center">

![AWS](https://img.shields.io/badge/AWS-S3-orange?style=for-the-badge&logo=amazonaws)
![Snowflake](https://img.shields.io/badge/Snowflake-Cloud%20Data%20Warehouse-29B5E8?style=for-the-badge&logo=snowflake)
![dbt](https://img.shields.io/badge/dbt-Core-FF694B?style=for-the-badge&logo=dbt)
![SQL](https://img.shields.io/badge/SQL-Data%20Engineering-336791?style=for-the-badge&logo=postgresql)
![Python](https://img.shields.io/badge/Python-3.12-3776AB?style=for-the-badge&logo=python)
![Git](https://img.shields.io/badge/Git-Version%20Control-F05032?style=for-the-badge&logo=git)

</p>

An end-to-end **ELT (Extract, Load, Transform)** Data Engineering pipeline built using **AWS S3, Snowflake, and dbt Core** following the **Medallion Architecture (Bronze → Silver → Gold)**. The project demonstrates modern data engineering practices including incremental loading, metadata-driven pipelines, reusable Jinja macros, and an analytics-ready **One Big Table (OBT)** for reporting.

---

# 🏗 Architecture

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
                 Bronze Layer
                        │
                        ▼
                 Silver Layer
                        │
                        ▼
           Gold Layer (One Big Table)
                        │
                        ▼
               Analytics & Reporting
```

---

# 🛠 Tech Stack

| Category | Technology |
|----------|------------|
| Cloud Storage | AWS S3 |
| Data Warehouse | Snowflake |
| Transformation | dbt Core |
| Language | SQL, Python |
| Templating | Jinja |
| Version Control | Git & GitHub |

---

# ✨ Features

- ✅ End-to-End ELT Pipeline
- ✅ AWS S3 → Snowflake Data Ingestion
- ✅ Medallion Architecture
- ✅ Bronze, Silver & Gold Layers
- ✅ Incremental Data Loading
- ✅ Metadata-Driven Pipeline
- ✅ Reusable dbt Jinja Macros
- ✅ One Big Table (OBT)
- ✅ Modular SQL Models
- ✅ Cloud Data Warehousing

---

# 📂 Project Structure

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

# 🥉 Bronze Layer

Stores raw Airbnb datasets in Snowflake using incremental dbt models while preserving source data.

**Models**
- raw_bookings
- raw_hosts
- raw_listings

---

# 🥈 Silver Layer

Transforms and standardizes raw data by applying business logic, feature engineering, and data cleaning.

**Models**
- silver_bookings
- silver_hosts
- silver_listings

---

# 🥇 Gold Layer

Builds an analytics-ready **One Big Table (OBT)** by combining booking, listing, and host information into a denormalized reporting dataset optimized for Business Intelligence.

---

# ⚡ Incremental Loading

Incremental models are implemented using:

- `materialized='incremental'`
- `unique_key`
- `is_incremental()`
- Watermark filtering using `CREATED_AT`

This ensures that only newly added records are processed, improving performance and reducing compute costs.

---

# 🧩 Metadata-Driven Pipeline

The project leverages reusable dbt models, Jinja macros, and modular SQL components to minimize code duplication, improve maintainability, and simplify future enhancements.

---

# 🔧 Custom Macros

| Macro | Purpose |
|--------|---------|
| `multiply.sql` | Calculates booking totals |
| `tag.sql` | Categorizes listing prices |
| `trim.sql` | Standardizes string values |

---

# 🚀 Getting Started

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
pip install dbt-snowflake
```

Run the project

```bash
dbt compile
dbt run
```

---

# 📊 Skills Demonstrated

- Data Engineering
- ELT Pipelines
- Snowflake
- AWS S3
- dbt Core
- SQL
- Jinja
- Medallion Architecture
- Metadata-Driven Pipelines
- Incremental Loading
- One Big Table (OBT)
- Git & GitHub

---

# 🚧 Future Enhancements

- Implement dbt Data Quality Tests
- Implement dbt Snapshots (SCD Type 2)
- Generate dbt Documentation & Lineage
- Build a Star Schema alongside the current OBT model
- CI/CD using GitHub Actions
- Pipeline Monitoring & Alerting

---

# 🙏 Acknowledgements

This project was built as part of a hands-on learning journey inspired by the excellent **End-to-End Data Engineering Project** by **Ansh Lamba**.

While the project follows the concepts taught in the tutorial, I independently implemented the pipeline, configured the environment, debugged issues, documented the project, and gained practical experience with AWS, Snowflake, and dbt Core.

Special thanks to **Ansh Lamba** for creating such a comprehensive learning resource.

---

# 👨‍💻 About Me

**Akshay Balaji**

Aspiring Data Engineer passionate about building scalable cloud-native data platforms using **Snowflake, dbt, SQL, Python, and AWS**.

⭐ If you found this project helpful, consider giving it a star!
