const { MongoClient } = require("mongodb");
const fs = require("fs");

async function run() {
  const client = new MongoClient("mongodb://127.0.0.1:27017");
  const data = JSON.parse(fs.readFileSync("./sample_documents.json", "utf-8"));

  try {
    await client.connect();

    const db = client.db("assignment_db");
    const products = db.collection("products");

    // OP1: insertMany() — insert all 3 documents from sample_documents.json
    await products.insertMany(data);

    // OP2: find() — retrieve all Electronics products with price > 20000
    const electronics = await products
      .find({ category: "Electronics", price: { $gt: 20000 } })
      .toArray();
    console.log("OP2", electronics);

    // OP3: find() — retrieve all Groceries expiring before 2025-01-01
    const expiringGroceries = await products
      .find({ category: "Groceries", expiry_date: { $lt: "2025-01-01" } })
      .toArray();
    console.log("OP3", expiringGroceries);

    // OP4: updateOne() — add a "discount_percent" field to a specific product
    await products.updateOne(
      { product_id: "ELEC101" },
      { $set: { discount_percent: 10 } }
    );

    // OP5: createIndex() — create an index on category field and explain why
    // This index improves performance for category-based filtering queries.
    await products.createIndex({ category: 1 });
  } finally {
    await client.close();
  }
}

run().catch((error) => {
  console.error(error);
  process.exit(1);
});
