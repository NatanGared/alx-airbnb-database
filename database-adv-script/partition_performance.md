Faster Query Execution:
After partitioning the Bookings table, queries that filter by start_date executed significantly faster, as only relevant partitions are scanned rather than the entire dataset.

Reduced I/O Operations:
Partitioning minimizes disk I/O by allowing the database engine to read only specific partitions that match the query criteria. This is particularly beneficial for large datasets.

Improved Maintenance:
Partitioning allows for easier data management, such as dropping old partitions without affecting the rest of the table.

Better Indexing:
Each partition can have its own indexes, further optimizing query performance.