*** 0 ***
INNER JOIN: Retrieves only records with matching entries in both tables (users with bookings).
LEFT JOIN: Retrieves all records from the left table (properties) and matching records from the right table (reviews), including those with no reviews.
FULL OUTER JOIN: Retrieves all records from both tables, including those without matches (users without bookings and bookings without linked users).

*** 1 ***
Non-Correlated Subquery: The subquery calculates the average rating for each property independently. It returns properties where this average exceeds 4.0.

Correlated Subquery: The subquery counts the number of bookings for each user. It is correlated because it references the outer query's user_id, effectively checking each user against their respective bookings.