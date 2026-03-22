## ETL Decisions

### Decision 1 — Standardized mixed date formats
Problem: The raw file used multiple date formats such as `29/08/2023`, `12-12-2023`, and `2023-02-05`, which would break date-based joins and monthly reporting if loaded as-is.
Resolution: I converted every transaction date into ISO format (`YYYY-MM-DD`) before loading the warehouse and then generated integer surrogate keys such as `20230829` for `dim_date`.

### Decision 2 — Normalized category casing and labels
Problem: Product categories appeared with inconsistent casing and naming, including `electronics`, `Electronics`, `Grocery`, and `Groceries`.
Resolution: I standardized category values into a single reporting vocabulary: `Electronics`, `Clothing`, and `Groceries`. This prevents category splits in BI outputs where the same business category would otherwise appear under multiple spellings.

### Decision 3 — Derived fact revenue explicitly
Problem: The raw transactional data stored `units_sold` and `unit_price`, but not a consistently named warehouse measure for reporting. Leaving analysts to recalculate revenue in every query would increase the chance of mistakes.
Resolution: I calculated `sales_revenue = units_sold * unit_price` during load and stored it in `fact_sales`. This keeps the fact table analysis-ready and makes monthly revenue and store-performance queries simpler and more reliable.
