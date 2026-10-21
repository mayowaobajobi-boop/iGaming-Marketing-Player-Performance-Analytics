# SQL analysis guide

This folder contains a **curated, read-only analytical SQL portfolio** derived from the original `GamingMS_Development.sql` practice script. The raw original is preserved in the repository as a historical learning record.

## Query files
1. `01_executive_kpis.sql` — player counts, deposits, bets, wins and monthly GGR.
2. `02_marketing_acquisition.sql` — campaign registrations, traffic sources and first-time depositor conversion.
3. `03_player_crm.sql` — status counts, lifetime deposit segments and player-level deposit rankings.
4. `04_gaming_performance.sql` — game category, provider and monthly gaming performance.
5. `05_data_quality_checks.sql` — row counts, referential checks, date checks and duplicates.

## How to use
Run **one query at a time** in SQL Server Management Studio against an existing `GamingMS` database. These are `SELECT` queries and do not modify the database. The original development SQL is **not** a setup/deployment script and should not be run end-to-end.

**Naming:** The original development script uses `Players`, `Registration`, `Campaigns`, `TrafficSources`, `Deposit`, `Bet`, `Games`, `GameCategory`, `GameProvider`, and `Session`. Power BI may display differently named/renamed tables. The curated queries follow the SQL Server names found in the original script.

**Metrics and limitations**
- **GGR** = stake amount minus payout/win amount. This is not net profit.
- **Deposits** are cash-in amounts, **not operator revenue**. The campaign deposit-to-cost metric is therefore an *attributed deposit/cost proxy*, **not financial ROI or ROAS**.
- **FTD conversion** below means *registered distinct players whose first recorded deposit falls in the query population*; validate transaction success statuses before reporting a production-grade number. The queries currently include **all deposit statuses** because permitted success values have not been verified.
- Campaign attribution uses the **earliest recorded registration per player** for demonstration only; it is not evidence of validated tracking attribution.
- **Inactive** status is a snapshot indicator and should not automatically be interpreted as behavioural churn or cohort retention.
- Player value labels here use **illustrative thresholds**; they are not the original BI model's verified DAX business rules.
- For reproducible results, compare dates, relationship directions and filters in the PBIX to these SQL definitions.
