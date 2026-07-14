# 🏡 Airbnb Data Engineering Pipeline using AWS, Snowflake & dbt

<p align="center">

![AWS](https://img.shields.io/badge/AWS-S3-orange?style=for-the-badge&logo=amazonaws)
![Snowflake](https://img.shields.io/badge/Snowflake-Cloud%20Data%20Warehouse-29B5E8?style=for-the-badge&logo=snowflake)
![dbt](https://img.shields.io/badge/dbt-Core-FF694B?style=for-the-badge&logo=dbt)
![SQL](https://img.shields.io/badge/SQL-Data%20Engineering-336791?style=for-the-badge&logo=postgresql)
![Python](https://img.shields.io/badge/Python-3.12-3776AB?style=for-the-badge&logo=python)
![Git](https://img.shields.io/badge/Git-Version%20Control-F05032?style=for-the-badge&logo=git)

</p>

An end-to-end **ELT (Extract, Load, Transform)** Data Engineering pipeline built using **AWS S3, Snowflake, and dbt Core**, implementing a complete **Medallion Architecture (Bronze → Silver → Gold)**.

The project demonstrates modern cloud data engineering practices including incremental loading, metadata-driven pipelines, reusable Jinja macros, ephemeral models, data quality testing, **Star Schema**, **One Big Table (OBT)**, **Slowly Changing Dimensions (SCD Type 2)**, and **dbt Snapshots**.

---

# 🏗️ Architecture

```text
              Airbnb CSV Dataset
                     │
                     ▼
               AWS S3 Data Lake
                     │
                     ▼
        Snowflake External Stage
                     │
                     ▼
         Snowflake Staging Tables
                     │
                     ▼
        Bronze Layer (Incremental)
                     │
                     ▼
 Silver Layer (Cleaning & Transformation)
                     │
                     ▼
              Gold Layer
        ┌──────────┴──────────┐
        ▼                     ▼
  Star Schema        One Big Table (OBT)
        │                     │
        └──────────┬──────────┘
                   ▼
        Analytics & Business Intelligence
```

---

# 🛠️ Tech Stack

| Category | Technology |
|----------|------------|
| Cloud Storage | AWS S3 |
| Cloud Data Warehouse | Snowflake |
| Data Transformation | dbt Core |
| Programming | SQL, Python |
| Templating | Jinja |
| Version Control | Git & GitHub |

---

# ✨ Features

- ✅ End-to-End ELT Pipeline
- ✅ AWS S3 Data Lake Integration
- ✅ Snowflake External Stages
- ✅ Medallion Architecture
- ✅ Bronze Layer
- ✅ Silver Layer
- ✅ Gold Layer
- ✅ Star Schema
- ✅ One Big Table (OBT)
- ✅ Incremental Data Loading
- ✅ Metadata-Driven Pipeline
- ✅ Reusable dbt Jinja Macros
- ✅ Ephemeral Models
- ✅ Slowly Changing Dimensions (SCD Type 2)
- ✅ dbt Snapshots
- ✅ Data Quality Testing
- ✅ dbt Documentation & Lineage

---

# 📂 Project Structure

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
├── sources/
├── dbt_project.yml
└── README.md
```

---

# 🥉 Bronze Layer

The Bronze layer ingests raw Airbnb datasets from **AWS S3** into **Snowflake** while preserving the original source data.

**Key Features**

- Incremental Loading
- External Stages
- File Formats
- COPY INTO
- Raw Data Preservation

---

# 🥈 Silver Layer

The Silver layer transforms raw data into clean, standardized datasets by applying business logic and reusable transformations.

**Key Features**

- Metadata-Driven Pipeline
- Jinja Templating
- Custom Macros
- Ephemeral Models
- Feature Engineering
- Data Cleaning
- Data Standardization

---

# 🥇 Gold Layer

The Gold layer provides analytics-ready datasets optimized for Business Intelligence and reporting.

Implemented models include:

- ⭐ Star Schema
- ⭐ One Big Table (OBT)

Additional Features

- Slowly Changing Dimensions (SCD Type 2)
- dbt Snapshots
- Analytics-ready data models

---

# ⚡ Incremental Loading

Incremental models are implemented using dbt's native incremental materialization.

Features:

- `materialized='incremental'`
- `unique_key`
- `is_incremental()`
- Watermark filtering
- Optimized processing

---

# 🧩 Metadata-Driven Pipeline

The project leverages metadata-driven transformations using reusable configurations, modular SQL models, Jinja templating, and custom macros to minimize repetitive code and improve maintainability.

---

# 🔧 Custom Macros

| Macro | Purpose |
|--------|---------|
| `multiply.sql` | Booking amount calculations |
| `tag.sql` | Property price categorization |
| `trim.sql` | String standardization |

---

# 🚀 Getting Started

Clone the repository

```bash
git clone https://github.com/Akshay-devv/DBT_Snowflake.git
```

Navigate to the project

```bash
cd DBT_Snowflake/Airbnb_Project1
```

Install dependencies

```bash
pip install dbt-snowflake
```

Run the pipeline

```bash
dbt compile
dbt run
dbt test
dbt docs generate
dbt docs serve
```

---

# 📊 Skills Demonstrated

- Data Engineering
- ELT Pipeline Development
- Cloud Data Warehousing
- AWS S3
- Snowflake
- dbt Core
- SQL
- Python
- Jinja
- Metadata-Driven Pipelines
- Incremental Models
- Star Schema
- One Big Table (OBT)
- Slowly Changing Dimensions (SCD Type 2)
- dbt Snapshots
- Data Quality Testing
- Git & GitHub

---

# 📚 What I Learned

Through this project, I gained hands-on experience with:

- Building cloud-native ELT pipelines
- Designing Medallion Architecture
- Configuring AWS S3 and Snowflake integrations
- Developing modular transformations with dbt
- Writing reusable Jinja macros
- Implementing incremental processing
- Managing historical data using SCD Type 2 Snapshots
- Building analytical models using Star Schema and One Big Table (OBT)

---

# 🚧 Future Enhancements

- Apache Airflow for pipeline orchestration
- CI/CD using GitHub Actions
- Power BI dashboards on the Gold Layer
- Docker containerization
- Data observability & monitoring
- Infrastructure as Code (Terraform)

---

# 🙏 Acknowledgements

This project was completed as part of a hands-on learning journey inspired by **Ansh Lamba's End-to-End Data Engineering Project**.

While the project architecture and concepts were learned from the tutorial, I independently configured the cloud infrastructure, implemented the complete data pipeline, resolved implementation challenges, documented the project, and gained practical experience with AWS, Snowflake, and dbt Core.

Special thanks to **Ansh Lamba** for creating such an exceptional educational resource.

---

# 👨‍💻 About Me

**Akshay Balaji**

Data Engineer passionate about building scalable cloud-native data platforms and modern data engineering solutions.

⭐ If you found this project helpful, consider giving it a star!
