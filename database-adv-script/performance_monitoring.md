Booking Query:

Execution Time: Reduced from several seconds to milliseconds due to the index on start_date.
Scan Type: Changed from Seq Scan to Index Scan, significantly improving performance.

User Query:

Execution time improved slightly, indicating that even though it was already efficient, the index on user_id will help as the dataset grows.