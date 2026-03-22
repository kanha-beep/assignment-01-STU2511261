import duckdb

query = open("duckdb_queries.sql").read()
print("file opened")
print(duckdb.sql(query).fetchall())