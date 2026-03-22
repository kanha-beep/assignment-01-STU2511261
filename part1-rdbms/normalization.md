## Anomaly Analysis

### Insert Anomaly
The file cannot store a new product or a new sales representative unless an order already exists for them, because product and representative attributes are embedded inside an order row. For example, row 12 stores `product_id = P008`, `product_name = Webcam`, `category = Electronics`, and `unit_price = 2100` only because order `ORD1185` exists in the same row. If the company wants to add a new product before it is sold, there is no place to insert just the product details without also inventing values for `order_id`, `customer_id`, `order_date`, and `sales_rep_id`.

### Update Anomaly
Customer details are repeated across many rows, so one real-world change requires many row updates. For customer `C002` (`Priya Sharma`), the same `customer_email` and `customer_city` are repeated in rows 1, 4, 7, 20, and several later rows. Those values live in columns `customer_name`, `customer_email`, and `customer_city`. If Priya changes her email address, every row for `C002` must be updated; missing even one row creates inconsistent customer data.

### Delete Anomaly
Deleting the only row for a rarely ordered product removes the product master data itself. Row 12 is the only row containing `product_id = P008` and `product_name = Webcam`. If order `ORD1185` were deleted, the dataset would lose the fact that product `P008` exists at all, because its descriptive attributes are stored only in that order row.

## Normalization Justification

Keeping everything in one table looks simple at first, but this dataset shows why that simplicity is misleading. The flat file repeats the same customer, product, and sales representative data across many rows. Customer `C002` appears repeatedly with the same name, email, and city, so even a minor change such as an updated email address would require editing every row for that customer. The same issue exists for sales representatives: `SR01` and `SR02` appear across multiple orders with repeated email and office information. This is exactly the kind of duplication that leads to inconsistent data over time.

The flat design also makes data maintenance harder. Row 12 is the only row for product `P008` (`Webcam`). If that order is deleted, the company loses the product record entirely. Similarly, the file cannot store a new product before it is sold, because product details are tied to order-specific columns like `order_id` and `order_date`. That is not a business rule; it is just a weakness in the table design.

Normalizing to 3NF is not over-engineering here. It separates customers, products, sales representatives, orders, and order items into tables that match real entities. Each fact is stored once, updates happen in one place, and relationships are preserved with foreign keys. The result is cleaner data, fewer anomalies, and queries that are more reliable for reporting and day-to-day operations.
