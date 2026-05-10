# Fintech Fraud Detection Pipeline

A production-style data pipeline built with dbt and BigQuery to analyse credit card transaction fraud patterns.

## Architecture

Raw Transactions (BigQuery)
↓
stg_transactions (staging) — clean & rename columns
↓
int_transactions_enriched (intermediate) — categorise amounts, flag risk
↓
mart_fraud_summary (marts) — fraud rate by transaction size

## Key Finding

Small transactions (<£10) have the highest fraud rate (0.49%), consistent with card-testing behaviour seen in real fintech fraud patterns.

| Amount Category | Total Transactions | Fraud Count | Fraud Rate |
|---|---|---|---|
| small | 15,195 | 75 | 0.49% |
| very_large | 576 | 2 | 0.35% |
| large | 9,936 | 25 | 0.25% |
| medium | 24,293 | 46 | 0.19% |

## Tech Stack

- **dbt** — data transformation and testing
- **BigQuery** — cloud data warehouse (europe-west2)
- **Python** — data preparation
- **GCP** — cloud infrastructure

## Project Structure

models/
├── staging/          # Clean raw source data
├── intermediate/     # Business logic layer
└── marts/            # Final analytical tables

## Tests

3 data quality tests covering null checks on critical fields.

## Setup

1. Clone the repo
2. Install dbt: `pip install dbt-bigquery`
3. Configure `profiles.yml` with your GCP credentials
4. Run: `dbt run && dbt test`